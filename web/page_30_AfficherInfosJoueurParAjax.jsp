<%--
  Created by IntelliJ IDEA.
  User: mouloud.mala
  Date: 09/03/2020
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>afficher info joueur par ajax</title>
    <script>
        function init() {
            // cette fonction sera appelée des le chargement de la page
            // en premier vider le contenu de la combobox
            document.getElementById('cmb_joueurs').options.length = 0;
            // puis je vais invoquer un code serveur pour remplir la combobox
            //      definition du chemin
            var url = "ServletTennis?action=listeJoueurs";
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
            requete.onreadystatechange = majComboBox;

            // envoi de la requete HTTP
            requete.send(null);

        }

        function majComboBox() {
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
                    var cmb = document.getElementById('cmb_joueurs');
                    var opt = document.createElement("option");
                    opt.appendChild(document.createTextNode(" "));
                    cmb.appendChild(opt);

                    for (var i = 0; i < noms.length; i++) {
                        opt = document.createElement("option");
                        opt.appendChild(document.createTextNode(noms[i]));
                        cmb.appendChild(opt);
                    }
                }
                else {
                    //alert("OUPSSSS")
                }
            }
        }

        function recupNomSelectionne() {
            var nomClique = document.getElementById('cmb_joueurs').options[document.getElementById('cmb_joueurs').selectedIndex].text;
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
        }

        function majFiche() {
            
        }
    </script>
</head>
<body onload="init();">
<!-- Choix du joueur -->
<div id="liste">
    <table bgcolor="#8a2be2" width="350">
        <tr>
            <td>Joueurs</td>
            <td>
                <select name="" id="cmb_joueurs" name="cmb_joueurs" onchange="recupNomSelectionne();">
                    <option value="1">Joueur 1</option>
                    <option value="2">Joueur 2</option>
                </select>
            </td>
        </tr>
    </table>
</div>
<!-- Info joueur -->
<div id="description">
    <table bgcolor="#8a2be2" width="350">
        <tr>
            <td>Nom</td>
            <td><span id="nomJoueur"></span></td>
        </tr>
        <tr>
            <td>Prenom</td>
            <td><span id="prenomJoueur"></span></td>
        </tr>
        <tr>
            <td>Taille</td>
            <td><span id="tailleJoueur"></span></td>
        </tr>
        <tr>
            <td>Genre</td>
            <td><span id="genreJoueur"></span></td>
        </tr>
    </table>
</div>
</body>
</html>
