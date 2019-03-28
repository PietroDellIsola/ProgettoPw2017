package merce.servlets;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import merce.db.Merchandise;
import merce.db.MerchandiseDAO;

/**
 * Servlet implementation class Research
 */
@WebServlet("/AddMerchandise")
@MultipartConfig //ALTRIMENTI I PARAMETRI DELLA REQUEST RISULTANO NULL
public class AddMerchandise extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String SAVE_DIR = "merchandiseImages";
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMerchandise() {
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
		
		String nome=request.getParameter("nome");
		String tipo=request.getParameter("tipo");
		String descrizione=request.getParameter("descrizione");		
		float prezzo=Float.parseFloat(request.getParameter("prezzo"));
		String username=(String) session.getAttribute("username");
		int sconto= Integer.parseInt(request.getParameter("sconto"));
		
		//IMMAGINE
		String filename = "";

		String appPath = request.getServletContext().getRealPath("");
		String savePath = appPath + File.separator + SAVE_DIR;

		// creates the save directory if it does not exists
		File fileSaveDir = new File(savePath);
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdir();
		}

		for (Part part : request.getParts()) {
			String fileName = extractFileName(part);
			if (fileName != null && !fileName.equals("")){
			// refines the fileName in case it is an absolute path
				fileName = new File(fileName).getName();
				part.write(savePath + File.separator + fileName);
				filename = fileName;
			}
		}
		//IMMAGINE..
		
		Merchandise merchandise= new Merchandise();
		merchandise.setNome(nome);
		merchandise.setTipo(tipo);
		merchandise.setDescrizione(descrizione);
		merchandise.setPrezzo(prezzo);
		merchandise.setUsername(username);
		merchandise.setFilename(filename);
		merchandise.setSconto(sconto);
		
		MerchandiseDAO cd=new MerchandiseDAO();
		try {
			cd.doSave(merchandise);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		getServletContext().getRequestDispatcher("/confermaOperazioneSuMerce.jsp").forward(
				request, response);
	}
	

	private String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		System.out.println("contentDisp= " + contentDisp);
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length()-1);
			}
		}
		return "";
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
