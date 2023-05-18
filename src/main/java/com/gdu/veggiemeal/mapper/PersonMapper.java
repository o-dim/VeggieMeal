package com.gdu.veggiemeal.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.veggiemeal.domain.LeavePersonDTO;
import com.gdu.veggiemeal.domain.PersonDTO;
import com.gdu.veggiemeal.domain.SleepPersonDTO;

@Mapper
public interface PersonMapper {
	public PersonDTO selectPersonById(String id);
	public SleepPersonDTO selectSleepPersonById(String id);
	public LeavePersonDTO selectLeavePersonById(String id);
	public PersonDTO selectPersonByEmail(String email);
	public SleepPersonDTO selectSleepPersonByEmail(String email);
	public LeavePersonDTO selectLeavePersonByEmail(String email);
}
