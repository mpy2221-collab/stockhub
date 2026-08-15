package kr.inventory.common;

import java.io.InputStream;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * Gmail SMTP로 메일을 보낸다. Spring 메일이 아니다.
 */
public class MailSender {
  public void send(String to, String subject, String body) {
    if (to == null || to.isEmpty()) {
      return;
    }
    Properties conf = load();
    String username = conf.getProperty("username");
    String password = conf.getProperty("password");
    Properties props = new Properties();
    props.put("mail.smtp.host", conf.getProperty("host", "smtp.gmail.com"));
    props.put("mail.smtp.port", conf.getProperty("port", "587"));
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");
    props.put("mail.smtp.starttls.required", "true");
    Session session = Session.getInstance(props, new Authenticator() {
      @Override
      protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(username, password);
      }
    });
    try {
      MimeMessage msg = new MimeMessage(session);
      msg.setFrom(new InternetAddress(username));
      msg.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
      msg.setSubject(subject, "UTF-8");
      msg.setText(body, "UTF-8");
      Transport.send(msg);
    } catch (Exception e) {
      throw new IllegalStateException("메일 발송 실패", e);
    }
  }

  private Properties load() {
    Properties conf = new Properties();
    try (InputStream in = MailSender.class.getClassLoader().getResourceAsStream("mail.properties")) {
      if (in != null) {
        conf.load(in);
      }
    } catch (Exception e) {
      throw new IllegalStateException("mail.properties를 읽지 못했다", e);
    }
    return conf;
  }
}
