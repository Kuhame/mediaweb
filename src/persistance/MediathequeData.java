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
				int emprunteur = -1;

				switch (typeDocument) {
					case "livre":
						documents.add(new Livre(idDocument, nom, typeDocument, auteur, emprunteur));
						break;
					case "dvd":
						documents.add(new DVD(idDocument, nom, typeDocument, auteur, emprunteur));
						break;
					case "cd":
						documents.add(new CD(idDocument, nom, typeDocument, auteur, emprunteur));
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
			while (res.next()) {
				int id = res.getInt("idUtilisateur");
				String pseudo = res.getString("pseudo");
				String motdepasse = res.getString("motdepasse");
				String nom = res.getString("nom");
				int estBiblio = res.getInt("estBibliothecaire");
				return new User(id, pseudo, motdepasse, nom, estBiblio);
				
			}
			
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

			while (res.next()) {
				int idDocument = res.getInt("idDocument");
				String nom = res.getString("nom");
				String typeDocument = res.getString("typeDocument");
				String auteur = res.getString("auteur");
				int emprunteur = res.getInt("emprunteur");

				switch (typeDocument) {
					case "livre":
						return new Livre(idDocument, nom, typeDocument, auteur, emprunteur);
					case "dvd":
						return new DVD(idDocument, nom, typeDocument, auteur, emprunteur);
					case "cd":
						return new CD(idDocument, nom, typeDocument, auteur, emprunteur);
					default:
						throw new IllegalArgumentException("Numéro de document inconnu");
				}
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
			PreparedStatement req = connec.prepareStatement("INSERT INTO document (nom, typeDocument, auteur, emprunteur) VALUES (?, ?, ?, -1)");

			// Nom du document
			req.setString(1, (String) args[0]);

			String typeD;
			if (type == 0) {
				typeD = "livre";
			} else if (type == 1) {
				typeD = "dvd";
			} else {
				typeD = "cd";
			}
			// Type du document
			req.setString(2, typeD);

			// Auteur du document
			req.setString(3, (String) args[1]);

			req.executeQuery();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
