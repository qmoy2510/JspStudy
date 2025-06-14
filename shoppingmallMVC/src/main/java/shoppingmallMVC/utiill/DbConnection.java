package shoppingmallMVC.utiill;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DbConnection {
	public static Connection getConnection() {
		Connection conn = null;
		//1. 드라이버 로드
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(url, "qmoy2510", "1234");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} 
		return conn;
	}
	public static void disConnection(ResultSet rs, PreparedStatement stmt, Connection conn) {
		try {
			if(rs!=null) rs.close();
			if(conn!=null) conn.close();
			if(stmt!=null) stmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void disConnection(PreparedStatement stmt, Connection conn) {
		try {
			if(conn!=null) conn.close();
			if(stmt!=null) stmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
