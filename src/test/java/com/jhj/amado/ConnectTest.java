package com.jhj.amado;

import static org.junit.Assert.*;

import java.util.List;
import java.util.UUID;

import javax.inject.Inject;

import org.junit.Test;

import com.jhj.product.ProductDAO;
import com.jhj.product.ProductDTO;
import com.jhj.util.Pager;

public class ConnectTest extends AbstractTestCase{
	@Inject
	private ProductDAO dao;
	
	@Test
	public void test() throws Exception {
		Pager pager = new Pager();
		pager.makePage(dao.getCount());
		pager.makeRow();
		List<ProductDTO> list = dao.list(pager);
		assertNotNull(list);
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
		
		
	}

}
