package kr.dbp.naemom.controller;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.dbp.naemom.utils.GenerateRandomCode;
@Controller
public class EmailController {

    @Autowired
    private JavaMailSender mailSender;

    @PostMapping("/sendEmail")
    @ResponseBody
    public String sendEmail(@RequestBody Email email) {
    	
        String code = GenerateRandomCode.generateRandomCode(); // GenerateRandomCode 클래스의 메서드 사용
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            helper.setFrom("jjojjosteve@gmail.com");
            helper.setTo(email.getTo());
            helper.setSubject("[회원가입 인증] 이메일 인증 코드입니다.");
            helper.setText("회원가입 인증 코드: " + code, true);
            mailSender.send(message);
            return code;
        } catch (Exception e) {
            e.printStackTrace();
            return "fail";
        }
    }   
}

class Email {

    private String to;

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

}