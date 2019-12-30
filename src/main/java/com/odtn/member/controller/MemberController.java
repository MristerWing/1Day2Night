package com.odtn.member.controller;

import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.odtn.aop.LogAspect;
import com.odtn.member.dto.MemberDto;
import com.odtn.member.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "member/beforeRegister.do", method = RequestMethod.GET)
	public ModelAndView memberBeforeRegister(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("member/beforeRegister.tiles");
		return mav;
	}

	@RequestMapping(value = "member/privacyPolicyAgreement.do", method = RequestMethod.GET)
	public ModelAndView memberPrivacyPolicy(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/privacyPolicyAgreement.tiles");
		return mav;
	}

	@RequestMapping(value = "member/register.do", method = RequestMethod.GET)
	public ModelAndView memberWrite(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/register.tiles");
		LogAspect.logger.info(LogAspect.logMsg + "MC.mW.OK");

		return mav;
	}

	@RequestMapping(value = "member/registerOk.do", method = RequestMethod.POST)
	public ModelAndView memberWriteOk(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
		LogAspect.logger.info(LogAspect.logMsg + "MC.mWO.OK");
		ModelAndView mav = new ModelAndView();
		// mav.addObject("request", request);
		mav.addObject("memberDto", memberDto);
		memberService.memberWriteOk(mav);

		return mav;
	}

	@RequestMapping(value = "member/emailDupCheck.json", method = RequestMethod.POST)
	public @ResponseBody int emailDupCheck(@RequestParam("email") String email, ModelAndView mav) {
		int result = memberService.emailDupCheck(email);
		// MemberDto memDto=memberService.emailDupCheck(email);
		return result;
	}

	@RequestMapping(value = "member/passwordCheck.json", method = RequestMethod.POST)
	public @ResponseBody int passwordCheck(@RequestParam String email, @RequestParam String password) {
		LogAspect.logger.info(LogAspect.logMsg + "MC.passwordCheck method");
		// LogAspect.logger.info(LogAspect.logMsg+"pwCheck.email: "+hMap.get("email"));
		// LogAspect.logger.info(LogAspect.logMsg+"pwCheck.password:
		// "+hMap.get("password"));
		LogAspect.logger.info(LogAspect.logMsg + "pwCheck.email: " + email);
		LogAspect.logger.info(LogAspect.logMsg + "pwCheck.password: " + password);

		int check = memberService.passwordCheck(email, password);
		return check;
	}

	@RequestMapping(value = "member/nicknameDuplCheck.json", method = RequestMethod.POST)
	public @ResponseBody int nicknameDuplCheck(@RequestParam String nickname) {
		int check = memberService.nicknameDuplCheck(nickname);
		return check;
	}

	@RequestMapping(value = "member/emailVerify.do", method = RequestMethod.GET)
	public ModelAndView memberEmailVerify(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			MemberDto memberDto, ModelAndView mav) {
		// ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("memberDto", memberDto);
		LogAspect.logger.info(LogAspect.logMsg + "MC.EV.dto: " + memberDto.toString());
		memberService.getDtoEmailAuth(mav);

		memberDto = memberService.updateEmail_auth_status(mav);
		session.setAttribute("email", memberDto.getEmail());
		session.setAttribute("user_num", memberDto.getUser_num());
		session.setAttribute("email_auth_key", memberDto.getEmail_auth_key());

		return mav;

	}

	@RequestMapping(value = "member/login.do", method = RequestMethod.GET)
	public ModelAndView memberLogin(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		ModelAndView mav = new ModelAndView();
		if (session.getAttribute("user_num") == null)
			mav.setViewName("member/login.tiles");
		else
			mav.setViewName("member/loginOk.tiles");
		return mav;
	}

	@RequestMapping(value = "member/loginOk.do", method = RequestMethod.POST)
	public ModelAndView memberLoginOk(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		mav.addObject("request", request);

		memberService.memberLoginOk(mav);
		LogAspect.logger.info(LogAspect.logMsg + "mavstr: " + mav.toString());
		Map<String, Object> map = mav.getModelMap();

		LogAspect.logger.info(LogAspect.logMsg + "map.keySet():" + map.keySet());
		MemberDto memberDto = (MemberDto) map.get("memberDto");
		// LogAspect.logger.info(LogAspect.logMsg+"MC.mLO.dto:
		// "+memberDto.toString());
		if (memberDto != null) {
			session.setAttribute("user_num", memberDto.getUser_num());
			session.setAttribute("email", memberDto.getEmail());
			session.setAttribute("email_auth_key", memberDto.getEmail_auth_key());
			session.setAttribute("register_type", memberDto.getRegister_type());
			session.setAttribute("email_auth_status", memberDto.getEmail_auth_status());
			mav.addObject("login_fail", "f");
		} else {
			LogAspect.logger.info(LogAspect.logMsg + "MC.mLO.dto가 비었습니다.로그인에 문제 발생");
			mav.addObject("login_fail", "t");
		}
		return mav;
	}

	@RequestMapping(value = "member/logout.do", method = RequestMethod.GET)
	public ModelAndView memberLogout(HttpSession session) {
		ModelAndView mav = new ModelAndView();

		session.removeAttribute("user_num");
		session.removeAttribute("email");
		session.removeAttribute("email_auth_key");
		session.removeAttribute("register_type");
		session.removeAttribute("email_auth_status");

		mav.setViewName("member/logoutOk.empty");
		return mav;

	}

	@RequestMapping(value = "member/update.do", method = RequestMethod.GET)
	public ModelAndView memberUpdate(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			MemberDto memberDto) {
		ModelAndView mav = new ModelAndView();

		if (session.getAttribute("register_type") == null) {
			LogAspect.logger.info(LogAspect.logMsg + "ses.forEmailmemb: ");
			LogAspect.logger.info(LogAspect.logMsg + "MC.mU.ses.unum: " + session.getAttribute("user_num"));
			LogAspect.logger.info(LogAspect.logMsg + "MC.mU.ses.email: " + session.getAttribute("email"));
			LogAspect.logger.info(LogAspect.logMsg + "MC.mU.ses.eAK: " + session.getAttribute("email_auth_key"));
			LogAspect.logger.info(LogAspect.logMsg + "MC.mU.ses.regType: " + session.getAttribute("register_type"));
			mav.setViewName("member/updateP.tiles");
		}

		if (session.getAttribute("user_auth_id") != null) {
			LogAspect.logger.info(LogAspect.logMsg + "ses.forKakao: ");
			LogAspect.logger.info(LogAspect.logMsg + "MC.mU.ses.uaid: " + session.getAttribute("user_auth_id"));
			LogAspect.logger.info(LogAspect.logMsg + "MC.mU.ses.unum: " + session.getAttribute("user_num"));
			LogAspect.logger.info(LogAspect.logMsg + "MC.mU.ses.rType: " + session.getAttribute("register_type"));
			if ((session.getAttribute("user_num").toString()) == "0") {
				LogAspect.logger.info(LogAspect.logMsg + "MC.mu.재로그인 후 정보를 수정해 주세요.");
			}
			memberService.memberKakaoUpdate(mav, session);
			mav.addObject("member/kakaoMemberUpdate.tiles");
		}

		// mav.addObject("memberDto", memberDto);
		// mav.addObject("request", request);
		return mav;
	}

	// 연동x 가입자 회원 정보 수정 시 비밀번호 입력 성공하면 여기로 옴
	@RequestMapping(value = "member/updatePo.do", method = RequestMethod.POST)
	public ModelAndView memberUpdateP(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("session", session);
		memberService.memberUpdateP(mav);

		return mav;
	}

	@RequestMapping(value = "member/updateOk.do", method = RequestMethod.POST)
	public ModelAndView memberUpdateOk(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		LogAspect.logger.info(LogAspect.logMsg + "MC.mUO.ses.uNum: " + session.getAttribute("user_num"));
		// LogAspect.logger.info(LogAspect.logMsg+"MC.mUO.dto:
		// "+memberDto.toString());
		// mav.addObject("memberDto", memberDto);
		memberService.memberUpdateOk(mav, session);

		return mav;
	}

	@RequestMapping(value = "member/delete.do", method = RequestMethod.GET)
	public ModelAndView memberDelete(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/delete.tiles");
		return mav;
	}

	@RequestMapping(value = "member/deleteOk.do", method = RequestMethod.POST)
	public ModelAndView memberDeleteOk(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mav = new ModelAndView();
<<<<<<< HEAD
		LogAspect.logger.info(LogAspect.logMsg+"MC.mDO.req.pw: "+request.getParameter("password_out"));
=======
		LogAspect.logger.info(LogAspect.logMsg + "MC.mDO.req.pw: " + request.getParameter("password"));
>>>>>>> master
		mav.addObject("request", request);
		memberService.memberDeleteOk(mav);
		session.removeAttribute("user_num");
		session.removeAttribute("email");
		session.removeAttribute("email_auth_key");
		session.removeAttribute("register_type");
		return mav;
	}

	// @RequestMapping(value="member/kakaoLogin.do", method=RequestMethod.GET)
	// public ModelAndView memberKakaoLogin(HttpServletRequest request,
	// HttpServletResponse response) {
	// LogAspect.logger.info(LogAspect.logMsg+"MC.mKL.OK");
	// ModelAndView mav = new ModelAndView();
	// mav.setViewName("member/kakaoLogin");
	// return mav;
	// }

	@RequestMapping(value = "member/kakaoLogin.do")
	public ModelAndView memberKakaoLoginOk(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, MemberDto memberDto, @RequestParam("code") String code) {
		ModelAndView mav = new ModelAndView();
		// MemberDto memberDto = new MemberDto();
		String access_Token = memberService.kakaoGetAccessToken(code);
		mav.addObject("memberDto", memberDto);
		// Map<String, Object> userInfoMap =
		// memberService.getUserInfo(access_Token);
		memberService.kakaoGetUserInfo(access_Token, mav);

		LogAspect.logger.info(LogAspect.logMsg + "code: " + code);
		LogAspect.logger.info(LogAspect.logMsg + "MC.access_token=" + access_Token);
		// LogAspect.logger.info(LogAspect.logMsg+"MC.userInfoMap:
		// "+userInfoMap);

		// 이메일이 있을 때는 이메일 저장
		// if(userInfoMap.get("email") != "") {
		// session.setAttribute("email", userInfoMap.get("email"));
		//
		// } else if(userInfoMap.get("nickname") != ""){
		// LogAspect.logger.info(LogAspect.logMsg+"MC.MKLO 이메일 없음/동의안함");
		// //이메일 입력 띄우기 가능
		// }
		Map<String, Object> map = mav.getModelMap();
		memberDto = (MemberDto) map.get("memberDto");
		// session = request.getSession();
		// session.setAttribute("nickname", memberDto.getNickname());
		session.setAttribute("user_auth_id", memberDto.getUser_auth_id());
		session.setAttribute("user_num", memberDto.getUser_num());
		session.setAttribute("access_Token", access_Token);
		session.setAttribute("register_type", memberDto.getRegister_type());
		// mav.addObject("nickname", session.getAttribute("nickname"));
		mav.addObject("user_auth_id", session.getAttribute("user_auth_id"));
		// mav.addObject("access_Token", access_Token);

		mav.setViewName("member/kakaoLoginOk.tiles");
		return mav;
	}

	@RequestMapping(value = "member/kakaoLogout.do")
	public ModelAndView kakaoLogout(HttpSession session, ModelAndView mav) {
		LogAspect.logger.info(LogAspect.logMsg + "MC.kLo.s.gA(a_t): " + (String) session.getAttribute("access_Token"));
		memberService.kakaoLogout((String) session.getAttribute("access_Token"));
		session.removeAttribute("access_Token");
		session.removeAttribute("user_auth_id");
		session.removeAttribute("user_num");
		// session.removeAttribute("nickname");
		session.removeAttribute("register_type");
		mav.setViewName("member/kakaoLogoutOk.tiles");
		return mav;
	}

	@RequestMapping(value = "member/kakaoDelete.do", method = RequestMethod.GET)
	public ModelAndView kakaoDelete(HttpSession session, ModelAndView mav) {
		LogAspect.logger.info(LogAspect.logMsg + "MC.kD.s.gA(u_n): " + session.getAttribute("user_num"));
		LogAspect.logger.info(LogAspect.logMsg + "MC.kD.s.gA(uai): " + session.getAttribute("user_auth_id"));
		LogAspect.logger.info(LogAspect.logMsg + "MC.kD.s.gA(nick): " + session.getAttribute("nickname"));
		LogAspect.logger.info(LogAspect.logMsg + "MC.kD.s.gA(reg_t): " + session.getAttribute("register_type"));

		mav.setViewName("member/kakaoDelete.tiles");
		return mav;
	}

	@RequestMapping(value = "member/kakaoDeleteOk.do", method = RequestMethod.POST)
	public ModelAndView kakaoDeleteOk(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			ModelAndView mav) {
		// session = request.getSession();
		LogAspect.logger.info(LogAspect.logMsg + "MC.kDO.ses.uaid: " + session.getAttribute("user_auth_id"));
		LogAspect.logger.info(LogAspect.logMsg + "MC.kDO.ses.unum: " + session.getAttribute("user_num"));
		LogAspect.logger.info(LogAspect.logMsg + "MC.kDO.ses.reg_t: " + session.getAttribute("register_type"));
		LogAspect.logger.info(LogAspect.logMsg + "MC.kDO.ses.a_t: " + session.getAttribute("access_token"));
		mav.addObject("session", session);
		memberService.kakaoDeleteOk(mav);
		return mav;
	}

	// @RequestMapping(value="member/update.do", method=RequestMethod.GET)
	// public ModelAndView memberUpdate(HttpSession session) {
	// ModelAndView mav = new ModelAndView();
	//
	//
	//
	//
	// LogAspect.logger.info(LogAspect.logMsg+"MC.mU.ses.forKakao: ");
	// LogAspect.logger.info(LogAspect.logMsg+"MC.mU.ses.uaid:
	// "+session.getAttribute("user_auth_id"));
	// LogAspect.logger.info(LogAspect.logMsg+"MC.mU.ses.unum:
	// "+session.getAttribute("user_num"));
	// LogAspect.logger.info(LogAspect.logMsg+"MC.mU.ses.reg_t:
	// "+session.getAttribute("register_type"));
	// return mav;
	// }

	// , MemberDto memberDto 받으면 dto에 profile이 dto에선스트링인데 req에선 파일타입이기때문에 에러남
	@RequestMapping(value = "member/kakaoMemberUpdateOk.do", method = RequestMethod.POST)
	public ModelAndView kakaoMemberUpdateOk(MultipartHttpServletRequest request, HttpServletResponse response,
			HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		// mav.addObject("memberDto", memberDto);
		memberService.kakaoMemberUpdateOk(mav, session);

		return mav;
	}

}
