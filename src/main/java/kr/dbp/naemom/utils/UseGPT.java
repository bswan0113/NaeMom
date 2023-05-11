package kr.dbp.naemom.utils;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.HttpHeaders;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.dbp.naemom.vo.MemberVO;

public class UseGPT {

	private final static String url ="https://api.openai.com/v1/completions";
	private final static String apiKey ="Bearer " + new ApiKey().getGpt();
	
	public static String getAnswer(String ask, MemberVO user) {
	    if(user !=null)ask+="이 앞쪽은 우리 사이트 이용자의 문의 내역입니다. 이것은 해당 사용자의 주소입니다."+user.getMe_registered_address();
	    	return usegpt(ask);
	}
	
	public static String getAnswerForAdmin(String ask) {
		ask+="이것은 우리 사이트 이용자의 문의 내용입니다.";
	    	return usegpt(ask);
	}
	
	private static String usegpt(String ask) {
		String result="";
		try {
            HttpClient httpClient = HttpClients.createDefault();
            HttpPost request = new HttpPost(url);
            request.setHeader(HttpHeaders.AUTHORIZATION,apiKey);
            request.setHeader(HttpHeaders.CONTENT_TYPE, "application/json");
            
            ObjectMapper objectMapper = new ObjectMapper();
        	
	         // requestMap 생성
	         Map<String, Object> requestMap = new HashMap<String, Object>();
	         requestMap.put("prompt", ask);
	         requestMap.put("max_tokens", 1000);
	         requestMap.put("model", "text-davinci-003");
	
	         // requestMap을 JSON 문자열로 변환
	         String requestBody = objectMapper.writeValueAsString(requestMap);

            request.setEntity(new StringEntity(requestBody, "UTF-8"));
            HttpResponse response = httpClient.execute(request);
            HttpEntity responseEntity = response.getEntity();
            String jsonResponse= EntityUtils.toString(responseEntity, "UTF-8");
            JsonObject jsonObject = JsonParser.parseString(jsonResponse).getAsJsonObject();
            JsonArray choicesArray = jsonObject.get("choices").getAsJsonArray();
            JsonObject firstChoiceObject = choicesArray.get(0).getAsJsonObject();
            result += firstChoiceObject.get("text").getAsString();
            return result;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
	}

	

}
