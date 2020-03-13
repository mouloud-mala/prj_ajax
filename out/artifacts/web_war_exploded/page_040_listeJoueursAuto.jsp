<%--
  Created by IntelliJ IDEA.
  User: mouloud.mala
  Date: 10/03/2020
  Time: 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>afficher auto joueur par ajax</title>
    <script>
        function init() {
            // cette fonction sera appelée des le chargement de la page
            // en premier vider le contenu de la combobox
            document.getElementById('list_joueurs');
            // puis je vais invoquer un code serveur pour remplir la combobox
            //      definition du chemin
            var url = "ServletTennis?action=liste2Joueurs";
            //      je prepare la requete HTTP
            if (window.XMLHttpRequest) {
                requete = new XMLHttpRequest();
            } else if (window.ActiveXObject) {
                requete = new ActiveXObject("Microsoft.XMLHTTP");
            }
            // envoter la semande au code serveur en async
            requete.open('GET', url, true);
            console.log(requete);
            //
            requete.onreadystatechange = majListe;

            // envoi de la requete HTTP
            requete.send(null);

        }

        function majListe() {
            //alert("Phase : " + requete.readyState);
            //alert("Phase : " + requete.status);
            // quand le code serveur repond il envoie un code en phase ( attente, execution, ececutée, ...)
            // et un code etat ( terminee correctement, anomalie, ...)
            if (requete.readyState === XMLHttpRequest.DONE) {
                if (requete.status === 200) {
                    var listeJoueursTag = requete.responseXML.getElementsByTagName("joueurs")[0];
                    var listeJoueurs = listeJoueursTag.childNodes[0].nodeValue;
                    // je recup les noms des joeueurs separé par ; dans un tableau
                    var noms = listeJoueurs.split(";");
                    // je pointe de nouveau sur la combobo
                    var table = document.getElementById('list_joueurs');

                    for (var i = 0; i < noms.length; i++) {
                        var tr = document.createElement("tr");
                        var tdNom = document.createElement("td");
                        var tdPrenom = document.createElement("td");
                        var tdTaille = document.createElement("td");
                        var tdGenre = document.createElement("td");

                        var nomJoueurs = noms[i].split(":");
                        tdNom.appendChild(document.createTextNode(nomJoueurs[0]));
                        tdPrenom.appendChild(document.createTextNode(nomJoueurs[1]));
                        tdTaille.appendChild(document.createTextNode(nomJoueurs[2]));
                        tdGenre.appendChild(document.createTextNode(nomJoueurs[3]));

                        tr.appendChild(tdNom);
                        tr.appendChild(tdPrenom);
                        tr.appendChild(tdTaille);
                        tr.appendChild(tdGenre);
                        table.appendChild(tr);
                    }
                }
                else {
                    //alert("OUPSSSS")
                }
            }
        }

        /*function recupNomSelectionne() {
            var nomClique = document.getElementById('list_joueurs').options[document.getElementById('list_joueurs').selectedIndex].text;
            var url = "ServletTennis?action=chercherUnJoueur&nom=" + nomClique;
            //      je prepare la requete HTTP
            if (window.XMLHttpRequest) {
                requete = new XMLHttpRequest();
            } else if (window.ActiveXObject) {
                requete = new ActiveXObject("Microsoft.XMLHTTP");
            }
            // envoter la semande au code serveur en async
            requete.open('GET', url, true);
            console.log(requete);
            //
            requete.onreadystatechange = majFiche;

            // envoi de la requete HTTP
            requete.send(null);
        }*/

        function majFiche() {

            if (requete.readyState === 4) {
                if (requete.status === 200) {
                    var nom = document.getElementById("nomJoueur");
                    var prenom = document.getElementById("prenomJoueur");
                    var taille = document.getElementById("tailleJoueur");
                    var genre = document.getElementById("genreJoueur");

                    var infosJoueursTag = requete.responseXML.getElementsByTagName("joueur")[0];
                    var infosJoueur = infosJoueursTag.childNodes[0].nodeValue;
                    var tabInfos = infosJoueur.split(";");
                    nom.textContent = tabInfos[0];
                    prenom.textContent = tabInfos[1];
                    taille.textContent = tabInfos[2];
                    genre.textContent = tabInfos[3];
                }
            }
        }

        function ajouter() {

            if (requete.readyState === 4) {
                if (requete.status === 200) {
                    var xhr = new XMLHttpRequest();
                    var url = "ServletTennis?action=insererJoueur&nom=" + nomClique
                    + "&prenom=" + +
                    + "&taille=" + +
                    + "&genre=" + ;
                    xhr.open('POST', url);
                    var myForm = document.getElementById('myForm');
                    var form = new FormData(myForm);
                    form.append('nom', '');
                    form.append('prenom', '');
                    form.append('taille', '');
                    form.append('genre', '');
                    xhr.send(form);
                }
            }
        }
    </script>
</head>
<body onload="init();">
<!-- Choix du joueur -->
<div id="liste">
    <table bgcolor="#8a2be2" width="650" id="list_joueurs">
        <tr>
            <th>Nom</th>
            <th>Prenom</th>
            <th>Taille</th>
            <th>Genre</th>
        </tr>
    </table>
    <form action="" id="myForm">
        <input type="text" id="myNom">
        <input type="text" id="myPrenom">
        <input type="text" id="myTaille">
        <input type="text" id="myGenre">
    </form>
</div>
</body>
</html>
