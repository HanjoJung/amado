package com.jhj.product;

import java.sql.Date;
import java.util.List;
import java.util.UUID;

import com.jhj.file.FileDTO;

public class ProductDTO {

	private String productCode;
	private String productName;
	private int price;
	private String kind;
	private String contents;
	private int hit;
	private int sale;
	private int good;
	private String brand;
	private int stock;
	private Date reg_data;
	private int score;
	private List<FileDTO> file;

	public String getProductCode() {
		if (productCode == null || productCode == "") {
			productCode = UUID.randomUUID().toString();
		}
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getSale() {
		return sale;
	}

	public void setSale(int sale) {
		this.sale = sale;
	}

	public int getGood() {
		return good;
	}

	public void setGood(int good) {
		this.good = good;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public Date getReg_data() {
		return reg_data;
	}

	public void setReg_data(Date reg_data) {
		this.reg_data = reg_data;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public List<FileDTO> getFile() {
		return file;
	}

	public void setFile(List<FileDTO> file) {
		this.file = file;
	}

}
