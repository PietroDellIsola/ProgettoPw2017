<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.util.ArrayList" %>
<%@ page import ="merce.db.Merchandise" %>    

<!DOCTYPE html>
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

<h1 style="color:red;text-align:center">Ricerca un prodotto:</h1>
<form name="form1" action="RicercaMerce" method="post">
	<div style="margin:4% 12% 4% 12%;padding:1%">
		<div >
		Scrivi il nome &nbsp;&nbsp;<input type="text" name="nome">
		&nbsp;&nbsp;Tipo <select name="tipo">
			<option value="" selected>---</option>
			<option value="film">Film</option>
			<option value="videogioco">Videogioco</option>
		</select>
	 	&nbsp; &nbsp;<input type="checkbox" name="sconto" value="1"> &nbsp;Prodotti scontati<br>
		<br><br>
		<div style="float:left">
		Prezzo minimo &nbsp;&nbsp;<input type="text" name="prezzoMin" value="0" required>
		<br><br>Prezzo massimo &nbsp;&nbsp;<input type="text" name="prezzoMax" value="0"  required>
		</div>
		
		<div style="float:right">
		<br><br><input  type="submit" value="Invia">
		</div>
		
		</div>
		
	</div>
</form>

<br><br>

 <%  
	ArrayList<Merchandise> listaMerce = null;
	
 	if(request.getAttribute("listaMerce")!=null){
 		listaMerce= (ArrayList<Merchandise>) request.getAttribute("listaMerce");
 		
 	}
 
 	if(listaMerce!=null){
 		if(listaMerce.size()==0){%> <h3>Nessun risultato</h3> <%}
	%>
	
 	<!-- AGGIUNGERE LINK PER PAGUNA PRODOTTO -->
 	
 <br>
 
   <%
		for(Merchandise m : listaMerce) {
			int id=m.getId();
			String nome=m.getNome();
			String tipo=m.getTipo();
			String descrizione=m.getDescrizione();
			float prezzo=m.getPrezzo();
			int sconto=m.getSconto();
			String username=m.getUsername();
			String filename="merchandiseImages"+'\\'+m.getFilename();
	%>    		
    		<fieldset style="width:88%;margin:5%;border:dashed;padding:2%">
    		<form action="AddItem" method="post">
    		    		
    			<div style="float:left;width:30%;margin">
    			<img  alt="Immagine del prodotto" width=95% src="<%=filename%>">
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
    				<br><span style="font-weight: bold;width:20%;color:red;">Invece che:  </span>
    				<span style="text-decoration: line-through"><%=prezzo%> &euro;</span>
    				<%} %>
    				
    				<%if(sconto==0){ %>
    				<span style="font-weight: bold;width:20%;color:red;flag:left">Prezzo:  </span>
    				<span><%=prezzo%> &euro;</span>
    				<%} %>
    				
    				<%
    				String t=null;
    				if((String)session.getAttribute("tipo")!=null){
    			 		t=(String)session.getAttribute("tipo");
    			 		
    			 	}
    			 
    			 	if((t!=null)&&(t.equals("cliente"))){
    				%>
    				<div style="float:right;">
    				<input onclick="alert('Articolo aggiunto al carrello')" type="submit" 
    				value="Aggiungi al carrello">
    				</div>
    				<%}%>
    				
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

<br>
	<%
			} //chiusura for
 		} //chiusura if
	%>
<%@ include file="footer.jsp" %>

</body>
</html>