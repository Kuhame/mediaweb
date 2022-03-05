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
		actions = "<button onClick=\"location.href ='ajouter.jsp';\" class=\"button is-black is-fullwidth mb-2\">Ajouter un nouveau document</button>";
	} else {
		actions = "<button onClick=\"location.href ='emprunter';\" class=\"button is-black is-fullwidth mb-2\">Emprunter un document</button>" +
		"<button onClick=\"location.href ='rendre';\" class=\"button is-black is-fullwidth mb-2\">Rendre un document</button>";
	}
%>

<!DOCTYPE html>
<html lang="fr" class="is-clipped">
	<head>
		<link
      		rel="stylesheet"
      		href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css"
    	/>
		<link rel="stylesheet" href="./css/main.css" />
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>Accueil</title>
	</head>
	<body>
		<main class="is-flex is-flex-direction-column is-justify-content-center is-align-items-center is-viewport">
			<div class="box is-flex is-flex-direction-column is-justify-content-center is-align-items-center" style="width: 500px">
				<h1 class="title">Accueil</h1>
				<h2 class="subtitle pt-2">Bienvenue, <%= u.name() %> </h2>
			</div>
			<div class="box" style="width: 500px">
					<%= actions %>
					<button onClick="location.href ='logout';" class="button is-black is-fullwidth">Se déconnecter</button>
			</div>
		</main>
	</body>
</html>
