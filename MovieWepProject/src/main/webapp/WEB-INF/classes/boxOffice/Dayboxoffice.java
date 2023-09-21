package boxOffice;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class Dayboxoffice {
    private static final String API_KEY = "9cbf70ef669df368261f74e63c81b28c";
    private static final String BASE_API_URL = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json";

    public static List<datamovie> fetchDataByDate(String targetDt) {
        HttpClient httpClient = HttpClients.createDefault();
        List<datamovie> movieDayDataList = new ArrayList<>();

        try {
            String apiUrl = BASE_API_URL + "?key=" + API_KEY + "&targetDt=" + targetDt;
            HttpGet httpGet = new HttpGet(apiUrl);
            HttpResponse response = httpClient.execute(httpGet);

            if (response.getStatusLine().getStatusCode() == 200) {
                String json = EntityUtils.toString(response.getEntity());
                JSONObject jsonObject = new JSONObject(json);
                JSONObject boxOfficeResult = jsonObject.getJSONObject("boxOfficeResult");
                JSONArray dailyBoxOfficeList = boxOfficeResult.getJSONArray("dailyBoxOfficeList");

                for (int i = 0; i < dailyBoxOfficeList.length(); i++) {
                    JSONObject movieData = dailyBoxOfficeList.getJSONObject(i);

                    datamovie Daydata = new datamovie();
                    Daydata.setRank(movieData.getString("rank"));//순위
                    Daydata.setMovieNm(movieData.getString("movieNm"));//영화명
                    Daydata.setMovieCd(movieData.getString("movieCd"));//영화대표코드
                    Daydata.setOpenDt(movieData.getString("openDt"));//개봉일
                    Daydata.setSalesAcc(movieData.getString("salesAcc"));//누적매출액
                    Daydata.setSalesShare(movieData.getString("salesShare"));//해당일자 상영작의 매출총액 대비 해당 영화의 매출비율
                    Daydata.setAudiCnt(movieData.getString("audiCnt"));//해당일 관객수
                    Daydata.setAudiInten(movieData.getString("audiInten"));//전일 대비 관객수 증감
                    Daydata.setAudiAcc(movieData.getString("audiAcc"));//누적 관객수
                    Daydata.setScrnCnt(movieData.getString("scrnCnt"));//해당일자 스크린 상영수
                    Daydata.setShowCnt(movieData.getString("showCnt"));//상영된 횟수
                    Daydata.setSalesAmt(movieData.getString("salesAmt"));//매출액
                    Daydata.setSalesInten(movieData.getString("salesInten"));//매출액
                   
                    movieDayDataList.add(Daydata);
                }
            } else {
                System.err.println("API 요청 실패: " + response.getStatusLine().getReasonPhrase());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return movieDayDataList;
    }
    
}
