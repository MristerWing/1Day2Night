package com.odtn.member.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.odtn.aop.LogAspect;
import com.odtn.member.dao.MemberDao;
import com.odtn.member.dto.MemberDto;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.odtn.member.util.MailUtils;
import com.odtn.member.util.SHA256Util;
import com.odtn.member.util.TempKey;

/**
 * @author kkh
 * @date 2019. 12. 13.
 * @description 이메일 가입자 인증 추가
 * private JavaMailSender mailSender;
 */

/**
 * @author kkh
 * @date 2019. 12. 16.
 * @description 이메일 인증 칼럼을 x에서 null로 업데이트하려니 에러나서 dynamic-update 설정사용
 *              http://mkyong.com ...하려고 했는데 안 그래도 괜찮았음
 */

/**
 * @author kkh
 * @date 2019. 12. 26.
 * @description 이메일 유효성 검사를 위해 emailDupCheck 함수 추가
 * 	24일 DB에 salt랑 비번 섞어서 SHA256 방식으로 암호화 해서 저장, 로그인, 수정, 탈퇴 기능 구현 완료
 */
@Component
public class MemberServiceImp implements MemberService {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private JavaMailSender mailSender;

//	private org.apache.ibatis.session.Configuration configNull= 
//		new org.apache.ibatis.session.Configuration();
//	configNull.setCacheEnabled(false);
//	configuration.setJdbcTypeForNull(null);

	// 회원가입
	public void memberWriteOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		MemberDto memberDto = (MemberDto) map.get("memberDto");
//		String email = request.getParameter("email");
//		String password = request.getParameter("password");
//		LogAspect.logger.info(LogAspect.logMsg+"rgP.email="+email+"   "+"rgP.pw="+password);
		memberDto.setRegister_date(new Date());
		memberDto.setEmail_auth_status("x");
		LogAspect.logger.info(LogAspect.logMsg + "mWO." + memberDto.toString());

		String salt = SHA256Util.generateSalt();
		memberDto.setSalt(salt);

		String password = memberDto.getPassword();
		password = SHA256Util.getEncrypt(password, salt);

		memberDto.setPassword(password);
		LogAspect.logger.info(LogAspect.logMsg + "MSI.mWO.SHApw: " + memberDto.getPassword());

