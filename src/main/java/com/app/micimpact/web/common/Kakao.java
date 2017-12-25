package com.app.micimpact.web.common;
import javax.net.ssl.HttpsURLConnection;

import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

public class Kakao {

    private final static String STORY_UPLOAD_MULTI_URL
            = "https://kapi.kakao.com/v1/api/story/post/link";

    //private final static String ACCESS_TOKEN = "yBmJFOO0ar8Iv-JqVweW9htHpH-_kFypgR4j-awQQHYAAAFTopMMFQ";

    public static void main(String[] args) throws ParseException, Exception {
        //String uploadedImageUrlList = post_kakao("Success!","http://micimpact.outsourcing-org.com/share/sys_1/50", "http://micimpact.outsourcing-org.com/share/sys_1/50", "micimpact.com", "micimpact","Xgg4n5jWjnoukbxjEt41WpcqjsRDFf1GFHtcNKwQQI4AAAFTpu3Lmw");

        //System.out.println(getHTML("http://micimpact.outsourcing-org.com/share/sys_1/5"));
    	//String access_token="3hxQ6WlnPo39W5lSiKBC7SYDjuXvDBifmz2Nj6wQQI0AAAFUf74LwA";
    	String access_token="IUKzt7Y-8ktcZTZpmRSy0NFdv_OlQXULyLe55KwQQjMAAAFUnZYugg";
        //System.out.println(getUnixId_ByAccessToken(access_token));
    }
    private static String getQuery(List<NameValuePair> params) throws UnsupportedEncodingException
    {
        StringBuilder result = new StringBuilder();
        boolean first = true;

        for (NameValuePair pair : params)
        {
            if (first)
                first = false;
            else
                result.append("&");

            result.append(URLEncoder.encode(pair.getName(), "UTF-8"));
            result.append("=");
            result.append(URLEncoder.encode(pair.getValue(), "UTF-8"));
        }

        return result.toString();
    }

    public static String post_kakao(String content,String url_link,String requested_url,String title,String description, String access_token) throws ParseException, Exception {

        String CRLF = "\r\n";
        String TWO_HYPHENS = "--";
        String BOUNDARY = "---------------------------012345678901234567890123456";
        HttpsURLConnection conn = null;
        DataOutputStream dos = null;
        // Request
        try {
//        	String url_link = "https://developers.kakao.com/";
//            String requested_url = "http://bit.ly/1wwLqDl";
           
//            String title = "Kakao Developers";
//            String image = "http://dn-l1-story.kakao.co.kr/dn/bc995u/hydnh8wbKi/dz59YCCjyZSXNmDgTPpPa0/img.jpg?height=630&width=1200";
//            String description = "To make our dream of better world come true, Kakao now launch kakao app development platform service.";
        	String host = "developers.kakao.com";
            String section = "";
            String type = "website";
            URL url = new URL(STORY_UPLOAD_MULTI_URL);
            conn = (HttpsURLConnection) url.openConnection();
            conn.setDoInput(true);
            conn.setDoOutput(true);
            conn.setUseCaches(false);
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
            conn.setRequestProperty("Authorization", "Bearer " + access_token);
            JSONParser parser = new JSONParser();
            JSONObject json = (JSONObject) parser.parse(getHTML(requested_url,access_token));
            System.out.println(json.get("image"));
            JSONObject link_info   = new JSONObject();
            link_info.put("url", url_link);
            link_info.put("requested_url", requested_url);
            link_info.put("host", host);
            link_info.put("title", title);
            link_info.put("image", json.get("image"));
            link_info.put("description", description);
            link_info.put("section", section);
            link_info.put("type", type);
            System.out.println(">>>>>>>>>>>"+link_info.toJSONString());
            List<NameValuePair> params = new ArrayList<NameValuePair>();
            params.add(new BasicNameValuePair("link_info", link_info.toJSONString()));
            params.add(new BasicNameValuePair("content", content));
            OutputStream os = conn.getOutputStream();
            BufferedWriter writer = new BufferedWriter(
                    new OutputStreamWriter(os, "UTF-8"));
            writer.write(getQuery(params));
            writer.flush();
            writer.close();
            os.close();
        } catch (MalformedURLException ex) {
            ex.printStackTrace();
        } catch (IOException ioe) {
            ioe.printStackTrace();
        } finally {
            if (dos != null) try { dos.close(); } catch (IOException ignore) { }
        }

        // Response
        InputStream inputStream = null;
        BufferedReader reader = null;
        try {
        	int status = conn.getResponseCode();
        	System.out.println(status);
        	inputStream = new BufferedInputStream(conn.getInputStream());
            reader = new BufferedReader(new InputStreamReader(inputStream));
            String line;
            StringBuilder builder = new StringBuilder();
            while ((line = reader.readLine()) != null) {
                builder.append(line).append("\n");
            }
            reader.close();
            return builder.toString();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try { reader.close(); } catch (IOException ignore) {}
            }
            if (inputStream != null) {
                try { inputStream.close(); } catch (IOException ignore) {}
            }
            conn.disconnect();
        }

        return null;
    }
    
    public static String getHTML(String link, String access_token) throws Exception {
        StringBuilder result = new StringBuilder();
        URL url = new URL("https://kapi.kakao.com/v1/api/story/linkinfo?url="+link);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setDoInput(true);
        conn.setDoOutput(true);
        conn.setUseCaches(false);
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
        conn.setRequestProperty("Authorization", "Bearer " + access_token);
        conn.setRequestMethod("GET");
        BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        String line;
        while ((line = rd.readLine()) != null) {
           result.append(line);
        }
        rd.close();
        return result.toString();
     }
    
    
    public  String getUnixId_ByAccessToken(String access_token) throws Exception {
    	 StringBuilder result = new StringBuilder();
         URL url = new URL("https://kapi.kakao.com/v1/user/me");
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
         return json.get("id").toString();
     }
    
    
}
