package DB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CinemaDataAccess {
    private DatabaseConnection databaseConnection = new DatabaseConnection();

    public List<Cinema> getAllCinemaData() {
        List<Cinema> cinemaList = new ArrayList<>();
        Connection connection = null;

        try {
            connection = databaseConnection.getConnection();
            String sql = "SELECT * FROM cinema";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Cinema cinema = new Cinema();
                cinema.setNo(resultSet.getInt("no"));
                cinema.setName(resultSet.getString("name"));
                cinema.setCompany(resultSet.getString("company"));
                cinema.setAddress(resultSet.getString("address"));
                cinema.setCallno(resultSet.getString("callno"));
                cinema.setWep(resultSet.getString("wep"));
                cinemaList.add(cinema);
            }

            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            databaseConnection.closeConnection(connection);
        }

        return cinemaList;
    }

    // 나머지 코드는 필요한 메서드와 필드를 추가하여 작성
}
