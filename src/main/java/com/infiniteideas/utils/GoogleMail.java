package com.infiniteideas.utils;

import com.infiniteideas.model.ContactForm;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class GoogleMail {
    public void sendMail(ContactForm contactForm) {

    final String username = "no.reply.infiniteideas";
    final String password = "infiniteidea";

    Properties props = new Properties();
    props.put("mail.smtp.starttls.enable", "true");
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.host", "smtp.gmail.com");
    props.put("mail.smtp.port", "587");

    Session session = Session.getInstance(props,
            new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            });

    try {

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress("no.reply.infiniteideas@gmail.com"));
        message.setRecipients(Message.RecipientType.TO,
                InternetAddress.parse("visvijay@indiana.edu"));
        message.setSubject(contactForm.getSubject() + " From: " + contactForm.getEmail());
        message.setText(contactForm.getMessage());

        Transport.send(message);

        System.out.println("Done");

    } catch (MessagingException e) {
        throw new RuntimeException(e);
    }
}
}
