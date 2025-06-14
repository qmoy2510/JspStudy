package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.RentalVO;

import java.io.IOException;

import dao.RentalDAO;

/**
 * Servlet implementation class AddMemberCtrl
 */
@WebServlet("/AddRentalBookActionCtrl")
public class AddRentalBookActionCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddRentalBookActionCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RentalVO vo = new RentalVO();
		vo.setRentBook(request.getParameter("rent_book"));
		vo.setRentRent(Integer.parseInt(request.getParameter("rent_rent")));
		RentalDAO dao = new RentalDAO();
		request.setAttribute("msg", dao.addBookAction(vo));
		response.sendRedirect("AddRentalBookCtrl");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
