package com.my.pack.hr.servlets;
import com.my.pack.hr.dl.*;
import com.my.pack.hr.beans.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class NotifyFormResubmission extends HttpServlet
{
public void doPost(HttpServletRequest request,HttpServletResponse response)
{
doGet(request,response);
}
public void doGet(HttpServletRequest request,HttpServletResponse response)
{
try
{
MessageBean messageBean=new MessageBean();
messageBean.setHeading("Notification");
messageBean.setMessage("Form are not to be resubmitted.");
messageBean.setGenerateButtons(true);
messageBean.setGenerateTwoButtons(false);
messageBean.setButtonOneText("Ok");
messageBean.setButtonOneAction("index.jsp");
request.setAttribute("messageBean",messageBean);
RequestDispatcher requestDispatcher;
requestDispatcher=request.getRequestDispatcher("/Notification.jsp");
requestDispatcher.forward(request,response);
}catch(Exception exception)
{
RequestDispatcher requestDispatcher;
requestDispatcher=request.getRequestDispatcher("ErrorPage.jsp");
try
{
requestDispatcher.forward(request,response);
}catch(Exception e)
{
//do nothing
}
}
}//function ends
}//class ends
