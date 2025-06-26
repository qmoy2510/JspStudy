import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConnector {
	public Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "qmoy2510", "1234");
			return con;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return con;
	}
	public void disConnection(Connection conn, PreparedStatement stmt) throws SQLException {
		conn.close();
		stmt.close();
	}
	public void disConnection(Connection conn, PreparedStatement stmt, ResultSet rs) throws SQLException {
		conn.close();
		stmt.close();
		rs.close();
	}
}
