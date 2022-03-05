package services;

import mediatek2022.Document;
import mediatek2022.Mediatheque;
import mediatek2022.Utilisateur;
import org.jetbrains.annotations.NotNull;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class EmprunterServlet extends HttpServlet {
    @Override
    protected void doGet(@NotNull HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("documentsDisponibles", Mediatheque.getInstance().tousLesDocumentsDisponibles());
        req.getRequestDispatcher("/emprunter.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(@NotNull HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idDocument = Integer.parseInt(req.getParameter("idDocument"));
        Document d = Mediatheque.getInstance().getDocument(idDocument);

        HttpSession session = req.getSession(false);
        Utilisateur u = (Utilisateur) session.getAttribute("user");

        try {
            Mediatheque.getInstance().emprunt(d, u);
            req.setAttribute("msg", "Emprunt effectué avec succès");

            req.setAttribute("documentsDisponibles", Mediatheque.getInstance().tousLesDocumentsDisponibles());
            req.getRequestDispatcher("/emprunter.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
