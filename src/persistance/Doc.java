package persistance;

import mediatek2022.Document;
import mediatek2022.Utilisateur;

import java.sql.Connection;
import java.sql.PreparedStatement;

public abstract class Doc implements Document {
    private final int id;
    private final String nom;
    private final String type;
    private final String auteur;
    private int emprunteur;

    private static Connection connection = null;

    static {
        try {
            connection = DataBase.connexionBD();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

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

        // Mise à jour de l'emprunteur en BDD
        PreparedStatement stmt = connection.prepareStatement("UPDATE document SET emprunteur = ? WHERE idDocument = ?");
        stmt.setInt(1, emprunteur);
        stmt.setInt(2, id);

        stmt.executeUpdate();
    }

    @Override
    public void retour() {
        emprunteur = -1;

        // Mise à jour de l'emprunteur en BDD
        try {
            PreparedStatement stmt = connection.prepareStatement("UPDATE document SET emprunteur = ? WHERE idDocument = ?");
            stmt.setObject(1, null);
            stmt.setInt(2, id);

            stmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
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
