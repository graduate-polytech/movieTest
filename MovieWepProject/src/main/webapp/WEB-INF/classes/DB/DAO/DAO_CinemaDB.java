package DB.DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import DB.DatabaseConnection;
import DB.Data.Data_Cinema;
import DB.Data.Data_Review;

public class DAO_CinemaDB extends DatabaseConnection{
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	public static void main(String[] args) {
		DAO_CinemaDB dao = new DAO_CinemaDB();
		Data_Cinema data = new Data_Cinema("영화관","용마공원로 9길 29","010-0000-0000","WWW.");
		System.out.println("영화관 DB"+dao.updateCinema(data));
	}
	public int insertCinema(String[] datas) {
		return insertCinema(new Data_Cinema(datas));
	}
	public int insertCinema(Data_Cinema data) {
		int result = -1;
		float x = data.getlocation_x();
		float y = data.getlocation_y();
		
		String name = data.getName();
		String address = data.getAddress();
		String Area_1 = data.getArea1();
		String Area_2 = data.getArea2();
		String tel = data.getTel();
		String wep = data.getWep();
		
		try {

			conn = getConnection();
			// "SELECT * FROM moviedb.review WHERE ? = ?"
			String checkIdSql = "insert into moviedb.cinema(name,address,Area_1,Area_2,location_x,location_y,tel,wep) value(?,?,?,?,?,?,?)";

			pstmt = conn.prepareStatement(checkIdSql);

			pstmt.setString(1, name);
			pstmt.setString(2, address);
			pstmt.setString(3, Area_1);
			pstmt.setString(4, Area_2);
			pstmt.setFloat(5, x);
			pstmt.setFloat(6, y);
			pstmt.setString(7, tel);
			pstmt.setString(8, wep);

			int rs = pstmt.executeUpdate();

			if (rs > 0) {
				result = 0;
			}

		} catch (SQLException e) {
			System.out.println("에러 : " + e.getMessage());
			e.printStackTrace();
			result = -1;
		}

		return result;
	}
	
	public int updateCinema(Data_Cinema data) {
		int result = -1;
		float x = data.getlocation_x();
		float y = data.getlocation_y();
		
		String name = data.getName();
		String address = data.getAddress();
		String Area_1 = data.getArea1();
		String Area_2 = data.getArea2();
		String tel = data.getTel();
		String wep = data.getWep();
		
		try {

			conn = getConnection();
			String sql = "SELECT * FROM moviedb.cinema where name=?";
			pstmt.setString(1, name);
			pstmt = conn.prepareStatement(sql);
			ResultSet resultSet = pstmt.executeQuery();
			if(resultSet.next()) { //동일한 이름이 존재
				conn = getConnection();
				//name,address,Area_1,Area_2,location_x,location_y,tel,wep
				sql = "UPDATE moviedb.cinema SET \r\n"
						+ "	address=? ,\r\n"
						+ "	Area_1=? ,\r\n"
						+ "	Area_2=? ,\r\n"
						+ "	location_x=? ,\r\n"
						+ "	location_y=? ,\r\n"
						+ "	tel=?,"
						+ " wep=?,\r\n"
						+ "	WHERE name=?";
				pstmt.setString(8, name);
				pstmt.setString(1, address);
				pstmt.setString(2, Area_1);
				pstmt.setString(3, Area_2);
				pstmt.setFloat(4, x);
				pstmt.setFloat(5, y);
				pstmt.setString(6, tel);
				pstmt.setString(7, wep);
				pstmt = conn.prepareStatement(sql);
				pstmt = conn.prepareStatement(sql);
				result = pstmt.executeUpdate();
				
				if(result>0) {
					result = 0;
				}
			}

		} catch (SQLException e) {
			System.out.println("에러 : " + e.getMessage());
			e.printStackTrace();
			result = -1;
		}

		return result;
	}
	
    public ArrayList<Data_Cinema> getAllCinemaData() {
    	ArrayList<Data_Cinema> cinemaList = new ArrayList<>();
        Connection connection = null;

        try {
            connection = getConnection();
            String sql = "SELECT * FROM cinema";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
            	Data_Cinema cinema = new Data_Cinema();
                cinema.setName(resultSet.getString("name"));
                cinema.setArea1(resultSet.getString("Area_1"));
                cinema.setArea2(resultSet.getString("Area_2"));
                cinema.setAddress(resultSet.getString("address"));
                cinema.setTel(resultSet.getString("tel"));
                cinema.setWep(resultSet.getString("wep"));
                cinema.setlocation_x(resultSet.getFloat("location_x"));
                cinema.setlocation_y(resultSet.getFloat("location_y"));
                
                cinemaList.add(cinema);
            }

            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection);
        }

        return cinemaList;
    }

    // 나머지 코드는 필요한 메서드와 필드를 추가하여 작성
}
