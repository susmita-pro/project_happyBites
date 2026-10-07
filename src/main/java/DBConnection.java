package com.HappyBites.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL =
            "jdbc:mysql://localhost:3306/happybites";

    private static final String USERNAME = "root";

    private static final String PASSWORD = "123456";


    public static Connection getConnection() {

        try {

            System.out.println("========== DATABASE CONNECTION ==========");

            System.out.println("Loading MySQL Driver...");

            Class.forName("com.mysql.cj.jdbc.Driver");

            System.out.println("MySQL Driver Loaded Successfully");

            System.out.println("Connecting to Database...");

            Connection connection =
                    DriverManager.getConnection(
                            URL,
                            USERNAME,
                            PASSWORD
                    );

            System.out.println("Database Connected Successfully");

            System.out.println("Database Name : "
                    + connection.getCatalog());

            System.out.println("=========================================");

            return connection;

        }
        catch (ClassNotFoundException e) {

            System.out.println("MYSQL DRIVER NOT FOUND");

            e.printStackTrace();

        }
        catch (SQLException e) {

            System.out.println("DATABASE CONNECTION FAILED");

            e.printStackTrace();
        }

        return null;
    }
}