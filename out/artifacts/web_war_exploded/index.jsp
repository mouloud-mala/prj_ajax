<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>AJAX</title>
</head>
<body>
    <!-- afficher date en Java -->
    <%
        DateFormat monFormat = new SimpleDateFormat("hh:mm:ss aa");
        String maintenant = monFormat.format(new Date());
    %>
    L'heure est <%= maintenant%>
</body>
</html>
