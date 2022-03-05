package persistance;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * Accès à la base de données wamp server
 *
 */
public class DataBase {

	private static final String url_jdbc = "jdbc:mysql://localhost/mediaweb";
	private static final String login = "root";
	private static final String password = "";

	
	public static Connection connexionBD() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		return DriverManager.getConnection(url_jdbc, login, password);
	}
}