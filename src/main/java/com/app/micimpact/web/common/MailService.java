package com.app.micimpact.web.common;

import java.io.Serializable;

public interface MailService extends Serializable {
    void sendMail(String subject, String text, String toUser, String[]toCC);
}
