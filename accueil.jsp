<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="mediatek2022.Utilisateur" %>

<%
	if (session.getAttribute("user") == null) {
		response.sendRedirect(request.getContextPath() + "/login.jsp");
		return;
	}

	Utilisateur u = (Utilisateur) session.getAttribute("user");

	String actions;
	if (u.isBibliothecaire()) {
		actions = "<li><a href=\"ajouter.jsp\">Ajouter un nouveau document</a></li>";
	} else {
		actions = "<li><a href=\"emprunter\">Emprunter un document</a></li><li><a href=\"rendre\">Rendre un document</a></li>";
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
		<title>Accueil</title>
	</head>
	<body>
		<p>Bienvenue, <%= u.name() %> !</p>
		<ul>
			<%= actions %>
			<li><a href="logout">Se déconnecter</a></li>
		</ul>
	</body>
</html>
