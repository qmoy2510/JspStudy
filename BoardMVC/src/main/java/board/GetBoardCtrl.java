package board;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
		//seq번호를 받아오기
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		//seq번호에 해당하는 게시글 Db가져오기
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			//1. 드라이버 로드
			Class.forName("oracle.jdbc.OracleDriver");
			//2. 연결설정
        	String url = "jdbc:oracle:thin:@localhost:1521:xe";
        	conn = DriverManager.getConnection(url, "qmoy2510", "1234");
        	//3. 질의문 준비
        	//3-1. 조회수 증가하기
        	String sql = "update board set cnt = cnt + 1 where seq = ?";
        	stmt = conn.prepareStatement(sql);
        	
        	stmt.setInt(1, seq);
        	stmt.executeUpdate();
        	
        	stmt.close();
        	//3-2. 게시글 가져오기
        	sql = "select * from board where seq = ?";
        	stmt = conn.prepareStatement(sql);
        	//4. 질의문 세팅
        	stmt.setInt(1, seq);
        	//5. 질의문 실행
        	rs = stmt.executeQuery();
        	if(rs.next()) {
        		//가져온 경우
        		BoardVO vo = new BoardVO();
        		vo.setSeq(rs.getInt("seq"));
        		vo.setTitle(rs.getString("title"));
        		vo.setNickname(rs.getString("nickname"));
        		vo.setContent(rs.getString("content"));
        		vo.setRegdate(rs.getDate("regdate"));
        		vo.setCnt(rs.getInt("cnt"));
        		vo.setUserid(rs.getString("userid"));
        		
        		request.setAttribute("board", vo);
        		RequestDispatcher view = request.getRequestDispatcher("getBoard.jsp");
        		view.forward(request, response);
        	}else {
				//가져오지 못한 경우 글 목록 화면 이동하기
        		response.sendRedirect("GetBoardListCtrl");
			}
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			}catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		//getBoard.jsp화면을 열기
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
