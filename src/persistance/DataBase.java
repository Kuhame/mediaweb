package persistance;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * Accès à la base de données wamp server
 *
 */
public class DataBase {

	private static String url_jdbc = "jdbc:mysql://localhost;testjee";
	private static String login = "root";
	private static String pwd = "";

	
	public static Connection connexionBD() throws Exception {
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection conn = DriverManager.getConnection(url_jdbc, login, pwd);
		
		return conn;
	}
}