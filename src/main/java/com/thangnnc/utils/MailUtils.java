 package com.thangnnc.utils;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailUtils {

	public static void sendEmail(String toMail,String subject, String message) throws Exception {
        final String user = "thangnncps14579@gmail.com";
        final String pass = "ThangThang123";
        
        // sets SMTP server properties
        Properties props = new Properties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.host","smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        
        // creates a new session with an authenticator
        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, pass);
            }
        };
        Session session = Session.getInstance(props, auth);
        Transport transport = session.getTransport(); 
        // creates a new e-mail message
        Message msg = new MimeMessage(session);
 
        msg.setFrom(new InternetAddress(user));
        // To get the array of addresses
//        msg.addRecipient(Message.RecipientType.TO, new InternetAddress(toMail));
        msg.addRecipients(Message.RecipientType.CC, InternetAddress.parse(toMail));
        msg.setSubject(subject);
        msg.setText(message);

        // sends the e-mail
        transport.connect();  
        Transport.send(msg,msg.getAllRecipients());  
        transport.close();

    }
}
