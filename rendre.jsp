<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="mediatek2022.Document" %>
<%@ page import="java.util.List" %>

<%
    // Redirection si pas connecté
    if (session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    List<Document> documentsEmpruntes = (List<Document>) request.getAttribute("documentsEmpruntes");

    StringBuilder sb = new StringBuilder();
    for (Document d : documentsEmpruntes) {
        sb.append(d.toString()).append("\n");
    }

    String msg = (String) request.getAttribute("msg");
    if (msg == null) {
        msg = "";
    }
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css"
    />
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Rendre un document</title>
</head>
<body>
<pre style="font-size: 25px"><%= sb.toString() %></pre>


<form action="rendre" method="post" class="form">
    <label for="idDocument">Identifiant du document à rendre</label>
    <input type="text" id="idDocument" name="idDocument" />
    <input type="submit" value="Rendre" />
    <p><%= msg %></p>
</form>
</body>
</html>
