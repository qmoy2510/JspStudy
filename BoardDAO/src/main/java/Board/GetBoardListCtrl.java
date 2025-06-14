package Board;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import org.apache.catalina.connector.Request;

import Baord.DAO.BoardDAO;
import Board.VO.BoardVO;

/**
 * Servlet implementation class GetBoardListCtrl
 */
@WebServlet("/GetBoardListCtrl")
public class GetBoardListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetBoardListCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//검색 조건과 검색어를 받아오기
		String searchCondition = request.getParameter("searchCondition");
		String searchKeyword = request.getParameter("searchKeyword");
		if(searchCondition == null) {
			searchCondition = "TITLE";
		}
		if(searchKeyword == null) {
			searchKeyword= "";
		}
		
		//dao의 인스턴스를 생성하고
		BoardDAO dao = new BoardDAO();
		
		//dao에서 db작업으로 게시글 가져오기
		ArrayList<BoardVO> bList = dao.getBoardList(searchCondition, searchKeyword);
		
		request.setAttribute("bList", bList);
		
		RequestDispatcher view = request.getRequestDispatcher("getBoardList.jsp");
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
