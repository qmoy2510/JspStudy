 package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import shoppingmallMVC.utiill.DbConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class ActionCtrl
 */
@WebServlet("/ActionCtrl")
public class ActionCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActionCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		Connection conn = null;
		PreparedStatement stmt = null;
		//화면에 입력한 내용 받아오기
		String custno = request.getParameter("custno");
		String custname = request.getParameter("custname");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		Date joindate = Date.valueOf(request.getParameter("joindate"));
		String grade  = request.getParameter("grade");
		String city  = request.getParameter("city");
		//db의 member_tbl_02에 저장하기
		try {
			conn = DbConnection.getConnection();
			//3. 질의문 준비
			String sql = "insert into member_tbl_02 values((select nvl(max(custno), 10000) + 1 custno from member_tbl_02) ,?,?,?,?,?,?)";
			stmt = conn.prepareStatement(sql);
			//4. 질의문 세팅
			stmt.setString(1, custname);
			stmt.setString(2, phone);
			stmt.setString(3, address);
			stmt.setDate(4, joindate);
			stmt.setString(5, grade);
			stmt.setString(6, city);
			//5. 질의문 실행
			stmt.executeUpdate();
			response.sendRedirect("AddMemberCtrl");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			DbConnection.disConnection(stmt, conn);
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
