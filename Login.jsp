<jsp:useBean id='administrationBean' scope='request' class='com.my.pack.hr.beans.AdministrationBean'/>
<jsp:setProperty name='administrationBean' property='*'/>
<jsp:forward page='/login' />