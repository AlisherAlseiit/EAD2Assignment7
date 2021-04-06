package org.example.dbInfo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {


    public static Connection getConnection(){
        Connection connection = null;

        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5433/forum_db", "postgres", "123456");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }


        return connection;
    }
}
