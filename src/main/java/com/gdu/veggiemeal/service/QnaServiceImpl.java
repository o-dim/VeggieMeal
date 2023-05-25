package com.gdu.veggiemeal.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Service;
import org.springframework.ui.Model;


import com.gdu.veggiemeal.domain.PersonDTO;
import com.gdu.veggiemeal.domain.QnaDTO;
import com.gdu.veggiemeal.mapper.QnaMapper;
import com.gdu.veggiemeal.util.PageUtil;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class QnaServiceImpl implements QnaService {
	
	private QnaMapper qnaMapper;
	private PageUtil pageUtil;
	
	@Override
	public void getQnaList(HttpServletRequest request, Model model) {
		Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt.orElse("1"));
		int qnaCount = qnaMapper.getQnaCount();
		int recordPerPage = 10;
		pageUtil.setPageUtil(page, qnaCount, recordPerPage);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("begin", pageUtil.getBegin());
		map.put("end", pageUtil.getEnd());
		List<QnaDTO> qnaList = qnaMapper.getQnaList(map);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("pagination", request.getContextPath() + "/qna/list.form");
	}
	
	@Override
	public List<PersonDTO> selectPersonById(String id) {
		return qnaMapper.selectPersonById(id);
	}
	
	@Override
	public int addQnaList(HttpServletRequest request) {
		String title = request.getParameter("title");
		String id = request.getParameter("id");
		String content = request.getParameter("content");
		QnaDTO qnaDTO = new QnaDTO();
	    qnaDTO.setTitle(title);
	    qnaDTO.setContent(content);
	    
	    PersonDTO personDTO = new PersonDTO();
	    personDTO.setId(id);
	    qnaDTO.setPersonDTO(personDTO);
	    
	    int writeResult = qnaMapper.addQnaList(qnaDTO);
	    
	    return writeResult;
	}
}
