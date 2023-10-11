package DB;

import java.sql.*;

public class DAO_UserDB extends DatabaseConnection {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public static void main(String[] args) {

	}

	public int signupUser(Data_User u) {
		int result = 1;
		try {
			conn = getConnection();

			String checkIdSql = "SELECT * FROM moviedb.user WHERE id = ?";
			pstmt = conn.prepareStatement(checkIdSql);
			pstmt.setString(1, u.getId());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				// 중복된 아이디가 이미 존재하는 경우

			} else {
				// 중복된 아이디가 없는 경우 회원 정보를 데이터베이스에 저장
				String insertSql = "INSERT INTO user (id, pw, name, birthday, email, address, genre) VALUES (?, ?, ?, ?, ?, ?, ?)";
				pstmt = conn.prepareStatement(insertSql);
				pstmt.setString(1, u.getId());
				pstmt.setString(2, u.getPw());
				pstmt.setString(3, u.getName());
				pstmt.setString(4, u.getBirthday());
				pstmt.setString(5, u.getEmail());
				pstmt.setString(6, u.getAddress());
				pstmt.setString(7, u.getGenre_1());

				int rowsInserted = pstmt.executeUpdate();

				if (rowsInserted > 0) {
					// 회원가입 성공
					result = 1;
				} else {
					// 회원가입 실패
					result = -1;
				}
			}
        } catch (SQLException e) {
        	result = e.getErrorCode();
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
		return result;
	}

	
}
