<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="merce.db.Merchandise" %>
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
<br><br>
<h1 style="color:red;text-align:center">Gestione merce</h1><br><br>
<form id="inserisciMerce" action="AddMerchandise" method="post" enctype="multipart/form-data">
	<fieldset style="width:40%;float:left">
		<legend>Inserisci un prodotto</legend>
		<!-- IL NOME, MEGLIO SE UNIVOCO -->
		Inserisci un nome<br><input type="text" name="nome" required><br><br>
		<input type="radio" name="tipo" value="videogioco" checked="checked">Videogioco
		<input type="radio" name="tipo" value="film">Film
		<br><br>Inserisci una descrizione<br><textarea name="descrizione" style="width:20em;height:5em" required></textarea><br><br>
		Inserisci un prezzo<br><input type="text" name="prezzo" required><br>
		<br>Inserisci una percentuale di sconto<br>
		<input type="number" min="0" max="100" name="sconto" required><br>
		<br>Inserisci un immagine<br>
		<input type="file" name="photo">
		<input type="submit" value="Invia">
	</fieldset>
</form>

<%
Merchandise m=new Merchandise();
if(request.getAttribute("articolo")!=null){
	m=(Merchandise)request.getAttribute("articolo");
}%>

<fieldset style="width:40%;float:right">
		<legend>Modifica un prodotto</legend>
		<form method="post" action="VisualizeMerchandiseName">
		<input type="text" name="nomeProdotto" placeholder="Inserisci il nome del prodotto"> 
		<input type="submit" value="Invia"><br><br>
		</form>
		<!--OLTRE AL NOME LA SERVLET PRENDERA' ANCHE LO USERNAME VENDITORE-->	
		<form method="post" action="ModifyMerchandise" onsubmit="alert('Modifica avvenuta')" >
		<input type="hidden" name="nomeProdotto" value="<%=m.getNome()%>">
		Inserisci un nome<br><input type="text" name="nome" value="<%=m.getNome()%>" required><br><br>
		<input type="radio" name="tipo" value="videogioco"<%if(m.getTipo().equals("videogioco")){%>checked="checked"<%} %>>Videogioco
		<input type="radio" name="tipo" value="film"<%if(m.getTipo().equals("film")){%>checked="checked"<%} %>>Film
		<br><br>Inserisci una descrizione<br><textarea name="descrizione" style="width:20em;height:5em"><%=m.getDescrizione()%></textarea><br><br>
		Inserisci un prezzo<br><input type="text" name="prezzo" value="<%=m.getPrezzo()%>"><br>
		<br>Inserisci una percentuale di sconto<br>
		<input type="number" min="0" max="100" name="sconto" value="<%=m.getSconto()%>"><br>
		<br>Inserisci un immagine<br>
		<input type="file" name="filename" value="<%=m.getFilename()%>">
		<input type="submit" value="Invia">
		</form>
</fieldset>




<form id="visualizzaMerce" action="VisualizeMerchandise" method="post">
	<fieldset  style="width:40%">
		<legend>Visualizza merce in vendita</legend>
		<input type="submit" value="Invia">
	</fieldset>
</form>


<form id="eliminaMerce" action="DeleteMerchandise" method="post">
	<fieldset style="width:40%;float:right">
		<legend>Elimina un prodotto</legend>
			<input type="text" name="nome" placeholder="Inserisci il nome del prodotto" required> 
			<input type="submit" value="Invia">
</fieldset>
</form>

<form id="visualizzaOrdini" action="ViewOrders" method="post">
	<fieldset style="width:40%">
		<legend>Visualizza ordini ricevuti</legend>
			<input type="submit" value="Invia">
	</fieldset>
</form>

<br><br><br><br>

<%@ include file="footer.jsp"%>

</body>
</html>