package user;



import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.http.HttpServlet;

import jakarta.servlet.http.HttpServletRequest;

import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.http.HttpSession;



import java.io.IOException;

import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.PreparedStatement;

import java.sql.ResultSet;



/**

 * Servlet implementation class LoginCtrl2

 */
@WebServlet ("/LoginCtrl2")
public class LoginCtrl2 extends HttpServlet {

	private static final long serialVersionUID = 1L;

       

    /**

     * @see HttpServlet#HttpServlet()

     */

    public LoginCtrl2() {

        super();

        // TODO Auto-generated constructor stub

    }



	/**

	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)

	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// TODO Auto-generated method stub

		response.getWriter().append("Served at: ").append(request.getContextPath());

		request.setCharacterEncoding("UTF-8");

        

        String id = request.getParameter("id");

        String password = request.getParameter("password");

        

        Connection conn = null;

        PreparedStatement stmt = null;

        ResultSet rs = null;

        

        HttpSession session = request.getSession();

        

        try {

        	Class.forName("oracle.jdbc.OracleDriver");

        	String url = "jdbc:oracle:thin:@localhost:1521:xe";

        	conn = DriverManager.getConnection(url, "qmoy2510", "1234");

        	

        	String sql = "select * from users where id = ? and password = ?";

        	stmt = conn.prepareStatement(sql);

        	

        	stmt.setString(1, id);

        	stmt.setString(2, password);

        	

        	rs = stmt.executeQuery();

        	if(rs.next()) {

        		session.setAttribute("id", rs.getString("id"));

        		session.setAttribute("name", rs.getString("name"));

        		response.sendRedirect("GetBoardListCtrl");

        	}else {

        		response.sendRedirect("login.jsp");

        	}

        } catch (Exception e) {

        	e.printStackTrace();

        } finally {

        	try {

				if(rs!=null) rs.close();

				if(stmt!=null) stmt.close();

				if(conn !=null) conn.close();

			} catch (Exception e2) {

				// TODO: handle exception

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