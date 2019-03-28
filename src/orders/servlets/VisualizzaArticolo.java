package orders.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import merce.db.Merchandise;

/**
 * Servlet implementation class VisualizzaArticolo
 */
@WebServlet("/VisualizzaArticolo")
public class VisualizzaArticolo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VisualizzaArticolo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		Merchandise m=new Merchandise();
		m.setId(Integer.parseInt(request.getParameter("id")));
		m.setNome(request.getParameter("nome"));
		m.setTipo(request.getParameter("tipo"));
		m.setDescrizione(request.getParameter("descrizione"));	
		m.setPrezzo(Float.parseFloat(request.getParameter("prezzo")));
		m.setUsername(request.getParameter("username"));
		m.setFilename(request.getParameter("filename"));
		m.setSconto(Integer.parseInt(request.getParameter("sconto")));
		
		request.setAttribute("articolo", m);

		getServletConfig().getServletContext().getRequestDispatcher("/visualizzaArticolo.jsp").forward(
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
