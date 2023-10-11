package DB;

import java.sql.*;
import java.util.*;

public class DAO_ReviewDB extends DatabaseConnection {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

//userid, movieCode, score, review, date
	public static void main(String[] args) {
		DAO_ReviewDB d = new DAO_ReviewDB();
//		ArrayList<Data_Review> reviewList = d.getReviewList();
//		ArrayList<Data_Review> reviewList = d.getReviewList("userID");
		ArrayList<Data_Review> reviewList = d.getReviewList("CODE_1","감독_1");
		for (Data_Review review : reviewList) {
			System.out.println(review.toString());
		}
	}

	public ArrayList<Data_Review> getReviewList() {
		return getReviewList("", "");
	}

	public ArrayList<Data_Review> getReviewList(String condition) {

		return getReviewList(condition, "");
	}

	public ArrayList<Data_Review> getReviewList(String userid_title, String director) {
		ArrayList<Data_Review> reviewList = new ArrayList<Data_Review>();
		try {
			System.out.println("리뷰 불러오기");
			conn = getConnection();
			// "SELECT * FROM moviedb.review WHERE ? = ?"
			String checkIdSql = "";

			int dataCount = 0;
			if (userid_title.length() == 0)
				dataCount = 0;
			else {
				if (director.length() == 0)
					dataCount = 1;
				else
					dataCount = 2;
			}
			
			if(dataCount == 0) {
				checkIdSql = "SELECT * FROM moviedb.review";
			} else if(dataCount == 1) {
				checkIdSql = "SELECT * FROM moviedb.review WHERE userid = ?";
			} else if(dataCount == 2) {
				checkIdSql = "SELECT * FROM moviedb.review WHERE title = ? and director = ?";
			}
			
			pstmt = conn.prepareStatement(checkIdSql);
			
			if(dataCount == 1) {
				pstmt.setString(1, userid_title);
			} else if(dataCount == 2) {
				pstmt.setString(1, userid_title);
				pstmt.setString(2, director);
			}

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// 중복된 아이디가 이미 존재하는 경우
				Data_Review review = new Data_Review();
				review.setUserid(rs.getString(2));
				review.setTitle(rs.getString(3));
				review.setDirector(rs.getString(4));
				review.setScore(rs.getInt(5));
				review.setReview(rs.getString(6));
				review.setDate(rs.getDate(7));
				reviewList.add(review);
			}
		} catch (SQLException e) {
			System.out.println("에러 : " + e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println("finally : " + e.getMessage());
			}
		}
		return reviewList;
	}

}