		MemberDto memberDtoIsNew = new MemberDto();
		memberDtoIsNew = memberDao.isNewMember(memberDto.getEmail());
		if (memberDtoIsNew == null) {
			int check = memberDao.memberWrite(memberDto);
			LogAspect.logger.info(LogAspect.logMsg + "mWO.check: " + check);
			mav.addObject("check", check);
			mav.addObject("memberDto", memberDto);
			// request.getParameter("email"); //npe
			emailSender(mav);

		} else if (memberDtoIsNew.getRegister_type() != null && memberDtoIsNew.getRegister_type().equals("KAKAO")) {
			LogAspect.logger.info(LogAspect.logMsg + "이미 이 이메일을 사용하는 카카오 계정으로 가입하신 적이 있습니다.");
			mav.addObject("register_type", memberDtoIsNew.getRegister_type());
			mav.setViewName("member/login");

		} else {
			LogAspect.logger.info(LogAspect.logMsg + "이미 가입하신 이메일입니다.");
			mav.addObject("isNewMember", "f");
			mav.setViewName("member/login");
		}

//		mav.setViewName("member/registerOk");
	}

	@Override
	public int emailDupCheck(String email) {
		int result=0;
		MemberDto memDto=memberDao.isNewMember(email);
		
		String regex = "^[_a-zA-Z0-9-\\.]{1,64}+@[\\.a-zA-Z0-9]+\\.[a-zA-Z]+$";
		Boolean b = email.matches(regex);
		
		if(memDto==null) {
			if(b==false) {
				LogAspect.logger.info(LogAspect.logMsg+"MC.emailDupCheck.이메일 형식에 맞지 않습니다.");
				result = -1;
			}
			if(b) {
				result = 0;
				LogAspect.logger.info(LogAspect.logMsg+"MC.emailDupCheck.이메일 사용가능");
				LogAspect.logger.info(LogAspect.logMsg+"MC.emailDupCheck.result= "+result);
			}
			
		} else if(memDto.getEmail().equals(email)) {
			LogAspect.logger.info(LogAspect.logMsg+"MC.emailDupCheck.이미 사용중인 이메일입니다.");
			result= 1;
		} else if(memDto.getRegister_type()!=null && memDto.getRegister_type().contentEquals("KAKAO")) {
			LogAspect.logger.info(LogAspect.logMsg+"MC.emailDupCheck.같은 메일을 사용하는 카카오 계정으로 가입하셨습니다.");
			result = 2;
		}
		return result;
	}
	
	@Override
	public int passwordCheck(String email, String password) {
		
		int check = 0;
		LogAspect.logger.info(LogAspect.logMsg+"pwCheck.check: "+check);
//		String password_check = "^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[$@$!%*?&`~'\"+=])[A-Za-z[0-9]$@$!%*?&`~'\"+=]{11,20}$";
		String password_check = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&`~'\"+=])[A-Za-z\\d$@$!%*?&`~'\"+=]{11,20}";
		
				
		Pattern patternSymbol = Pattern.compile(password_check);
		Matcher matcherSymbol = patternSymbol.matcher(password);
		
		if(matcherSymbol.matches()) {
			check = 1;
			LogAspect.logger.info(LogAspect.logMsg+"MC.passCheck.사용가능한 비밀번호입니다.");
			LogAspect.logger.info(LogAspect.logMsg+"MC.passCheck.사가비.check= "+check);
			
		}
		if(matcherSymbol.find()) {
			check = 1;
			LogAspect.logger.info(LogAspect.logMsg+"MC.passCheck.사용가능한 패스워드입니다.");
			LogAspect.logger.info(LogAspect.logMsg+"MC.passCheck.사가패.check= "+check);
		}
		if(email != "" && password.contains(email)) {
			check = -1;
			LogAspect.logger.info(LogAspect.logMsg+"MC.passCheck.비번에 이메일을 넣으시면 귀하의 소중한 개인정보가 유출되기 쉬워집니다.");
			if(!password.contains(email))
				LogAspect.logger.info(LogAspect.logMsg+"MC.passCheck.잘만들어보c5");
		}
		if(password.contains(" ")) {
			check = -2;
			LogAspect.logger.info(LogAspect.logMsg+"MC.passCheck.비밀번호에 공백이 포함될 수 없습니다.");
		}
		
		return check;
	}
	
	@Override
	public int nicknameDuplCheck(String nickname) {
		int check=memberDao.nicknameDuplCheck(nickname);
		
		return check;
	}
	
	
	
	
	//
	@Override
	public void getDtoEmailAuth(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		MemberDto memberDto = (MemberDto) map.get("memberDto");

		HttpServletRequest request = (HttpServletRequest) map.get("request");

//		LogAspect.logger.info(LogAspect.logMsg+"MSI.gDEA.dto: "+memberDto.toString()); //npe발생
		memberDto.setEmail(request.getParameter("email"));
		memberDto.setEmail_auth_key(request.getParameter("authkey"));
		memberDto = memberDao.getDtoEmailAuth(memberDto);
		LogAspect.logger.info(LogAspect.logMsg + "MSI.gDEA.dtoAfter: " + memberDto.toString());

		mav.addObject("memberDto", memberDto);

	}

	// 이메일 보내는 역할
	@Override
	public void emailSender(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		MemberDto memberDto = (MemberDto) map.get("memberDto");
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		// 이메일 인증 키 생성
		String email_auth_key = new TempKey().getKey(50, false);
		while (memberDao.isNewEmailAuthKey(email_auth_key) > 0) {
			email_auth_key = new TempKey().getKey(50, false);
		}
		memberDto.setEmail_auth_key(email_auth_key);
		int akCheck = memberDao.updateEmail_auth_key(memberDto);
		LogAspect.logger.info(LogAspect.logMsg + "MSI.mWO.afterUEak.dto: " + memberDto.toString());
		// 자동으로 보내지는 mail 내용 작성
		try {
			//String mailLink = request.getContextPath();
			
			LogAspect.logger.info(LogAspect.logMsg + "MSI.mWO.mail.dto:" + memberDto.toString());
			MailUtils sendMail = new MailUtils(mailSender);
			sendMail.setSubject("1Day2Night 회원가입 이메일 인증입니다.");
			sendMail.setText(new StringBuffer().append("<h3>이메일 인증</h3>").append("<p>아래의 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
					.append("<a href='http://localhost:8181/camping/member/emailVerify.do?uid=")
					.append(memberDto.getUser_num()).append("&email=").append(memberDto.getEmail()).append("&authkey=")
					.append(email_auth_key).append("' target=_blank'>이메일 인증 확인</a>").toString());
			sendMail.setFrom("egeodaa@gmail.com", "admin1");
			sendMail.setTo(memberDto.getEmail());
			sendMail.send();

		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		LogAspect.logger.info(LogAspect.logMsg + "MSI.mS.akupdCheck: " + akCheck);
		LogAspect.logger.info(LogAspect.logMsg + "MSI.mS.dto: " + memberDto.toString());
		mav.addObject("memberDto", memberDto);
		mav.setViewName("member/registerOk");
	}

	// 이메일 인증 상태 변경
	@Override
	public MemberDto updateEmail_auth_status(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		MemberDto memberDto = (MemberDto) map.get("memberDto");

		LogAspect.logger.info(LogAspect.logMsg + "MSI.uEas.dtobefor: " + memberDto.toString());
		memberDto.setEmail_auth_status(null);
		LogAspect.logger.info(LogAspect.logMsg + "MSI.uEas.dtoAfter: " + memberDto.toString());

		int check = memberDao.updateEmail_auth_status(memberDto);
		LogAspect.logger.info(LogAspect.logMsg + "MSI.uEas.dtoAfterUpd:" + memberDto.toString());
		LogAspect.logger.info(LogAspect.logMsg + "MSI.uEas.check:" + check);
		mav.addObject("check", check);
		mav.addObject("memberDto", memberDto);
		mav.setViewName("member/emailConfirm");
		return memberDto;
	}

	// 로그인 ok
	@Override
	public void memberLoginOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

//		String mailLink = request.getContextPath();
//		LogAspect.logger.info(LogAspect.logMsg + "MSI.mLO.getConPath: "+mailLink);
//		LogAspect.logger.info(LogAspect.logMsg + "MSI.mLO.getReqURI: "+request.getRequestURI());
//		LogAspect.logger.info(LogAspect.logMsg + "MSI.mLO.mL.getRpath: "+request.getRealPath(mailLink));
		LogAspect.logger.info(LogAspect.logMsg + "MSI.mLO.getSPath: "+request.getServletPath());
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		LogAspect.logger.info(LogAspect.logMsg + "req.email:" + request.getParameter("email"));
		LogAspect.logger.info(LogAspect.logMsg + "req.pw:" + request.getParameter("password"));
		LogAspect.logger.info(LogAspect.logMsg + "str.email:" + email);
		LogAspect.logger.info(LogAspect.logMsg + "str.pw:" + password);

		String salt = memberDao.getSaltByEmail(email);
		LogAspect.logger.info(LogAspect.logMsg + "MSI.mWO.salt: " + salt);

		password = SHA256Util.getEncrypt(password, salt);
		LogAspect.logger.info(LogAspect.logMsg + "MSI.mWO.pwsha: " + password);
		LogAspect.logger.info(LogAspect.logMsg + "MSI.mWO.salt: " + salt);

		MemberDto memberDto = new MemberDto();
		memberDto.setPassword(password);

		Map<String, String> hMap = new HashMap<String, String>();

		LogAspect.logger.info(LogAspect.logMsg + "MSI.mLO.reqEmail: " + request.getParameter("email"));
		hMap.put("email", request.getParameter("email"));
		hMap.put("password", password);

		LogAspect.logger.info(LogAspect.logMsg + "MSI.mLO.email: " + hMap.get("email"));
		LogAspect.logger.info(LogAspect.logMsg + "MSI.mLO.password: " + hMap.get("password"));
		memberDto = memberDao.memberLoginOk(hMap);

		if (memberDto != null) {
			LogAspect.logger.info(LogAspect.logMsg + "MSI.mLO.dto: " + memberDto.toString());
			mav.addObject("memberDto", memberDto);

			mav.setViewName("member/loginOk");
		} else {
			LogAspect.logger.info(LogAspect.logMsg + "아이디 혹은 비밀번호가 틀렸습니다 다시 시도해주세요");
			mav.addObject("memberDto", memberDto);
			mav.setViewName("member/login");
		}

	}

//	@Override
//	public void memberUpdate(ModelAndView mav) {
//		Map<String, Object> membInfoMap = mav.getModelMap();
//		MemberDto memberDto = (MemberDto) membInfoMap.get("memberDto");
//		LogAspect.logger.info(LogAspect.logMsg + "mWI:" + memberDto.toString());
//		int check = memberDao.memberUpdate(memberDto);
//
//		mav.addObject("check", check);
//		// mav.setViewName("index");
//	}

	// 수정전 연동x이메일 회원들은 비밀번호 체크
	@Override
	public void memberUpdateP(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = (HttpSession) map.get("session");
		Map<String, Object> hMap = new HashMap<String, Object>();

		LogAspect.logger.info(LogAspect.logMsg + "MSI.mUP.req.getPpw: " + request.getParameter("password"));
		LogAspect.logger.info(LogAspect.logMsg + "MSI.mUP.ses.getUnum: " + session.getAttribute("user_num"));
		LogAspect.logger.info(LogAspect.logMsg + "MSI.mUP.ses.getemal: " + session.getAttribute("email"));
		LogAspect.logger.info(LogAspect.logMsg + "MSI.mUP.ses.getEAK: " + session.getAttribute("email_auth_key"));

		String salt = memberDao.getSaltByEmail((String) session.getAttribute("email"));
		String password = request.getParameter("password");
		LogAspect.logger.info(LogAspect.logMsg + password);
		password = SHA256Util.getEncrypt(password, salt);
		LogAspect.logger.info(LogAspect.logMsg + "업데이트부분+MSI.mUP.salt: " + salt);
		LogAspect.logger.info(LogAspect.logMsg + "MSI.mUP.pwSHA: " + password);

		hMap.put("password", password);
		hMap.put("user_num", session.getAttribute("user_num"));
		hMap.put("email", session.getAttribute("email"));
		hMap.put("email_auth_key", session.getAttribute("email_auth_key"));
		hMap.put("register_type", session.getAttribute("register_type"));

		MemberDto memberDto = memberDao.getMemberDtoP(hMap);
		if (memberDto != null) {
			LogAspect.logger.info(LogAspect.logMsg + "MSI.mUP.dto:" + memberDto.toString());
			memberDto.setPassword(request.getParameter("password"));
			mav.addObject("memberDto", memberDto);
			mav.setViewName("member/update");
		} else {
			LogAspect.logger.info(LogAspect.logMsg + "MSI.mUP.비밀번호가 틀렸습니다");
			mav.addObject("password_fail", "t");
			mav.setViewName("member/updateP");
		}
	}

	// 카카오 연동 회원 정보 수정 페이지 이동(기존 데이터 들고 가서 뿌림)
	@Override
	public void memberKakaoUpdate(ModelAndView mav, HttpSession session) {

		LogAspect.logger.info(LogAspect.logMsg + "MSI.mKU.ses.getUnum: " + session.getAttribute("user_num"));
		LogAspect.logger.info(LogAspect.logMsg + "MSI.mKU.ses.getUai: " + session.getAttribute("user_auth_id"));
		LogAspect.logger.info(LogAspect.logMsg + "MSI.mKU.ses.getregType: " + session.getAttribute("register_type"));

		Map<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("user_num", session.getAttribute("user_num"));
		hMap.put("user_auth_id", session.getAttribute("user_auth_id"));
		hMap.put("register_type", session.getAttribute("register_type"));

		MemberDto memberDto = memberDao.getKakaoMemberDto(hMap);

		if (memberDto != null) {
			LogAspect.logger.info(LogAspect.logMsg + "MSI.mKU.dto: " + memberDto.toString());
			mav.addObject("memberDto", memberDto);
			mav.setViewName("member/kakaoMemberUpdate");
		} else {
			LogAspect.logger.info(LogAspect.logMsg + "MSI.mKU.dto:dto를 불러오지 못했습니다.(비었어요);");
			mav.addObject("memberDto_null", "t");
			mav.setViewName("member/kakaoMemberUpdate");
		}
	}

	// 이메일가입 회원 정보 수정 db에 update
	@Override
	public void memberUpdateOk(ModelAndView mav, HttpSession session) {
		Map<String, Object> map = mav.getModelMap();
		// MemberDto memberDto = (MemberDto)map.get("memberDto");
		MemberDto memberDto = new MemberDto();
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");

		LogAspect.logger.info(LogAspect.logMsg + "req: " + request);
		// LogAspect.logger.info(LogAspect.logMsg+"MSI.mUO.dto: "+memberDto.toString());

		memberDto.setEmail(request.getParameter("email"));
		LogAspect.logger.info(LogAspect.logMsg + "MSI.mUO.reqEmail: " + request.getParameter("email"));
		LogAspect.logger.info(LogAspect.logMsg + "MSI.mUO.dtoEmail: " + memberDto.getEmail());

		// 암호화 한다면 달라져야 될 부분일 듯 - 그리 해보도록 하지요
		String salt = SHA256Util.generateSalt();
		LogAspect.logger.info(LogAspect.logMsg + "MSI.mUO.reqPw: " + request.getParameter("password"));
		LogAspect.logger.info(LogAspect.logMsg + "MSI.mUO.salt: " + salt);
		String password = request.getParameter("password");
		password = SHA256Util.getEncrypt(password, salt);
		memberDto.setPassword(password);
		memberDto.setSalt(salt);

		LogAspect.logger.info(LogAspect.logMsg+"MSI.mUO.interest: "+request.getParameter("result"));
		memberDto.setUser_num((Integer) session.getAttribute("user_num"));
		memberDto.setInterest(request.getParameter("result"));
		memberDto.setUser_name(request.getParameter("user_name"));
		memberDto.setNickname(request.getParameter("nickname"));
		memberDto.setPhone_num(Integer.valueOf(request.getParameter("phone_num")));
//		memberDto.setGender(request.getParameter("genderh"));
//		memberDto.setAge(Integer.parseInt(request.getParameter("age")));

		LogAspect.logger
				.info(LogAspect.logMsg + "MSI.mUO.req.getFile.pImg: " + request.getFile("profile_image").toString());
		MultipartFile upFile = request.getFile("profile_image");
		Long file_size = upFile.getSize();

		if (file_size != 0) {// 이미 파일 존재
			String file_name = Long.toString(System.currentTimeMillis()) + "_" + upFile.getOriginalFilename();
			File path = new File("C:\\ftp\\profile_image\\");
			path.mkdir();

			if (path.exists() && path.isDirectory()) {// 경로가 있고 파일이 있으면
				File file = new File(path, file_name);
				try {
					upFile.transferTo(file);
				} catch (IOException e) {
					e.printStackTrace();
				}
//				memberDto.setFileSize(fileSize);
//				memberDto.setFileName(fileName);
				memberDto.setProfile_image(file.getAbsolutePath());
				LogAspect.logger.info(LogAspect.logMsg + "MSI.mUO" + file.getAbsolutePath());
			}

		}

		int check = 0;

		LogAspect.logger.info(LogAspect.logMsg + "MSI.mUO.dto: " + memberDto.toString());
		check = memberDao.memberUpdateOk(memberDto);
		LogAspect.logger.info(LogAspect.logMsg + "MSI.mUO.check: " + check);

		mav.addObject("check", check);
		mav.setViewName("member/updateOk");
	}

	@Override
	public void memberDeleteOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();
		LogAspect.logger.info(LogAspect.logMsg + "MSI.mDO.sesUnum: " + session.getAttribute("user_num"));
		LogAspect.logger.info(LogAspect.logMsg + "MSI.mDO.sesemail: " + session.getAttribute("email"));
		LogAspect.logger.info(LogAspect.logMsg + "MSI.mDO.sesEAKey: " + session.getAttribute("email_auth_key"));
		LogAspect.logger.info(LogAspect.logMsg + "MSI.mDO.reqPassword: " + request.getParameter("password"));
		Map<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("user_num", session.getAttribute("user_num"));
		hMap.put("email", session.getAttribute("email"));
		hMap.put("email_auth_key", session.getAttribute("email_auth_key"));

		// 비번 암호화로 인해 변화

		String salt = memberDao.getSaltByEmail((String) session.getAttribute("email"));

		String password = request.getParameter("password");

		password = SHA256Util.getEncrypt(password, salt);

		hMap.put("password", password);
		int check = memberDao.memberDeleteOk(hMap);
		LogAspect.logger.info(LogAspect.logMsg + "MSI.mDO.check: " + check);
		mav.addObject("check", check);
	}

	@Override
	public void kakaoDeleteOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpSession session = (HttpSession) map.get("session");
		int check = 0;
