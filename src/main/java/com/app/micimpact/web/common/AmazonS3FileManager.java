package com.app.micimpact.web.common;

import java.io.File;
import java.io.InputStream;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.beans.factory.annotation.Value;

import com.amazonaws.AmazonClientException;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.GetObjectRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectInputStream;

@Configurable
public class AmazonS3FileManager {
	private AWSCredentials credentials;
	private AmazonS3 s3;
	
	private String AWS_BUCKET_NAME;

	
	public AmazonS3FileManager(String bucketName, String accessKey, String secretKey){
//		credentials = new ProfileCredentialsProvider().getCredentials(); 
		AWS_BUCKET_NAME = bucketName;
		credentials = new BasicAWSCredentials(accessKey, secretKey);
		s3 = new AmazonS3Client(credentials);
	}
	
	public boolean upload(String key, File mFile) {
		try {
			System.out.println("AmazonS3 Uploading a new object to S3 from a file\n");
			s3.putObject(new PutObjectRequest(AWS_BUCKET_NAME, key, mFile));

			return true;
		} catch (AmazonServiceException ase) {
	            System.out.println("Caught an AmazonServiceException, which means your request made it "
	                    + "to Amazon S3, but was rejected with an error response for some reason.");
	            System.out.println("Error Message:    " + ase.getMessage());
	            System.out.println("HTTP Status Code: " + ase.getStatusCode());
	            System.out.println("AWS Error Code:   " + ase.getErrorCode());
	            System.out.println("Error Type:       " + ase.getErrorType());
	            System.out.println("Request ID:       " + ase.getRequestId());
		} catch (AmazonClientException ace) {
	            System.out.println("Caught an AmazonClientException, which means the client encountered "
	                    + "a serious internal problem while trying to communicate with S3, "
	                    + "such as not being able to access the network.");
	            System.out.println("Error Message: " + ace.getMessage());
		}
		return false;
	}
	
	public boolean upload(String key, InputStream inputStream, ObjectMetadata metadata) {
		try {
			System.out.println("AmazonS3 Uploading a new object to S3 from a file\n");
			s3.putObject(new PutObjectRequest(AWS_BUCKET_NAME, key, inputStream, metadata));

			return true;
		} catch (AmazonServiceException ase) {
	            System.out.println("Caught an AmazonServiceException, which means your request made it "
	                    + "to Amazon S3, but was rejected with an error response for some reason.");
	            System.out.println("Error Message:    " + ase.getMessage());
	            System.out.println("HTTP Status Code: " + ase.getStatusCode());
	            System.out.println("AWS Error Code:   " + ase.getErrorCode());
	            System.out.println("Error Type:       " + ase.getErrorType());
	            System.out.println("Request ID:       " + ase.getRequestId());
		} catch (AmazonClientException ace) {
	            System.out.println("Caught an AmazonClientException, which means the client encountered "
	                    + "a serious internal problem while trying to communicate with S3, "
	                    + "such as not being able to access the network.");
	            System.out.println("Error Message: " + ace.getMessage());
		}catch (Exception e) {
			System.out.println("Eception upload Amazon: "+ e);
		}
		return false;
	}
	
	public S3ObjectInputStream download(String key) {
		 try {
			 System.out.println("AmazonS3 Downloading an object");
	         S3Object object = s3.getObject(new GetObjectRequest(AWS_BUCKET_NAME, key));
	         System.out.println("Content-Type: "  + object.getObjectMetadata().getContentType());
	         return object.getObjectContent();
	         
		 } catch (AmazonServiceException ase) {
	            System.out.println("Caught an AmazonServiceException, which means your request made it "
	                    + "to Amazon S3, but was rejected with an error response for some reason.");
	            System.out.println("Error Message:    " + ase.getMessage());
	            System.out.println("HTTP Status Code: " + ase.getStatusCode());
	            System.out.println("AWS Error Code:   " + ase.getErrorCode());
	            System.out.println("Error Type:       " + ase.getErrorType());
	            System.out.println("Request ID:       " + ase.getRequestId());
	     } catch (AmazonClientException ace) {
	            System.out.println("Caught an AmazonClientException, which means the client encountered "
	                    + "a serious internal problem while trying to communicate with S3, "
	                    + "such as not being able to access the network.");
	            System.out.println("Error Message: " + ace.getMessage());
	     }
		 
		return null;
	}
	
	public boolean delete(String key) {

		 try {
			 System.out.println("Deleting an object\n");
	         s3.deleteObject(AWS_BUCKET_NAME, key);
			 return true;
		 } catch (AmazonServiceException ase) {
	            System.out.println("Caught an AmazonServiceException, which means your request made it "
	                    + "to Amazon S3, but was rejected with an error response for some reason.");
	            System.out.println("Error Message:    " + ase.getMessage());
	            System.out.println("HTTP Status Code: " + ase.getStatusCode());
	            System.out.println("AWS Error Code:   " + ase.getErrorCode());
	            System.out.println("Error Type:       " + ase.getErrorType());
	            System.out.println("Request ID:       " + ase.getRequestId());
	     } catch (AmazonClientException ace) {
	            System.out.println("Caught an AmazonClientException, which means the client encountered "
	                    + "a serious internal problem while trying to communicate with S3, "
	                    + "such as not being able to access the network.");
	            System.out.println("Error Message: " + ace.getMessage());
	     }
		return false;
	}
}
