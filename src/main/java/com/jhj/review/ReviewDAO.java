package com.jhj.review;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAO {

	@Inject
	private SqlSession sqlSession;
	private String NAMESPACE = "reviewMapper.";

	public int getCount(String productCode) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getCount", productCode);
	}

	public List<ReviewDTO> list(HashMap<String, Object> map) throws Exception {
		return sqlSession.selectList(NAMESPACE + "list", map);
	}

	public int insert(ReviewDTO reviewDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "insert", reviewDTO);
	}

	public int delete(int num) throws Exception {
		return sqlSession.delete(NAMESPACE + "delete", num);
	}

}
