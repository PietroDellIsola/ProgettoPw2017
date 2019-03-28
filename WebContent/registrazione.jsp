<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Ciak.it: registrati</title>
<link href="accediRegistratiStyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script>
function clearForm(form){
	//reset input border color
	var inputs = form.getElementsByTagName("input");
	for(var i = 0; i<inputs.length; i++){
		inputs[i].style.borderColor = "black"; 
	}
	//delete previous error messages
	var spans = form.getElementsByTagName("span");
	for(var i = 0; i<spans.length; i++){
		form.removeChild(spans[i]);
		}
		
}

function validateForm(form)
{

 clearForm(form);
 
 var o='\u00F3'; //ò
  var letters = /^[A-Za-z]+$/; 
  var numbers = /^\d{10}$/; 
  var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;  
  var address = /^[0-9a-zA-Z,\s]+$/;
  var country = /^[A-Za-z,\s]+$/; 
  
  
  if(!(form.nome.value.match(letters)))
  {
	form["nome"].style.borderColor = "red"; 
	var msgEl = document.createTextNode("Il nome può contenere solo lettere");

		var span = document.createElement('span');
		span.style.color = "red";
		span.appendChild(msgEl);
		
		form.insertBefore(span, form["nome"].nextSibling);
		form.nome.focus();
		form.nome.value="";//Ripulisce il field
		return false;
  }
  
  else if(!(form.cognome.value.match(letters))){
	form["cognome"].style.borderColor = "red"; 
	var msgEl = document.createTextNode("Il cognome può contenere solo lettere");

		var span = document.createElement('span');
		span.style.color = "red";
		span.appendChild(msgEl);
		
		form.insertBefore(span, form["cognome"].nextSibling);
		form.cognome.focus();
		form.cognome.value="";//Ripulisce il field
		return false;
  }
  
   else if(!(form.cellulare.value.match(numbers))){
	form["cellulare"].style.borderColor = "red"; 
	var msgEl = document.createTextNode("Il numero deve essere lungo 10 cifre e contenere solo numeri");

		var span = document.createElement('span');
		span.style.color = "red";
		span.appendChild(msgEl);
		
		form.insertBefore(span,form["cellulare"].nextSibling);
		form.cellulare.focus();
		form.cellulare.value="";//Ripulisce il field
		return false;
  }
  
   else if(!(form.indirizzo.value.match(address))){
	form["indirizzo"].style.borderColor = "red"; 
	var msgEl = document.createTextNode("Il campo può contenre soltanto numeri, virgole e spazi");

		var span = document.createElement('span');
		span.style.color = "red";
		span.appendChild(msgEl);
		
		form.insertBefore(span, form["indirizzo"].nextSibling);
		form.indirizzo.focus();
		form.indirizzo.value="";//Ripulisce il field
		return false;
  }
  
  else if(!(form.citta.value.match(country ))){
	form["citta"].style.borderColor = "red"; 
	var msgEl = document.createTextNode("Specificare paese e provincia");

		var span = document.createElement('span');
		span.style.color = "red";
		span.appendChild(msgEl);
		
		form.insertBefore(span, form["citta"].nextSibling);
		form.citta.focus();
		form.citta.value="";//Ripulisce il field
		return false;
  }
  
  else if(!(form.email.value.match(mailformat))){
	form["email"].style.borderColor = "red"; 
	var msgEl = document.createTextNode("Formato non corretto");

		var span = document.createElement('span');
		span.style.color = "red";
		span.appendChild(msgEl);
		
		form.insertBefore(span, form["email"].nextSibling);
		form.email.focus();
		form.email.value="";//Ripulisce il field
		return false;
  }

 
else if(!(form.password1.value==form.password2.value))
  {
  
	form["password1"].style.borderColor = "red";
	form["password2"].style.borderColor = "red"; 
	var msgEl = document.createTextNode("Le password inserite non coincidono");

		var span = document.createElement('span');
		span.style.color = "red";
		span.appendChild(msgEl);
		
		form.insertBefore(span, form["password2"].nextSibling);
		form.password1.focus();
		form.password1.value="";//Ripulisce il field
		form.password2.value="";//Ripulisce il field
		return false;
  }
  
  
return true;
}



