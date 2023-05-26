package com.gdu.veggiemeal.service;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.gdu.veggiemeal.domain.LeavePersonDTO;
import com.gdu.veggiemeal.domain.PersonDTO;
import com.gdu.veggiemeal.mapper.PersonMapper;
import com.gdu.veggiemeal.util.JavaMailUtil;
import com.gdu.veggiemeal.util.SecurityUtil;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class PersonServiceImpl implements PersonService {
	
	private PersonMapper personMapper;
	private SecurityUtil securityUtil;
	private JavaMailUtil javaMailUtil;
	
	@Override
	public Map<String, Object> verifyId(String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("enableId", personMapper.selectPersonById(id) == null && personMapper.selectSleepPersonById(id) == null && personMapper.selectLeavePersonById(id) == null);
		return map;
	}
	
	@Override
	public Map<String, Object> verifyEmail(String email) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("enableEmail", personMapper.selectPersonByEmail(email) == null && personMapper.selectSleepPersonByEmail(email) == null && personMapper.selectLeavePersonByEmail(email) == null);
		return map;
	}
	
	@Override
	public void join(HttpServletRequest request, HttpServletResponse response) {

		PersonDTO personDTO = new PersonDTO();
		personDTO.setId(request.getParameter("id"));
		personDTO.setPw(securityUtil.getSha256(request.getParameter("pw")));
		personDTO.setName(securityUtil.preventXSS(request.getParameter("name")));
		personDTO.setPhoneno(request.getParameter("phoneno"));
		personDTO.setPostCode(request.getParameter("postCode"));
		personDTO.setRoadAddress(request.getParameter("roadAddress"));
		personDTO.setJibunAddress(request.getParameter("jibunAddress"));
		personDTO.setDetailAddress(securityUtil.preventXSS(request.getParameter("detailAddress")));
		personDTO.setEmail(request.getParameter("email"));
		personDTO.setGender(request.getParameter("gender"));
				
		int joinResult = personMapper.insertPerson(personDTO);
		
		try {
			response.setContentType("text/html; charset=UTF-8");
	        response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			if(joinResult == 1) {
				out.println("alert('회원가입 되었습니다')");
				out.println("location.href = '" + request.getContextPath() + "/person/index.form';");
			} else {
				out.println("alert('회원가입에 실패하였습니다.)");
				out.println("history.go(-2)");
			}
			out.println("</script>");
			out.flush();
			out.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public Map<String, Object> sendAuthCode(String email) {
		String authCode = securityUtil.getRandomString(6, true, true);
		javaMailUtil.sendJavaMail(email, "[인증요청]", "인증번호는 <strong>" + authCode + "</strong>입니다.");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("authCode", authCode);
		return map;
	}
	
	@Override
	public void login(HttpServletRequest request, HttpServletResponse response) {		
		PersonDTO personDTO = new PersonDTO();
		String id = request.getParameter("id");
		personDTO.setId(id);
		personDTO.setPw(securityUtil.getSha256(request.getParameter("pw")));
		
		PersonDTO loginPersonDTO = personMapper.selectPersonByPersonDTO(personDTO);
		if(loginPersonDTO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginId", id);
			try {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('반갑습니다, ${sessionScope.loginId}님.');");
				out.println("</script>");
				response.sendRedirect(request.getContextPath() + "/person/index.form");
				return;
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			try {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('로그인이 실패하였습니다.');");
				out.println("location.href='" + request.getContextPath() + "/person/login.form';");
				out.println("</script>");
				out.flush();
				out.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	@Override
	public void edit(HttpServletRequest request, HttpServletResponse response) {
		String strPw = request.getParameter("pw");
		String pw = securityUtil.getSha256(strPw);
		String phoneNo = request.getParameter("phoneNo");
		PersonDTO personDTO = new PersonDTO();
		personDTO.setPw(pw);
		personDTO.setPhoneno(phoneNo);
		
		int editResult = personMapper.insertPerson(personDTO);
		
		try {
			response.setContentType("text/html; charset=UTF-8");
	        response.setCharacterEncoding("UTF-8");
			PrintWriter out = ((ServletResponse) response).getWriter();
			out.println("<script>");
			if(editResult == 1) {
				out.println("alert('회원정보가 수정되었습니다')");
				out.println("location.href = '" + request.getContextPath() + "/person/mypage.form';");
			} else {
				out.println("alert('회원정보 수정에 실패하였습니다...)");
				out.println("location.href = '" + request.getContextPath() + "/person/mypage.form';");
			}
			out.println("</script>");
			out.flush();
			out.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("loginId");
		if(session.getAttribute("loginId") != null) {
			session.invalidate();
			try {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('로그아웃 되었습니다.');");
				out.println("location.href='" + request.getContextPath() + "/person/index.form';");
				out.println("</script>");
				out.flush();
				out.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
	@Override
	public void leave(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		// 아이디 session에서 가져오기
		String id = (String) session.getAttribute("loginId");
		
		// 나머지 정보는 DTO 에서 가져오기
		PersonDTO personDTO = personMapper.selectPersonById(id);
		
		
		LeavePersonDTO leavePersonDTO = new LeavePersonDTO();
		leavePersonDTO.setId(id);
		leavePersonDTO.setEmail(personDTO.getEmail());
		leavePersonDTO.setJoinedAt(personDTO.getJoinedAt());
		// leavePersonDTO.setLeaveAt(null);
		
		// 탈퇴회원에 넣고, 기존 멤버에서는 삭제
		int leaveResult = personMapper.insertLeavePerson(leavePersonDTO);
		int deleteResult = personMapper.deletePerson(id);
		
		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			if(leaveResult == 1 && deleteResult == 1) {
				session.invalidate();
				out.println("location.href = '" + request.getContextPath() + "/person/index.form';");
			} else {
				out.println("alert('회원 탈퇴에 실패하였습니다')");
				out.println("history.back()");
			}
			out.println("</script>");
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
