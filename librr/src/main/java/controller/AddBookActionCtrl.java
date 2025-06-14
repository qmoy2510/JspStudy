package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.BookVO;

import java.io.IOException;
import java.sql.Date;

import dao.BookDAO;

/**
 * Servlet implementation class AddBookActionCtrl
 */
@WebServlet("/AddBookActionCtrl")
public class AddBookActionCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBookActionCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		BookVO vo = new BookVO();
		vo.setBookCode(request.getParameter("book_code"));
		vo.setBookName(request.getParameter("book_name"));
		vo.setBookType(request.getParameter("book_type"));
		vo.setBookAuthor(request.getParameter("book_author"));
		vo.setInDate(Date.valueOf(request.getParameter("in_date")));
		vo.setStatFg(request.getParameter("stat_fg"));
		BookDAO dao = new BookDAO();
		request.setAttribute("msg", dao.addBook(vo));
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
