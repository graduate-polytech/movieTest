package KMDB;

import java.io.*;
import java.net.*;
import java.util.*;

import org.json.simple.*;
import org.json.simple.parser.*;

public class LoadKMDBData {
	private static final String API_KEY = "B40IP5NLA4A22KX077TM";
	private static final String api_url = "https://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&detail=Y&ServiceKey=" + API_KEY;
	
	long totalCount;
	long count;
	ArrayList<KMDB_Data> KMDB_DataList = null;

	LoadKMDBData() {
		
//		KMDB_DataList = getKMDB_movieSeq("55873");	//아이디로 검새
		KMDB_DataList = getKMDB_title("타짜");	//제목으로 검색
//		KMDB_DataList = getKMDB_director("55873");	//감독으로 검색
//		KMDB_DataList = getKMDB_titleDirector("55873","");	//제목과 감독으로 검색
		
		if(KMDB_DataList!=null && KMDB_DataList.size()>0) {
			for(KMDB_Data data : KMDB_DataList) {
				System.out.println("[" +data.getMovieSeq()+ "] 제목: " + data.getTitle());
			}
		}
		
	}

	public static void main(String[] args) {
		new LoadKMDBData();
	}

	public String Condition(String Key, String value) {

		try {
			return ("&" + URLEncoder.encode(Key, "UTF-8") + "=" + URLEncoder.encode(value, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return "";
		}
	}

	public ArrayList<KMDB_Data> getKMDB_movieSeq(String movieSeq) {
		
		StringBuilder urlBuilder = new StringBuilder(api_url);
		urlBuilder.append(Condition("movieSeq", movieSeq));

		return loadApi(urlBuilder);

	}
	public ArrayList<KMDB_Data> getKMDB_title(String title) {
		
		StringBuilder urlBuilder = new StringBuilder(api_url);
		urlBuilder.append(Condition("title", title));

		return loadApi(urlBuilder);

	}
	public ArrayList<KMDB_Data> getKMDB_director(String director) {
		
		StringBuilder urlBuilder = new StringBuilder(api_url);
		urlBuilder.append(Condition("director", director));

		return loadApi(urlBuilder);

	}
	public ArrayList<KMDB_Data> getKMDB_titleDirector(String title,String director) {
		
		StringBuilder urlBuilder = new StringBuilder(api_url);
		urlBuilder.append(Condition("title", title));
		urlBuilder.append(Condition("director", director));

		return loadApi(urlBuilder);

	}

	public ArrayList<KMDB_Data> loadApi(StringBuilder urlBuilder) {
		ArrayList<KMDB_Data> result = new ArrayList<KMDB_Data>();
		try {
			// System.out.println("전체 URL : " + urlBuilder.toString());

			URL url = new URL(urlBuilder.toString());
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
			result = changeJsonData(responseJson);

		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return result;
	}

	public ArrayList<KMDB_Data> changeJsonData(String jsonData) {
		
		ArrayList<KMDB_Data> resultData = new ArrayList<KMDB_Data>();
		
		try {
			JSONParser parser = new JSONParser();

			JSONObject obj = (JSONObject) parser.parse(jsonData);	//에러 발생

			org.json.simple.JSONArray dataArray = (org.json.simple.JSONArray) obj.get("Data");
			long totalCount = (long)obj.get("TotalCount");
			if(totalCount == 0) {
				//KMDB_DataList = null;
				System.out.println("데이터가 없습니다.");
				return null;
			}
			
			JSONObject kmdbData = (JSONObject) dataArray.get(0);

			org.json.simple.JSONArray resultArray = (org.json.simple.JSONArray) kmdbData.get("Result");

			totalCount = (long) kmdbData.get("TotalCount");
			
			count = (long) kmdbData.get("Count");

			for (Object resultObj : resultArray) {

				JSONObject result = (JSONObject) resultObj;

				KMDB_Data kmdb = new KMDB_Data();

				kmdb.setDirectors(result);
				kmdb.setActors(result);
				kmdb.setPlots(result);
				kmdb.setRatings(result);
				kmdb.setStaffs(result);
				kmdb.setVods(result);

				kmdb.setALIAS((String) result.get("ALIAS"));
				kmdb.setAudiAcc((String) result.get("audiAcc"));
				kmdb.setAwards1((String) result.get("Awards1"));
				kmdb.setAwards2((String) result.get("Awards2"));
				kmdb.setCompany((String) result.get("company"));
				kmdb.setDOCID((String) result.get("DOCID"));
				kmdb.setEpisodes((String) result.get("episodes"));
				kmdb.setfLocation((String) result.get("fLocation"));
				kmdb.setGenre((String) result.get("genre"));
				kmdb.setKeywords((String) result.get("keywords"));
				kmdb.setKmdbUrl((String) result.get("kmdbUrl"));
				kmdb.setModDate((String) result.get("modDate"));
				kmdb.setMovieId((String) result.get("movieId"));
				kmdb.setMovieSeq((String) result.get("movieSeq")); // 영화 아이디
				kmdb.setNation((String) result.get("nation"));
				kmdb.setOpenThtr((String) result.get("openThtr"));
				kmdb.setPosters((String) result.get("posters"));
				kmdb.setProdYear((String) result.get("prodYear"));
				kmdb.setRatedYn((String) result.get("ratedYn"));
				kmdb.setRating((String) result.get("rating"));
				kmdb.setRegDate((String) result.get("regDate"));
				kmdb.setRepRatDate((String) result.get("repRatDate"));
				kmdb.setRepRlsDate((String) result.get("repRlsDate"));
				kmdb.setRuntime((String) result.get("runtime"));
				kmdb.setSalesAcc((String) result.get("salesAcc"));
				kmdb.setScreenArea((String) result.get("screenArea"));
				kmdb.setScreenCnt((String) result.get("screenCnt"));
				kmdb.setSoundtrack((String) result.get("soundtrack"));
				kmdb.setStatDate((String) result.get("statDate"));
				kmdb.setStatSouce((String) result.get("statSouce"));
				kmdb.setStlls((String) result.get("stlls"));
				kmdb.setThemeSong((String) result.get("themeSong"));
				kmdb.setTitle((String) result.get("title"));
				kmdb.setTitleEng((String) result.get("titleEng"));
				kmdb.setTitleEtc((String) result.get("titleEtc"));
				kmdb.setTitleOrg((String) result.get("titleOrg"));
				kmdb.setType((String) result.get("type"));
				kmdb.setUse((String) result.get("use"));
				
				//System.out.println(kmdb.getTitle());
				
//				String[] posters = kmdb.getStlls();
//				for(String str : posters) {
//					System.out.println(str);
//				}
				
				resultData.add(kmdb);
			}
		} catch (Exception e) {
			System.err.println("에러 발생 : " + e);
			e.printStackTrace();
		}
		return resultData;
	}

}
