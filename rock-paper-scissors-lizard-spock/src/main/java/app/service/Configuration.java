package app.service;

import app.coder.HmacSha1Signature;
import app.entities.GameSession;
import app.entities.GameStatistics;
import app.exceptions.EvenAmountException;
import app.exceptions.NotEnoughVariantsException;
import app.shuffler.Shuffler;

import java.io.File;
import java.io.FileNotFoundException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.SignatureException;
import java.util.*;
import java.util.stream.Collectors;

public class Configuration {

    private final String filename = "C:/Users/LENOVO/Web Proj/rock-paper-scissors/src/main/resources/variants.txt";
    private static List<String> variants;
    private static final String[] defaultVariants = {"Rock","Paper","Scissors"};
    private boolean isDefault = false;
    private static volatile Configuration instance;
    private List<GameSession> configuration;
    private static GameStatistics gameStatistics;
    private int[][] battleMatrix;

    public List<String> getVariants() {
        return variants;
    }

    public GameStatistics getGameStatistics() {
        return gameStatistics;
    }

    public static Configuration getInstance() {
        if(instance == null) {
            synchronized (Configuration.class) {
                if(instance == null)
                    instance = new Configuration();
                return instance;
            }
        }
        return instance;
    }

    private Configuration() {
        SecureRandom random1 = new SecureRandom();
        byte[] values = new byte[20];
        random1.nextBytes(values);
        HmacSha1Signature.KEY = random1.toString();
        HmacSha1Signature.KEY = HmacSha1Signature.KEY.replace("java.security.SecureRandom@","");
        configuration = new ArrayList<GameSession>();
        variants = new ArrayList<>();
        gameStatistics = new GameStatistics();
        try {
            readFile();
            variants = Shuffler.shuffle(variants);
        }
        catch (FileNotFoundException | NotEnoughVariantsException | EvenAmountException | NoSuchElementException e) {
            isDefault = true;
            variants.clear();
            variants.addAll(Arrays.asList(defaultVariants));
        }

        int n = variants.size();

        battleMatrix = new int[n][n];
        for(int i = 0;i < n;i++) {

            battleMatrix[i][(i + 1) % n] = GameStatistics.LOSE;
            battleMatrix[(i + 1) % n][i] = GameStatistics.WIN;

            int winNumber = (n - 1) / 2;

            for(int j = 2;j <= winNumber;j++) {
                battleMatrix[i][(i + j) % n] = GameStatistics.WIN;
                battleMatrix[(i + j) % n][i] = GameStatistics.LOSE;
            }
            battleMatrix[i][i] = GameStatistics.TIE;
        }
        Random random = new Random();
        int a = random.nextInt(variants.size());
        String variant = variants.get(a);
        try {
            String hmac = HmacSha1Signature.calculateRFC2104HMAC(variant,HmacSha1Signature.KEY);
            gameStatistics.setComputerCurrentHash(hmac);
            gameStatistics.setComputerCurrentVariant(variant);

        } catch (SignatureException | NoSuchAlgorithmException | InvalidKeyException e) {
            e.printStackTrace();
        }


    }
    private void readFile() throws FileNotFoundException, NotEnoughVariantsException, EvenAmountException,NoSuchElementException {
        Scanner scanner = new Scanner(new File(filename));
        while(scanner.hasNext()) {
            String string = scanner.next();
            variants.add(string);
        }
        if(variants.size() < 3) throw new NotEnoughVariantsException("Minimum Amount Of Variants is 3!");
        if(variants.size() % 2 == 0) throw new EvenAmountException("Amount of Variants Should Be Odd");
    }
    public void add(GameSession gameSession) {
        configuration.add(gameSession);
    }
    public List<String> list() {
        return configuration.stream().map(GameSession::getCurrentSession).collect(Collectors.toList());
    }

    public boolean isDefault() {
        return isDefault;
    }

    public int[][] getBattleMatrix() {
        return battleMatrix;
    }
}
