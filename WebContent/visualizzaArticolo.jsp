<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="merce.db.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, user-scalable=no, 
initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="indexStyle.css">
<title>Ciak.it: film e videogiochi</title>
</head>
<body>

<%@ include file="header.jsp" %>
<br><br>
<h1 style="color:red;text-align:center">Dettagli Articolo:</h1>	
<br>
<%Merchandise articolo= (Merchandise)request.getAttribute("articolo");
if(articolo!=null){
%>
<div style="float:left;width:30%;margin">
    <img  alt="Immagine del prodotto" width=95% src="<%=articolo.getFilename()%>">
</div>
    <div style="float:right">
    <h4 style="color:green;float:right"><%=articolo.getUsername()%></h4>
    <h2 style="color:red"><%=articolo.getNome()%></h2>
    <h3 style="color:blue">[ <%=articolo.getTipo()%> ]</h3>
    <textarea rows="15" cols="70" readonly><%=articolo.getDescrizione()%></textarea>
    <br><br>
    				    				
    <%
    float prezzo=articolo.getPrezzo(),sconto=articolo.getSconto();
    			
    if(sconto!=0){
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
    </div>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br>
    <%} }%>
<%@ include file="footer.jsp" %>

</body>
</html>