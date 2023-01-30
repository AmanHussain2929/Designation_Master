package com.my.pack.hr.servlets;
import com.my.pack.hr.dl.*;
import com.my.pack.hr.beans.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.text.*;

public class EditEmployee extends HttpServlet
{
public void doGet(HttpServletRequest request,HttpServletResponse response)
{
String employeeId="";
employeeId=request.getParameter("employeeId");	

try
{
EmployeeDTO dlEmployee;
EmployeeBean employeeBean;
try
{
dlEmployee=new EmployeeDAO().getByEmployeeId(employeeId);

SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
employeeBean=new EmployeeBean();
employeeBean.setName(dlEmployee.getName());
employeeBean.setEmployeeId(dlEmployee.getEmployeeId());
	System.out.println(dlEmployee.getEmployeeId());
	System.out.println(employeeBean.getEmployeeId());
employeeBean.setGender(dlEmployee.getGender());
employeeBean.setDesignationCode(dlEmployee.getDesignationCode());
employeeBean.setDesignation(dlEmployee.getDesignation());
employeeBean.setDateOfBirth(simpleDateFormat.format(dlEmployee.getDateOfBirth()));
employeeBean.setIsIndian(dlEmployee.getIsIndian());
employeeBean.setBasicSalary(dlEmployee.getBasicSalary().toPlainString());
employeeBean.setAadharCardNumber(dlEmployee.getAadharCardNumber());
employeeBean.setPanNumber(dlEmployee.getPANNumber());
request.setAttribute("employeeBean",employeeBean);
RequestDispatcher requestDispatcher;
requestDispatcher=request.getRequestDispatcher("/EmployeeEditForm.jsp");
requestDispatcher.forward(request,response);
}catch(DAOException daoException)
{
ErrorBean errorBean=new ErrorBean();
errorBean.setError(daoException.getMessage());
request.setAttribute("errorBean",errorBean);
RequestDispatcher requestDispatcher;
requestDispatcher=request.getRequestDispatcher("/Employees.jsp");
requestDispatcher.forward(request,response);
}
}catch(Exception exception)
{
RequestDispatcher requestDispatcher;
requestDispatcher=request.getRequestDispatcher("/Employees.jsp");
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