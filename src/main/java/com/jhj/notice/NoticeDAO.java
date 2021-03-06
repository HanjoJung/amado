package com.jhj.notice;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jhj.board.BoardDAO;
import com.jhj.board.BoardDTO;
import com.jhj.util.Pager;

@Repository
public class NoticeDAO implements BoardDAO {

	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "noticeMapper.";

	public int hitUp(int num) throws Exception {
		return sqlSession.update(NAMESPACE + "hitUp", num);
	}

	@Override
	public int totalCount(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "totalCount", pager);
	}

	@Override
	public List<BoardDTO> list(Pager pager) throws Exception {

		return sqlSession.selectList(NAMESPACE + "list", pager);
	}

	@Override
	public BoardDTO select(int num) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "select", num);
	}

	@Override
	public int insert(BoardDTO boardDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "insert", boardDTO);
	}

	@Override
	public int update(BoardDTO boardDTO) throws Exception {
		return sqlSession.update(NAMESPACE + "update", boardDTO);
	}

	@Override
	public int delete(int num) throws Exception {
		return sqlSession.delete(NAMESPACE + "delete", num);
	}

}
