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
	private static Connection connection;

	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection =  DriverManager.getConnection(url_jdbc, login, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private DataBase() {}
	
	public static Connection connexionBD() {
		return connection;
	}
}