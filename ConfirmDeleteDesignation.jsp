<%@taglib uri='/WEB-INF/mytags/mytags.tld' prefix='my' %>
<my:Module name='DESIGNATION' />
<jsp:useBean id='designationBean' scope='request' class='com.my.pack.hr.beans.DesignationBean'/>
<jsp:useBean id='errorBean' scope='request' class='com.my.pack.hr.beans.ErrorBean'/>
<jsp:include page='/MasterPageTopSection.jsp' />

<script src='/styletwo/js/DesignationAddForm.js'></script>
<h2>Designation (Delete Module)</h2>
<span class='error'>

<jsp:getProperty name='errorBean' property='error'/>
</span>
<form method='post' action='/styletwo/DeleteDesignation.jsp' onSubmit='return validateForm(this)'>
<input type='hidden' id='code' name='code' value='${designationBean.code}'>

Designation : 
<b>'${designationBean.title}'</b><br><br>
Are you sure want to delete this designation ?<br><br>
<span id='titleErrorSection' class='error'></span><br>
<button type='submit'>Delete</button> 
<button type='Button' onclick='cancelAddition()'>Cancel</button> 

</form>
<form id='cancelAdditionForm' action='/styletwo/Designations.jsp'>
</form> 
<jsp:include page='/MasterPageBottomSection.jsp' />
