package com.jhj.member;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	private String NAMESPACE = "memberMapper.";
	
	public int getCount() {
		return sqlSession.selectOne(NAMESPACE+"getCount");
	}

}
