package board;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.spi.DirStateFactory.Result;

import org.apache.catalina.connector.Request;

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
		
		//인코딩
		request.setCharacterEncoding("UTF-8");
		
		//로그인 되어있는지 확인
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("id");
		if(id == null) {
			response.sendRedirect("login.jsp");
		}
		
		//DB에 가서 글을 읽고 VO에 담기
		Connection conn =null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			String searchCondition = request.getParameter("searchCondition");
			String searchKeyword = request.getParameter("searchKeyword");			
			
			if(searchCondition == null) searchCondition = "TITLE";
			if (searchKeyword == null) searchKeyword = "";
			//1. 드라이버 로드
			Class.forName("oracle.jdbc.OracleDriver");
			//2. 연결설정
        	String url = "jdbc:oracle:thin:@localhost:1521:xe";
        	conn = DriverManager.getConnection(url, "qmoy2510", "1234");

			//3. 질의문 준비
        	String sql = "select * from board ";
        	
        	if (searchCondition.equals("TITLE")) {
        		sql += "where title like '%'||?||'%' ";
        	}else {
        		sql += "where content like '%'||?||'%' ";
        	}
        	
        	sql += "order by seq desc ";
        	stmt = conn.prepareStatement(sql);
			//4. 질의문 세팅
        	stmt.setString(1, searchKeyword);
			//5. 질의문 실행
        	rs = stmt.executeQuery();
        	
        	ArrayList<BoardVO> list = new ArrayList<BoardVO>();
        	while(rs.next()) {
        		BoardVO vo =new BoardVO();
        		vo.setSeq(rs.getInt("seq"));
        		vo.setTitle(rs.getString("title"));
        		vo.setNickname(rs.getString("nickname"));
        		vo.setContent(rs.getString("content"));
        		vo.setRegdate(rs.getDate("regdate"));
        		vo.setCnt(rs.getInt("cnt"));
        		vo.setUserid(rs.getString("userid"));
        		
        		list.add(vo);
        	}
        	request.setAttribute("boardList", list);
        	RequestDispatcher view = request.getRequestDispatcher("getBoardList.jsp");
        	view.forward(request, response);
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			//질의문 닫기
			try {
				if(rs !=null)rs.close();
				if(stmt !=null)stmt.close();
				if(conn !=null)conn.close();
			}
			catch(Exception e2){
				e2.printStackTrace();
			}
		}
		//VO를 jsp파일에 전달해서 화면 열기
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
