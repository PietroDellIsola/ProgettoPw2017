<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.util.ArrayList" %>
<%@ page import ="orders.db.*" %>
<%@ page import ="merce.db.*" %>
<%@ page import ="registrazione.db.UserData" %>
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
<h1 style="color:red;text-align:center">Dettagli ordini:</h1>	
<br>
<% if(session.getAttribute("tipo").equals("cliente")) {%>

<form action="getOrdersMade" method="post">
	<div>
	<input style="float:right" type="submit" value="Sincronizza"><br><br>
	</div>
</form>
<% } 
	ArrayList<Orders> ordini = null;
	
 	if(request.getAttribute("ordini")!=null){
 		ordini= (ArrayList<Orders>) request.getAttribute("ordini");
 		
 	}
 
 	if((ordini!=null)){
 		if(ordini.size()==0){%> <h3>Nessun risultato</h3> <%}
 		else {
 		 if(session.getAttribute("tipo").equals("venditore")){
 			 //SE E' IL VENDITORE A FARE LA RICHIESTA
 			for(Orders o:ordini){ //PER OGNI ORDINE
 				for(Merchandise m:o.getProdotti())
 				if(m.getUsername().equals(session.getAttribute("username"))){
	%>
<br><br>	
<fieldset>
  <legend>Id ordine:&nbsp;&nbsp;<%=o.getIdOrdine() %></legend>
	<div style="width:100%">
	<span style="float:right">Data ordine:&nbsp;&nbsp;<%=o.getDataOrdine() %></span>
	</div>
	<br><br>
	<div style="float:right">
	<% ArrayList<UserData> clienti= null;
	if(request.getAttribute("clienti")!=null){
		clienti= (ArrayList<UserData>) request.getAttribute("clienti");
	for(UserData us:clienti){ 
	if(o.getUsername().equals(us.getUsername())){%>
	<h2>Dati cliente:</h2>
	<h3>Username: &nbsp;&nbsp;<%=us.getUsername() %></h3>
	<h3>Nome: &nbsp;&nbsp;<%=us.getNome() %></h3>
	<h3>Cognome: &nbsp;&nbsp;<%=us.getCognome() %></h3>
	<h3>Cellulare: &nbsp;&nbsp;<%=us.getCellulare() %></h3>
	<h3>Indirizzo: &nbsp;&nbsp;<%=us.getIndirizzo() %></h3>
	<h3>Città: &nbsp;&nbsp;<%=us.getCitta() %></h3>
	<h3>Email: &nbsp;&nbsp;<%=us.getEmail() %></h3>
	<%} } }%>
	</div>
	<div>
	 <br><br>
	
	<%
	String filename="merchandiseImages"+'\\'+m.getFilename();%>
	<form action="VisualizzaArticolo" method="post">
	<button style="background-color:white;border: 1px solid greey;" type="submit">
		<img src="<%=filename%>" alt="Immagine del prodotto" height="auto" width="200px">
	</button>
	<input type="hidden" name="id" value="<%=m.getId()%>">
    <input type="hidden" name="filename" value="<%=filename%>">
    <input type="hidden" name="sconto" value="<%=m.getSconto() %>">
    <input type="hidden" name="nome" value="<%=m.getNome() %>">
    <input type="hidden" name="tipo" value="<%=m.getTipo() %>">
    <input type="hidden" name="descrizione" value="<%=m.getDescrizione() %>">
    <input type="hidden" name="prezzo" value="<%=m.getPrezzo() %>">
    <input type="hidden" name="username" value="<%=m.getUsername() %>">
	</form>
	</div>
	
</fieldset>
<br>	
	
	

<%
 			}//chiusura if(o.getUsername().equals(session.getAttribute("username")))
 			}//chiusura for ordini
 		 }//if(session.getAttribute("tipo").equals("venditore"))
  else{
	//SE E' IL CLIENTE A FARE LA RICHIESTA
  for(Orders o:ordini){ //PER OGNI ORDINE
	  %>	<br><br>	
	 	<fieldset>
	 	  <legend>Id ordine:&nbsp;&nbsp;<%=o.getIdOrdine() %></legend>
	 		<div style="width:100%">
	 		<span style="float:right">Data ordine:&nbsp;&nbsp;<%=o.getDataOrdine() %></span>
	 		</div>
	 		<br><br>
	 		<div>
		 <br><br>
	 	<%
	  for(Merchandise m:o.getProdotti()){
 	
	String filename="merchandiseImages"+'\\'+m.getFilename();%>
	<form action="VisualizzaArticolo" method="post">
	<button style="background-color:white;border: 1px solid greey;" type="submit">
		<img src="<%=filename%>" alt="Immagine del prodotto" height="auto" width="200px">
	</button>
	<input type="hidden" name="id" value="<%=m.getId()%>">
    <input type="hidden" name="filename" value="<%=filename%>">
    <input type="hidden" name="sconto" value="<%=m.getSconto() %>">
    <input type="hidden" name="nome" value="<%=m.getNome() %>">
    <input type="hidden" name="tipo" value="<%=m.getTipo() %>">
    <input type="hidden" name="descrizione" value="<%=m.getDescrizione() %>">
    <input type="hidden" name="prezzo" value="<%=m.getPrezzo() %>">
    <input type="hidden" name="username" value="<%=m.getUsername() %>">
	</form>
	</div>
		
 				
 		<%
 		}//chiusura for prodotti per ogni ordine
	  %></fieldset><br><% 
 		}//chiusura for ordini per cliente
 		 }//chiusura else(SE E' UN CLIENTE)
 		
 		}//chiusura else rispetto a if(ordini.size()==0)
 		} //chiusura if(ordini!=null)
	%>
<br><br>
<%@ include file="footer.jsp" %>

</body>
</html>