package com.jhj.amado;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.junit.Test;

import com.jhj.product.ProductDAO;
import com.jhj.product.ProductDTO;
import com.jhj.util.Pager;

public class dbTest extends AbstractTestCase{
	@Inject
	private ProductDAO dao;
	@Test
	public void test() throws Exception {
//		Pager pager = new Pager();
//		pager.makePage(dao.getCount());
//		pager.makeRow();
//		List<ProductDTO> list = dao.list(pager);
//		assertNotNull(list);
//		
//		ProductDTO dto = dao.selectOne("1");
//		assertNotNull(dto);
//		
//		dto.setProductCode(UUID.randomUUID().toString());
//		System.out.println(dto.getProductCode());
//		int result = dao.insert(dto);
//		assertNotEquals(0, result);
//		
//		ProductDTO productDTO = new ProductDTO();
//		productDTO.setProductCode(dto.getProductCode());
//		productDTO.setProductColor("red");
//		productDTO.setProductName("");
//		productDTO.setBrand("s");
//		productDTO.setPrice(1200);
//		productDTO.setContents("contents");
//		productDTO.setHit(2);
//		result = dao.update(productDTO);
//		assertNotEquals(0, result);
//		
//		result = dao.delete("054cd9eb-8191-4a8c-a325-e25909029033");
//		assertNotEquals(0, result);
		
		String [] s = {"1","2","3","4","5","6"};
		List<String> ar = new ArrayList<String>();
		Map<String, String[]> map = new HashMap<String, String[]>();
		ar.add("1");
		ar.add("2");
		ar.add("3");
		ar.add("4");
		ar.add("5");
		ar.add("6");
		Map<String, List<String>> mapar = new HashMap<String, List<String>>();
		map.put("cart", s);
		
	}
}
