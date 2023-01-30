<%@taglib uri='/WEB-INF/mytags/mytags.tld' prefix='my' %>
<my:Module name='EMPLOYEE' />
<jsp:useBean id='employeeBean' scope='request' class='com.my.pack.hr.beans.EmployeeBean'/>
<jsp:setProperty name='employeeBean' property='*'/>
<jsp:forward page='/updateEmployee' />