package persistance;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mediatek2022.*;
import persistance.documents.*;

// classe mono-instance  dont l'unique instance est connue de la médiatheque
// via une auto-déclaration dans son bloc static

public class MediathequeData implements PersistentMediatheque {
// Jean-François Brette 01/01/2018
	static {
		Mediatheque.getInstance().setData(new MediathequeData());
	}

	private MediathequeData() {
	}

	// renvoie la liste de tous les documents disponibles de la médiathèque
	@Override
	public List<Document> tousLesDocumentsDisponibles() {
		List<Document> documents = new ArrayList<>();
		try {
			Connection connection = DataBase.connexionBD();
			PreparedStatement requete = connection.prepareStatement("SELECT * FROM document WHERE emprunteur IS NULL");

			ResultSet res = requete.executeQuery();

			while (res.next()) {
				int idDocument = res.getInt("idDocument");
				String nom = res.getString("nom");
				String typeDocument = res.getString("typeDocument");
				String auteur = res.getString("auteur");
				String description = res.getString("description");
				int emprunteur = -1;

				switch (typeDocument) {
					case "Livre":
						documents.add(new Livre(idDocument, nom, typeDocument, auteur, description, emprunteur));
						break;
					case "DVD":
						documents.add(new DVD(idDocument, nom, typeDocument, auteur, description, emprunteur));
						break;
					case "CD":
						documents.add(new CD(idDocument, nom, typeDocument, auteur, description, emprunteur));
						break;
					default:
						throw new IllegalArgumentException("Type de document inconnu");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return documents;
	}

	// va récupérer le User dans la BD et le renvoie
	// si pas trouvé, renvoie null
	@Override
	public Utilisateur getUser(String login, String password) {
		try {
			Connection connec = DataBase.connexionBD();
			PreparedStatement reqUser = connec.prepareStatement("SELECT * FROM utilisateur WHERE pseudo = ? AND motdepasse = ?");
			reqUser.setString(1, login);
			reqUser.setString(2, password);
			
			ResultSet res = reqUser.executeQuery();
			res.next();

			int id = res.getInt("idUtilisateur");
			String pseudo = res.getString("pseudo");
			String motdepasse = res.getString("motdepasse");
			String nom = res.getString("nom");
			int estBiblio = res.getInt("estBibliothecaire");
			return new User(id, pseudo, motdepasse, nom, estBiblio);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	// va récupérer le document de numéro numDocument dans la BD
	// et le renvoie
	// si pas trouvé, renvoie null
	@Override
	public Document getDocument(int numDocument) {
		try {
			Connection connec = DataBase.connexionBD();
			PreparedStatement req = connec.prepareStatement("SELECT * FROM document WHERE idDocument = ?");
			req.setInt(1, numDocument);

			ResultSet res = req.executeQuery();
			res.next();

			int idDocument = res.getInt("idDocument");
			String nom = res.getString("nom");
			String typeDocument = res.getString("typeDocument");
			String auteur = res.getString("auteur");
			String description = res.getString("description");
			int emprunteur = res.getInt("emprunteur");

			switch (typeDocument) {
				case "Livre":
					return new Livre(idDocument, nom, typeDocument, auteur, description, emprunteur);
				case "DVD":
					return new DVD(idDocument, nom, typeDocument, auteur, description, emprunteur);
				case "CD":
					return new CD(idDocument, nom, typeDocument, auteur, description, emprunteur);
				default:
					throw new IllegalArgumentException("Numéro de document inconnu");
			}


		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void ajoutDocument(int type, Object... args) {
		try {
			Connection connec = DataBase.connexionBD();
			PreparedStatement req = connec.prepareStatement("INSERT INTO document (nom, typeDocument, auteur, description, emprunteur) VALUES (?, ?, ?, ?, ?)");

			// 0 : Nom du document
			req.setString(1, (String) args[0]);

			String typeD;
			if (type == 0) {
				typeD = "Livre";
			} else if (type == 1) {
				typeD = "DVD";
			} else {
				typeD = "CD";
			}
			// Type du document
			req.setString(2, typeD);

			// 1: Auteur du document
			req.setString(3, (String) args[1]);

			// 2: Description
			if (args[2] == null) {
				req.setObject(4, null);
			} else {
				req.setString(4, (String) args[2]);
			}

			// Disponible
			req.setObject(5, null);

			req.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
