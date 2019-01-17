package com.jhj.cart;

import com.jhj.product.ProductDTO;

public class CartDTO extends ProductDTO {
	private int num;
	private String id;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
