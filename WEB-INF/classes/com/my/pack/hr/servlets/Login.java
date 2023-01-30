package com.my.pack.hr.servlets;
import com.my.pack.hr.dl.*;
import com.my.pack.hr.beans.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Login extends HttpServlet
{
public void doPost(HttpServletRequest request,HttpServletResponse response)
{
try
{
AdministrationBean administrationBean;
administrationBean=(AdministrationBean)request.getAttribute("administrationBean");
String _username;
String _password;
_username=administrationBean.getUsername();
_password=administrationBean.getPassword();
AdministrationDTO administrationDTO=null;
AdministrationDAO administrationDAO=new AdministrationDAO();
try
{
administrationDTO=administrationDAO.getByUsername(_username);
}catch(DAOException daoException)
{
ErrorBean errorBean=new ErrorBean();
errorBean.setError(daoException.getMessage());
request.setAttribute("errorBean",errorBean);
RequestDispatcher requestDispatcher;
requestDispatcher=request.getRequestDispatcher("/LoginForm.jsp");
requestDispatcher.forward(request,response);
}
String password=administrationDTO.getPassword();
if(password.equals(_password))
{
HttpSession ss=request.getSession();
ss.setAttribute("username",_username);
RequestDispatcher requestDispatcher;
requestDispatcher=request.getRequestDispatcher("/index.jsp");
requestDispatcher.forward(request,response);
}
else
{
ErrorBean errorBean=new ErrorBean();
errorBean.setError("Invalid password");
request.setAttribute("errorBean",errorBean);
RequestDispatcher requestDispatcher;
requestDispatcher=request.getRequestDispatcher("/LoginForm.jsp");
requestDispatcher.forward(request,response);
}
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

