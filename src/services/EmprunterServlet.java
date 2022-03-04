package services;

import mediatek2022.Mediatheque;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class EmprunterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer idDocument = (Integer) req.getAttribute("idDocument");

        if (idDocument == null) {
            req.setAttribute("documentsDisponibles", Mediatheque.getInstance().tousLesDocumentsDisponibles());
            req.getRequestDispatcher("/emprunter.jsp").forward(req, resp);
        } else {
            System.out.println("ton père l'orang-outan");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
