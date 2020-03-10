package com.lou.cours.models;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Joueur {
    private int idJoueur;
    private String nom;
    private String prenom;
    private int taille;
    private String genre;

    public Joueur() {
    }

    public Joueur(int idJoueur, String nom, String prenom, int taille, String genre) {
        this.idJoueur = idJoueur;
        this.nom = nom;
        this.prenom = prenom;
        this.taille = taille;
        this.genre = genre;
    }

    public int getIdJoueur() {
        return idJoueur;
    }

    public void setIdJoueur(int idJoueur) {
        this.idJoueur = idJoueur;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public int getTaille() {
        return taille;
    }

    public void setTaille(int taille) {
        this.taille = taille;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public static List<Joueur> listerJoueurs() {
        List<Joueur> listeJoueurs = new ArrayList<>();
        String reqAll = "SELECT * FROM Joueurs";
        try {
            ResultSet result = ParametresBD.executeRequeteSQL(reqAll);
            // boucler sur les lignes renvoyes par la BD
            // et fabriquer la liste a renvoyer au code appelant
            while (result.next()){
                Joueur joueur = new Joueur();
                joueur.setIdJoueur(result.getInt(1));
                joueur.setNom(result.getString(2));
                joueur.setPrenom(result.getString(3));
                joueur.setTaille(result.getInt(4));
                joueur.setGenre(result.getString(5));
                listeJoueurs.add(joueur);
            }
            return listeJoueurs;

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /*public void chercherJoueur() {
        String reqById = "SELECT * FROM joueurs idJoueur ='" + this.getIdJoueur() + "'";
        try {
            ResultSet resultSet = ParametresBD.executeRequeteSQL(reqById);
            if (resultSet != null) {

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }*/
}
