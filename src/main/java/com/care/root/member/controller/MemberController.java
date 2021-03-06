package com.care.root.member.controller;

import java.util.Calendar;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.care.root.common.session.SessionName;
import com.care.root.member.dto.MemberDTO;
import com.care.root.member.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController implements SessionName{
	@Autowired MemberService ms;
	
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	@PostMapping("/user_check")
	public String userCheck(@RequestParam String id,
							@RequestParam String pw,
							@RequestParam(required = false) String autoLogin,
							@RequestParam(required = false) String saveId,
							RedirectAttributes rs) {
		System.out.println("autoLogin : "+ autoLogin);
		
		int result = ms.userCheck(id, pw); 
		if(result == 0) {
			rs.addAttribute("id",id);
			rs.addAttribute("autoLogin",autoLogin);
			rs.addAttribute("saveId",saveId);
			return "redirect:successLogin";
		}
		return "redirect:login";
	}
	@GetMapping("/successLogin")
	public String successLogin(@RequestParam String id,
			@RequestParam(required = false) String autoLogin,
			@RequestParam(required = false) String saveId,
						HttpSession session,
						HttpServletResponse response) {
		System.out.println("saveId : "+saveId);
		if(saveId != null) {
			int limitTime = 60*60*24*90; //90일
			Cookie idCookie = new Cookie("saveId", id);
			idCookie.setMaxAge(limitTime);
			idCookie.setPath("/");
			response.addCookie(idCookie);
		}
		if(autoLogin != null) {
			int limitTime = 60*60*24*90; //90일
			Cookie loginCookie = new Cookie("loginCookie", session.getId());
			loginCookie.setMaxAge(limitTime);
			loginCookie.setPath("/");
			response.addCookie(loginCookie);
			
			Calendar cal = Calendar.getInstance();
			cal.setTime( new java.util.Date() );
			cal.add(Calendar.MONTH , 3);
			
		java.sql.Date limitDate = new java.sql.Date(cal.getTimeInMillis());
			ms.keepLogin(session.getId(), limitDate, id);
		}
		
		session.setAttribute( LOGIN, id);
		return "redirect:/main";

	}
	
	@GetMapping("logout")
	public String logout(HttpSession session, HttpServletResponse response,
	@CookieValue(value="loginCookie", required = false) Cookie loginCookie) {
		if(session.getAttribute( LOGIN ) != null) {
			if(loginCookie != null) {
				loginCookie.setMaxAge(0);
				loginCookie.setPath("/");
				response.addCookie(loginCookie);
			ms.keepLogin("nan", 
				new java.sql.Date(System.currentTimeMillis() ), 
						(String)session.getAttribute(LOGIN)
					);
			}
			session.invalidate();
		}
		return "redirect:/main";
	}
	
	@GetMapping("memberInfo")
	public String memberInfo(Model model, HttpSession session) {
		//if(session.getAttribute(LOGIN) != null) {
		ms.memberInfo(model);
		return "member/memberInfo";
		//}
		//return "redirect:login";
	}
	@GetMapping("info")
	public String info(@RequestParam String id, Model model) {
		ms.getMember(id, model);
		return "member/info";
	}
	@GetMapping("register_form")
	public String registerForm() {
		return "member/register";
	}
	@PostMapping("register")
	public String register(MemberDTO dto) {
		int result = ms.register(dto);
		if(result == 1)
			return "redirect:login";
		return "redirect:register_form";
	}
	
//	@ResponseBody
//	@RequestMapping(value = "idCheck.do", method = { RequestMethod.GET, RequestMethod.POST })
//	public String idCheck(String id) {
//		boolean getId = ms.getId(id);
//		return getId + "";
//	}

	
}
