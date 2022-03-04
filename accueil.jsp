<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="persistance.User" %>
<%
	if (session.getAttribute("user") == null) {
		response.sendRedirect(request.getContextPath() + "./login.jsp");
	}

	User u = (User) session.getAttribute("user");

	String actions;
	if (!u.isBibliothecaire()) {
		actions = "<li>Ajouter un nouveau document</li>";
	} else {
		actions = "<li>Emprunter un document</li><li>Rendre un document</li>";
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
			<li><a href="logout">Déconnexion</a></li>
		</ul>
	</body>
</html>
