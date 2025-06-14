package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import shoppingmallMVC.utiill.DbConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import VO.MemMonVO;

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
		//db에서 회원 매출조회를 가져오기
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DbConnection.getConnection();
			
			String sql = "select me.custno, custname, case grade when 'A' then 'VIP' when 'B' then '일반' when 'C' then '직원' end grade, sum(price) price from member_tbl_02 me, money_tbl_02 mo where me.custno = mo.custno group by me.custno, custname, grade";
			stmt = conn.prepareStatement(sql);
			ArrayList<MemMonVO> list = new ArrayList<MemMonVO>();
			rs = stmt.executeQuery();
			while(rs.next()) {
				MemMonVO vo = new MemMonVO();
				vo.setCustno(rs.getString("custno"));
				vo.setCustname(rs.getString("custname"));
				vo.setGrade(rs.getString("grade"));
				vo.setPrice(rs.getString("price"));
				
				list.add(vo);
			}
			
			request.setAttribute("list",list);
			RequestDispatcher view = request.getRequestDispatcher("memberMoney.jsp");
			view.forward(request, response);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			DbConnection.disConnection(rs, stmt, conn);
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
