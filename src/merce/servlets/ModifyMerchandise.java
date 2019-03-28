package merce.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import merce.db.Merchandise;
import merce.db.MerchandiseDAO;
import profilo.db.ProfileDAO;
import registrazione.db.UserData;

/**
 * Servlet implementation class ModifyMerchandise
 */
@WebServlet("/ModifyMerchandise")
public class ModifyMerchandise extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyMerchandise() {
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
		
		Merchandise merchandise=new Merchandise();
		merchandise.setNome(request.getParameter("nome"));
		merchandise.setTipo(request.getParameter("tipo"));
		merchandise.setDescrizione(request.getParameter("descrizione"));
		merchandise.setPrezzo(Float.parseFloat(request.getParameter("prezzo")));
		merchandise.setUsername(username);
		merchandise.setFilename(request.getParameter("filename"));
		merchandise.setSconto(Integer.parseInt(request.getParameter("sconto")));
		String nomeProdotto=request.getParameter("nomeProdotto");
		
		MerchandiseDAO md=new MerchandiseDAO();
		
		try {
			md.modifyMerchandise(merchandise,nomeProdotto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		getServletContext().getRequestDispatcher("/OrdiniEMerce.jsp").forward(
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
