<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<header>    
   
   	<!--ACCESSO EFFETTUATO-->
   	<%
    if (session.getAttribute("username")!=null) { %>    
    <h3 id="accediRegistrati">
	
	
	<span style="text-align:left"> Ciao! <%=session.getAttribute("nome")%> </span>
	
	<a href="LogoutServlet">Logout</a>
	
	<input type="hidden" name="action" value="logout"/>
	
	</h3>
	
	<% } else { %>
	
	<!--ACCESSO NON EFFETTUATO-->
	
      <h3 id="accediRegistrati">
      <span style="text-align:left"> Ciao! <a href="accedi.jsp">Accedi</a> 
      o <a href="registrazione.jsp">registrati</a>! </span>
      </h3>
     <% } %>
    
    <div >
    <div style="float:left;display:inline;">
     <a href="index.jsp">
       <img id="logo" src="images/logo.png" alt="Il logo del nostro e-comerce">
     </a>
            
	 <div id="ciak">Ciak</div>
	
   </div>
   
   
   <div style="float:right;display:inline;">
    <a href="profilo.jsp">
       <img id="logoProfilo" src="images/profilo.jpg" alt="Un immagine che rappresenta il profilo">
    </a>
	 <a href="carrello.jsp">		
	 	 <img id="carrello" src="images/carrello.png" alt="Icona del carrello">
	 </a>
	</div>
  	</div>               
   
   <br><br><br><br><br><br>
   <nav>
      <div id="menuBar">
         <ul id="nav">
            <li><a href="index.jsp">HOME</a>
            <li><a href="catalogo.jsp">CATALOGO</a>
  <%
    if ((session.getAttribute("username")!=null)&&(session.getAttribute("tipo").equals("venditore"))){ %>
            <li><a href="OrdiniEMerce.jsp">ORDINI E MERCE</a>  <!--SOLAMENTE IL VENDITORE HA QUESTA SEZIONE-->
    <%}
    if ((session.getAttribute("username")!=null)&&(session.getAttribute("tipo").equals("cliente"))){ %>
            <li><a href="iMieiOrdini.jsp">I MIEI ORDINI</a>    <!--SOLAMENTE IL CLIENTE HA QUESTA SEZIONE-->
     <%} %>      
            <li><a href="contatti.jsp">CONTATTI</a>
         </ul>
      </div>
   </nav>
   
</header>
   