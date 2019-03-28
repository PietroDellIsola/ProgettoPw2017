<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, user-scalable=no, 
initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ciak.it: film e videogiochi</title>
<link rel="stylesheet" type="text/css" href="indexStyle.css">
</head>
<body>

<%@ include file="header.jsp" %>

<%
		if (session.getAttribute("username")==null)
		 	response.sendRedirect("accedi.jsp");
		else{
%>
<br><br>

<h1 style="color:red;text-align:center">Gestione profilo:</h1>
<br><br>
<div>
<a href="profilo.jsp">
       <img style="width:35%;height:35%;float:left;padding: 1%;margin-left:7%" 
       id=profilo src="images/profilo.jpg" alt="Un immagine che rappresenta il profilo">
</a>
</div>

<form method="get">
<div style="float:center;padding: 1%;">
	<h3>Username:&nbsp;&nbsp;<%=session.getAttribute("username")%></h3>
	<!-- MEGLIO NON PERMETTERE LA MODIFICA DELLO USERNAME POICHE' RAPPRESENTA
	LA CHIAVE PRIMARIA NEL DB -->
	<h3>Nome:&nbsp;&nbsp;<input type="text"value="<%=session.getAttribute("nome") %>" name="nome"></h3>
	<h3>Cognome:&nbsp;&nbsp;<input type="text"value="<%=session.getAttribute("cognome")%>" name="cognome"></h3>
	<h3>Cellulare:&nbsp;&nbsp;<input type="text"value="<%=session.getAttribute("cellulare")%>" name="cellulare"></h3>
	<h3>Indirizzo:&nbsp;&nbsp;<input type="text"value="<%=session.getAttribute("indirizzo")%>" name="indirizzo"></h3>
	<h3>Citt&agrave;:&nbsp;&nbsp;<input type="text"value="<%=session.getAttribute("citta")%>" name="citta"></h3>
	<h3>Email:&nbsp;&nbsp;<input type="text"value="<%=session.getAttribute("email") %>" name="email"></h3>
	<h3>Tipo:&nbsp;&nbsp;<%=session.getAttribute("tipo") %></h3>
	<input type="submit" onclick="form.action='EditProfile';alert('Modifica avvenuta')" value="Modifica il profilo">
	<input type="submit" onclick="form.action='DeleteProfile'" value="Elimina il profilo">
</div>
</form>


<br><br><br>


<%}%>

<br><br><br><br>
<%@ include file="footer.jsp" %>

</body>
</html>