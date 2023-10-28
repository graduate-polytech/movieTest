package Servlet;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

@WebServlet("/adminServlet")
public class AdminServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 클라이언트로부터 전송된 데이터 읽기
		request.setCharacterEncoding("UTF-8");
		BufferedReader reader = request.getReader();
		StringBuilder requestData = new StringBuilder();
		String line;
		while ((line = reader.readLine()) != null) {
			requestData.append(line);
		}

		// JSON 데이터 파싱
		JSONObject json = new JSONObject(requestData.toString());

		// 데이터 확인 및 MySQL DB에 추가하는 로직 수행
		String type = json.getString("type");
//		String userId = json.getString("userId");
//		String userPw = json.getString("userPw");
//		String userName = json.getString("userName");
//		String birthDay = json.getString("birthDay");
//		String userEmail = json.getString("userEmail");
//		String userAddress = json.getString("userAddress");
//		String genre_1 = json.getString("genre_1");
//		String genre_2 = json.getString("genre_2");
//		String genre_3 = json.getString("genre_3");
//		String genre_4 = json.getString("genre_4");
		
		System.out.println("관리자 서블렛 : " + type);

		JSONObject jsonResponse = new JSONObject();
		
		int result = 0;
		
		System.out.println("리뷰 작성 서블렛 : " + result);

		jsonResponse.put("result", result);

		// JSON 응답을 클라이언트로 전송
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonResponse.toString());
	}
}
