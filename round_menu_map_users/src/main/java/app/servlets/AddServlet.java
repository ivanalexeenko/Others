package app.servlets;

import app.entities.User;
import app.model.Model;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AddServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/add.jsp");
        requestDispatcher.forward(req,resp);
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String name = req.getParameter("name");
       String password = req.getParameter("pass");
       String club = req.getParameter("select");
       String path = req.getParameter("file");
       String gender = req.getParameter("gender");
       String attitude = null;
       String[] meals = req.getParameterValues("meal");

        StringBuffer buffer = new StringBuffer("");
        if(meals != null) {
            for(int i = 0;i < meals.length;i++) {
                buffer.append(meals[i]);
                buffer.append("& ");
            }
            if(buffer.length() != 0) {
                buffer.replace(buffer.length() - 2,buffer.length() - 1,"");
            }
            attitude = buffer.toString();
        }



        User user = new User(name,password,club,gender,attitude,path);
        Model model = Model.getInstance();
        Boolean isAdded = false;
        if(name != null && !name.equals("")
                && password != null && !password.equals("")
                && club != null && !club.equals("")
                && gender != null && !gender.equals("")
                && attitude != null && !attitude.equals("")
                && path != null && !path.equals("")) {
            model.add(user);
            isAdded = true;
        }
        req.setAttribute("userUser",user);
        req.setAttribute("isAdded",isAdded);
        doGet(req,resp);
    }

}
