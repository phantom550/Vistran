package com.user;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static Connection con = null;

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Read environment variables
            String envUrl  = System.getenv("DB_URL");
            String envUser = System.getenv("DB_USER");
            String envPass = System.getenv("DB_PASSWORD");

            String dbUrl, dbUser, dbPass;

            // If env variables are available, use them
            if (envUrl != null && envUser != null && envPass != null) {
                dbUrl  = envUrl;
                dbUser = envUser;
                dbPass = envPass;
            }
            // Otherwise use local database
            else {
                dbUrl  = "jdbc:mysql://localhost:3306/void4";
                dbUser = "root";
                dbPass = "root";
            }

            con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public Connection getConnection() {
        if (con != null) {
            return con;
        }
        return null;
    }
}