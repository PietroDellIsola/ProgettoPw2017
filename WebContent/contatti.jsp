<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<jsp:useBean id="userData" class="registrazione.db.UserData" scope="session" />    
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

   <div >
   <BR><BR>
         <h1 style="color:red;text-align:center">Contattaci:</h1>
		<BR><BR><BR>
		 <fieldset style="border-style:dashed; margin: 0% 10% 0% 10%">
    		<legend ></legend>
    			<p>
    			<b>Via Pietro Custodi, 1 
    			<br>28100 Novara, Italia
    			<br>
    			<br>tel +39 0321 031 057
    			<br>fax +39 0321 030 855
    			<br>
    			<br>info@ciak.it
    			</b>
    			</p>
 		 </fieldset>
 		       
        <BR><BR><BR><BR><BR>
   </div>
   
<%@ include file="footer.jsp" %>  

</body>
</html>