package com.gdu.veggiemeal.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;


import com.gdu.veggiemeal.domain.PersonDTO;

public interface QnaService {
	public void getQnaList(HttpServletRequest request, Model model);
	public List<PersonDTO> selectPersonById(String id);
	public int addQnaList(HttpServletRequest request, HttpServletResponse response);
	public void getQnaByNo(int qnaNo, Model model);
	public int editQnaList(HttpServletRequest request, HttpServletResponse response);
	
}
