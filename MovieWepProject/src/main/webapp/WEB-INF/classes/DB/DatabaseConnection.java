package DB;
import java.sql.*;

public class DatabaseConnection {
    private static Connection connection;

    private final String jdbcUrl = "jdbc:mysql://121.130.132.95:3306/moviedb"; // 데이터베이스 URL
    private final String jdbcUsername = "outlineuser"; // 데이터베이스 사용자 이름
    private final String jdbcPassword = "outline0000"; // 데이터베이스 암호

    // 데이터베이스 연결을 설정하고 커넥션을 반환하는 메서드
    public Connection getConnection() {
        connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcUrl, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }
    public void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
