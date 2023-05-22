package com.gdu.veggiemeal.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.veggiemeal.domain.LeavePersonDTO;
import com.gdu.veggiemeal.domain.PersonDTO;
import com.gdu.veggiemeal.domain.SleepPersonDTO;

@Mapper
public interface PersonMapper {
	// 회원가입
	public PersonDTO selectPersonById(String id);
	public SleepPersonDTO selectSleepPersonById(String id);
	public LeavePersonDTO selectLeavePersonById(String id);
	public PersonDTO selectPersonByEmail(String email);
	public SleepPersonDTO selectSleepPersonByEmail(String email);
	public LeavePersonDTO selectLeavePersonByEmail(String email);
	
	public int insertPerson(PersonDTO personDTO);
	
	// 로그인
	public PersonDTO selectPersonByPersonDTO(PersonDTO personDTO);

	// 회원 정보 수정 
	public PersonDTO updatePerson(String id);
	
	// 회원 탈퇴
	public int insertLeavePerson(LeavePersonDTO leavePersonDTO);
	public int deletePerson(String id);
}
