package persistance.documents;

import mediatek2022.Utilisateur;
import persistance.Doc;

public class CD extends Doc {
    public CD(int id, String nom, String type, String auteur, String description, int emprunteur) {
        super(id, nom, type, auteur, description, emprunteur);
    }
}
