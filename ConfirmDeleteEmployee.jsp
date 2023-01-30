<%@taglib uri='/WEB-INF/mytags/mytags.tld' prefix='my' %>
<my:Module name='EMPLOYEE' />
<jsp:useBean id='employeeBean' scope='request' class='com.my.pack.hr.beans.EmployeeBean'/>
<jsp:useBean id='errorBean' scope='request' class='com.my.pack.hr.beans.ErrorBean'/>
<jsp:include page='/MasterPageTopSection.jsp' />

<script src='/styletwo/js/EmployeeAddForm.js'></script>

<h2>Employee (Edit Module)</h2>
<span class='error'>
<jsp:getProperty name='errorBean' property='error'/>
</span>

<form method='post' action='/styletwo/DeleteEmployee.jsp' onSubmit='return validateForm(this)'>
<input type='hidden' id='employeeId' name='employeeId' value='${employeeBean.employeeId}'>
<table>
<tr>
<td>Name</td>
<td><b>'${employeeBean.name}'</b></td>
</tr>

<tr>
<td>Designation</td>
<td><b>'${employeeBean.designation}'</b></td>
</tr>

<tr>
<td>Date of Birth</td>
<td><b>'${employeeBean.dateOfBirth}'</b></td>
</tr>	
<tr>
<td>Gender</td>
<my:If condition='${employeeBean.isMale()==true}'>
<td><b>Male</b>
</my:If>
<my:If condition='${employeeBean.isFemale()==true}'>
<td><b>Female</b>
</my:If>
</td>
</tr>
<tr>
<td>Indian ?</td>

<my:If condition='${employeeBean.getIsIndian()==true}'>
<td><b>Indian</b>
</my:If>
<my:If condition='${employeeBean.getIsIndian()==false}'>
<td><b>Not an Indian</b>
</my:If>
</td>
</tr>


<tr>
<td>Basic Salary</td>
<td>
<b>'${employeeBean.basicSalary}'</b>
</td>
</tr>
<tr>
<td>PAN Number</td>
<td>
<b>'${employeeBean.panNumber}'</b>
</td>
</tr>
<tr>
<td>Aadhar Card Number</td>
<td>
<b>'${employeeBean.aadharCardNumber}'</b>
</td>
</tr>
<tr>
Are you sure want to delete this employee ?
<br><br>
<td colspan='2'><button type='submit'>Delete</button> 
&nbsp;&nbsp;<button type='Button' onclick='cancelAddition()'>Cancel</button></td> 
</tr>
</table>
</form>

<form id='cancelAdditionForm' action='/styletwo/Employees.jsp'>
</form> 
<jsp:include page='/MasterPageBottomSection.jsp' />