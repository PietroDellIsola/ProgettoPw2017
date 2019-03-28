<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="registrazione.db.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Ciak.it: film e videogiochi</title>
<meta name="viewport" content="width=device-width, user-scalable=no, 
initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
<link rel="stylesheet" type="text/css" href="indexStyle.css">
</head>
<body>
   
<%@ include file="header.jsp" %>

<br><br>
<h1 style="color:red;text-align:center">Scegli una categoria:</h1>
<br><br>

<h2 id="textLogoVideogiochi" >Videogiochi</h2>
<h2 id="textLogoFilm" >Film</h2>

<br><br><br><br><br><br>

<div id="divLogoCategoriaVideogiochi">
<form action="RicercaMerce" method="get">
	<input type="hidden" name="nome" value="">
	<input type="hidden" name="tipo" value="videogioco">
	<input type="hidden" name="sconto" value="0">
	<input type="hidden" name="prezzoMin" value="0">
	<input type="hidden" name="prezzoMax" value="99999">
	<button id="buttonLogoCategoriaVideogiochi" type="submit" >
		<img src="images/categoriaVideogiochi.png" alt="Un logo per i videogiochi" height="260" width="260">
	</button>
</form>
</div>

<div id="divLogoCategoriaFilm">
<form action="RicercaMerce" method="get">
	<input type="hidden" name="nome" value="">
	<input type="hidden" name="tipo" value="film">
	<input type="hidden" name="sconto" value="0">
	<input type="hidden" name="prezzoMin" value="0">
	<input type="hidden" name="prezzoMax" value="99999">
	<button id="buttonLogoCategoriaFilm" type="submit">
		<img src="images/categoriaFilm.jpg" alt="Un logo per i film" height="260" width="260">
	</button>
</form>
</div>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
  
<%@ include file="footer.jsp" %>

</body>
</html>