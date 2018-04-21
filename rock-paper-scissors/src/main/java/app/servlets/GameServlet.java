package app.servlets;

import app.coder.HmacSha1Signature;
import app.entities.GameSession;
import app.entities.GameStatistics;
import app.service.Configuration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.SignatureException;
import java.util.List;
import java.util.Random;

public class GameServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Configuration configuration = Configuration.getInstance();
        GameStatistics gameStatistics = configuration.getGameStatistics();
        List<String> gameSession = configuration.list();
        List<String> variants = configuration.getVariants();
        int[][] matrix = configuration.getBattleMatrix();
        request.setAttribute("gameSession",gameSession);
        request.setAttribute("battleMatrix",matrix);
        request.setAttribute("pickVariants",variants);
        request.setAttribute("gameStatistics",gameStatistics);

        request.getRequestDispatcher("views/game.jsp").forward(request,response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String selection = request.getParameter("select");

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
                SecureRandom random1 = new SecureRandom();
                byte[] values = new byte[20];
                random1.nextBytes(values);
                HmacSha1Signature.KEY = random1.toString();
                HmacSha1Signature.KEY = HmacSha1Signature.KEY.replace("java.security.SecureRandom@","");

                gameStatistics.setComputerCurrentHash(HmacSha1Signature.calculateRFC2104HMAC(compPick,HmacSha1Signature.KEY));
                gameStatistics.setHumanLastHash(HmacSha1Signature.calculateRFC2104HMAC(selection,HmacSha1Signature.KEY));
            } catch (SignatureException | NoSuchAlgorithmException | InvalidKeyException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST);
            }
        }
        request.setAttribute("gameSession",gameSession);
        request.setAttribute("battleMatrix",matrix);
        request.setAttribute("pickVariants",variants);
        request.setAttribute("gameStatistics",gameStatistics);
        request.setAttribute("selection",selection);
        doGet(request,response);
    }
}
