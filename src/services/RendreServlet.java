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
import java.util.ArrayList;
import java.util.List;

public class RendreServlet extends HttpServlet {
    @Override
    protected void doGet(@NotNull HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        Utilisateur u = (Utilisateur) session.getAttribute("user");

        List<Document> documentsEmpruntes = getDocuments(u);

        req.setAttribute("documentsEmpruntes", documentsEmpruntes);
        req.getRequestDispatcher("/rendre.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(@NotNull HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idDocument = Integer.parseInt(req.getParameter("idDocument"));
        Document d = Mediatheque.getInstance().getDocument(idDocument);

        HttpSession session = req.getSession(false);
        Utilisateur u = (Utilisateur) session.getAttribute("user");
        List<Document> documentsEmpruntes = getDocuments(u);
        if (d != null) {
            try {
                Mediatheque.getInstance().retour(d, u);
                req.setAttribute("msg", "Retour effectué avec succès");

                documentsEmpruntes = getDocuments(u);
                req.setAttribute("documentsEmpruntes", documentsEmpruntes);
                req.getRequestDispatcher("/rendre.jsp").forward(req, resp);

            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            req.setAttribute("msg", "Vous n'avez pas emprunté ce document");
            req.setAttribute("documentsEmpruntes", documentsEmpruntes);
            req.getRequestDispatcher("/rendre.jsp").forward(req, resp);
        }

    }

    @NotNull
    private List<Document> getDocuments(Utilisateur u) {
        List<Integer> idDocumentsEmpruntes = (List<Integer>) u.data()[3];

        List<Document> documentsEmpruntes = new ArrayList<>();
        for (Integer i : idDocumentsEmpruntes) {
            documentsEmpruntes.add(Mediatheque.getInstance().getDocument(i));
        }
        return documentsEmpruntes;
    }
}
