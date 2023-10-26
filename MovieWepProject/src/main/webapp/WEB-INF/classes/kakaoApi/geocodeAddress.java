package kakaoApi;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;


public class geocodeAddress {
	
	String apikey = "84469BB6-6E08-399F-9408-C587A010AAA1";
	String searchType = "parcel";
	String searchAddr = "경기도 고양시 일산동구 백석동 1242 번지 고양종합터미널 5~7F CGV 고양백석";
	String epsg = "epsg:4326";
	
	public static void main(String[] args) {
		new geocodeAddress();
	}
	
	public geocodeAddress() {
		StringBuilder sb = new StringBuilder("https://api.vworld.kr/req/address");
		sb.append("?service=address");
		sb.append("&request=getCoord");
		sb.append("&format=json");
		sb.append("&crs=" + epsg);
		sb.append("&key=" + apikey);
		sb.append("&type=" + searchType);
		sb.append("&address=" + URLEncoder.encode(searchAddr, StandardCharsets.UTF_8));

		try{
		    URL url = new URL(sb.toString());
		    BufferedReader reader = new BufferedReader(new InputStreamReader(url.openStream(), StandardCharsets.UTF_8));

		    JSONParser jspa = new JSONParser();
		    JSONObject jsob = (JSONObject) jspa.parse(reader);
		    System.out.println(jsob.toString());
		    JSONObject jsrs = (JSONObject) jsob.get("response");
		    JSONObject jsResult = (JSONObject) jsrs.get("result");
		    JSONObject jspoitn = (JSONObject) jsResult.get("point");

		    System.out.println(jspoitn.get("x"));//사용시 반대로 사용
		    System.out.println(jspoitn.get("y"));
		} catch (IOException | ParseException e) {
		    throw new RuntimeException(e);
		}
	}
}
