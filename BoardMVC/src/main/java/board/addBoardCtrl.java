package board;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class addBoardCtrl
 */
@WebServlet("/addBoardCtrl")
public class addBoardCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public addBoardCtrl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 입력항목(제목, 내용)
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		// 세션 항목(작성자, 아이디)
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("name");
		String id = (String) session.getAttribute("id");

		// 인코딩
		request.setCharacterEncoding("UTF-8");

		Connection conn = null;
		PreparedStatement stmt = null;

		try {
			// 1. 드라이버 로드
			Class.forName("oracle.jdbc.OracleDriver");
			// 2. 연결설정
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(url, "qmoy2510", "1234");
			// 3.질의문 준비
			String sql = "insert into board(seq, title, nickname, content, regdate, userid)   "
					+ "values((select nvl(max(seq), 0)+1 from board), ?, ?, ?, sysdate, ?) ";
			stmt = conn.prepareStatement(sql);
			// 4. 질의문 세팅
			stmt.setString(1, title);
			stmt.setString(2, name);
			stmt.setString(3, content);
			stmt.setString(4, id);
			// 5. 질의문 실행
			stmt.executeUpdate();

			response.sendRedirect("GetBoardListCtrl");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 질의문 닫기
			try {
				if (stmt != null) {
					stmt.close();
				}
				if (conn != null) {
					stmt.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
