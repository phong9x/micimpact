package com.app.micimpact.web.common;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
 
import org.springframework.security.crypto.codec.Base64;
import org.springframework.stereotype.Service;
 
/**
 * @author bchild
 *
 */

public class ObjectSerializer<T>{
 
 public String objectToString(Serializable object) {
  String encoded = null;
  
  try {
   ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
   ObjectOutputStream objectOutputStream = new ObjectOutputStream(byteArrayOutputStream);
   objectOutputStream.writeObject(object);
   objectOutputStream.close();
   encoded = new String(Base64.encode(byteArrayOutputStream.toByteArray()));
  } catch (IOException e) {
   e.printStackTrace();
  }
  return encoded;
 }
 
 @SuppressWarnings("unchecked")
 public <t extends Serializable>T stringToObject(String string, Class<t> clazz) {
  byte[] bytes = Base64.decode(string.getBytes());
  T object = null;
  try {
   ObjectInputStream objectInputStream = new ObjectInputStream( new ByteArrayInputStream(bytes) );
   object = (T)objectInputStream.readObject();
  } catch (IOException e) {
   e.printStackTrace();
  } catch (ClassNotFoundException e) {
   e.printStackTrace();
  } catch (ClassCastException e) {
   e.printStackTrace();
  }
  return object;
 }
 
}