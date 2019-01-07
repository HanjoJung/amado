package com.jhj.product;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jhj.util.Pager;

@Repository
public class ProductDAO {
	@Inject
	private SqlSession sqlSession;
	private String NAMESPACE = "productMapper.";

	public int getCount() throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getCount");
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
}
