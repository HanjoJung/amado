package com.jhj.board;

import java.sql.Date;
import java.util.List;

import com.jhj.file.FileDTO;

public class BoardDTO {

	private int num;
	private String title;
	private String writer;
	private String contents;
	private Date reg_date;
	private int hit;

	private List<FileDTO> files;

	public List<FileDTO> getFiles() {
		return files;
	}

	public void setFiles(List<FileDTO> files) {
		this.files = files;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

}
