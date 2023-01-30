function validateForm(frm)
{
var username=frm.username.value.trim();
var password=frm.password.value;
var userErrorSection=document.getElementById('userErrorSection');
userErrorSection.innerHTML='';
if(username.length==0)
{
userErrorSection.innerHTML='Username required';
frm.username.focus();
return false;
}
if(password.length==0)
{
userErrorSection.innerHTML='Password required';
frm.password.focus();
return false;
}
return true;
}

