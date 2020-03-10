<%--
  Created by IntelliJ IDEA.
  User: mouloud.mala
  Date: 09/03/2020
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ajax date rafrachie</title>
</head>
<body>
<%--date affichee par JS et rafrachie--%>
<div style="width: 400px; height: 50px; background: grey; color: white; text-align: center; line-height: 50px;">
</div>
<br>
<label name="afficheHeure" id="labAffiche">....</label>
<script>
    let afficherDansDiv = document.querySelector('div');
    let afficherDansLab = document.getElementById('labAffiche');

    function horloge() {
        let heure = new Date();
        afficherDansDiv.textContent = 'Il est ' + heure.getHours() + ' : ' + heure.getMinutes() + ' : ' + heure.getSeconds() + ' : ' + heure.getMilliseconds();
        afficherDansLab.textContent = 'Il est ' + heure.getHours() + ' : ' + heure.getMinutes() + ' : ' + heure.getSeconds() + ' : ' + heure.getMilliseconds();
    }
    // appel de la fonction toutes les secondes
    setInterval("horloge()", 1000);

</script>
</body>
</html>
