/**
 *
 * @author HP
 */
package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    
    private static final String URL = "jdbc:mysql://localhost/assigment";
    private static final String DRIVER_NAME = "com.mysql.jdbc.Driver";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "";
    
    private static Connection conn;
    
    public static Connection getConnection() throws ClassNotFoundException{
        try {
            Class.forName(DRIVER_NAME);
            
            conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException | SQLException e){
            e.getMessage();
        }
        return conn;
    }
    
}
