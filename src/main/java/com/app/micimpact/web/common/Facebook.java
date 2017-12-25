package com.app.micimpact.web.common;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.*;
import org.apache.http.message.*;
import org.apache.http.util.EntityUtils;

public class Facebook {
    public static void main(String args[]) throws Exception {
    	 CloseableHttpClient httpClient = HttpClients.createDefault();
         HttpPost post = new HttpPost("");
         List<NameValuePair> params = new ArrayList<>();
         params.add(new BasicNameValuePair("task", "savemodel"));
         String link_info="{"+
                 "\"url\":\"https://developers.kakao.com/\","+
                 "\"requested_url\":\"http://bit.ly/1wwLqDl\","+
                 "\"host\":\"developers.kakao.com\","+
                 "\"title\":\"Kakao Developers_\","+
                 "\"image\":[\"http://dn-l1-story.kakao.co.kr/dn/bc995u/hydnh8wbKi/dz59YCCjyZSXNmDgTPpPa0/img.jpg?height=630&width=1200\"],"+
                 "\"description\":\"To make our dream of better world come true, Kakao now launch kakao app development platform service.\","+
                 "\"section\":\"\","+
                 "\"type\":\"website\""+
                "}";
         params.add(new BasicNameValuePair("link_info", link_info));
         CloseableHttpResponse response = null;
         Scanner in = null;
         try
         {
             post.setEntity(new UrlEncodedFormEntity(params));
             response = httpClient.execute(post);
             // System.out.println(response.getStatusLine());
             HttpEntity entity = response.getEntity();
             in = new Scanner(entity.getContent());
             while (in.hasNext())
             {
                 System.out.println(in.next());

             }
             EntityUtils.consume(entity);
         } finally
         {
             in.close();
             response.close();
         }
    }
}