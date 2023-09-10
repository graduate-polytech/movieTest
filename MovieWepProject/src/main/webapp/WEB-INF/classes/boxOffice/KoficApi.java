package boxOffice;

import java.net.http.HttpClient;
import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.json.simple.JSONObject;

public class KoficApi{
//    public static List<datamovie> data() {
//        CloseableHttpClient httpClient = HttpClients.createDefault();
//        String apiKey = "9cbf70ef669df368261f74e63c81b28c";
//        
//        String apiUrl = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.json?key=" + apiKey + "&targetDt=20230101";
//
//        List<datamovie> movieDataList = new ArrayList<>();
//
//        try {
//            HttpGet httpGet = new HttpGet(apiUrl);
//            CloseableHttpResponse response = httpClient.execute(httpGet);
//
//            if (response.getStatusLine().getStatusCode() == 200) {
//                String json = EntityUtils.toString(response.getEntity());
//                
//                JsonToString jts = new JsonToString();
//                
//                JSONObject jsonObject = new JSONObject(json);
//                JSONObject boxOfficeResult = jsonObject.getJSONObject("boxOfficeResult");
//                JSONArray weeklyBoxOfficeList = boxOfficeResult.getJSONArray("weeklyBoxOfficeList");
//
//                for (int i = 0; i < weeklyBoxOfficeList.length(); i++) {
//                    JSONObject movieData = weeklyBoxOfficeList.getJSONObject(i);
//
//                    datamovie data = new datamovie();
//                    data.setRank(movieData.getString("rank"));
//                    data.setMovieNm(movieData.getString("movieNm"));
//                    data.setMovieCd(movieData.getString("movieCd"));
//                    data.setOpenDt(movieData.getString("openDt"));
//                    data.setSalesAcc(movieData.getString("salesAcc"));
//                    data.setSalesShare(movieData.getString("salesShare"));
//                    data.setAudiCnt(movieData.getString("audiCnt"));
//                    data.setAudiInten(movieData.getString("audiInten"));
//                    data.setAudiAcc(movieData.getString("audiAcc"));
//                    data.setScrnCnt(movieData.getString("scrnCnt"));
//                    data.setShowCnt(movieData.getString("showCnt"));
//
//                    movieDataList.add(data);
//                }
//                
//            } else {
//                System.err.println("API ��û ����: " + response.getStatusLine().getReasonPhrase());
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return movieDataList;
//       /* for (MovieData movieData : movieDataList) {
//            System.out.println("Rank: " + movieData.getRank());
//            System.out.println("Movie Name: " + movieData.getMovieNm());
//            System.out.println("Movie Code: " + movieData.getMovieCd());
//            // ... ������ �ʵ� ���
//        }*/
//    }
}



