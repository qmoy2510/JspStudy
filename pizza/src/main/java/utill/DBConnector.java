package utill;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnector {
	static public Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection
					("jdbc:oracle:thin:@localhost:1521:xe","qmoy2510","1234");
			return con;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
}
