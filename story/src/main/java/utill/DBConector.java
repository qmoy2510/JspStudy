package utill;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConector {
	public static Connection getConnection() throws Exception{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection
		("jdbc:oracle:thin:@//localhost:1521/xe","qmoy2510","1234");
		return con;
	}
}	
