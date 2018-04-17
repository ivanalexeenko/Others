package app.servlets;

import app.coder.HmacSha1Signature;
import app.entities.GameSession;
import app.entities.GameStatistics;
import app.model.Configuration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SignatureException;
import java.util.List;
import java.util.Random;

public class GameServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Configuration configuration = Configuration.getInstance();
        GameStatistics gameStatistics = configuration.getGameStatistics();
        List<String> gameSession = configuration.list();
        List<String> variants = configuration.getVariants();
        int[][] matrix = configuration.getBattleMatrix();
        req.setAttribute("gameSession",gameSession);
        req.setAttribute("battleMatrix",matrix);
        req.setAttribute("pickVariants",variants);
        req.setAttribute("gameStatistics",gameStatistics);


        RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/game.jsp");
        requestDispatcher.forward(req,resp);
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String selection = req.getParameter("select");

        Configuration configuration = Configuration.getInstance();
        GameStatistics gameStatistics = configuration.getGameStatistics();
        List<String> gameSession = configuration.list();
        List<String> variants = configuration.getVariants();
        int[][] matrix = configuration.getBattleMatrix();

        if(selection != null && !selection.equals("")) {
            int computerSelection =  variants.indexOf(gameStatistics.getComputerCurrentVariant());
            int humanSelection = variants.indexOf(selection);
            gameStatistics.increaseCounter(matrix[humanSelection][computerSelection]);
            String verdict = selection + " " + gameStatistics.toWord(matrix[humanSelection][computerSelection]) + " " + gameStatistics.getComputerCurrentHash();
            configuration.add(new GameSession(verdict));
            Random random = new Random();
            int rand = random.nextInt(variants.size());
            String compPick = variants.get(rand);
            gameStatistics.setComputerCurrentVariant(compPick);
            gameStatistics.setComputerLastHash(gameStatistics.getComputerCurrentHash().toString());
            try {
                gameStatistics.setComputerCurrentHash(HmacSha1Signature.calculateRFC2104HMAC(compPick,HmacSha1Signature.KEY));
                gameStatistics.setHumanLastHash(HmacSha1Signature.calculateRFC2104HMAC(selection,HmacSha1Signature.KEY));
            } catch (SignatureException | NoSuchAlgorithmException | InvalidKeyException e) {
                e.printStackTrace();
            }


        }
        req.setAttribute("gameSession",gameSession);
        req.setAttribute("battleMatrix",matrix);
        req.setAttribute("pickVariants",variants);
        req.setAttribute("gameStatistics",gameStatistics);

        req.setAttribute("selection",selection);
        doGet(req,resp);
    }
}
