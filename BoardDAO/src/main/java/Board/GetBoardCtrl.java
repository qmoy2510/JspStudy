package Board;	

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import Baord.DAO.BoardDAO;
import Board.VO.BoardVO;

/**
 * Servlet implementation class GetBoardCtrl
 */
@WebServlet("/GetBoardCtrl")
public class GetBoardCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetBoardCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//seq번호 받아오기
		int seq = Integer.parseInt(request.getParameter("seq"));
		//dao 인스턴화 하기
		BoardDAO dao = new BoardDAO();
		//seq 번호에 해당하는 게시글 가져오기
		BoardVO vo = dao.getBoard(seq);
		//게시글에 해당하는 화면 열기
		request.setAttribute("board", vo);
		RequestDispatcher view = request.getRequestDispatcher("getBoard.jsp");
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
