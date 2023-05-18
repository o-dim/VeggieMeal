package com.gdu.veggiemeal.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdu.veggiemeal.mapper.PersonMapper;

@Service
public class PersonServiceImpl implements PersonService {
	@Autowired
	private PersonMapper personMapper;
	
	@Override
	public Map<String, Object> verifyId(String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("enableId", personMapper.selectPersonById(id) != null && personMapper.selectSleepPersonById(id) != null && personMapper.selectLeavePersonById(id) != null);
		return map;
	}
	
	@Override
	public Map<String, Object> verifyEmail(String email) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("enableEmail", personMapper.selectPersonByEmail(email) != null && personMapper.selectSleepPersonByEmail(email) != null && personMapper.selectLeavePersonByEmail(email) != null);
		return map;
	}
}
