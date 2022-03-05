<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="mediatek2022.Utilisateur" %>

<%
	Utilisateur u = (Utilisateur) session.getAttribute("user");
	if (u == null || !u.isBibliothecaire()) {
		response.sendRedirect(request.getContextPath() + "/login.jsp");
		return;
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
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>Mediaweb</title>
		<script
			src="https://kit.fontawesome.com/f0cb48158b.js"
			crossorigin="anonymous"
		></script>
	</head>
	<body class="scale135">
		<main class="is-flex is-flex-direction-column is-justify-content-center is-align-items-center is-viewport">
			<div class="box is-flex is-flex-direction-column is-justify-content-center is-align-items-center" style="width: 500px">
				<h1 class="title">Ajouter un document</h1>
			</div>
			<div id="wrapper" class="box" style="width: 500px">
                <%= msg %>
                <form
				action="ajouter"
				method="post"
				id="ajouter"
			>
				<!--Nom-->
				<div class="field">
					<label for="nom" class="label">Nom</label>
					<div class="control has-icons-left">
						<input
							class="input"
							type="text"
							id="nom"
							name="nom"
							placeholder="Nom du document"
							required
						/>
						<span class="icon is-small is-left">
							<i class="fa-solid fa-pen"></i>
						</span>
					</div>
				</div>

				<!--Type-->
				<div class="field">
					<label for="type" class="label">Type</label>
					<div class="control">
						<div class="select">
							<select id="type" name="type" form="ajouter">
								<option disabled selected>Type de document</option>
								<option value="1">Livre</option>
								<option value="2">DVD</option>
								<option value="3">CD</option>
							</select>
						</div>
					</div>
				</div>

				<!--Auteur-->
				<div class="field">
					<label for="auteur" class="label">Auteur</label>
					<div class="control has-icons-left">
						<input
							class="input"
							type="text"
							id="auteur"
							name="auteur"
							placeholder="Auteur du document"
							required
						/>
						<span class="icon is-small is-left">
							<i class="fa-solid fa-id-badge"></i>
						</span>
					</div>
				</div>

				<!--Description-->
				<div class="field">
					<label for="description" class="label">Description</label>
					<div class="control has-icons-left">
						<textarea
							class="textarea has-fixed-size"
							type="text"
							rows="4"
							id="description"
							name="description"
							placeholder="Description du document"
						></textarea>
						<span class="icon is-small is-left">
							<i class="fa-solid fa-text"></i>
						</span>
					</div>
				</div>

				<!--Ajouter-->
				<div class="field">
					<div class="control">
						<input
							type="submit"
							class="button is-black is-fullwidth"
							value="Ajouter"
						/>
					</div>
				</div>
			</form>
            </div>
		</main>

        <script src="./js/main.js"></script>
	</body>
</html>
