package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.MemberVO;
import vo.MenMonVo;

import java.io.IOException;
import java.util.ArrayList;

import dao.MemberMoneyDao;

/**
 * Servlet implementation class MemberMoneyCtrl
 */
@WebServlet("/MemberMoneyCtrl")
public class MemberMoneyCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberMoneyCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		MemberMoneyDao dao = new MemberMoneyDao();
		ArrayList<MenMonVo> list = dao.getMemberMoney();
		
		//회원 매출 조회 화면 열기
		request.setAttribute("list", list);
		RequestDispatcher view = request.getRequestDispatcher("memberMoney.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
