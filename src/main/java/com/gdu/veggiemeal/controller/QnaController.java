package com.gdu.veggiemeal.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gdu.veggiemeal.service.QnaService;

@RequestMapping("/qna")
@Controller
public class QnaController {

	@Autowired
	private QnaService qnaService;
	
	@GetMapping("/list.do")
	public String pagination(HttpServletRequest request, Model model) {
		qnaService.getQnaList(request, model);
		return "qna/list";
	}

	@GetMapping("/list.form")
	public String getqnaList(HttpServletRequest request, Model model) { // Model : jsp로 forward할 데이터를 저장하는 곳
		qnaService.getQnaList(request, model);
		return "qna/list";
	}

	@GetMapping("/qnaWrite.form")
	public String writeQna() {
		return "qna/qnaWrite";
	}

	@PostMapping("/qnaWrite.do")
	public void addqnaList(HttpServletRequest request, HttpServletResponse response) {
		qnaService.addQnaList(request, response);
	}

	@GetMapping("/qnaDetail.form")
	public String detail(@RequestParam(value = "qnaNo", required = false, defaultValue = "0") int qnaNo, Model model) {
		qnaService.getQnaByNo(qnaNo, model);
		return "qna/qnaDetail";
	}
	
	@PostMapping("/qnaEdit.do")
	public void editqnaList(HttpServletRequest request, HttpServletResponse response) {
		qnaService.editQnaList(request, response);
	}
	
	
	//@GetMapping("/qnaEdit.form")
	public String editQna(@RequestParam(value = "qnaNo", required = false, defaultValue = "0") int qnaNo, Model model) {
		qnaService.getQnaByNo(qnaNo, model);
		return "qna/list";
	}
	
	


}
