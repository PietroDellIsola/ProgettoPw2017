package carrello.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import carrello.db.Cart;
import carrello.db.CartDAO;

/**
 * Servlet implementation class CompletePurchase
 */
@WebServlet("/CompletePurchase")
public class CompletePurchase extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompletePurchase() {
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
		
		/*PRELEVIAMO L'OGGETTO CARRELLO DELL'ISTANZA SESSION*/
		Cart carrello=(Cart) session.getAttribute("carrello");
		
		if(carrello==null)carrello=new Cart();
		
		CartDAO cd=new CartDAO();
		try {
			cd.doSave(carrello,username);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		/*UNA VONTA CONFERMATO L'ORDINE IL CARRELLO SI SVUOTA*/
		 session.setAttribute("carrello", new Cart());
		
		getServletContext().getRequestDispatcher("/carrello.jsp").forward(
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
