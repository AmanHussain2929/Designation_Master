package com.my.pack.hr.servlets;
import com.my.pack.hr.dl.*;
import com.my.pack.hr.beans.*;
import java.util.*;
import java.math.*;
import java.text.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class AddEmployee extends HttpServlet
{
public void doPost(HttpServletRequest request,HttpServletResponse response)
{
try
{
EmployeeBean employeeBean;
employeeBean=(EmployeeBean)request.getAttribute("employeeBean");
String employeeId;
String name;
int designationCode;
String designation;
String dateOfBirth;
String gender;
boolean isIndian;
String basicSalary;
String panNumber;
String aadharCardNumber;
name=employeeBean.getName();
designationCode=employeeBean.getDesignationCode();
designation=new DesignationDAO().getByCode(designationCode).getTitle();
employeeBean.setDesignation(designation);
dateOfBirth=employeeBean.getDateOfBirth();
gender=employeeBean.getGender();
isIndian=employeeBean.getIsIndian();
basicSalary=employeeBean.getBasicSalary();
panNumber=employeeBean.getPanNumber();
aadharCardNumber=employeeBean.getAadharCardNumber();
EmployeeDTO employee=new EmployeeDTO();
employee.setName(name);
employee.setDesignationCode(designationCode);
employee.setDesignation(designation);
SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
java.util.Date utilDate=simpleDateFormat.parse(dateOfBirth);
employee.setDateOfBirth(utilDate);
employee.setGender(gender);
employee.setIsIndian(isIndian);
employee.setBasicSalary(new BigDecimal(basicSalary));
employee.setPANNumber(panNumber);
employee.setAadharCardNumber(aadharCardNumber);
/*
	System.out.println(employeeId);
	System.out.println(name);
	System.out.println(designationCode);
	System.out.println(designation);
	System.out.println(dateOfBirth);
	System.out.println(gender);
	System.out.println(isIndian);
	System.out.println(basicSalary);
	System.out.println(panNumber);
	System.out.println(aadharCardNumber);
*/
EmployeeDAO employeeDAO=new EmployeeDAO();
try
{
employeeDAO.add(employee);
employeeBean.setEmployeeId(employee.getEmployeeId());
MessageBean messageBean=new MessageBean();
messageBean.setHeading("Designation (Add Module)");
messageBean.setMessage("Designation added, add more ?");
messageBean.setGenerateButtons(true);
messageBean.setGenerateTwoButtons(true);
messageBean.setButtonOneText("Yes");
messageBean.setButtonOneAction("EmployeeAddForm.jsp");
messageBean.setButtonTwoText("No");
messageBean.setButtonTwoAction("Employees.jsp");
request.setAttribute("messageBean",messageBean);
RequestDispatcher requestDispatcher;
requestDispatcher=request.getRequestDispatcher("/Notification.jsp");
requestDispatcher.forward(request,response);
}catch(DAOException daoException)
{
ErrorBean errorBean=new ErrorBean();
errorBean.setError(daoException.getMessage());
request.setAttribute("errorBean",errorBean);
RequestDispatcher requestDispatcher;
requestDispatcher=request.getRequestDispatcher("/EmployeeAddForm.jsp");
requestDispatcher.forward(request,response);
}
}catch(Exception exception)
{
System.out.println(exception.getMessage());
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