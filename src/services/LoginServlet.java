package services;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mediatek2022.*;

public class LoginServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		HttpSession session = request.getSession(true);
		String login = request.getParameter("pseudo");
		String password = request.getParameter("motdepasse");
		Utilisateur user = Mediatheque.getInstance().getUser(login, password);
		
		if(user != null) {
			session.setAttribute("user", user);
		}
		else {
			throw new IOException();
		}
		
	}
}
