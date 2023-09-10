package boxOffice;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Iterator;
import java.util.Set;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class Call_Kofic_Api {

	public String getJsonData_Kofic(char Day_Week/*D or W*/,String Date) {
		String result = "";
		try {
			URL url = new URL(call(Day_Week, Date));
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	
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
	
	        result = sb.toString();
		}
		catch(IOException e) {
			result = "IOException";
		} catch(Exception e) {
			result = "Exception";
		}
		return result;
	}
	public static void main(String[] args) throws IOException {
		Call_Kofic_Api c = new Call_Kofic_Api();
		URL url = new URL(c.call('W', "20230903"));
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");

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

        // JSON 파싱

        // 출력
        System.out.println(responseJson);
        
        JSONParser parser = new JSONParser();
		try
		{
			//파싱할 문자열 지정 후 json object로 형변환 
			JSONObject obj = (JSONObject)parser.parse(responseJson);
	        System.out.println(obj.get("boxOfficeResult").toString());
			
			// 몇개의 오브젝트가 들어있는가?
			System.out.println("오브젝트의 갯수 : "+obj.size());
			
			// key set 받아오기 
			Set key = obj.keySet();
			
			// Iterator 설정
			Iterator<String> iter = key.iterator();

//	        System.out.println(obj.get("TotalCount"));
			// 각각 키 값 출력
			while(iter.hasNext())
			{
				String keyname = iter.next();
				Object result = obj.get(keyname);
				
				if(obj.get(keyname) instanceof JSONObject) {
					System.out.print("JSONObject : ");
				} else if (result instanceof org.json.simple.JSONArray){
					org.json.simple.JSONArray jsonArray = (org.json.simple.JSONArray)result;
					result = jsonArray.get(0);
					System.out.print("JSONArray[" + jsonArray.size() + "] : ");
				} else {
					System.out.print(result.getClass() + " : ");
				}
				System.out.println("key : "+keyname + "\t\tvalue : "+result);
			}
		}
		catch (ParseException e)
		{
			e.printStackTrace();
		}catch (Exception e)
		{
			e.printStackTrace();
		}

	}
	
	public static String Condition(String Key,String value) throws IOException {

		return ("&" + URLEncoder.encode(Key,"UTF-8") + "=" + URLEncoder.encode(value,"UTF-8"));
    }
	//recursion
	
	public String call(char Day_Week/*D or W*/,String Date) {
		String result = "";
		String Url = "";
		try {
			Url = getApiUrl(Day_Week,Date);
			result = Url;
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		return result;
	}
	public String getApiUrl(char Day_Week/*D or W*/,String Date) throws IOException {
		String result = "";
		String Url = "";
		if(Day_Week == 'd' || Day_Week == 'D') Url = "https://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?";
		else Url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.json?";
		StringBuilder urlBuilder = new StringBuilder(Url);
		urlBuilder.append(Condition("key","9cbf70ef669df368261f74e63c81b28c"));
        urlBuilder.append(Condition("targetDt",Date));
        result = urlBuilder.toString();
		return result;
	}

}
