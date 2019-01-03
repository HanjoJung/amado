package com.jhj.product;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAO {
	@Inject
	private SqlSession sqlSession;
	private String NAMESPACE = "productMapper.";
	
	public int getCount() throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getCount");
	}
}
