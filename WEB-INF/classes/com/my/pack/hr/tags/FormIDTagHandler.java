package com.my.pack.hr.tags;
import javax.servlet.jsp.tagext.*;
import java.io.*;
import java.util.*;
import javax.servlet.jsp.*;
public class FormIDTagHandler extends TagSupport
{
private String formID;
public void setformID(String formID)
{
this.formID=formID;
}
public String getformID()
{
return this.formID;
}
public void FormIDTagHandler()
{
reset();
}
private void reset()
{
this.formID="";
}
public int doStartTag()
{
formID=UUID.randomUUID().toString();
pageContext.setAttribute(formID,formID,PageContext.SESSION_SCOPE);
JspWriter jw=pageContext.getOut();
try
{
jw.print("<input type='hidden' id='formID' name='formID' value='"+formID+"'>");
}catch(IOException ioe)
{
// do nothing
}
return super.SKIP_BODY;
}
public int doEndTag()
{
this.reset();
return super.EVAL_PAGE;
}
}//class ends