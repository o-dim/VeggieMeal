package com.gdu.veggiemeal.service;

import java.util.Map;

public interface PersonService {
	public Map<String, Object> verifyId(String id);
	public Map<String, Object> verifyEmail(String email);
}
