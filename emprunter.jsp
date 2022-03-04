<%@ page import="mediatek2022.Document" %>
<%@ page import="java.util.List" %>
<%
	List<Document> documentsDisponibles = (List<Document>) request.getAttribute("documentsDisponibles");

	StringBuilder sb = new StringBuilder();
	for (Document d : documentsDisponibles) {
		sb.append(d.toString()).append("\n");
	}
%>

<!DOCTYPE html>
<html lang="fr">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>Emprunter un document</title>
	</head>
	<body>
		<pre style="font-size: 25px"><%= sb.toString() %></pre>
	</body>
</html>
