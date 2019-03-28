function validateForm(form)
{
  
  var o='\u00F3';
  if(form.username.value=="")
  {
    alert("Il campo username non pu"+o+" essere nullo");
    form.username.focus();
    return false;
  }
  else if(form.password.value=="")
  {
    alert("Il campo password non pu"+o+" essere nullo");
    form.password.focus();
    return false;
  }
}