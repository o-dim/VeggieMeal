package com.gdu.veggiemeal.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;


import org.springframework.ui.Model;


import com.gdu.veggiemeal.domain.PersonDTO;

public interface QnaService {
	public void getQnaList(HttpServletRequest request, Model model);
	public List<PersonDTO> selectPersonById(String id);
	public int addQnaList(HttpServletRequest request);

}
