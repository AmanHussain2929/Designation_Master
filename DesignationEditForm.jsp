<%@taglib uri='/WEB-INF/mytags/mytags.tld' prefix='my' %>
<my:Module name='DESIGNATION' />
<jsp:useBean id='designationBean' scope='request' class='com.my.pack.hr.beans.DesignationBean'/>
<jsp:useBean id='errorBean' scope='request' class='com.my.pack.hr.beans.ErrorBean'/>
<jsp:include page='/MasterPageTopSection.jsp' />
<script src='/styletwo/js/DesignationAddForm.js'></script>
<h2>Designation (Edit Module)</h2>
<span class='error'>

<jsp:getProperty name='errorBean' property='error'/>
</span>
<form method='post' action='/styletwo/UpdateDesignation.jsp' onSubmit='return validateForm(this)'>
Designation
<input type='hidden' id='code' name='code' value='${designationBean.code}'>
<input type='text' id='title' name='title' maxlength='35' size='36' value='${designationBean.title}'>
<span id='titleErrorSection' class='error'></span><br>
<button type='submit'>Update</button> 
<button type='Button' onclick='cancelAddition()'>Cancel</button> 
</form>
<form id='cancelAdditionForm' action='/styletwo/Designations.jsp'>
</form> 
<jsp:include page='/MasterPageBottomSection.jsp' />
