package Json;

import org.json.JSONArray;
import org.json.JSONObject;

import KMDB.KMDBTest;

import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class NestedJSONToHashMap {
    public static void main(String[] args) {
        // 예제 JSON 데이터
//    	Call_Kofic_Api c = new Call_Kofic_Api();
//    	String jsonData = c.getJsonData('D',"20230901");

    	KMDBTest d = new KMDBTest();
        String jsonData = d.getJsonData_KMDB();
     // JSON 문자열을 JSONObject로 파싱
        JSONObject jsonObject = new JSONObject(jsonData);

        // JSONObject를 해시맵으로 변환
        Map<String, Object> hashMap = jsonToMap(jsonObject);

        // 해시맵 데이터 출력
        printHashMap(hashMap, "");
    }
    public static void printHobbies(Map<String, Object> hashMap) {
        // "hobbies" 키에 해당하는 값을 가져옴
        Object hobbies = hashMap.get("Data");

        if (hobbies instanceof List) {
            // 값이 리스트인 경우, 리스트 내용 출력
            List<Object> hobbiesList = (List<Object>) hobbies;
            System.out.println("Hobbies:");

            for (Object hobby : hobbiesList) {
                if (hobby instanceof Map) {
                    // 리스트 내의 값이 해시맵인 경우, 해시맵 내용 출력
                    Map<String, Object> hobbyMap = (Map<String, Object>) hobby;
                    for (Map.Entry<String, Object> entry : hobbyMap.entrySet()) {
                        System.out.println(entry.getKey() + ": " + entry.getValue());
                    }
                }
            }
        }
    }
    public static Map<String, Object> jsonToMap(JSONObject jsonObject) {
        Map<String, Object> map = new HashMap<>();

        // JSONObject의 모든 키를 반복하면서 값을 해시맵에 추가
        for (String key : jsonObject.keySet()) {
            Object value = jsonObject.get(key);

            if (value instanceof JSONObject) {
                // 값이 JSONObject인 경우, 재귀적으로 처리
                map.put(key, jsonToMap((JSONObject) value));
            } else if (value instanceof JSONArray) {
                // 값이 JSONArray인 경우, 각 항목을 리스트로 변환
                map.put(key, jsonArrayToList((JSONArray) value));
            } else {
                // 다른 타입의 값인 경우 그대로 추가
                map.put(key, value);
            }
        }

        return map;
    }

    public static List<Object> jsonArrayToList(JSONArray jsonArray) {
        // JSONArray를 리스트로 변환
        List<Object> list = new ArrayList<>();

        for (int i = 0; i < jsonArray.length(); i++) {
            Object value = jsonArray.get(i);

            if (value instanceof JSONObject) {
                // 값이 JSONObject인 경우, 재귀적으로 처리
                list.add(jsonToMap((JSONObject) value));
            } else if (value instanceof JSONArray) {
                // 값이 JSONArray인 경우, 재귀적으로 처리
                list.add(jsonArrayToList((JSONArray) value));
            } else {
                // 다른 타입의 값인 경우 그대로 추가
                list.add(value);
            }
        }

        return list;
    }

    public static void printHashMap(Map<String, Object> hashMap, String prefix) {
        for (Map.Entry<String, Object> entry : hashMap.entrySet()) {
            String key = entry.getKey();
            Object value = entry.getValue();

            if (value instanceof Map) {
                // 값이 해시맵인 경우, 재귀적으로 출력
                printHashMap((Map<String, Object>) value, prefix + key + ".");
            } else if (value instanceof List) {
                // 값이 리스트인 경우, 재귀적으로 출력
                printList((List<Object>) value, prefix + key + ".");
            } else {
                // 다른 타입의 값인 경우, 키와 값 출력
                System.out.println(prefix + key + ": " + value);
            }
        }
    }

    public static void printList(List<Object> list, String prefix) {
        for (int i = 0; i < list.size(); i++) {
            Object value = list.get(i);

            if (value instanceof Map) {
                // 값이 해시맵인 경우, 재귀적으로 출력
                printHashMap((Map<String, Object>) value, prefix + "[" + i + "].");
            } else if (value instanceof List) {
                // 값이 리스트인 경우, 재귀적으로 출력
                printList((List<Object>) value, prefix + "[" + i + "].");
            } else {
                // 다른 타입의 값인 경우, 인덱스와 값 출력
                System.out.println(prefix + "[" + i + "]: " + value);
            }
        }
    }
}
