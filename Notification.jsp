<%@taglib uri='/WEB-INF/mytags/mytags.tld' prefix='my' %>
<jsp:useBean id='messageBean' scope='request' class='com.my.pack.hr.beans.MessageBean'/>
<jsp:include page='MasterPageTopSection.jsp' />

<h2>${messageBean.heading}</h2>
${messageBean.message}<br>

<my:If condition='${messageBean.generateButtons}'>
<table>
<tr>
<td>
<form action='/styletwo/${messageBean.buttonOneAction}'>
<button type='OnSubmit'>${messageBean.buttonOneText}</button>
</form>
</td>

<my:If condition='${messageBean.generateTwoButtons}'>
<td>
<form action='/styletwo/${messageBean.buttonTwoAction}'>
<button type='onSubmit'>${messageBean.buttonTwoText}</button>
</form >
</td>
</my:If>
</tr>
</table>
</my:If>

<jsp:include page='/MasterPageBottomSection.jsp' />