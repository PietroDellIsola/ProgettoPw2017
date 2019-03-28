<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="carrello.db.*" %>
<%@ page import="merce.db.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, user-scalable=no, 
initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
<title>Ciak.it: film e videogiochi</title>
<link rel="stylesheet" type="text/css" href="indexStyle.css">

</head>
<body>
   
	<%@ include file="header.jsp" %>

	<br><br>
	<h1 style="color:red;text-align:center">Carrello attuale:</h1>
	<br><br>

	<%
		if (session.getAttribute("tipo")==null)
		 	response.sendRedirect("accedi.jsp");

		else if (session.getAttribute("tipo").equals("venditore")){
				/*IL VENDITORE NON POSSIEDE UN CARRELLO*/
				response.sendRedirect("index.jsp");
						}

		else{

	
	Cart cart=new Cart();
	
	cart=(Cart)session.getAttribute("carrello");
	ArrayList<Merchandise> merce= cart.getMerchandise();
	
	float totalePagamento=0;
	
	for(Merchandise m:merce){
		/*STAMPA PRODOTTI CARRELLO*/
		 int id=m.getId();
		 String nome=m.getNome();
		 String tipo=m.getTipo();
		 String descrizione=m.getDescrizione();
		 float prezzo=m.getPrezzo();
		 String username=m.getUsername();
		 String filename=m.getFilename();
		 int sconto=m.getSconto();
		 
		 if(sconto!=0)
		 		totalePagamento=totalePagamento+(prezzo-(prezzo*sconto/100));
		 else totalePagamento += prezzo;
		 
		 %> 
		 
		 
		 
		 	<fieldset style="width:88%;margin:5%;border:dashed;padding:2%">
    		<form action="RemoveItem" method="get">
    		
    <!--SOSTITUIRE H2 CON UN ANCORA PER LINK A PAGINA PRODOTTO 
    L'ID DEL PRODOTTO SERVE PER STAMPARE LA SUA PAGINA, FACENDO LA RICERCA
 	ASSIEME ALL'ID PRODOTTO (ENTRAMBE CHIAVI PRIMARIE) -->
    		
    			<div style="float:left;width:30%;">
    			<img  alt="Foto del prodotto" width=95% src="<%=filename%>">
    			</div>
    			<div style="float:right">
    				<h4 style="color:green;float:right"><%=username%></h4>
    				<h2 style="color:red"><%=nome%></h2>
    				<h3 style="color:blue">[ <%=tipo%> ]</h3>
    				<textarea rows="10" cols="60" readonly><%=descrizione%></textarea>
    				<br><br>
    				    				
    				<%if(sconto!=0){
    				float prezzoScont=prezzo-prezzo*((float)sconto/100);
    				%>
    				<span style="font-weight: bold;width:20%;color:red;flag:left">Sconto del: </span> <span style="color:black"><%=sconto %>%</span>
    				<br>
    				<span style="font-weight: bold;width:20%;color:red;flag:left">Prezzo:  </span>
    				<span ><%=prezzoScont%> &euro;</span>
    				<span style="font-weight: bold;width:20%;color:red;">Invece che:  </span>
    				<span style="text-decoration: line-through"><%=prezzo%> &euro;</span>
    				<%} %>
    				
    				<%if(sconto==0){ %>
    				<span style="font-weight: bold;width:20%;color:red;flag:left">Prezzo:  </span>
    				<span><%=prezzo%> &euro;</span>
    				<%} %>
    				<div style="float:right;">
    				<input type="submit" value="Rimuovi dal carrello">
    				</div>
    				
    				<input type="hidden" name="id" value="<%=id%>">
    				<input type="hidden" name="filename" value="<%=filename %>">
    				<input type="hidden" name="sconto" value="<%=sconto %>">
    				<input type="hidden" name="nome" value="<%=nome %>">
    				<input type="hidden" name="tipo" value="<%=tipo %>">
    				<input type="hidden" name="descrizione" value="<%=descrizione %>">
    				<input type="hidden" name="prezzo" value="<%=prezzo %>">
    				<input type="hidden" name="username" value="<%=username %>">
    				
    			</div>
    		</form>
    		
    		</fieldset>

		 
		 
		 
		 <%
							}
	if(totalePagamento==0){%><h3>Carrello vuoto</h3><%}%>
	 <span style="font-weight: bold;color:red;">Prezzo Totale:  </span>
	 <span><%=totalePagamento%> &euro;</span> <%
	if(totalePagamento!=0){
		 %>
		 <form action="CompletePurchase" method="get">
		 <input onclick="alert('Acquisto completo')" style="float:right;height:40px" type="submit" value="Completa l'acquisto">
		 </form>
		 <%				}
	}
	%>
	<br><br><br><br><br><br>
  
	<%@ include file="footer.jsp" %>

	</body>
	</html>