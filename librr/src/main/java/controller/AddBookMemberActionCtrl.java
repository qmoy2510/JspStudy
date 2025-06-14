package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.MemberVO;

import java.io.IOException;
import java.sql.Date;

import dao.MemberDAO;

/**
 * Servlet implementation class AddBookMemberActionCtrl
 */
@WebServlet("/AddBookMemberActionCtrl")
public class AddBookMemberActionCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBookMemberActionCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		MemberVO vo = new MemberVO();
		MemberDAO dao = new MemberDAO();
		vo.setCustNo(Integer.parseInt(request.getParameter("cust_no")));
		vo.setCustName(request.getParameter("cust_name"));
		vo.setPhone(request.getParameter("phone"));
		vo.setAddress(request.getParameter("address"));
		vo.setJoinDate(Date.valueOf(request.getParameter("joindate")));
		vo.setStatFg(request.getParameter("stat_fg"));
		dao.addBookMemberAction(vo);
		response.sendRedirect("AddBookMemberCtrl");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
