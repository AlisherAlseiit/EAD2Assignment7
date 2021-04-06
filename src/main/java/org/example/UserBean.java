package org.example;

import org.example.dbInfo.DBConnection;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserBean implements Serializable {

    private String name = null;
    private String password = null;
    private Long user_id;

    boolean loggedIn = false;


    public UserBean() {
    }

    public Long getUser_id() {
        return user_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
    }

    public boolean isLoggedIn() {
        return loggedIn;
    }

    public void setLoggedIn(boolean loggedIn) {
        this.loggedIn = loggedIn;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean login() {
        Connection connection = null;

        connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM my_user WHERE name=? and password=?");

            preparedStatement.setString(1, name);
            preparedStatement.setString(2, password);

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                user_id = resultSet.getLong("id");
                System.out.println(user_id);
                loggedIn = true;
            } else {
                loggedIn = false;
            }
            preparedStatement.close();
            connection.close();
        } catch (Exception sqlException) {
            loggedIn = false;
        }
        return loggedIn;
    }

    public boolean registration(){
        Connection connection = null;
        connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;

        try {
            preparedStatement = connection.prepareStatement("INSERT INTO my_user( name, password)  VALUES (?,?)");
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, password);
            preparedStatement.executeUpdate();

            loggedIn = true;
        } catch (Exception Exception) {
            loggedIn = false;
        }
        return loggedIn;
    }

    public void logout(){
        loggedIn = false;
    }

    public boolean getIsLoggedIn() {
        return loggedIn;
    }
}
