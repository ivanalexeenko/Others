package app.entities;

public class GameStatistics {

    public static final int WIN = 1;
    public static final int TIE = 0;
    public static final int LOSE = -1;

    public static final String WIN_STR = "WINS";
    public static final String TIE_STR = "TIES";
    public static final String LOSE_STR = "LOSES";

    private int wins;
    private int ties;
    private int loses;

    private String computerCurrentHash;
    private String computerLastHash;
    private String humanLastHash;
    private String computerCurrentVariant;

    public void setComputerCurrentHash(String computerCurrentHash) {
        this.computerCurrentHash = computerCurrentHash;
    }

    public void setComputerLastHash(String computerLastHash) {
        this.computerLastHash = computerLastHash;
    }

    public void setHumanLastHash(String humanLastHash) {
        this.humanLastHash = humanLastHash;
    }

    public void setComputerCurrentVariant(String computerCurrentVariant) {
        this.computerCurrentVariant = computerCurrentVariant;
    }
    public String getComputerCurrentVariant() {
        return this.computerCurrentVariant;
    }


    public String getComputerCurrentHash() {

        return computerCurrentHash;
    }

    public String getComputerLastHash() {
        return computerLastHash;
    }

    public String getHumanLastHash() {
        return humanLastHash;
    }

    public String toWord(int num) {
        if(num == WIN ){
            return WIN_STR;
        }
        if(num == TIE) {
            return TIE_STR;
        }
        return LOSE_STR;
    }
    public void increaseCounter(int num) {
        if(num == WIN ){
            addWins();
        }
        else if(num == TIE) {
            addTies();
        }
        else {
            addLoses();
        }

    }



    public GameStatistics() {
        wins = 0;
        ties = 0;
        loses = 0;
        humanLastHash = "";
        computerLastHash = "";
        computerCurrentHash = "";
        computerCurrentVariant = "";
    }

    public int getWins() {
        return wins;
    }

    public int getTies() {
        return ties;
    }

    public int getLoses() {
        return loses;
    }

    private void addWins() {
        wins++;
    }

    private void addTies() {
        ties++;
    }

    private void addLoses() {
        loses++;
    }

}
