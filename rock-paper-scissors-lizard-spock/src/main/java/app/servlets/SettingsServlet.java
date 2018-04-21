package app.servlets;

import app.service.Configuration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class SettingsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Configuration configuration = Configuration.getInstance();
        List<String> variants = configuration.getVariants();
        int[][] matrix = configuration.getBattleMatrix();
        req.setAttribute("battleMatrix",matrix);
        req.setAttribute("pickVariants",variants);
        req.setAttribute("isDefault",configuration.isDefault());
        req.setAttribute("gameStatistics",configuration.getGameStatistics());

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/settings.jsp");
        requestDispatcher.forward(req,resp);
    }
}
