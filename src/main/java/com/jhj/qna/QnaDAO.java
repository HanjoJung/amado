package com.jhj.qna;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jhj.board.BoardDAO;
import com.jhj.board.BoardDTO;
import com.jhj.util.Pager;
@Repository
public class QnaDAO implements BoardDAO {
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="qnaMapper.";

	@Override
	public int getNum() throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getNum");
	}

	@Override
	public int totalCount(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"totalCount",pager);
	}
	
	@Override
	public List<BoardDTO> list(Pager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE+"list", pager);
	}

	@Override
	public BoardDTO select(int num) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"select", num);
	}

	//원본글 작성
	@Override
	public int insert(BoardDTO boardDTO) throws Exception {
		
		return sqlSession.insert(NAMESPACE+"insert", boardDTO);
	}
	//답글 작성
	public int reply(QnaDTO qnaDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"reply", qnaDTO);
	}
	
	public int replyUpdate(QnaDTO qnaDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"replyUpdate", qnaDTO);
	}

	@Override
	public int update(BoardDTO boardDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"update", boardDTO);
	}

	@Override
	public int delete(int num) throws Exception {
		return sqlSession.delete(NAMESPACE+"delete", num);
	}

}
