<%@taglib uri='/WEB-INF/mytags/mytags.tld' prefix='my' %>
<my:FormResubmitted>
<my:Module name='HOME' />
<jsp:forward page='/notifyFormResubmission' />
</my:FormResubmitted>
<my:Module name='DESIGNATION' />
<jsp:useBean id='designationBean' scope='request' class='com.my.pack.hr.beans.DesignationBean'/>
<jsp:setProperty name='designationBean' property='*'/>
<jsp:forward page='/addDesignation'/>