package com.app.micimpact.web.common;
import java.io.*;
import java.net.*;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;


public class Naver {
   public  String getIdNaver(String access_token) throws Exception {
      StringBuilder result = new StringBuilder();
      URL url = new URL("https://openapi.naver.com/v1/nid/me");
      HttpURLConnection conn = (HttpURLConnection) url.openConnection();
      conn.setDoInput(true);
      conn.setDoOutput(true);
      conn.setUseCaches(false);
      conn.setRequestProperty("User-Agent", "curl / 7.43.0");
      conn.setRequestProperty("Accept", "*/*");
      conn.setRequestProperty("Content-Type", "application/xml");
      conn.setRequestProperty("Authorization", "Bearer " + access_token);
      conn.setRequestMethod("GET");
      BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
      String line;
      while ((line = rd.readLine()) != null) {
         result.append(line);
      }
      rd.close();
      JSONParser parser = new JSONParser();
      JSONObject json = (JSONObject) parser.parse(result.toString());
      JSONObject json2 = (JSONObject)json.get("response");
      return json2.get("id").toString();
   }

   public static void main(String[] args) throws Exception
   {
	 //String access_token="AAAAON0Qu2ht2HLmSwjK2WyrYocBqXkAx1md7jbNNaxCKTZ0H7uO5nSdGIZo075hAyY0BfNw7Z3tv4igbIsMBUlRyBI=";
     //System.out.println(getIdNaver(access_token));
   }
}