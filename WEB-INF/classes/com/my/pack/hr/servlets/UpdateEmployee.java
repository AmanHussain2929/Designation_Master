package com.my.pack.hr.servlets;
import com.my.pack.hr.dl.*;
import com.my.pack.hr.beans.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.text.*;
import java.math.*;

public class UpdateEmployee extends HttpServlet
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
employeeId=employeeBean.getEmployeeId();
         System.out.println("Update EMployee "+employeeId);
name=employeeBean.getName();
	System.out.println("Update name "+name);
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
employee.setEmployeeId(employeeId);	
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

EmployeeDAO employeeDAO=new EmployeeDAO();
try
{
employeeDAO.update(employee);
MessageBean messageBean=new MessageBean();
messageBean.setHeading("Employee (Update Module)");
messageBean.setMessage("Employee Updated.");
messageBean.setGenerateButtons(true);
messageBean.setButtonOneText("Ok");
messageBean.setButtonOneAction("/Employees.jsp");
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
requestDispatcher=request.getRequestDispatcher("/EmployeeEditForm.jsp");
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