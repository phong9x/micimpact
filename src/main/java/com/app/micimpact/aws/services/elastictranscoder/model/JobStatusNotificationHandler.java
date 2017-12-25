package com.app.micimpact.aws.services.elastictranscoder.model;

public interface JobStatusNotificationHandler {

    public void handle(JobStatusNotification jobStatusNotification);
}
