package com.jhj.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jhj.util.Pager;

@Service
public class ProductService {

	@Inject
	private ProductDAO productDAO;

	public List<ProductDTO> list(Pager pager) throws Exception {
		int totalCount = productDAO.getCount();
		pager.makePage(totalCount);
		pager.makeRow();
		return productDAO.list(pager);
	}

	public ProductDTO selectOne(String productCode) throws Exception {
		return productDAO.selectOne(productCode);
	}

	public int insert(ProductDTO productDTO) throws Exception {
		return productDAO.insert(productDTO);
	}

	public int update(ProductDTO productDTO) throws Exception {
		return productDAO.update(productDTO);
	}

	public int delete(String productCode) throws Exception {
		return productDAO.delete(productCode);
	}

	public List<ProductDTO> cart() throws Exception {
		List<String> ar = new ArrayList<String>();
		ar.add("1");
		ar.add("2");
		ar.add("3");
		ar.add("4");
		ar.add("5");
		ar.add("6");
		Map<String, List<String>> map = new HashMap<String, List<String>>();
		map.put("cart", ar);
		return productDAO.cart(map);
	}
}
