package com.gdu.veggiemeal.service;

import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;

import com.gdu.veggiemeal.domain.RecipeDTO;
import com.gdu.veggiemeal.mapper.RecipeMapper;
import com.gdu.veggiemeal.util.MyFileUtil;
import com.gdu.veggiemeal.util.PageUtil;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class RecipeServiceImpl implements RecipeService {

	private RecipeMapper recipeMapper;
	private PageUtil pageUtil;
	private MyFileUtil myfileUtil;
	
	@Override
	public void selectRecipeList(HttpServletRequest request, Model model) {
		
		// 파라미터 page가 전달되지 않는 경우 page=1로 처리한다.
		Optional<String> opt1 = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt1.orElse("1"));
			
		// 전체 레코드 개수를 구한다.
		int totalRecord = recipeMapper.getRecipeCount();
		
		//  recordPerPage = 9로 처리한다.
		int recordPerPage = 3;
		
		// PageUtil(Pagination에 필요한 모든 정보) 계산하기
		pageUtil.setPageUtil(page, totalRecord, recordPerPage);
		
		// DB로 보낼 Map 만들기
		 Map<String, Object> map = new HashMap<String, Object>(); 
		 map.put("begin", pageUtil.getBegin());
		 map.put("end", pageUtil.getEnd());
		 
		// begin ~ end 사이의 목록 가져오기
		 List<RecipeDTO> recipeList = recipeMapper.selectRecipeList(map); 
		
		 // menu2/recipe.jsp로 이동할 때 전달(forward)할 데이터는 Model에 저장한다.
		 model.addAttribute("recipeList", recipeList);
		 model.addAttribute("pagination", pageUtil.getPagination(request.getContextPath() + "/menu2/recipe.do"));
		
	}
	
	@Override
	public ResponseEntity<byte[]> display(int recipeNo) {
		
		RecipeDTO recipeDTO = recipeMapper.getRecipeByNo(recipeNo);
		
		ResponseEntity<byte[]> image = null;
		
		try {
			File file = new File(myfileUtil.getRecipePath(), recipeDTO.getImgfileName());
			image = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return image;
	}
	
	@Override
	public RecipeDTO getRecipeByNo(HttpServletRequest request) {
		String strRecipeNo = request.getParameter("recipeNo");
		int recipeNo = 0;
		if(strRecipeNo != null) {
			recipeNo = Integer.parseInt(strRecipeNo);
		}
		return recipeMapper.getRecipeByNo(recipeNo);
	}
	
	@Override
	public int removeRecipe(int recipeNo) {
		int removeResult = recipeMapper.removeRecipe(recipeNo);
		return removeResult;
	}
	
	@Override
	public void modifyRecipe(HttpServletRequest request, HttpServletResponse response) {
		
		String title = request.getParameter("title");
		String tool = request.getParameter("tool");
		String content1 = request.getParameter("content1");
		String content2 = request.getParameter("content2");
		int recipeNo = Integer.parseInt(request.getParameter("recipeNo"));
		
		RecipeDTO recipeDTO = new RecipeDTO();
		recipeDTO.setTitle(title);
		recipeDTO.setTool(tool);
		recipeDTO.setContent1(content1);
		recipeDTO.setContent2(content2);
		recipeDTO.setRecipeNo(recipeNo);
		
		int modifyResult = recipeMapper.modifyRecipe(recipeDTO);
		
		try {
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			if(modifyResult == 1) {
				out.println("alert('게시글이 수정되었습니다.')");
				out.println("location.href='" + request.getContextPath() + "/menu2/detail.do?recipeNo=" + recipeNo + "'");
			} else {
				out.println("alert('게시글이 수정되지 않았습니다.')");
				out.println("history.back()");
			}
			out.println("</script>");
			out.flush();
			out.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	/*
	 * @Override public int addRecipe(MultipartHttpServletRequest multipartRequest)
	 * {
	 * 
	 * String recipeTitle = multipartRequest.getParameter("recipeTitle"); String
	 * recipeContent2 = multipartRequest.getParameter("recipeContent2");
	 * 
	 * RecipeDTO recipeDTO = new RecipeDTO(); recipeDTO.set
	 * 
	 * return 0; }
	 */
	
}
