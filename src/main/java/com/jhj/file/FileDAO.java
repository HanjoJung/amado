package com.jhj.file;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class FileDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "fileMapper.";

	public int insert(FileDTO fileDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "insert", fileDTO);
	}

	public int deleteAll(FileDTO fileDTO) throws Exception {
		return sqlSession.delete(NAMESPACE + "deleteAll", fileDTO);
	}

	public int delete(int fnum) throws Exception {
		return sqlSession.delete(NAMESPACE + "delete", fnum);
	}

	public FileDTO select(int fnum) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "select", fnum);
	}

	public List<FileDTO> list(FileDTO fileDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE + "list", fileDTO);
	}

}
