package com.jhj.product;

import java.util.List;

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
}
