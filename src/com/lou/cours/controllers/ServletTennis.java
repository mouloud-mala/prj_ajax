package com.lou.cours.controllers;

import com.lou.cours.models.Joueur;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/ServletTennis")
public class ServletTennis extends HttpServlet {

    public ServletTennis() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String quoi = request.getParameter("action");
        switch (quoi){
            case "listeJoueurs":

                String listeJoueursARenvoyer = "";
                // recuperer les joueurs
                List<Joueur> laListe = Joueur.listerJoueurs();

                // Fabriquer les infos a envoyer au code client
                for (Joueur j:laListe) {
                    listeJoueursARenvoyer += j.getNom() + ";";
                }
                listeJoueursARenvoyer = listeJoueursARenvoyer.substring(0, listeJoueursARenvoyer.length() - 1);
                // je prepare et renvoie la réponse au code appelant
                response.setContentType("text/xml");
                response.setHeader("Cache-Control", "no-cache");
                response.getWriter().write("<joueurs>" + listeJoueursARenvoyer +"</joueurs>");
                break;

            case "liste2Joueurs":

                String liste2JoueursARenvoyer = "";
                // recuperer les joueurs
                List<Joueur> laListe2 = Joueur.listerJoueurs();

                // Fabriquer les infos a envoyer au code client
                for (Joueur j:laListe2) {
                    liste2JoueursARenvoyer += j.getNom() + ":" + j.getPrenom() + ":" + j.getTaille() + ":" + j.getGenre() + ";";
                }
                liste2JoueursARenvoyer = liste2JoueursARenvoyer.substring(0, liste2JoueursARenvoyer.length() - 1);
                // je prepare et renvoie la réponse au code appelant
                response.setContentType("text/xml");
                response.setHeader("Cache-Control", "no-cache");
                response.getWriter().write("<joueurs>" + liste2JoueursARenvoyer +"</joueurs>");
                break;

            case "chercherUnJoueur" :
                String quiChercher = request.getParameter("nom");
                Joueur joueurByName = new Joueur();
                joueurByName.chercher(quiChercher);
                // prepare la reponse
                String infosJoueur = joueurByName.getNom() + ";" + joueurByName.getPrenom() + ";" + joueurByName.getTaille() + ";" + joueurByName.getGenre();

                response.setContentType("text/xml");
                response.setHeader("Cache-Control", "no-cache");
                response.getWriter().write("<joueur>" + infosJoueur + "</joueur>");
                break;

            case "insererJoueur" :
                String nom = request.getParameter("nom");
                String prenom = request.getParameter("prenom");
                String taille = request.getParameter("taille");
                String genre = request.getParameter("genre");

                Joueur nouveauJoueur = new Joueur();
                nouveauJoueur.inserer(nom, prenom, Integer.parseInt(taille), genre);

            default:
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request, response);
    }
}
