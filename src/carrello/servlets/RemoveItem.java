package carrello.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import carrello.db.Cart;
import merce.db.Merchandise;

/**
 * Servlet implementation class RemoveItem
 */
@WebServlet("/RemoveItem")
public class RemoveItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveItem() {
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
		
		/*PRELEVIAMO L'OGGETTO CARRELLO DELL'ISTANZA SESSION*/
		Cart carrello=(Cart) session.getAttribute("carrello");
		
		/*ELIMINIAMO IL NUOVO OGGETTO ITEM DAL CARRELLO TRAMITE IL SUO ID*/
		carrello.deleteMerchandise(Integer.parseInt(request.getParameter("id")));
		
		
		session.removeAttribute("carrello");
		session.setAttribute("carrello",carrello);
		
				
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/carrello.jsp");
		dispatcher.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
