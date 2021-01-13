package com.webook.service;

import java.util.Random;

import javax.print.attribute.standard.Sides;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;

import com.webook.persistence.MemberDAO;

public class UserMailSendService {
	
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private SqlSessionTemplate sqlSession;
	private MemberDAO userDao;
	
	// 이메일 난수 만드는 메서드
	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;
		
		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >65 && num <= 90) || (num >= 97 && num <=122)) {
				sb.append((char) num);
			} else {
				continue;
			}
			
		} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}
	
	// 난수를 이용한 키 생성
	private boolean lowerCheck;
	private int size;
	
	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}
	
	// 회원가입 발송 이메일(인증키 발송)
	public void mailSendWithUserKey(String userEmail, String userId, HttpServletRequest request) {
		
		String key = getKey(false, 20);
		userDao = sqlSession.getMapper(MemberDAO.class);
		userDao.getClass()
	}

}