//		MemberDto memberDto = new MemberDto();

		Map<String, Object> hMap = new HashMap<String, Object>();
		LogAspect.logger.info(LogAspect.logMsg + "MSI.kDO.ses.uaid: " + session.getAttribute("user_auth_id"));
		LogAspect.logger.info(LogAspect.logMsg + "MSI.kDO.ses.unum: " + session.getAttribute("user_num"));
		LogAspect.logger.info(LogAspect.logMsg + "MSI.kDO.ses.a_t: " + session.getAttribute("access_token"));
		hMap.put("user_auth_id", session.getAttribute("user_auth_id"));
		hMap.put("user_num", session.getAttribute("user_num"));
//		hMap.put("access_token", session.getAttribute("access_token"));
		hMap.put("register_type", "KAKAO");
		// int user_num = (Integer) hMap.get("user_num");
		if ((Integer) hMap.get("user_num") == 0) {
			LogAspect.logger.info(LogAspect.logMsg + "다시 로그인 해주신 후에 탈퇴해 주십시오");
		} else {
			check = memberDao.kakaoDeleteOk(hMap);
		}

		if (check > 0) {
			session.removeAttribute("user_auth_id");
			session.removeAttribute("user_num");
			session.removeAttribute("access_token");
			// session.removeAttribute("nickname");
			session.removeAttribute("register_type");
		}
		mav.addObject("check", check);
		mav.setViewName("member/kakaoDeleteOk");
	}

	// 카카오 로그인 위한 액세스 토큰 겟
	@Override
	public String kakaoGetAccessToken(String authorize_code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqUrl = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("POST");
			// post 쓰려면 해줘야 되는 부분
			conn.setDoOutput(true);

			// 주소 이어 만들어 bw에 저장
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=06ef11d13082c0f6655eada1dec1670a");
			sb.append("&redirect_uri=http://localhost:8181/camping/member/kakaoLogin.do");
			sb.append("&code=" + authorize_code);
			LogAspect.logger.info(LogAspect.logMsg + "sb.append: " + sb);
			bw.write(sb.toString());
			bw.flush();

			// 잘 되는지 확인(200이면 됨)
			int responseCode = conn.getResponseCode();
			LogAspect.logger.info(LogAspect.logMsg + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			LogAspect.logger.info(LogAspect.logMsg + "response body: " + result);

			// JSON객체 받아서 스트링으로 만들기 (gson 라이브러리 사용)
			// json 파서 선언하고
			// json엘러먼트 선언해놓고 , result(line 이어서 만든 주소) 넣고
			// json파서가 엘러먼트의 주소를 찾아 파싱할 수 있게 만들고, 파싱한걸 json엘러먼트에 저장
			JsonParser jsonParser = new JsonParser();
			JsonElement jsonElement = jsonParser.parse(result);
			// 엘러먼트에 저장된 json 객체를 get하고 거기서 a_token과 r_token을 얻는데 스트링타입으로서 get한다.
			access_Token = jsonElement.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = jsonElement.getAsJsonObject().get("refresh_token").getAsString();

			LogAspect.logger.info(LogAspect.logMsg + "access_token : " + access_Token);
			LogAspect.logger.info(LogAspect.logMsg + "refresh_token : " + refresh_Token);

			// 다 썼으면 닫아주기(먼저 연 걸 나중에 닫음)
			if (br != null)
				br.close();
			if (bw != null)
				bw.close();
//			if(conn != null) conn.disconnect();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return access_Token;
	}

//	@Override
//	public Map<String, Object> kakaoGetUserInfo(String access_Token) {
//		//이메일 o/x, 수집 동의 여부 o/x로 회원 정보가 다 다름
//		Map<String, Object> userInfoMap = new HashMap<String, Object>();
//		String requestUrl = "https://kapi.kakao.com/v2/user/me";
//		
//		try {
//			URL url = new URL(requestUrl);
//			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//			conn.setRequestMethod("POST");
//			
//			//헤더에 포함시키는 내용
//			conn.setRequestProperty("Authorization", "Bearer " + access_Token);
//			
//			//200 나오면됨
//			LogAspect.logger.info(LogAspect.logMsg+"MSI.gUI.responseCode: "+conn.getResponseCode());
//			
//			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//			String line="";
//			String result="";
//			
//			while((line=br.readLine()) != null) {
//				result += line;
//			}
//			
//			LogAspect.logger.info(LogAspect.logMsg+"MSI.gUI.responseBody: "+result);
//			
//			//json 객체 파싱
//			JsonParser jsonParser = new JsonParser();
//			JsonElement jsonElement = jsonParser.parse(result);
//			
//			// json객체 내의 배열 properties와 kakao_account를 선언
//			JsonObject properties = jsonElement.getAsJsonObject().get("properties").getAsJsonObject();
//			JsonObject kakao_account = jsonElement.getAsJsonObject().get("kakao_account").getAsJsonObject();
//			
//			if(jsonElement.getAsJsonObject().get("id") != null)
//				userInfoMap.put("user_auth_id", jsonElement.getAsJsonObject().get("id").getAsLong());
//			
//			//각 배열 내에 있는 하나씩 뽑아 String 변수에 하나씩 저장하기
//			if(properties.getAsJsonObject().get("nickname").getAsString() != null) {
//				//String nickname = properties.getAsJsonObject().get("nickname").getAsString();
//				userInfoMap.put("nickname", properties.getAsJsonObject().get("nickname").getAsString());
//			}
//			if(kakao_account.getAsJsonObject().get("email") != null && kakao_account.getAsJsonObject().get("email_needs_agreement").getAsBoolean() == false) {
//				//String email = kakao_account.getAsJsonObject().get("email").getAsString();
//				userInfoMap.put("email", kakao_account.getAsJsonObject().get("email").getAsString());
//			} else {
//				//String email = "";
//				userInfoMap.put("email", "");
//			}
//			
//			if(kakao_account.getAsJsonObject().get("profile_needs_agreement") !=null && kakao_account.getAsJsonObject().get("profile_needs_agreement").getAsBoolean() == false) {
//				if(properties.getAsJsonObject().get("profile_image") != null)
//					userInfoMap.put("profile_image", properties.getAsJsonObject().get("profile_image").getAsString());
//				if(properties.getAsJsonObject().get("thumbnail_image") != null)
//					userInfoMap.put("thumbnail_image", properties.getAsJsonObject().get("thumbnail_image").getAsString());
//			}
//			
//			
//			if(br != null) br.close();
//			if(conn != null) conn.disconnect();
//		} catch(Exception e) {
//			e.printStackTrace();
//		} 
//		return userInfoMap;
//	}

	@Override
	public void kakaoGetUserInfo(String access_Token, ModelAndView mav) {
		// 이메일 o/x, 수집 동의 여부 o/x로 회원 정보가 다 다름

		String requestUrl = "https://kapi.kakao.com/v2/user/me";
		Map<String, Object> map = mav.getModelMap();
		MemberDto memberDto = (MemberDto) map.get("memberDto");
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		try {
			URL url = new URL(requestUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");

			// 헤더에 포함시키는 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			// 200 나오면됨
			LogAspect.logger.info(LogAspect.logMsg + "MSI.gUI.responseCode: " + conn.getResponseCode());

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}

			LogAspect.logger.info(LogAspect.logMsg + "MSI.gUI.responseBody: " + result);

			// json 객체 파싱
			JsonParser jsonParser = new JsonParser();
			JsonElement jsonElement = jsonParser.parse(result);

			// json객체 내의 배열 properties와 kakao_account를 선언
			JsonObject properties = jsonElement.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = jsonElement.getAsJsonObject().get("kakao_account").getAsJsonObject();
			LogAspect.logger.info(LogAspect.logMsg + jsonElement.getAsJsonObject().get("id").getAsString());
			LogAspect.logger
					.info(LogAspect.logMsg + Integer.valueOf(jsonElement.getAsJsonObject().get("id").getAsString()));
			if (jsonElement.getAsJsonObject().get("id") != null) {
				memberDto.setUser_auth_id(Integer.valueOf(jsonElement.getAsJsonObject().get("id").getAsString()));
				mav.addObject("user_auth_id", memberDto.getUser_auth_id());
			} else {
				LogAspect.logger.info(LogAspect.logMsg + "고유 id를 찾을 수 없습니다");

			}

			// 각 배열 내에 있는 하나씩 뽑아 String 변수에 하나씩 저장하기
			if (properties.getAsJsonObject().get("nickname").getAsString() != null) {
				// String nickname = properties.getAsJsonObject().get("nickname").getAsString();
				memberDto.setNickname(properties.getAsJsonObject().get("nickname").getAsString());
				mav.addObject("nickname", memberDto.getNickname());
			}
//			} else {
//				memberDto.setNickname("");
//			}
			if (kakao_account.getAsJsonObject().get("email") != null
					&& (kakao_account.getAsJsonObject().get("email_needs_agreement") != null
							&& kakao_account.getAsJsonObject().get("email_needs_agreement").getAsBoolean() == false)) {
				// String email = kakao_account.getAsJsonObject().get("email").getAsString();
				memberDto.setEmail(kakao_account.getAsJsonObject().get("email").getAsString());
			} else {
//				memberDto.setEmail("");
				memberDto.setEmail_auth_status("x");
			}

			if (kakao_account.getAsJsonObject().get("profile_needs_agreement") != null
					&& (kakao_account.getAsJsonObject().get("profile_needs_agreement") != null && kakao_account
							.getAsJsonObject().get("profile_needs_agreement").getAsBoolean() == false)) {

				if (properties.getAsJsonObject().get("profile_image") != null)
					memberDto.setProfile_image(properties.getAsJsonObject().get("profile_image").getAsString());
//				else memberDto.setProfile_image("");

				if (properties.getAsJsonObject().get("thumbnail_image") != null)
					memberDto.setThumbnail_image(properties.getAsJsonObject().get("thumbnail_image").getAsString());
//				else memberDto.setThumbnail_image("");
			}
//			} else {
//				memberDto.setProfile_image("");
//				memberDto.setThumbnail_image("");
//			}

			// null인 값들은 ""처리(oracle에선 null로 입력됨)
//			if(memberDto.getPassword() == null)
//				memberDto.setPassword("");
			if (memberDto.getRegister_date() == null)
				memberDto.setRegister_date(new Date());
			if (memberDto.getRegister_type() == null)
				memberDto.setRegister_type("KAKAO");

			LogAspect.logger.info(LogAspect.logMsg + memberDto.toString());
			int check = 0;

			MemberDto memberDtoIsNew = new MemberDto();
			memberDtoIsNew = memberDao.isNewOAuthMember(memberDto.getUser_auth_id());

//			LogAspect.logger.info(LogAspect.logMsg + "MSI.kGUI.isNew.dto: " + memberDtoIsNew.toString());
//			LogAspect.logger.info(LogAspect.logMsg + "isNew.uid: "+memberDtoIsNew.getUser_auth_id());
//			LogAspect.logger.info(LogAspect.logMsg + "dto.uid: "+memberDto.getUser_auth_id());
//			 
//			LogAspect.logger.info(LogAspect.logMsg+"MSI.kGUI.isNewKaKao(t is f): "+memberDtoIsNew.getRegister_type().equals("KAKAO"));
//			LogAspect.logger.info(LogAspect.logMsg+"MSI.kGUI.isNewAuthId: "+memberDtoIsNew.getUser_auth_id().equals(memberDto.getUser_auth_id()));
			// LogAspect.logger.info(LogAspect.logMsg+"mDIN: "+memberDtoIsNew.toString());
			if (memberDtoIsNew == null) {
				check = memberDao.memberWrite(memberDto);
				memberDto = memberDao.kakaoMemberNewLoad(memberDto);
			} else if (!(memberDtoIsNew.getRegister_type().equals("KAKAO"))) {
				check = memberDao.memberWrite(memberDto);
				memberDto = memberDao.kakaoMemberNewLoad(memberDto);
			} else if (memberDtoIsNew.getUser_auth_id().equals(memberDto.getUser_auth_id())) {
				LogAspect.logger.info(LogAspect.logMsg + "MSI.KGUI.이미 있는 카카오 아이디이므로 로그인합니다.");
				memberDto = memberDao.kakaoMemberLoad(memberDtoIsNew);
			}
//			} else if(memberDtoIsNew.getUser_auth_id()==null  && !(memberDtoIsNew.getRegister_type().equals("KAKAO"))) {
//				check = memberDao.memberWrite(memberDto);
//			 이거 되려면 user_auth_id가 여러개 필요한듯(만약 다른 연동 로그인이 있으면 null이 아님
//			} 

//			if (memberDtoIsNew != null) {
//				if(memberDtoIsNew.getRegister_type().equals("KAKAO")){
//					if(memberDtoIsNew.getUser_auth_id().equals(memberDto.getUser_auth_id())) {
//						LogAspect.logger.info(LogAspect.logMsg + "MSI.KGUI.이미 있는 카카오 아이디이므로 로그인합니다.");
//						memberDto = memberDao.kakaoMemberLoad(memberDtoIsNew);
//					}
//				} else {
//					check = memberDao.memberWrite(memberDto);
//				}
//			} else {
//				check = memberDao.memberWrite(memberDto);
//			}
			LogAspect.logger.info(LogAspect.logMsg + "MSI.gUIkakao.dto: " + memberDto.toString());
			LogAspect.logger.info(LogAspect.logMsg + "MSI.gUIkakao.check: " + check);

			mav.addObject("check", check);
			mav.addObject("memberDto", memberDto);
			mav.addObject("access_Token", access_Token);
			mav.addObject("nickname", memberDto.getNickname());

//			HttpSession session = request.getSession();
//			session.setAttribute("nickname", memberDto.getNickname());
//			session.setAttribute("user_auth_id", memberDto.getUser_auth_id());
//			session.setAttribute("user_num", memberDto.getUser_num());
//			session.setAttribute("access_Token", access_Token);
//			session.setAttribute("register_type", memberDto.getRegister_type());
//			
			mav.setViewName("member/kakaoLoginOk");

			if (br != null)
				br.close();
//			if(conn != null) conn.disconnect();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void kakaoLogout(String access_Token) {
		String requestUrl = "https://kapi.kakao.com/v1/user/logout";

		try {
			URL url = new URL(requestUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);
			LogAspect.logger.info(LogAspect.logMsg + "MSI.kLo.a_t: " + access_Token);

			LogAspect.logger.info(LogAspect.logMsg + "MSI.kLo.responseCode: " + conn.getResponseCode());

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String result = "";
			String line = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			LogAspect.logger.info(LogAspect.logMsg + "MSI.kLo.result: " + result);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void kakaoMemberUpdateOk(ModelAndView mav, HttpSession session) {
		Map<String, Object> map = mav.getModelMap();
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");

		// MemberDto memberDto = (MemberDto)map.get("memberDto");
		MemberDto memberDto = new MemberDto();

		LogAspect.logger.info(LogAspect.logMsg + "MSI.kMUO.ses.unum: " + session.getAttribute("user_num"));
		LogAspect.logger.info(LogAspect.logMsg + "MSI.kMUO.ses.uai: " + session.getAttribute("user_auth_id"));
		LogAspect.logger.info(LogAspect.logMsg + "MSI.kMUO.ses.regType: " + session.getAttribute("register_type"));
		LogAspect.logger.info(LogAspect.logMsg + "MSI.kMUO.req.interest: " + request.getParameter("interest"));

		// LogAspect.logger.info(LogAspect.logMsg+"MSI.kMUO.dtoBefore:"+memberDto.toString());

		memberDto.setUser_num((Integer) session.getAttribute("user_num"));
		memberDto.setUser_auth_id((Integer) session.getAttribute("user_auth_id"));
		memberDto.setRegister_type((String) session.getAttribute("register_type"));

		memberDto.setInterest(request.getParameter("interestHidden"));
		memberDto.setUser_name(request.getParameter("user_name"));
		memberDto.setNickname(request.getParameter("nickname"));
		memberDto.setPhone_num(Integer.valueOf(request.getParameter("phone_num")));
//		memberDto.setGender(request.getParameter("genderh"));
//		memberDto.setAge(Integer.parseInt(request.getParameter("age")));
	
		// LogAspect.logger.info(LogAspect.logMsg+"MSI.mUO.req.getFile.pImg:
		// "+request.getFile("profile_image").toString());
		MultipartFile upFile = request.getFile("profile_image");
		Long file_size = upFile.getSize();

		if (file_size != 0) {// 이미 파일 존재
			String file_name = Long.toString(System.currentTimeMillis()) + "_" + upFile.getOriginalFilename();
			File path = new File("C:\\ftp\\profile_image\\");
			path.mkdir();

			if (path.exists() && path.isDirectory()) {// 경로가 있고 파일이 있으면
				File file = new File(path, file_name);
				try {
					upFile.transferTo(file);
				} catch (IOException e) {
					e.printStackTrace();
				}
//				memberDto.setFileSize(fileSize);
//				memberDto.setFileName(fileName);
				memberDto.setProfile_image(file.getAbsolutePath());
				LogAspect.logger.info(LogAspect.logMsg + "MSI.mUO" + file.getAbsolutePath());
			}

		}

		LogAspect.logger.info(LogAspect.logMsg + "MSI.kMUO.dto.sesAdd:" + memberDto.toString());

		int check = memberDao.kakaoMemberUpdateOk(memberDto);

		mav.addObject("check", check);
		mav.addObject("nickname", memberDto.getNickname());
		mav.setViewName("member/kakaoMemberUpdateOk");

	}

}