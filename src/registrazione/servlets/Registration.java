package registrazione.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import registrazione.db.UserData;
import registrazione.db.UserDataDAO;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/Registration")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
maxFileSize=1024*1024*10,      // 10MB
maxRequestSize=1024*1024*50)   // 50MB


public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * Default constructor. 
	 */
	public Registration() {
		// TODO Auto-generated constructor stub
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		
		String username = request.getParameter("username");
		String nome = request.getParameter("nome");
		String cognome = request.getParameter("cognome");
		String cellulare = request.getParameter("cellulare");
		String citta=request.getParameter("citta");
		String indirizzo = request.getParameter("indirizzo");
		String email = request.getParameter("email");
		String password = request.getParameter("password1");
		String tipo = request.getParameter("tipo");
		boolean flag=false;
	
		
		UserData data = new UserData();
		data.setUsername(username);
		data.setNome(nome);
		data.setCognome(cognome);
		data.setCellulare(cellulare);
		data.setIndirizzo(indirizzo);
		data.setCitta(citta);
		data.setEmail(email);
		data.setPassword(password);
		data.setTipo(tipo);
		
		
		UserDataDAO usd = new UserDataDAO();
		try {
			flag=usd.doSave(data);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(flag==true){
		request.setAttribute("nome", nome);
		getServletContext().getRequestDispatcher("/conferma.jsp").forward(
				request, response);
		}
		else {
			getServletContext().getRequestDispatcher("/errorPage.jsp").forward(
					request, response);			
		}
		
	}


}
