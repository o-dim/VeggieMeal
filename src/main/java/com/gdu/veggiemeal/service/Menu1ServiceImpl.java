package com.gdu.veggiemeal.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;

import com.gdu.veggiemeal.domain.SaleDTO;
import com.gdu.veggiemeal.mapper.Menu1Mapper;
import com.gdu.veggiemeal.util.PageUtil;

import lombok.AllArgsConstructor;


@AllArgsConstructor
@Service
public class Menu1ServiceImpl implements Menu1Service {
	
	private Menu1Mapper menu1Mapper;
	private PageUtil pageUtil;
	
	@Override
	public ResponseEntity<byte[]> display(int saleNo) {
		SaleDTO saleDTO = menu1Mapper.selectSaleByNo(saleNo);
		ResponseEntity<byte[]> image = null; 
		try {
			File file = new File(saleDTO.getProductDTO().getProdPath(), saleDTO.getProductDTO().getProdImgName());
			image = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return image;
	}
	
	@Override
	public Map<String, Object> getSaleListUsingScroll(HttpServletRequest request) {

		// 파라미터 page가 전달되지 않는 경우 page=1로 처리한다. 
		Optional<String> opt1 = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt1.orElse("1"));
		
		// 전체 레코드 개수를 구한다. 
		int totalRecord = menu1Mapper.getSaleCount();
		
		// recordPerPage=9 한화면에 3X3으로 구현 스크롤한번에 9개씩 보여주기 
		int recordPerPage = 9;
		
		// PageUtuil(Pagination에 필요한 모든 정보) 계산하기
		pageUtil.setPageUtil(page, totalRecord, recordPerPage);
		
		// DB로 보낼 Map 만들기 
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("begin", pageUtil.getBegin());
		map.put("end", pageUtil.getEnd());
		
		// begin  ~ end 사이의 목록 가져오기
		List<SaleDTO> sales = menu1Mapper.getSaleListUsingScroll(map);
		
		// wanted.jsp로 응답할 데이터 
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("sales", sales);
		resultMap.put("totalPage", pageUtil.getTotalPage());

		// 응답
		return resultMap;
	}
	

	@Override
	public SaleDTO getSaleByNo(HttpServletRequest request) {
		String strSaleNo = request.getParameter("saleNo");
		int saleNo = 0;
		if(strSaleNo != null) {
			saleNo = Integer.parseInt(strSaleNo);
		}
		return menu1Mapper.selectSaleByNo(saleNo);
	}

}
