package persistance;

import mediatek2022.Utilisateur;

public class User implements Utilisateur{
	private final int id;
	private final String pseudo;
	private final String mdp;
	private final String nom;
	private final boolean estBiblio;
	
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
		return new Object[] {id, pseudo, mdp};
	}
	
}
