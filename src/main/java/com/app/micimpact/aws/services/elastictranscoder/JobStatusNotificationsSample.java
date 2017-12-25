package com.app.micimpact.aws.services.elastictranscoder;

import java.util.ArrayList;
import java.util.List;

import com.amazonaws.ClientConfiguration;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Region;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.elastictranscoder.AmazonElasticTranscoder;
import com.amazonaws.services.elastictranscoder.AmazonElasticTranscoderClient;
import com.amazonaws.services.elastictranscoder.model.CreateJobOutput;
import com.amazonaws.services.elastictranscoder.model.CreateJobRequest;
import com.amazonaws.services.elastictranscoder.model.Job;
import com.amazonaws.services.elastictranscoder.model.JobInput;
import com.amazonaws.services.elastictranscoder.model.JobOutput;
import com.amazonaws.services.elastictranscoder.model.ListJobsByPipelineRequest;
import com.amazonaws.services.elastictranscoder.model.ListJobsByPipelineResult;
import com.amazonaws.services.sqs.AmazonSQS;
import com.amazonaws.services.sqs.AmazonSQSClient;
import com.app.micimpact.aws.services.elastictranscoder.utils.TranscoderSampleUtilities;


/**
 * The purpose of this sample is to show how job status notifications can be
 * used to receive job status updates using an event-driven model.  Using
 * notifications allows you to track job status of transcoding jobs in a
 * scalable fashion.
 * 
 * Note that this implementation will not scale to multiple machines because
 * the provided JobStatusNotificationHandler is looking for a specific job ID.
 * If there are multiple machines polling SQS for notifications, there is no
 * guarantee that a particular machine will receive a particular notification.
 * 
 * More information about notifications can be found in the Elastic Transcoder
 * documentation:
 * http://docs.aws.amazon.com/elastictranscoder/latest/developerguide/notifications.html
 */
public class JobStatusNotificationsSample {

    // This is the ID of the Elastic Transcoder pipeline that was created when
    // setting up your AWS environment:
    // http://docs.aws.amazon.com/elastictranscoder/latest/developerguide/sample-code.html#java-pipeline
    private static final String PIPELINE_ID = "1451981513774-7p5iaq";

    // This is the URL of the SQS queue that was created when setting up your
    // AWS environment.
    // http://docs.aws.amazon.com/elastictranscoder/latest/developerguide/sample-code.html#java-sqs
    private static final String SQS_QUEUE_URL = "https://sqs.ap-northeast-1.amazonaws.com/189741064361/micimpact-q";
    
    private static final String ACCESS_KEY = "AKIAIPP4VEHEEFTRTLVA";
    private static final String SECRET_KEY = "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";
    private static final String SEGMENT_DURATION = "10";
    
    // This will generate a 480p 16:9 mp4 output.
    //private static final String PRESET_ID = "1351620000001-000020";
    private static final String HLS_64K_AUDIO_PRESET_ID = "1351620000001-200071";
    private static final String HLS_0400K_PRESET_ID     = "1351620000001-200050";
    private static final String HLS_0600K_PRESET_ID     = "1351620000001-200040";
    private static final String HLS_1000K_PRESET_ID     = "1351620000001-200030";
    private static final String HLS_1500K_PRESET_ID     = "1351620000001-200020";
    private static final String HLS_2000K_PRESET_ID     = "1351620000001-200010";
    
    // Clients are built using the default credentials provider chain.  This
    // will attempt to get your credentials in the following order:
    //      1. Environment variables (AWS_ACCESS_KEY and AWS_SECRET_KEY).
    //      2. Java system properties (AwsCredentials.properties).
    //      3. Instance profile credentials on EC2 instances.
    private static final AmazonSQS amazonSqs = new AmazonSQSClient();
    //private static final AmazonElasticTranscoder amazonElasticTranscoder = new AmazonElasticTranscoderClient();
    
//    public static void main(String[] args) throws Exception {
//        
//        // Setup our notification worker.
//        SqsQueueNotificationWorker sqsQueueNotificationWorker = new SqsQueueNotificationWorker(amazonSqs, SQS_QUEUE_URL);
//        Thread notificationThread = new Thread(sqsQueueNotificationWorker);
//        notificationThread.start();
//        
//        // Create a job in Elastic Transcoder.
//        String jobId = createElasticTranscoderJob("input_test");
//        
//        // Wait for the job we created to complete.
//        System.out.println("Waiting for job to complete: " + jobId);
//        waitForJobToComplete(jobId, sqsQueueNotificationWorker);
//    }
    
