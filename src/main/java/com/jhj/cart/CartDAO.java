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

	public int count(String id) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "count", id);
	}
	
	public List<CartDTO> list(String id) throws Exception {
		return sqlSession.selectList(NAMESPACE + "list", id);
	}
	
	public int check(CartDTO cartDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "check", cartDTO);
	}

	public int insert(CartDTO cartDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "insert", cartDTO);
	}

	public int delete(CartDTO cartDTO) throws Exception {
		return sqlSession.delete(NAMESPACE + "delete", cartDTO);
	}

}
