package persistance;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet(urlPatterns = "/notused", loadOnStartup = 1)
public class InitServlet extends HttpServlet {
    @Override
    public void init() throws ServletException {
        super.init();
        try {
            Class.forName("persistance.MediathequeData");
            System.out.println("****************************************");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
