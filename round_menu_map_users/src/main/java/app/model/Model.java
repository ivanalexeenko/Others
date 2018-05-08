package app.model;

import app.entities.User;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class Model {
    private static Model instance = new Model();
    private List<User> model;
    public static Model getInstance() {
        return instance;
    }
    private Model() {
        model = new ArrayList<User>();
    }
    public void add(User user) {
        model.add(user);
    }
    public List<String> names() {
        return model.stream().map(User::getName).collect(Collectors.toList());
    }
    public List<String> clubs() {
        return model.stream().map(User::getClub).collect(Collectors.toList());
    }
    public List<String> genders() {
        return model.stream().map(User::getGender).collect(Collectors.toList());
    }
    public List<String> attitudes() {
        return model.stream().map(User::getAttitude).collect(Collectors.toList());
    }
    public List<String> paths() {
        return model.stream().map(User::getPath).collect(Collectors.toList());
    }



    public String[] getStandardAttitudes() {
        return standardAttitudes;
    }
    public String[] getStandardClubs() {
        return standardClubs;
    }

    private final String standardClubs[] = {"FC Chelsea","AC Milan","FC Barcelona","Real Madrid","Madison","FC Liverpool","FC BATE","FC Dinamo Kiew","Dozari"};

    private final String standardAttitudes[] = {"Salads","Fruit","Meat","FastFood","Pizza","Ice-Cream"};

}
