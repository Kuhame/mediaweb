package services;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mediatek2022.*;
import org.jetbrains.annotations.NotNull;

public class LoginServlet extends HttpServlet {
	@Override
	protected void doPost(@NotNull HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		HttpSession session = request.getSession(true);
		String login = request.getParameter("pseudo");
		String password = request.getParameter("motdepasse");
		Utilisateur user = Mediatheque.getInstance().getUser(login, password);
		
		if (user != null) {
			session.setAttribute("user", user);
			response.sendRedirect(request.getContextPath() + "/accueil.jsp");
		} else {
			response.sendRedirect(request.getContextPath() + "/login.jsp");
		}
		
	}
}
