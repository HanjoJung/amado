package com.jhj.cart;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAO {

	@Inject
	private SqlSession sqlSession;
	private String NAMESPACE = "cartMapper.";
	
	public List<CartDTO> list() throws Exception {
		return null;
	}
	
}