    /**
     * Creates a job in Elastic Transcoder using the configured pipeline, input
     * key, preset, and output key prefix.
     * @return Job ID of the job that was created in Elastic Transcoder.
     * @throws Exception
     */
    public static String createElasticTranscoderJob(String INPUT_KEY, String OUTPUT_KEY_PREFIX) throws Exception {
    	

    	AmazonElasticTranscoder amazonElasticTranscoder = new AmazonElasticTranscoderClient(new BasicAWSCredentials(ACCESS_KEY, SECRET_KEY));
    	amazonElasticTranscoder.setRegion(Region.getRegion(Regions.fromName("ap-northeast-1")));
    	
    	//com.amazonaws.regions.Region e = new com.amazonaws.regions.Region("ap-northeast-1", "elastictranscoder.ap-northeast-1.amazonaws.com");
    	
    	// Setup the job input using the provided input key.
        JobInput input = new JobInput()
            .withKey(INPUT_KEY);
        
        // Setup the job output using the provided input key to generate an output key.
        List<CreateJobOutput> outputs = new ArrayList<CreateJobOutput>();
        CreateJobOutput output = new CreateJobOutput()
            .withKey(TranscoderSampleUtilities.inputKeyToOutputKey(INPUT_KEY))
            .withPresetId(HLS_1000K_PRESET_ID)
            .withSegmentDuration(SEGMENT_DURATION);
        	
        outputs.add(output);
        
        // Create a job on the specified pipeline and return the job ID.
        CreateJobRequest createJobRequest = new CreateJobRequest()
            .withPipelineId(PIPELINE_ID)
            .withOutputKeyPrefix(OUTPUT_KEY_PREFIX)
            .withInput(input)
            .withOutputs(outputs);
        	
        
        return amazonElasticTranscoder.createJob(createJobRequest).getJob().getId();
    }
    
    
    public static List<Job> getElasticTranscoderJob() throws Exception {
    	 AmazonElasticTranscoder amazonElasticTranscoder = new AmazonElasticTranscoderClient(new BasicAWSCredentials(ACCESS_KEY, SECRET_KEY));
    	 amazonElasticTranscoder.setRegion(Region.getRegion(Regions.fromName("ap-northeast-1")));
    	 
		 ListJobsByPipelineRequest listJobsByPipelineRequest = new ListJobsByPipelineRequest();
	     listJobsByPipelineRequest.setPipelineId(PIPELINE_ID);
	     ListJobsByPipelineResult listJobsByPipelineResult = amazonElasticTranscoder.listJobsByPipeline(listJobsByPipelineRequest);
	     List<Job> jobs = listJobsByPipelineResult.getJobs();
//	     for(Job job : jobs){
//	         System.out.println("  Id : "+job.getId());
//	         JobInput jobInput = job.getInput();
//	         System.out.println("    JobInput");
//	         System.out.println("      AspectRatio : "+jobInput.getAspectRatio());
//	         System.out.println("      Container : "+jobInput.getContainer());
//	         System.out.println("      FrameRate : "+jobInput.getFrameRate());
//	         System.out.println("      Key : "+jobInput.getKey());
//	         System.out.println("      Resolution : "+jobInput.getResolution());
//	         JobOutput jobOutput = job.getOutput();
//	         System.out.println("    JobOutput");
//	         System.out.println("      Key : "+jobOutput.getKey());
//	         System.out.println("      PresetId : "+jobOutput.getPresetId());
//	         System.out.println("      Status : "+jobOutput.getStatus());
//	         System.out.println("      StatusDetail : "+jobOutput.getStatusDetail());  
//	     }
        
        return jobs;
    }

    /**
     * Waits for the specified job to complete by adding a handler to the SQS
     * notification worker that is polling for status updates.  This method
     * will block until the specified job completes.
     * @param jobId
     * @param sqsQueueNotificationWorker
     * @throws InterruptedException
     */
    /*
    private static void waitForJobToComplete(final String jobId, SqsQueueNotificationWorker sqsQueueNotificationWorker) throws InterruptedException {
        
        // Create a handler that will wait for this specific job to complete.
        JobStatusNotificationHandler handler = new JobStatusNotificationHandler() {
            
            @Override
            public void handle(JobStatusNotification jobStatusNotification) {
                if (jobStatusNotification.getJobId().equals(jobId)) {
                    System.out.println(jobStatusNotification);
                    
                    if (jobStatusNotification.getState().isTerminalState()) {
   
                        synchronized(this) {
                            this.notifyAll();
                        }
                    }
                }
            }
        };
        sqsQueueNotificationWorker.addHandler(handler);
        
        // Wait for job to complete.
        synchronized(handler) {
            handler.wait();
        }
        
        // When job completes, shutdown the sqs notification worker.
        sqsQueueNotificationWorker.shutdown();
    } */
}
