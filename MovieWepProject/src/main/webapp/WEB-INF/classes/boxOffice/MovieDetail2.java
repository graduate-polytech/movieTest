package boxOffice;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

public class MovieDetail2 {
    private static final String API_URL = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json.jsp";
    private static final String API_KEY = "25QF8GG6G9R22N50D3X4"; // 본인의 KMDB API 키로 대체

    public static List<MovieInfo> searchMovieInfo(String title) throws IOException {
        // 영화 제목을 URL 인코딩
    	
        String encodedTitle = URLEncoder.encode(title, "UTF-8");
        
        // API 요청 URL 생성
        String API_URL = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json.jsp";
        String API_KEY = "25QF8GG6G9R22N50D3X4"; // 본인의 KMDB API 키로 대체
        String apiUrl = API_URL + "?ServiceKey=" + API_KEY + "&collection=kmdb_new&title=" + encodedTitle+ "&detail=Y&sort=prodYear&listCount="+20;

        // HTTP GET 요청 생성 및 설정
        URL url = new URL(apiUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");

        // 응답 읽기
        BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
        StringBuilder response = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            response.append(line);
        }
        reader.close();
        conn.disconnect();

        // JSON 파싱
        JsonParser jsonParser = new JsonParser();
        JsonObject jsonResponse = jsonParser.parse(response.toString()).getAsJsonObject();

        // 필요한 정보 추출
        JsonArray data = jsonResponse.getAsJsonArray("Data");
        JsonArray results = data.get(0).getAsJsonObject().getAsJsonArray("Result");

        List<MovieInfo> movieInfoList = new ArrayList<>();

        for (int i = 0; i < results.size(); i++) {
            JsonObject result = results.get(i).getAsJsonObject();
            String movieTitle = result.get("title").getAsString();
            if (movieTitle.contains("!HS") || movieTitle.contains("!HE")) {
            	movieTitle = movieTitle.replaceAll("\\s!HS\\s|\\s!HE\\s", "");
            }
            System.out.println("Original Title: " + movieTitle);

            JsonArray directors = result.getAsJsonArray("director");
            String directorName = "";

            if (directors != null && directors.size() > 0) {
                JsonObject director = directors.get(0).getAsJsonObject();
                directorName = director.get("directorNm").getAsString(); // 감독 이름
            }

            String nation = result.get("nation").getAsString(); // 국가 정보

            // 중복된 "rating" 키 처리
            JsonArray ratings = result.getAsJsonArray("rating");

            // "posters" 값을 불러옴
            JsonElement postersElement = result.get("posters");
            List<String> posters = new ArrayList<>();

            if (postersElement != null && postersElement.isJsonPrimitive()) {
                String postersValue = postersElement.getAsString();
                String[] posterUrls = postersValue.split("\\|");
                for (String posterUrl : posterUrls) {
                    posters.add(posterUrl);
                }
            }

            // MovieInfo 객체 생성 및 추가
            MovieInfo movieInfo = new MovieInfo(movieTitle, directorName, nation);
            movieInfo.setPosters(posters);
            movieInfoList.add(movieInfo);
        }

        return movieInfoList;
    }
}