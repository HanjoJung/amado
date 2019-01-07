package com.jhj.member;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jhj.product.ProductDTO;
import com.jhj.util.Pager;

@Repository
public class MemberDAO {

	@Inject
	private SqlSession sqlSession;
	private String NAMESPACE = "memberMapper.";
}
