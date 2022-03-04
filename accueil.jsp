<%@ page import="mediatek2022.Utilisateur" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
	if (session.getAttribute("user") == null) {
		response.sendRedirect(request.getContextPath() + "./login.jsp");
	}

	Utilisateur u = (Utilisateur) session.getAttribute("user");

	String actions;
	if (!u.isBibliothecaire()) {
		actions = "<li>Ajouter un nouveau document</li>";
	} else {
		actions = "<li><a href=\"emprunter\">Emprunter un document</a></li><li>Rendre un document</li>";
	}
%>

<!DOCTYPE html>
<html lang="fr">
	<head>
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
