package profilo.servlets;
import registrazione.db.UserData;
import profilo.db.*;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class EditProfile
 */
@WebServlet("/EditProfile")
public class EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		HttpSession session= request.getSession(false);
		String username=(String) session.getAttribute("username"); 
		
		UserData user=new UserData();
		user.setUsername(username);
		user.setNome(request.getParameter("nome"));
		user.setCognome(request.getParameter("cognome"));
		user.setCellulare(request.getParameter("cellulare"));
		user.setIndirizzo(request.getParameter("indirizzo"));
		user.setCitta(request.getParameter("citta"));
		user.setEmail(request.getParameter("email"));
		
		ProfileDAO pd=new ProfileDAO();
		
		/*AGGIORNIAMO ANCHE I DATI DELLA SESSION*/
		session.setAttribute("nome", request.getParameter("nome"));
		session.setAttribute("cognome", request.getParameter("cognome"));
		session.setAttribute("cellulare", request.getParameter("cellulare"));
		session.setAttribute("indirizzo", request.getParameter("indirizzo"));
		session.setAttribute("citta", request.getParameter("citta"));
		session.setAttribute("email", request.getParameter("email"));
		
		try {
			pd.modifyUser(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		getServletContext().getRequestDispatcher("/profilo.jsp").forward(
				request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
