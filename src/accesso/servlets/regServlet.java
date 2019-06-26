package accesso.servlets;

import registrazione.db.UserData;
import carrello.db.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class regServlet
 */
@WebServlet("/regServlet")
public class regServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public regServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session= request.getSession(true);
		
		synchronized(session){
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			UserData userLogin = pwdCheck(username, password);

			if (userLogin != null){
				System.out.println("Login "+userLogin.getUsername());
				session.setAttribute("username", userLogin.getUsername());
				session.setAttribute("nome", userLogin.getNome());
				session.setAttribute("cognome", userLogin.getCognome());
				session.setAttribute("cellulare", userLogin.getCellulare());
				session.setAttribute("indirizzo", userLogin.getIndirizzo());
				session.setAttribute("citta", userLogin.getCitta());
				session.setAttribute("email", userLogin.getEmail());
				session.setAttribute("tipo", userLogin.getTipo());
				
				if(userLogin.getTipo().equals("cliente"))
				session.setAttribute("carrello", new Cart());
					/*AGGIUNGIAMO UN OGGETTO CARRELLO ALLA SESSIONE*/
				
				
				
								}
			else{
					request.setAttribute("logged", "errore login");
					System.out.println("Login error");
				}
	
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/accedi.jsp");
			dispatcher.forward(request,response);

										}
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private UserData pwdCheck(String username, String password){
		Connection conn = null;
		Statement stmt = null;
		
		
		try {

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/dbprogettopw", "root", ""); // <== Check!
			// database-URL(hostname, port, default database), username, password

			// Step 2: Allocate a Statement object within the Connection
			stmt = conn.createStatement();

			// Step 3: Execute a SQL SELECT query
			String sqlStr = "select * from users";
			ResultSet rset = stmt.executeQuery(sqlStr);  // Send the query to the server

			// Step 4: Process the query result set
			
			while (rset.next()) 
				// Print a paragraph <p>...</p> for each record
				if (rset.getString("username").equalsIgnoreCase(username) && rset.getString("password").equalsIgnoreCase(password))
						{
							UserData user= new UserData();
							user.setUsername(rset.getString("username"));
							user.setNome(rset.getString("nome"));
							user.setCognome(rset.getString("cognome"));
							user.setCellulare(rset.getString("cellulare"));
							user.setIndirizzo(rset.getString("indirizzo"));
							user.setCitta(rset.getString("citta"));
							user.setEmail(rset.getString("email"));
							user.setTipo(rset.getString("tipo"));
							return user;
						}

		} catch (SQLException ex) {
			ex.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
		    try
		    {
		        conn.close();
		    }
		    catch (SQLException e)
		    {
		        e.printStackTrace();
		    }
		}
		return null;
	}

}
