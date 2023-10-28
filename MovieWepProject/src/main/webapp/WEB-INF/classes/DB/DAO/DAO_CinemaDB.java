package DB.DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import DB.DatabaseConnection;
import DB.Data.Data_Cinema;

public class DAO_CinemaDB extends DatabaseConnection{

	public static void main(String[] args) {
		DAO_CinemaDB dao = new DAO_CinemaDB();
		dao.getAllCinemaData();
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
