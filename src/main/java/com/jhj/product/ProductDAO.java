package com.jhj.product;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jhj.util.Pager;

@Repository
public class ProductDAO {
	@Inject
	private SqlSession sqlSession;
	private String NAMESPACE = "productMapper.";

	public int getCount(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getCount", pager);
	}

	public List<ProductDTO> list(Pager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE + "list", pager);
	}

	public ProductDTO selectOne(String productCode) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "selectOne", productCode);
	}

	public int insert(ProductDTO productDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "insert", productDTO);
	}

	public int update(ProductDTO productDTO) throws Exception {
		return sqlSession.update(NAMESPACE + "update", productDTO);
	}

	public int delete(String productCode) throws Exception {
		return sqlSession.delete(NAMESPACE + "delete", productCode);
	}
	
	public List<ProductDTO> cart(Map<String, List<String>> cart) throws Exception{
		return sqlSession.selectList(NAMESPACE+"cart", cart);
	}
}
