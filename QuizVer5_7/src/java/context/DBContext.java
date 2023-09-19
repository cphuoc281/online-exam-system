package context;

//import com.microsoft.sqlserver.jdbc.SQLServerDataSource;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBContext {

    private final String servername = "localhost";
    private final String dbName = "Quiz";
    private final String portNumber = "1433";
    private final String instance = "";
    private final String userID = "sa";
    private final String password = "12";

    public Connection getConnection() throws Exception {
        try {
            String url = "jdbc:sqlserver://" + servername + ":" + portNumber + "\\" + instance + ";databaseName="
                    + dbName + ";encrypt=true;trustServerCertificate=true";
            if (instance == null || instance.trim().isEmpty()) {
                url = "jdbc:sqlserver://" + servername + ":" + portNumber + ";databaseName=" + dbName
                        + ";encrypt=true;trustServerCertificate=true";
            }
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            return DriverManager.getConnection(url, userID, password);

        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public static void main(String[] args) throws Exception {
        try {
            Connection connection = new DBContext().getConnection();

            if (connection != null) {
                System.out.println("Connect successfully to dtb");
            } else {
                System.out.println("Connect failed");
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
