package com.my.pack.hr.tags;
import javax.servlet.jsp.tagext.*;
import javax.servlet.jsp.*;
import javax.servlet.http.*;

public class GuardTagHandler extends TagSupport
{
public void GuardTagHandler()
{
reset();
}
private void reset()
{
//do nothing
}
public int doStartTag()
{
String usernameInSession=null;
usernameInSession=(String)pageContext.getAttribute("username",PageContext.SESSION_SCOPE);
if(usernameInSession==null)
{
return super.EVAL_BODY_INCLUDE;
}
else
{
return super.SKIP_BODY;
}
}
public int doEndTag()
{
this.reset();
return super.EVAL_PAGE;
}
}//class ends
