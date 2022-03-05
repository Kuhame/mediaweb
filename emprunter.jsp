<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="mediatek2022.Document" %>
<%@ page import="java.util.List" %>

<%
	// Redirection si pas connecté
	if (session.getAttribute("user") == null) {
		response.sendRedirect(request.getContextPath() + "/login.jsp");
		return;
	}

	List<Document> documentsDisponibles = (List<Document>) request.getAttribute("documentsDisponibles");

	StringBuilder sb = new StringBuilder();
	int cmp=0;
	for (Document d : documentsDisponibles) {
		if(cmp == 0) {
			sb.append("<div class=\"columns is-mobile\">");
		}
		else if(cmp%3==0 && cmp!=0){
			sb.append("</div>");
			sb.append("<div class=\"columns is-mobile\">");
		}
		sb.append("<div class=\"column\"><div class=\"card\"><div class=\"card-content\"><div class=\"content\">").append(d.toString()).append("</div></div></div></div>");
		cmp++;
	}

	String msg = (String) request.getAttribute("msg");
	if (msg == null) {
		msg = "<p></p>";
	} else {
        msg = "<div class=\"notification\"><button class=\"delete\"></button>" + msg + "</div>";
    }
%>

<!DOCTYPE html>
<html lang="fr">
	<head>
		<link
			rel="stylesheet"
			href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css"
		/>
		<link rel="stylesheet" href="./css/main.css" />
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>Emprunter un document</title>
		<script
			src="https://kit.fontawesome.com/f0cb48158b.js"
			crossorigin="anonymous"
		></script>
	</head>
	<body class="scale135">
		<main
					class="is-flex is-flex-direction-column is-justify-content-center is-align-items-center is-viewport"
				>
			<div class="box is-flex is-flex-direction-column is-justify-content-center is-align-items-center" style="width: 1300px">
				<h1 class="title">Emprunter un document</h1>
			</div>
			<div class="box is-flex is-flex-direction-column is-justify-content-center is-align-items-center" style="width: 1300px">
				<%= sb.toString() %>
				</div>
			</div>
			<div class="box" style="width: 1300px">
				<%= msg %>
				<form action="emprunter" method="post" class="form">
					<div class="field">
						<label for="idDocument" class="label">Identifiant du document à emprunter</label>
						<div class="control has-icons-left">
							<input type="text" id="idDocument" name="idDocument" class="input" required />
							<span class="icon is-small is-left">
									<i class="fa-solid fa-pen"></i>
							</span>
						</div>
						<input type="submit" value="Emprunter" class="button is-black is-fullwidth mt-2"/>
					<div>
				</form>
			</div>
		<main>
		<script src="./js/main.js"></script>
	</body>
</html>
