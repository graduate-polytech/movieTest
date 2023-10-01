package DB;

import java.sql.*;

public class DatabaseConnection {

	private Connection connection;

//	private final String jdbcUrl = "jdbc:mysql://121.130.132.95:3306/moviedb"; // 데이터베이스 URL
//	private final String jdbcUsername = "outlineuser"; // 데이터베이스 사용자 이름
//	private final String jdbcPassword = "outline0000"; // 데이터베이스 암호

	private final String jdbcUrl = "jdbc:mysql://localhost:3306/moviedb"; // 데이터베이스 URL
	private final String jdbcUsername = "root"; // 데이터베이스 사용자 이름
	private final String jdbcPassword = "0000"; // 데이터베이스 암호


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

	public int signUp(userData u) {
		int result = 0;
		
		result = checkId(u.getId());
		connection = getConnection();
		// 데이터베이스에 데이터 삽입 쿼리
		if(result != 0) {
			return result;
		}
		try {
			String insertQuery = "insert into moviedb.user(id,pw,name,birthday,email,address,genre_1,genre_2,genre_3,genre_4) values(?,?,?,?,?,?,?,?,?,?);";
			PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
			preparedStatement.setString(1, u.getId());
			preparedStatement.setString(2, u.getPw());
			preparedStatement.setString(3, u.getName());
			preparedStatement.setString(4, u.getBirthday());
			preparedStatement.setString(5, u.getEmail());
			preparedStatement.setString(6, u.getAddress());
			preparedStatement.setString(7, u.getGenre_1());
			preparedStatement.setString(8, u.getGenre_2());
			preparedStatement.setString(9, u.getGenre_3());
			preparedStatement.setString(10, u.getGenre_4());

			// 데이터 삽입 실행
			preparedStatement.executeUpdate();

			// 리소스 해제
			preparedStatement.close();
			closeConnection(connection);
		} catch (SQLException e) {
			result = -1;
			// TODO Auto-generated catch block
			System.out.println(e.getErrorCode());
			e.printStackTrace();
		}
		return result;
	}
	
	public int checkId(String userId) {
		int result = 0;
		connection = getConnection();
		// 데이터베이스에 데이터 삽입 쿼리
		try {
			connection = getConnection();

			String checkIdSql = "SELECT * FROM moviedb.user WHERE id = ?";
			PreparedStatement preparedStatement = connection.prepareStatement(checkIdSql);
			preparedStatement.setString(1, userId);
			ResultSet rs = preparedStatement.executeQuery();
			
			if (rs.next()) {
				result = 1;
			}
			
			preparedStatement.close();
			closeConnection(connection);
		} catch (SQLException e) {
			result = -1;
			// TODO Auto-generated catch block
			System.out.println(e.getErrorCode());
			e.printStackTrace();
		}
		return result;
	}
	public int signIn(userData u) {
		int result = 1;
		connection = getConnection();
		// 데이터베이스에 데이터 삽입 쿼리
		try {
			connection = getConnection();

			String checkIdSql = "SELECT * FROM moviedb.user WHERE id = ? and pw = ?";
			PreparedStatement preparedStatement = connection.prepareStatement(checkIdSql);
			preparedStatement.setString(1, u.getId());
			preparedStatement.setString(2, u.getPw());
			ResultSet rs = preparedStatement.executeQuery();
			
			if (rs.next()) {
				result = 0;
			}
			
			preparedStatement.close();
			closeConnection(connection);
		} catch (SQLException e) {
			result = -1;
			// TODO Auto-generated catch block
			System.out.println(e.getErrorCode());
			e.printStackTrace();
		}
		return result;
	}
	
}
