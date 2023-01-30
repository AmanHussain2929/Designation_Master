package com.my.pack.hr.tags;
import javax.servlet.jsp.tagext.*;
import javax.servlet.jsp.*;
import javax.servlet.http.*;

public class FormResubmittedTagHandler extends TagSupport
{
public void FormResubmittedTagHandler()
{
reset();
}
private void reset()
{
//do nothing
}
public int doStartTag()
{
HttpServletRequest request=(HttpServletRequest)pageContext.getRequest();
String formID=request.getParameter("formID");
if(formID==null)
{
System.out.println("1");
return super.EVAL_BODY_INCLUDE;
}
String formIDInSession=(String)pageContext.getAttribute(formID,PageContext.SESSION_SCOPE);
if(formIDInSession==null)
{
System.out.println("2");
return super.EVAL_BODY_INCLUDE;
}
pageContext.removeAttribute(formID,PageContext.SESSION_SCOPE);
System.out.println("formIDInSession : "+formIDInSession);
System.out.println("formID : "+formID);

if(formIDInSession.equals(formID))
{
System.out.println("equal");
return super.SKIP_BODY;
}
else
{
return super.EVAL_BODY_INCLUDE;
}
}
public int doEndTag()
{
this.reset();
return super.EVAL_PAGE;
}
}
