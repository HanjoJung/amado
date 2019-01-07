package com.jhj.amado;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Test;

import com.jhj.product.ProductDAO;

public class dbTest extends AbstractTestCase{
	@Inject
	private ProductDAO dao;
	
	@Test
	public void test() throws Exception {
		int n = dao.getCount();
		assertEquals(2, n);
	}

}
