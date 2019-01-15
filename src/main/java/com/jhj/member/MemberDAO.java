package com.jhj.member;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jhj.util.Pager;

@Repository
public class MemberDAO {

	@Inject
	private SqlSession sqlSession;
	private String NAMESPACE = "memberMapper.";

	public int getCount() throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getCount");
	}

	public List<MemberDTO> list(Pager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE + "list", pager);
	}

	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "login", memberDTO);
	}

	public MemberDTO selectOne(String id) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "selectOne", id);
	}

	public int join(MemberDTO memberDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "join", memberDTO);
	}

	public int checkId(String id) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "checkId", id);
	}

	public int update(MemberDTO memberDTO) throws Exception {
		return sqlSession.update(NAMESPACE + "update", memberDTO);
	}

	public int delete(MemberDTO memberDTO) throws Exception {
		return sqlSession.delete(NAMESPACE + "delete", memberDTO);
	}
}
