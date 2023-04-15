package kr.dbp.naemom.service;

public interface EmailService {
    void sendEmail(String email, String code) throws Exception;
}
