package persistance.documents;

import mediatek2022.Utilisateur;
import persistance.Doc;

public class Livre extends Doc {
    public Livre(int id, String nom, String type, String auteur, int emprunteur) {
        super(id, nom, type, auteur, emprunteur);
    }
}
