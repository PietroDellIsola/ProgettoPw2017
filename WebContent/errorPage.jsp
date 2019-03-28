<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    isErrorPage="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, user-scalable=no, 
initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
<link href="accediRegistratiStyle.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ciak.it: registrati</title>
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
	<h1 style="text-align:'justify'">Ops... si è verificato un errore, controlla i dati inseriti 
	tornando indietro nella pagina</h1>
	<a href="accedi.jsp">Effettua l'accesso</a> oppure 
	<a href="registrazione.jsp">Crea un altro account</a>
</div>

<%@ include file="footer.jsp" %>
	
</body>
</html>