package JSONonDB;

import MoviePortal.Personality;
import jsonLoader.JsonDealer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Comparator;
import java.util.List;

public class App {
    public static void main(String[] args) {
        try {
            Class.forName("org.postgresql.Driver");
            String dbURL = "jdbc:postgresql://localhost:5432/OODB";
            Connection connection = DriverManager.getConnection(dbURL, "postgres", "131214");

            List<Personality> personalities = Loader.load(connection);
            List<Personality> personalities_from_file = JsonDealer.loadPersonality();

            System.out.println("Database:\n");
            if (personalities != null) {
                personalities.sort(Comparator.comparing(Personality::getName));
                personalities.forEach(System.out::println);
                JsonDealer.findPersonByName(personalities, "Акакий Акакиевич");
            }
            System.out.println("JSON file:\n");
            personalities_from_file.forEach(System.out::println);
            long time1 = System.currentTimeMillis();
            Loader.save(personalities_from_file, connection);
            long time2 = System.currentTimeMillis();
            Loader.saveb(personalities_from_file, connection);
            long time3 = System.currentTimeMillis();
            System.out.println(time2 - time1);
            System.out.println(time3 - time2);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

    }
}
