package persistance;

import mediatek2022.Document;
import mediatek2022.Utilisateur;

public abstract class Doc implements Document {
    private final int id;
    private final String nom;
    private final String type;
    private final String auteur;
    private int emprunteur;

    public Doc(int id, String nom, String type, String auteur, int emprunteur) {
        this.id = id;
        this.nom = nom;
        this.type = type;
        this.auteur = auteur;
        this.emprunteur = emprunteur;
    }

    @Override
    public boolean disponible() {
        return emprunteur == -1;
    }

    @Override
    public void emprunt(Utilisateur u) throws Exception {
        emprunteur = (int) u.data()[0];
    }

    @Override
    public void retour() {
        emprunteur = -1;
    }

    @Override
    public String toString() {
        return "Doc{" +
                "id=" + id +
                ", nom='" + nom + '\'' +
                ", type='" + type + '\'' +
                ", auteur='" + auteur + '\'' +
                ", emprunteur=" + emprunteur +
                '}';
    }
}
