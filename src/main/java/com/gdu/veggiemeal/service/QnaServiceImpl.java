package com.gdu.veggiemeal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdu.veggiemeal.domain.QnaDTO;
import com.gdu.veggiemeal.mapper.QnaMapper;

@Service
public class QnaServiceImpl implements QnaService {
	@Autowired
	private QnaMapper qnaMapper;
	@Override
	public List<QnaDTO> getQnaList() {
		return qnaMapper.getQnaList();
	}
}
