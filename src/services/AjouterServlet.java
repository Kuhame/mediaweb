package services;

import mediatek2022.Mediatheque;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AjouterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int typeDocument = Integer.parseInt(req.getParameter("type"));

        Object[] args = new Object[] {
                req.getParameter("nom"),
                req.getParameter("auteur"),
                req.getParameter("description")
        };

        Mediatheque.getInstance().ajoutDocument(typeDocument, args);

        req.setAttribute("msg", "Document ajouté avec succès.");
        req.getRequestDispatcher("/ajouter.jsp").forward(req, resp);
    }
}
