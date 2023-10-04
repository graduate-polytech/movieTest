package KMDB;

import org.json.*;



//kmdb 반환값을 사용하기 쉽게 변환
public class Data_KMDB {
	public static void main(String[] args) {
		String jsonString = "{\"name\": \"John\", \"age\": 30, \"city\": \"New York\"}";
		Data_KMDB d = new Data_KMDB();
		JSONObject test = d.Data_Processing(jsonString);
	}
	public JSONObject Data_Processing(String data) {
		JSONObject resutl = new JSONObject();
		JSONArray array = new JSONArray();
		try {
            JSONObject jsonObject = new JSONObject(data);

            for (String key : jsonObject.keySet()) {
                Object value = jsonObject.get(key);
                System.out.println(key + " : " + value);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
		return resutl;
	}
}
