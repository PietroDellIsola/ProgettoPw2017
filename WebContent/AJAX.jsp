<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="registrazione.db.*" %>
<%@ page import="java.sql.*" %>
    	
    	 <% 	
    	 		response.setContentType("text");
    	 		
    	 		
    	 		String risultato="";
    	 		String username=request.getParameter("username");
    	 		UserDataDAO ud=new UserDataDAO();
    	 		boolean flag=false;
    	 		
    	 		try {
    	 			flag=ud.getUsername(username);
    	 			if(flag==true){
    	 				risultato="Username non disponibile";
    	 				}
    	 			else{
    	 				risultato="Username disponibile";
    	 				}
    	 			
    	 			
    	 		} catch (SQLException e) {
    	 			// TODO Auto-generated catch block
    	 			e.printStackTrace();
    	 		}
    	 		
    	 	response.getWriter().write(risultato);
    
         %>
