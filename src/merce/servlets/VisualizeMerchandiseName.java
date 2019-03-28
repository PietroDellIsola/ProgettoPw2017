package merce.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import merce.db.Merchandise;
import merce.db.MerchandiseDAO;

/**
 * Servlet implementation class VisualizeMerchandiseName
 */
@WebServlet("/VisualizeMerchandiseName")
public class VisualizeMerchandiseName extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VisualizeMerchandiseName() {
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
		/*CERCO SOLTANTO LA MERCE DI QUEL VENDITORE TRAMITE USERNAME*/
		String MerchandiseName=request.getParameter("nomeProdotto");
		Merchandise merce=new Merchandise();
				
		MerchandiseDAO cd=new MerchandiseDAO();
		try {
			 merce = cd.getMerchandiseName(username,MerchandiseName);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("articolo", merce); 
		
		getServletConfig().getServletContext().getRequestDispatcher("/OrdiniEMerce.jsp").forward(
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
