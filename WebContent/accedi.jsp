<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="registrazione.db.*" %>
<jsp:useBean id="userData" class="registrazione.db.UserData" scope="session" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ciak.it: accedi</title>
<link href="accediRegistratiStyle.css" rel="stylesheet" type="text/css">
<script src="scriptsLogin.js"></script>
<meta name="viewport" content="width=device-width, user-scalable=no, 
initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
</head>
<body bgcolor="white">

<header>

<% 	
	if (session.getAttribute("username")!=null) { 

    String redirectURL = "index.jsp";
    response.sendRedirect(redirectURL);
    
	} else { %>

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
  <div id="accedi">
  
  <%String logged="";
  if(request.getAttribute("logged")!=null)
  {%><h3 style="color:red;text-align:center">Username o password errati!</h3><%} %>
  
  <form name="loginForm" action="regServlet" method="post" onSubmit="return validateForm(this);">
	 <input type="text" name="username" placeholder="Inserisci username"><br>
     <input type="password" name="password" placeholder="Password"><br>
     <button type="submit">Accedi</button><br><br>
  </form>
  </div>
   <% } %>
</header>
</body>
<footer>
      <div id="f">
	     <h6>Copyright &copy; 2017 Ciak. Tutti i diritti riservati.</h6>
	  </div>
	  <div id="socialMediaButtons">
	  <!-- Add icon library -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

		<!-- Add font awesome icons -->
		<a href="https://it-it.facebook.com/" class="fa fa-facebook"></a>
		<a href="https://www.instagram.com/" class="fa fa-instagram"></a>
		<a href="https://www.youtube.com/?hl=it&gl=IT" class="fa fa-youtube"></a>
		<a href="https://accounts.google.com/signin/v2/identifier?hl=IT&flowName=GlifWebSignIn&flowEntry=ServiceLogin" class="fa fa-google"></a>
	  </div>
</footer>
</html>