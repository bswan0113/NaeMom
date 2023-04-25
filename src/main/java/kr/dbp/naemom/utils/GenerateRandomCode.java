package kr.dbp.naemom.utils;
import java.security.SecureRandom;

import org.springframework.stereotype.Component;
@Component
public class GenerateRandomCode {

    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    private static final int LENGTH = 8;
    private static final SecureRandom secureRandom = new SecureRandom();

    public static String generateRandomCode() {
        StringBuilder sb = new StringBuilder(LENGTH);
        for (int i = 0; i < LENGTH; i++) {
            sb.append(CHARACTERS.charAt(secureRandom.nextInt(CHARACTERS.length())));
        }
        return sb.toString();
    }

    
}