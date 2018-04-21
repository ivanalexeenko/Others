package app.shuffler;

import java.util.List;
import java.util.Random;

public class Shuffler {
    public static List<String> shuffle(List<String> mas) {
        Random random = new Random();
        for(int i = mas.size() - 1;i > 0;i--) {
            int j = random.nextInt(i);
            String temp = mas.get(i);
            mas.set(i,mas.get(j));
            mas.set(j,temp);
        }
        return mas;
    }
}
