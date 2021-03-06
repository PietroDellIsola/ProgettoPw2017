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

import orders.db.Orders;
import orders.db.OrdersDAO;
import registrazione.db.UserData;

/**
 * Servlet implementation class ViewOrders
 */
@WebServlet("/ViewOrders")
public class ViewOrders extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewOrders() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		/*CERCO SOLTANTO GLI ORDINI DI QUEL VENDITORE TRAMITE USERNAME*/
		HttpSession session= request.getSession(false);
		String username=(String) session.getAttribute("username");
		
		ArrayList<Orders> ordini=new ArrayList<Orders>();
		ArrayList<UserData> clienti=new ArrayList<>();
		
		OrdersDAO od= new OrdersDAO();
		try {
			ordini=od.getOrdiniRicevuti(username);
			clienti=od.getUsers();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("ordini", ordini); 
		request.setAttribute("clienti", clienti);
		
		getServletConfig().getServletContext().getRequestDispatcher("/iMieiOrdini.jsp").forward(
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
