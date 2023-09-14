package boxOffice;
import java.net.URL;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import java.net.HttpURLConnection;
import java.net.URLEncoder;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class KoficApi_MovieList {
	public static void main(String[] args) throws IOException, ParseException {

        String apiKey = "9cbf70ef669df368261f74e63c81b28c";
        StringBuilder urlBuilder = new StringBuilder("http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key=" + apiKey);
        /*URL*/
//이미지 항목 posters
        // Append Service Key
//        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=B40IP5NLA4A22KX077TM");
//&detail=Y&director=김지훈"
//        urlBuilder.append("&" + URLEncoder.encode("detail","UTF-8") + "=" + "N");
        urlBuilder.append("&" + URLEncoder.encode("directorNm","UTF-8") + "=" + URLEncoder.encode("김지훈","UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("itemPerPage","UTF-8") + "=" + URLEncoder.encode("30","UTF-8"));
        
        // Append other parameters as needed

        System.out.println("전체 URL : " + urlBuilder.toString());

        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");

//        System.out.println("Response code: " + conn.getResponseCode());

        BufferedReader rd;
        if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }

        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();

        String responseJson = sb.toString();
        JSONParser jsonParser = new JSONParser();
        
        //3. To Object
        Object obj = jsonParser.parse(responseJson);
        
        //4. To JsonObject
        JSONObject jsonObject = (JSONObject) obj;
        // JSON 파싱
//        JSONObject jsonObject = new JSONObject(responseJson);

        // 출력
        System.out.println(jsonObject);
//        System.out.println(jsonObject.get("Data"));
    }
}



