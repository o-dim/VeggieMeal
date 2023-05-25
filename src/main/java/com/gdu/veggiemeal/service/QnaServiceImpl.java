package com.gdu.veggiemeal.service;


import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	public int addQnaList(HttpServletRequest request, HttpServletResponse response) {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String id = request.getParameter("id");
		QnaDTO qnaDTO = new QnaDTO();
	    qnaDTO.setTitle(title);
	    qnaDTO.setContent(content);
	    PersonDTO personDTO = new PersonDTO();
	    personDTO.setId(id);
	    qnaDTO.setPersonDTO(personDTO);
	    int writeResult = qnaMapper.addQnaList(qnaDTO);
	    try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			if (writeResult == 1) {
				out.println("alert('게시글이 등록되었습니다.')");
				out.println("location.href='" + request.getContextPath() + "/qna/list.form'");
			} else {
				out.println("alert('게시글이 등록되지 않았습니다.')");
				out.println("history.back()");
			}
			out.println("</script>");
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	    return writeResult;
	}
	
	@Override
	public void getQnaByNo(int qnaNo, Model model) {
		model.addAttribute("qnaDTO", qnaMapper.getQnaByNo(qnaNo));
		
		
	}
}
