package app.entities;

public class User {
    private String name;
    private String password;
    private String club;
    private String gender;
    private String attitude;
    private String path;


    public String getPassword() {
        return password;
    }

    public String getClub() {
        return club;
    }

    public String getGender() {
        return gender;
    }

    public String getAttitude() {
        return attitude;
    }

    public String getPath() {
        return path;
    }

    public String getName() {
        return name;
    }


    public User(String name, String password) {
        this.name = name;
        this.password = password;
    }

    public User(String name, String password, String club, String gender, String attitude, String path) {
        this.name = name;
        this.password = password;
        this.club = club;
        this.gender = gender;
        this.attitude = attitude;
        this.path = path;
    }

    public User() {

    }

    @Override
    public int hashCode() {
        return super.hashCode();
    }

    @Override
    public boolean equals(Object obj) {
        return super.equals(obj);
    }

    @Override
    public String toString() {
        return super.toString();
    }
}
