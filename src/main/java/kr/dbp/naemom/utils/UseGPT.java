package kr.dbp.naemom.utils;

import java.io.IOException;

import org.apache.http.HttpEntity;
import org.apache.http.HttpHeaders;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.dbp.naemom.vo.MemberVO;

public class UseGPT {

	public static String getAnswer(String ask, MemberVO user) {
		ask+="i live in korea";
		String apiKey = new ApiKey().getGpt();
	    String result ="";
	    if(user !=null) {
	    	ask+=" "+user.getMe_registered_address();
	    }
	            try {
	                HttpClient httpClient = HttpClients.createDefault();
	                HttpPost request = new HttpPost("https://api.openai.com/v1/completions");
	                request.setHeader(HttpHeaders.AUTHORIZATION, "Bearer " + apiKey);
	                request.setHeader(HttpHeaders.CONTENT_TYPE, "application/json");

	                String requestBody = "{\"prompt\": \"" + ask + "\", \"max_tokens\": 50, \"model\": \"text-davinci-003\"}";
	                request.setEntity(new StringEntity(requestBody, "UTF-8"));

	                HttpResponse response = httpClient.execute(request);
	                HttpEntity responseEntity = response.getEntity();


	                String jsonResponse= EntityUtils.toString(responseEntity, "UTF-8");
	                JsonObject jsonObject = JsonParser.parseString(jsonResponse).getAsJsonObject();
	                JsonArray choicesArray = jsonObject.get("choices").getAsJsonArray();
	                JsonObject firstChoiceObject = choicesArray.get(0).getAsJsonObject();
	                result += firstChoiceObject.get("text").getAsString();
	                System.out.println(result);
	                return result;
	            } catch (IOException e) {
	                e.printStackTrace();
	                return null;
	    }
	}

}
