package com.jhj.qna;

import java.io.File;
import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jhj.board.BoardDTO;
import com.jhj.board.BoardService;
import com.jhj.file.FileDAO;
import com.jhj.file.FileDTO;
import com.jhj.util.FileSaver;
import com.jhj.util.Pager;

@Service
public class QnaService implements BoardService {

	@Autowired
	private QnaDAO qnaDAO;
	@Inject
	private FileDAO fileDAO;

	@Override
	public ModelAndView list(Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		int totalCount = qnaDAO.totalCount(pager);
		// row
		pager.makeRow();
		// pageing
		pager.makePage(totalCount);

		mv.addObject("list", qnaDAO.list(pager));
		mv.addObject("pager", pager);
		mv.setViewName("board/boardList");
		return mv;
	}

	@Override
	public ModelAndView select(int num) throws Exception {
		ModelAndView mv = new ModelAndView();
		BoardDTO boardDTO = qnaDAO.select(num);
		if (boardDTO != null) {
			mv.setViewName("board/boardSelect");
			mv.addObject("dto", boardDTO);
		} else {
			mv.setViewName("redirect:./qnaList");
			mv.addObject("msg", "해당 글이 존재하지않습니다.");
		}
		return mv;
	}

	@Override
	public ModelAndView insert(BoardDTO boardDTO, List<MultipartFile> f1, HttpSession session) throws Exception {
		// 1. sequence num 가져오기
		int num = qnaDAO.getNum();

		// 2. qna Table에 insert
		boardDTO.setNum(num);
		int result = qnaDAO.insert(boardDTO);

		// transaction 처리
		if (result < 1) {
			throw new SQLException();
		}

		// 3. HDD에 File Save
		FileSaver fs = new FileSaver();
		String realPath = session.getServletContext().getRealPath("resources/qna");

		for (MultipartFile mFile : f1) {
			if (mFile.isEmpty()) {
				continue;
			}
			// 4. Files table insert
			FileDTO fileDTO = new FileDTO();
			fileDTO.setOname(mFile.getOriginalFilename());
			fileDTO.setFname(fs.saveFile3(realPath, mFile));
			fileDTO.setKind("q");
			fileDTO.setNum(num);

			result = fileDAO.insert(fileDTO);

			if (result < 1) {
				throw new SQLException();
			}
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", "작성 성공");
		mv.setViewName("redirect:./qnaList");
		return mv;
	}

	@Override
	public ModelAndView update(BoardDTO boardDTO, List<MultipartFile> f1, HttpSession session) throws Exception {
		int result = qnaDAO.update(boardDTO);

		if (result < 1) {
			throw new SQLException();
		}

		FileSaver fs = new FileSaver();
		String realPath = session.getServletContext().getRealPath("resources/qna");

		for (MultipartFile mFile : f1) {
			if (mFile.isEmpty()) {
				continue;
			}

			FileDTO fileDTO = new FileDTO();
			fileDTO.setOname(mFile.getOriginalFilename());
			fileDTO.setFname(fs.saveFile3(realPath, mFile));
			fileDTO.setNum(boardDTO.getNum());
			fileDTO.setKind("q");
			result = fileDAO.insert(fileDTO);

			if (result < 1) {
				throw new SQLException();
			}
		}

		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:./qnaSelect?num=" + boardDTO.getNum());
		mv.addObject("msg", "수정 성공");
		return mv;
	}

	@Override
	public ModelAndView delete(int num, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		// 1. notice Delete
		int result = qnaDAO.delete(num);
		if (result < 1) {
			throw new SQLException();
		}

		// 2. HDD Delete 준비
		FileDTO fileDTO = new FileDTO();
		fileDTO.setNum(num);
		fileDTO.setKind("q");
		List<FileDTO> ar = fileDAO.list(fileDTO);

		// 3. Files table Delete
		if (ar.size() != 0) {
			result = fileDAO.deleteAll(fileDTO);

			// 4. HDD Delete
			String realPath = session.getServletContext().getRealPath("resources/notice");
			for (FileDTO fileDTO2 : ar) {
				File file = new File(realPath, fileDTO2.getFname());
				file.delete();
			}
		}

		mv.setViewName("redirect:./qnaList");
		mv.addObject("msg", "삭제 성공");
		return mv;
	}

	public ModelAndView reply(QnaDTO qnaDTO, List<MultipartFile> f1, HttpSession session) throws Exception {
		// 부모의 ref, step, depth
		QnaDTO pQnaDTO = (QnaDTO) qnaDAO.select(qnaDTO.getNum());

		qnaDAO.replyUpdate(pQnaDTO);

		qnaDTO.setRef(pQnaDTO.getRef());
		qnaDTO.setStep(pQnaDTO.getStep() + 1);
		qnaDTO.setDepth(pQnaDTO.getDepth() + 1);

		// 1. sequence num 가져오기
		int num = qnaDAO.getNum();

		// 2. qna Table에 insert
		qnaDTO.setNum(num);
		int result = qnaDAO.reply(qnaDTO);

		// transaction 처리
		if (result < 1) {
			throw new SQLException();
		}

		// 3. HDD에 File Save
		FileSaver fs = new FileSaver();
		String realPath = session.getServletContext().getRealPath("resources/qna");

		for (MultipartFile mFile : f1) {
			if (mFile.isEmpty()) {
				continue;
			}
			// 4. Files table insert
			FileDTO fileDTO = new FileDTO();
			fileDTO.setOname(mFile.getOriginalFilename());
			fileDTO.setFname(fs.saveFile3(realPath, mFile));
			fileDTO.setKind("q");
			fileDTO.setNum(num);

			result = fileDAO.insert(fileDTO);

			if (result < 1) {
				throw new SQLException();
			}
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", "작성 성공");
		mv.setViewName("redirect:./qnaList");

		return mv;
	}
}
