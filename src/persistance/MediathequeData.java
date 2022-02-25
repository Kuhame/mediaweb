package persistance;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import mediatek2022.*;

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
		return null;
	}

	// va récupérer le User dans la BD et le renvoie
	// si pas trouvé, renvoie null
	@Override
	public Utilisateur getUser(String login, String password) {
		try {
			Connection connec = DataBase.connexionBD();
			PreparedStatement reqUser= connec.prepareStatement("SELECT * FROM utilisateur WHERE pseudo = ? AND motdepasse = ?");
			reqUser.setString(1,login);
			reqUser.setString(2, password);
			
			ResultSet res = reqUser.executeQuery();
			while (res.next()){
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
		return null;
	}

	@Override
	public void ajoutDocument(int type, Object... args) {
		// args[0] -> le titre
		// args [1] --> l'auteur
		// etc... variable suivant le type de document
	}

}
