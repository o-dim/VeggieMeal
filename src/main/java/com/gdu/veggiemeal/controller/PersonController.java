package com.gdu.veggiemeal.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gdu.veggiemeal.service.PersonService;

@RequestMapping("/person")
@Controller
public class PersonController {
	
	@Autowired
	private PersonService personService;
	
	@GetMapping("/index.form")
	public String main() {
		return "index";
	}

	@GetMapping("/login.form")
	public String login() {
		return "person/login";
	}
	
	@PostMapping("/login.do")
	public void login(HttpServletRequest request, HttpServletResponse response) {
		personService.login(request, response);
	}

	
	@GetMapping("/register.form")
	public String register() {
		return "person/register";
	}
	
	@GetMapping("/edit.form")
	public String edit() {
		return "person/edit";
	}
	
	@GetMapping("/mypage.form")
	public String mypage() {
		return "person/mypage";
	}
	
	@ResponseBody
	@GetMapping(value = "/verifyId.do", produces = "application/json")
	public Map<String, Object> verifyId(@RequestParam("id") String id) {
		return personService.verifyId(id);
	}
	
	@ResponseBody
	@GetMapping(value = "/verifyEmail.do", produces = "application/json")
	public Map<String, Object> verifyEmail(@RequestParam("email") String email) {
		return personService.verifyEmail(email);
	}
	
	@PostMapping("/join.do")
	public void join(HttpServletRequest request, HttpServletResponse response) {
		personService.join(request, response);
	}
	
	@ResponseBody
	@GetMapping(value = "/sendAuthCode.do", produces = "application/json")
	public Map<String, Object> sendAuthCode(@RequestParam("email") String email) {
		return personService.sendAuthCode(email);
	}
	
	@PostMapping("/edit.do")
	public void edit(HttpServletRequest request, HttpServletResponse response) {
		personService.edit(request, response);
	}
	
	@GetMapping("/logout.do")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		personService.logout(request, response);
		return "redirect:" + request.getContextPath() + "/person/index.form";
	}
	@GetMapping("/leave.do")
	public void leave(HttpServletRequest request, HttpServletResponse response) {
		personService.leave(request, response);
	}
}
