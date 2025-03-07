package service;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.sound.midi.MidiMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMailMessage;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;


@Service
public class MailSendService {

	@Autowired
	private JavaMailSender javaMailSender;

	private int authNumber = 0;
	
	public void setJavaMailSender(JavaMailSender javaMailSender) {
		this.javaMailSender = javaMailSender;
	}
	

	//인증번호 생성 메서드
	public void makeRandomNumber() {
		authNumber = new Random().nextInt(999999 - 111111 + 1 ) + 111111;
		System.out.println("인증번호 : " + authNumber);
	}
	
	//이메일 양식
	public String joinEmail( String academy_email ) {
		makeRandomNumber();
		
		String setFrom = "minsang583@naver.com";//보내는 사람의 메일주소
		String toMail = academy_email;//받을사람의 메일주소
		
		String title = "회원 가입 인증 이메일 입니다.";
		
		String content = "인증번호는 <b>" + authNumber + "</b>입니다";
		
		try {
			MimeMessage mail = javaMailSender.createMimeMessage();
			MimeMessageHelper mailHelper =
					 new MimeMessageHelper(mail, true, "utf-8");
			
			mailHelper.setFrom(setFrom);
			mailHelper.setTo(toMail);
			mailHelper.setSubject(title);
			mailHelper.setText(content, true);
			
			javaMailSender.send(mail);
		} catch (Exception e) {
			e.printStackTrace(); // 예외의 상세 정보를 출력
			System.out.println("이메일 전송 중 오류 발생: " + e.getMessage());
		}
		
		return "" + authNumber;
	}
	
	
}
