package com.gdu.veggiemeal.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gdu.veggiemeal.service.QnaService;

@RequestMapping("/qna")
@Controller
public class QnaController {

	@Autowired
	private QnaService qnaService;
	
	@GetMapping("/list.form")
	public String getqnaList(HttpServletRequest request, Model model) {  // Model : jsp로 forward할 데이터를 저장하는 곳
		qnaService.getQnaList(request, model);
		return "qna/list";
	}
	
	 @GetMapping("/qnaWrite.do")
		public String writeQna() {
			return "qna/qnaWrite";
		}
	
	@PostMapping("/qnaWrite.form")
	public String addqnaList(HttpServletRequest request ,RedirectAttributes redirectAttributes) {
		int addQna = qnaService.addQnaList(request);
		redirectAttributes.addFlashAttribute("addQna", addQna);
		return "redirect:/qna/list.form";
	}
	
	//@PostMapping("/qnaWrite.form")
  //  public int write(HttpServletRequest request, Model model) {
        
		//return null;
    }


	
//}
