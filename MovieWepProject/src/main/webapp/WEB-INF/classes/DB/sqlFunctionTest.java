package DB;

import java.sql.*;
//영화 추천용 선호장르 유사 유저 검색
public class sqlFunctionTest extends DatabaseConnection{

	private Connection connection;
    public static void main(String[] args) {
    	sqlFunctionTest d = new sqlFunctionTest();
    	d.selcetTest("user0001");
    }
    
    public void selcetTest(String userId) {
		int result = 0;
		connection = getConnection();
		// 데이터베이스에 데이터 삽입 쿼리
		try {
			connection = getConnection();

			String checkIdSql = "SELECT u1.userId,\r\n"
					+ "       SUM(\r\n"
					+ "         IF(u1.Genre_1 = u2.Genre_1 OR u1.Genre_1 = u2.Genre_2 OR u1.Genre_1 = u2.Genre_3 OR u1.Genre_1 = u2.Genre_4, 1, 0) +\r\n"
					+ "         IF(u1.Genre_2 = u2.Genre_1 OR u1.Genre_2 = u2.Genre_2 OR u1.Genre_2 = u2.Genre_3 OR u1.Genre_2 = u2.Genre_4, 1, 0) +\r\n"
					+ "         IF(u1.Genre_3 = u2.Genre_1 OR u1.Genre_3 = u2.Genre_2 OR u1.Genre_3 = u2.Genre_3 OR u1.Genre_3 = u2.Genre_4, 1, 0) +\r\n"
					+ "         IF(u1.Genre_4 = u2.Genre_1 OR u1.Genre_4 = u2.Genre_2 OR u1.Genre_4 = u2.Genre_3 OR u1.Genre_4 = u2.Genre_4, 1, 0)\r\n"
					+ "       ) AS overlap_count\r\n"
					+ "FROM `user` u1\r\n"
					+ "INNER JOIN `user` u2 ON u1.userId != u2.userId\r\n"
					+ "WHERE u2.userId = ?\r\n"
					+ "GROUP BY u1.userId\r\n"
					+ "HAVING overlap_count > 0\r\n"
					+ "ORDER BY overlap_count DESC";
			PreparedStatement preparedStatement = connection.prepareStatement(checkIdSql);
			preparedStatement.setString(1, userId);
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				System.out.print(rs.getString(1) + " : ");
				System.out.println(rs.getInt(2));
			}
			
			preparedStatement.close();
			closeConnection(connection);
		} catch (SQLException e) {
			result = -1;
			// TODO Auto-generated catch block
			System.out.println(e.getErrorCode());
			e.printStackTrace();
		}
	}
    
}
