package com.odtn.member.util;

import java.util.Random;

public class TempKey {
	private int size;
	private boolean lowerCheck;
	
	public String getKey(int size, boolean lowerCheck) {
		this.size=size;
		this.lowerCheck = lowerCheck;
		return init();
	}
	
	private String init() {
		Random random = new Random();
		StringBuffer sb = new StringBuffer();
			
		int num = 0;
			
		//매개변수로 입력받은 size만큼 반복, num이 아스키코드로 숫자 소문자 대문자에 속하면  문자로 바꿔주는 부분
		do {
			num = random.nextInt(75)+48; //0~75랜덤값+48
			if((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num>=97 && num <=122))
				sb.append((char)num);
			else continue;
		} while(sb.length() <size);
			
		//소문자화 하는 코드
		if(lowerCheck)
			return sb.toString().toLowerCase();
			
		return sb.toString();
	}
}

