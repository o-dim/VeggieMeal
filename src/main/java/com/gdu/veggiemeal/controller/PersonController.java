package com.gdu.veggiemeal.controller;

import java.util.Map;

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
	
	@GetMapping("/login.do")
	public String personLogin() {
		return "person/login";
	}
	@GetMapping("/edit.do")
	public String personEdit() {
		return "person/edit";
	}
	@GetMapping("/mypage.do")
	public String mypage() {
		return "person/mypage";
	}
	
	@ResponseBody
	@GetMapping(value = "/verifyId.form", produces = "application/json")
	public Map<String, Object> verifyId(@RequestParam("id") String id) {
		return personService.verifyId(id);
	}
	
	@ResponseBody
	@GetMapping(value = "/verifyEmail.form", produces = "application/json")
	public Map<String, Object> verifyEmail(@RequestParam("email") String email) {
		return personService.verifyEmail(email);
	}
	
	@PostMapping("/joinPerson.form")
	public Map<String, Object> joinPerson
}
