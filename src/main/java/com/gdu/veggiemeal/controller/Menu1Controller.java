package com.gdu.veggiemeal.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gdu.veggiemeal.service.Menu1Service;

@RequestMapping("/menu1")
@Controller
public class Menu1Controller {
	
	@Autowired
	private Menu1Service menu1Service;
	
	@GetMapping("/wanted.form")
	public String scrollPage() {
		return "menu1/wanted";
	}
	
	@ResponseBody  // 이 맵은 제이슨으로 만들어진 데이터다. 리스폰스데이터가 있어야 jsp가 아니라 ajax로 하는 데이터가 되는것.
	@GetMapping(value="/wanted.do", produces="application/json") 
	public Map<String, Object> scroll(HttpServletRequest request) {
		return menu1Service.getSaleListUsingScroll(request);
	}

	
	@GetMapping("/display.do")
	public ResponseEntity<byte[]> display(@RequestParam("saleNo") int saleNo) {
		return menu1Service.display(saleNo);
	}
	
	@GetMapping("/wantedDetail.do")
	public String wantedDetail(HttpServletRequest request, Model model) {
		model.addAttribute("s", menu1Service.getSaleByNo(request));
		return "menu1/wantedDetail";
	}
	
	@GetMapping("/payment.do")
	public String payment() {
		return "menu1/payment";
	}
	
	@GetMapping("/arrest.do")
	public String arrest() {
		return "menu1/arrest";
		
	}

	

}
