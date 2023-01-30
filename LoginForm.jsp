<jsp:useBean id='administrationBean' scope='request' class='com.my.pack.hr.beans.AdministrationBean'/>
<jsp:useBean id='errorBean' scope='request' class='com.my.pack.hr.beans.ErrorBean'/>


<!DOCTYPE HTML>
<html land='en'>
<head>
<title>HR Application</title>
<link rel='stylesheet' type='text/css' href='/styletwo/css/styles.css'>
<script src='/styletwo/js/LoginForm.js'></script>
</head>
<body>
<!-- Main container starts here -->
<div class='main-container'>
<!-- header starts here -->
<div class='header'>
<img src='/styletwo/images/logo.png' class='logo'>
<div class='brand-name'>HR APPLICATION</div>
</div> <!-- header ends here -->
<!-- content-section starts here -->
<div class='content'>  

<!-- login panel starts here -->
<center>
<h2>Login Form</h2><br>
<div class='login-panel'> 
<form method='post' action='/styletwo/Login.jsp' onSubmit='return validateForm(this)'>
<span class='error'>
<jsp:getProperty name='errorBean' property='error'/>
</span><br><br>
Username
<input type='text' id='username' name='username' maxlength='15' size='16' value='${administrationBean.username}'>
<br>Password
<input type='password' id='password' name='password' maxlength='15' size='16' value='${administrationBean.password}'>
<br><span id='userErrorSection' class='error'></span><br>
<button type='submit'>Login</button> 
</form>
</div> <!-- login panel ends here -->
</center>


</div> <!-- content-section ends here -->
<!-- footer starts here -->
<div class='footer'>
&copy; HR APPLICATION 2021
</div>
<!-- footer ends here -->
</div> <!-- Main container ends here -->
</body>
</html>









