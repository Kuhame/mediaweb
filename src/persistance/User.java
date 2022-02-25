package persistance;

import mediatek2022.Utilisateur;

public class User implements Utilisateur{
	private int id;
	private String pseudo;
	private String mdp;
	private String nom;
	private boolean estBiblio;
	
	public User(int id, String pseudo, String mdp, String nom, int estBiblio) {
		this.id=id;
		this.pseudo=pseudo;
		this.mdp=mdp;
		this.nom=nom;
		this.estBiblio = (estBiblio != 0) ? true : false;
	}
	
}
