package com.gdu.veggiemeal.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.gdu.veggiemeal.domain.RecipeDTO;
import com.gdu.veggiemeal.mapper.RecipeMapper;
import com.gdu.veggiemeal.util.PageUtil;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class RecipeServiceImpl implements RecipeService {

	private RecipeMapper menu2Mapper;
	private PageUtil pageUtil;
	
	@Override
	public Map<String, Object> selectRecipeList(HttpServletRequest request) {
		
		// 파라미터 page가 전달되지 않는 경우 page=1로 처리한다.
		Optional<String> opt1 = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt1.orElse("1"));
			
		// 전체 레코드 개수를 구한다.
		int totalRecord = menu2Mapper.getRecipeCount();
		
		//  recordPerPage = 9로 처리한다.
		int recordPerPage = 9;
		
		// PageUtil(Pagination에 필요한 모든 정보) 계산하기
		pageUtil.setPageUtil(page, totalRecord, recordPerPage);
		
		// DB로 보낼 Map 만들기
		 Map<String, Object> map = new HashMap<String, Object>(); 
		  map.put("begin", pageUtil.getBegin());
		  map.put("end", pageUtil.getEnd());
		 
		
		// begin ~ end 사이의 목록 가져오기
		 List<RecipeDTO> recipeList = menu2Mapper.selectRecipeList(map); 
		
		// scroll.jsp로 응답할 데이터
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("recipeList", recipeList);
		resultMap.put("totalPage", pageUtil.getTotalPage());
		
		// 응답
		return resultMap;
		
	}
	
	

}
