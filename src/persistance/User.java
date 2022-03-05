package persistance;

import mediatek2022.Utilisateur;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class User implements Utilisateur{
	private final int id;
	private final String pseudo;
	private final String mdp;
	private final String nom;
	private final boolean estBiblio;

	private static Connection connection = null;

	static {
		try {
			connection = DataBase.connexionBD();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public User(int id, String pseudo, String mdp, String nom, int estBiblio) {
		this.id=id;
		this.pseudo=pseudo;
		this.mdp=mdp;
		this.nom=nom;
		this.estBiblio = estBiblio != 0;
	}

	@Override
	public String name() {
		return this.nom;
	}

	@Override
	public boolean isBibliothecaire() {
		return this.estBiblio;
	}

	@Override
	public Object[] data() {
		List<Integer> documentsEmpruntes = new ArrayList<>();

		try {
			PreparedStatement stmt = connection.prepareStatement("SELECT idDocument FROM document WHERE emprunteur = ?");
			stmt.setInt(1, id);

			ResultSet res = stmt.executeQuery();

			while (res.next()) {
				documentsEmpruntes.add(res.getInt("idDocument"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return new Object[] {id, pseudo, mdp, documentsEmpruntes};
	}
	
}
