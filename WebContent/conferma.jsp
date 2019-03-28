<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, user-scalable=no, 
initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
<link href="accediRegistratiStyle.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ciak.it</title>
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

<div style="margin:5% 30% 5% 30%">
	<h1 style="text-align:'justify'">Utente aggiunto correttamente, benvenuto <%=request.getAttribute("nome")%></h1>
	<a href="accedi.jsp">Effettua l'accesso</a> oppure 
	<a href="registrazione.jsp">Crea un altro account</a>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>