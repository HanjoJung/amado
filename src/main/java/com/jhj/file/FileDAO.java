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

	public int update(FileDTO fileDTO) throws Exception {
		return sqlSession.update(NAMESPACE + "update", fileDTO);
	}

	public int delete(FileDTO fileDTO) throws Exception {
		return sqlSession.delete(NAMESPACE + "delete", fileDTO);
	}

	public FileDTO select(int fnum) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "select", fnum);
	}

	public List<FileDTO> list(int num) throws Exception {
		return sqlSession.selectList(NAMESPACE + "list", num);
	}

}
