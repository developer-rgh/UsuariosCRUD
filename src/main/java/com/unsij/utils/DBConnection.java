package com.unsij.utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {
        try {
            String url = System.getenv("DB_URL");
            String user = System.getenv("DB_USER");
            String pass = System.getenv("DB_PASS");
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(
                    url,
                    user,
                    pass
            );
        } catch (Exception e) {
            throw new RuntimeException("Error de conexión", e);
        }
    }
}
