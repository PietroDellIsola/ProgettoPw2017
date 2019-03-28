package ricerca.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import merce.db.Merchandise;
import merce.db.MerchandiseDAO;

/**
 * Servlet implementation class RicercaMerce
 */
@WebServlet("/RicercaMerce")
public class RicercaMerce extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RicercaMerce() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		ArrayList<Merchandise> merce=new ArrayList<Merchandise>();

		String nome=request.getParameter("nome");
		String tipo=request.getParameter("tipo");
		
		int sconto;
		if(request.getParameter("sconto")==null)sconto=0;
		else sconto=Integer.parseInt(request.getParameter("sconto"));
		
		float minPrice=Float.parseFloat(request.getParameter("prezzoMin"));
		float maxPrice=Float.parseFloat(request.getParameter("prezzoMax"));
		if(maxPrice==0)maxPrice=99999;
		
		MerchandiseDAO cd=new MerchandiseDAO();
		try {
			 merce = cd.findMerchandise(nome,tipo,sconto,minPrice,maxPrice);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("listaMerce", merce); 
		
		getServletConfig().getServletContext().getRequestDispatcher("/catalogo.jsp").forward(
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
