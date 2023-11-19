/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author ACER NITRO 5
 */
public class DBContext {

    protected Connection connection;

    public DBContext() {
        try {
            // Edit URL, username, password to authenticate with your MS SQL Server
            String url = "jdbc:sqlserver://localhost:1433;databaseName=Exam";
            String username = "sa";
            String password = "12";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println("Error: Unable to establish a database connection.");
            ex.printStackTrace();
        }
    }

    public Connection getConnection() {
        return connection;
    }

    public boolean isConnected() {
        return connection != null;
    }
    public static void main(String[] args) {
        // Create an instance of DBContext
        DBContext dbContext = new DBContext();

        // Check the connection status
        if (dbContext.isConnected()) {
            System.out.println("Database connection successful!");
            // You can now use the 'connection' object to interact with the database
            // For example, you can execute SQL queries using this connection
            // connection.createStatement().execute("SELECT * FROM YourTable");
        } else {
            System.out.println("Failed to connect to the database.");
        }
    }
}
