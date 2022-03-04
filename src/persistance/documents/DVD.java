package persistance.documents;

import mediatek2022.Utilisateur;
import persistance.Doc;

public class DVD extends Doc {
    public DVD(int id, String nom, String type, String auteur, int emprunteur) {
        super(id, nom, type, auteur, emprunteur);
    }
}
