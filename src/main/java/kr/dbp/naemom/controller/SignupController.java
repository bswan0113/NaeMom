package kr.dbp.naemom.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SignupController {

    @PostMapping("/signupd")
    @ResponseBody
    public String signup(@RequestParam String em, @RequestParam String pw) {
        //회원가입 처리 로직 구현
        //email과 password를 이용해 새회원 정보를 저장
        
        //회원가입 성공 시 "Y", 실패 시 "N" 반환
        return "Y";
    }     
  
}