function checkUsername(username){
	 
	 if (username == "") {
		    document.getElementById("disponibilita").innerHTML = "Inserisci uno username valido";
		    return;}
	var xmht= new XMLHttpRequest();
	xmht.onreadystatechange =function(){
		console.log("readyState: " + this.readyState);
		if(this.readyState==4&&this.status==200){
			
			document.getElementById("disponibilita").innerHTML=this.responseText;
		}
	};
	xmht.open("GET","AJAX.jsp?username="+username,true);
	xmht.send();
	return true;
}

</script>
<meta name="viewport" content="width=device-width, user-scalable=no, 
initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
</head>
<body>
   <div>
	   <a href="index.jsp">
	      <img id=logo src="images/logo.png" alt="Il logo del nostro e-commerce">	
	   </a>		
	   <div>
	      <h1  id="ciak">Ciak</h1>
	   </div>
	</div>
	
	 <h3 id="accediRegistrati">
      Ciao! <a href="accedi.jsp">Accedi</a> o <a href="registrazione.jsp">registrati</a>!
      </h3>	
	<br/>

	
   <div id="registrati">
      <form name="formRegistrazione" action="Registration" method="post" onSubmit="return validateForm(this);">
			
      	<h3 style="text-align:center;color:red">**Tutti i campi sono obbligatori</h3>

      	 
         <input id="username" type="text" name="username" placeholder="Username" 
         onblur="checkUsername(this.value)" required><br>
		
	      <h3 id="disponibilita" style="text-align:center"></h3>			 
                  	
         <input id="nome" type="text" name="nome" placeholder="Nome" required><br>
         
         <input  type="text" name="cognome" placeholder="Cognome" required><br>
         	        	
         <input  type="text" name="cellulare" placeholder="Cellulare" required><br>
                  	
         <input  type="text" name="indirizzo" placeholder="Indirizzo" required><br>
         	          
         <input  type="text" name="citta" placeholder="Città (Città, Provincia)" required><br>
         	          
         <input  type="text" name="email" placeholder="Email" required><br>
		 
         <input  type="password" name="password1" placeholder="Password" required><br>
         	      
       	 <input  type="password" name="password2" placeholder="Conferma la password" required><br>
                  
         <br>
         
          <select style="margin-left:4%; width:30%; height:2em" name="tipo" >
  			 <option value="cliente" selected="selected">Cliente  </option>
   			 <option value="venditore">Venditore </option>
  		  </select>	
		  
  		 <br><br>
         	
         <button type="submit">Registrati</button><br><br>                            
          <!-- UNA VOLTA EFFETTUATO L'ACCESSO RITORNA ALLA HOME PAGE -->
      </form>
   </div>
   
   <footer>
      <div id="f">
	     <h6>Copyright &copy; 2017 Ciak. Tutti i diritti riservati.</h6>
	  </div>
	  <div id="socialMediaButtons">
	  <!-- Add icon library -->
		

		<!-- Add font awesome icons -->
		<a href="https://it-it.facebook.com/" class="fa fa-facebook"></a>
		<a href="https://www.instagram.com/" class="fa fa-instagram"></a>
		<a href="https://www.youtube.com/?hl=it&gl=IT" class="fa fa-youtube"></a>
		<a href="https://accounts.google.com/signin/v2/identifier?hl=IT&flowName=GlifWebSignIn&flowEntry=ServiceLogin" class="fa fa-google"></a>
	  </div>
	</footer>
	 <!-- UNA VOLTA EFFETTUATO L'ACCESSO RITORNA ALLA HOME PAGE -->
</body>
</html>