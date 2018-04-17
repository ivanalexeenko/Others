package app.entities;

public class GameSession {
    private String currentSession;

    public GameSession() {
        currentSession = "";
    }
    public GameSession(String session) {
        currentSession = session;
    }

    public String getCurrentSession() {
        return currentSession;
    }

    public void setCurrentSession(String currentSession) {
        this.currentSession = currentSession;
    }

}
