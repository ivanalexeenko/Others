package app.servlets;

import app.model.Model;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Model model = Model.getInstance();
        List<String> names = model.names();
        List<String> clubs = model.clubs();
        List<String> genders = model.genders();
        List<String> attitudes = model.attitudes();
        List<String> paths = model.paths();

        req.setAttribute("userNames",names);
        req.setAttribute("userClubs",clubs);
        req.setAttribute("userGenders",genders);
        req.setAttribute("userAttitudes",attitudes);
        req.setAttribute("userPaths",paths);



        RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/list.jsp");
        requestDispatcher.forward(req,resp);
    }
}
