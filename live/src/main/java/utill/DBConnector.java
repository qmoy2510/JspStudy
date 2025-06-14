package utill;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConnector {
	public static Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "qmoy2510", "1234");
		return con;
	}
	public static void disConnection(ResultSet rs, Connection conn, PreparedStatement stmt) throws SQLException {
		rs.close();
		conn.close();
		stmt.close();
	}
	public static void disConnection(Connection conn, PreparedStatement stmt) throws SQLException {
		conn.close();
		stmt.close();
	}
}
