<%@taglib uri='/WEB-INF/mytags/mytags.tld' prefix='my' %>
<my:Module name='EMPLOYEE' />
<jsp:include page='/MasterPageTopSection.jsp' />
<script src='/styletwo/js/Employees.js'></script>

<link rel='stylesheet' type='text/css' href='/styletwo/css/employees.css'>
<h2>Empoyees</h2>
<div class='employeeGrid'>
<table border='1' width='100%' id='employeesGridTable'>
<thead>
<tr>
<th colspan='6' class='employeeGridHeader'>
<a href='/styletwo/EmployeeAddForm.jsp'>Add Employee</a>
</th>
</tr>
<tr>
<th class='employeeGrdiSNOColumnTitle'>S.NO.</th>
<th class='employeeGridIdColumnTitle'>Id.</th>
<th class='employeeGridNameColumnTitle'>Name</th>
<th class='employeeGridDesignationColumnTitle'>Designation</th>
<th class='employeeGridEditColumnTitle'>Edit</th>
<th class='employeeGridDeleteColumnTitle'>Delete</th>
</tr>
</thead>
<tbody>

<tr style='cursor:pointer'>
<td style='text-align:right' placeHolderId='serialNumber'></td>
<td placeHolderId='employeeId'></td>
<td placeHolderId='name'></td>
<td placeHolderId='designation'></td>
<td placeHolderId='editOption' style='text-align:center'></td>
<td placeHolderId='deleteOption' style='text-align:center'></td>
</tr>

</tbody>
</table>
</div>


<div style='height:18vh;margin-left:5px;margin-right:5px;margin-bottom:5px;margin-top:5px;padding:5px;border:1px solid black;'>
<label style='background:gray;color:white;padding-left:5px;padding-right:5px'>Details</label>
<table border='0' width='100%'>
<tr>
<td>Employee Id : <span id='detailPanel_employeeId' style='margin-right:30px'></span></td>
<td>Name : <span id='detailPanel_name' style='margin-right:30px'></span></td>
<td>Designation : <span id='detailPanel_designation' style='margin-right:30px'></span></td>
</tr>
<tr>
<td>Date of birth : <span id='detailPanel_dateOfBirth' style='margin-right:30px'></span></td>
<td>Gender : <span id='detailPanel_gender' style='margin-right:30px'></span></td>
<td>Is Indian : <span id='detailPanel_isIndian' style='margin-right:30px'></span></td>
</tr>
<tr>
<td>Basic salary : <span id='detailPanel_basicSalary' style='margin-right:30px'></span></td>
<td>PAN Number : <span id='detailPanel_panNumber' style='margin-right:30px'></span></td>
<td>Aadhar Card Number : <span id='detailPanel_aadharCardNumber' style='margin-right:30px'></span></td>
</tr>
</table>
</div>

<jsp:include page='/MasterPageBottomSection.jsp' />