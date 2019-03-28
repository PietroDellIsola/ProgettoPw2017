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

   <%  
		ArrayList<Merchandise> listaMerce = (ArrayList<Merchandise>) request.getAttribute("listaMerce");
	%>
	
 	<!-- AGGIUNGERE LINK PER PAGUNA PRODOTTO -->
 	
 <br><br><br><br><br><br><br>
 
   <%
		for(Merchandise m : listaMerce) {
			int id=m.getId();
			String nome=m.getNome();
			String tipo=m.getTipo();
			String descrizione=m.getDescrizione();
			float prezzo=m.getPrezzo();
			int sconto=m.getSconto();
			
	%>    		
    		<fieldset style="width:88%;margin:5%;border:dashed;padding:2%"> 
    		
    <!--SOSTITUIRE H2 CON UN ANCORA PER LINK A PAGINA PRODOTTO 
    L'ID DEL PRODOTTO SERVE PER STAMPARE LA SUA PAGINA, FACENDO LA RICERCA
 	ASSIEME ALL'ID PRODOTTO (ENTRAMBE CHIAVI PRIMARIE) -->
    		
    			<div style="float:left;width:30%">
    			<%String filename="merchandiseImages"+'\\'+m.getFilename(); %>
    			<img  alt="Foto del prodotto" width=80% src="<%=filename%>">
    			</div>
    			<div style="float:right">
    				<h2 style="color:red"><%=nome%></h2>
    				<h3 style="color:blue">[ <%=tipo%> ]</h3>
    				<textarea rows="10" cols="70"><%=descrizione%></textarea>
    				<br><br>
    				<span style="font-weight: bold;width:20%;color:red;flag:left">Prezzo:  </span>
    				
    				<%if(sconto!=0){
    				float prezzoScont=prezzo-prezzo*((float)sconto/100);
    				%>
    				
    				<span ><%=prezzoScont%> &euro;</span>
    				<span style="font-weight: bold;width:20%;color:red;">Invece che:  </span>
    				<span style="text-decoration: line-through"><%=prezzo%> &euro;</span>
    				<%} %>
    				
    				<%if(sconto==0){ %>
    				<span><%=prezzo%> &euro;</span>
    				<%} %>
    			</div>
    		</fieldset>
	<%
		}
	%>
  
  <br><br><br><br>
<%@ include file="footer.jsp" %>

</body>
</html>