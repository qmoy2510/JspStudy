package board;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import org.apache.jasper.tagplugins.jstl.core.Catch;

/**
 * Servlet implementation class UpdateBoardCtrl
 */
@WebServlet("/UpdateBoardCtrl")
public class UpdateBoardCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBoardCtrl() {
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
		
		int seq = Integer.parseInt(request.getParameter("seq"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Connection conn =null;
		PreparedStatement stmt = null;
		
		
		try {
			//1. 드라이버 로드
			Class.forName("oracle.jdbc.OracleDriver");
			//2. 연결설정
	    	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	    	conn = DriverManager.getConnection(url, "qmoy2510", "1234");
	    	
	    	String sql = "update board set title = ?, content = ? where seq = ?";
	    	stmt = conn.prepareStatement(sql);
	    	
	    	stmt.setString(1, title);
	    	stmt.setString(2, content);
	    	stmt.setInt(3, seq);
	    	
	    	stmt.executeUpdate();
	    	
	    	response.sendRedirect("GetBoardListCtrl");
	    	
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(stmt != null) {
					stmt.close();
				}
				if(conn != null) {
					stmt.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
