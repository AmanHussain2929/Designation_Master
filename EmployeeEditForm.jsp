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

<form method='post' action='/styletwo/UpdateEmployee.jsp' onSubmit='return validateForm(this)'>
<input type='hidden' id='employeeId' name='employeeId' value='${employeeBean.employeeId}'>
<table>
<tr>
<td>Name</td>
<td><input type='text' id='name' name='name' maxlength='50' size='51' value='${employeeBean.name}'>
<span id='nameErrorSection' style='color:red'></span></td>
</tr>

<tr>
<td>Designation</td>
<td><select id='designationCode' name='designationCode'>
<option selected value='-1'>&lt;Select Designation&gt;</option>
<my:EntityList populatorClass='com.my.pack.hr.bl.DesignationBL' populatorMethod='getAll' name='dBean'>
<my:If condition='${employeeBean.designationCode==dBean.code}'>
<option value=${dBean.code} selected>${dBean.title}</option>
</my:If>
<my:If condition='${employeeBean.designationCode!=dBean.code}'>
<option value=${dBean.code}>${dBean.title}</option>
</my:If>
</my:EntityList>
</select>
<span id='designationCodeErrorSection' style='color:red'></span></td>
</tr>

<tr>
<td>Date of Birth</td>
<td><input type='date' id='dateOfBirth' name='dateOfBirth' value='${employeeBean.dateOfBirth}'>
<span id='dateOfBirthErrorSection' style='color:red'></span>
</td>
</tr>	
<tr>
<td>Gender</td>
<my:If condition='${employeeBean.isMale()==true}'>
<td><input type='radio' id='male' name='gender' value='M' checked> Male 
</my:If>
<my:If condition='${employeeBean.isMale()==false}'>
<td><input type='radio' id='male' name='gender' value='M'> Male 
</my:If>
&nbsp;&nbsp;&nbsp;&nbsp; 
<my:If condition='${employeeBean.isFemale()==true}'>
<input type='radio' id='female' name='gender' value='F' checked> Female
</my:If>
<my:If condition='${employeeBean.isFemale()==false}'>
<input type='radio' id='female' name='gender' value='F'> Female
</my:If>
<span id='genderErrorSection' style='color:red'></span>
</td>
</tr>
<tr>
<td>Indian ?</td>

<my:If condition='${employeeBean.getIsIndian()==true}'>
<td><input type='checkbox' name='isIndian' id='isIndian' value='true' checked>
</my:If>
<my:If condition='${employeeBean.getIsIndian()==false}'>
<td><input type='checkbox' name='isIndian' id='isIndian' value='true' >
</my:If>


</td>
</tr>


<tr>
<td>Basic Salary</td>
<td>
<input type='text' style='text-align:right' name='basicSalary' id='basicSalary' maxlength='12' size='13'  value='${employeeBean.basicSalary}'>
<span id='basicSalaryErrorSection' style='color:red'></span>
</td>
</tr>
<tr>
<td>PAN Number</td>
<td>
<input type='text' name='panNumber' id='panNumber' maxlength='15' size='16' value='${employeeBean.panNumber}'> 
<span id='panNumberErrorSection' style='color:red'></span>
</td>
</tr>
<tr>
<td>Aadhar Card Number</td>
<td>
<input type='text' name='aadharCardNumber' id='aadharCardNumber' maxlength='15' size='16' value='${employeeBean.aadharCardNumber}'>
<span id='aadharCardNumberErrorSection' style='color:red'></span>
</td>
</tr>
<tr>
<td colspan='2'><button type='submit'>Update</button> 
&nbsp;&nbsp;<button type='Button' onclick='cancelAddition()'>Cancel</button></td> 
</tr>
</table>
</form>
<form id='cancelAdditionForm' action='/styletwo/Employees.jsp'>
</form> 
<jsp:include page='/MasterPageBottomSection.jsp' />