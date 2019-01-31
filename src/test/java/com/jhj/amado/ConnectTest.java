package com.jhj.amado;

import static org.junit.Assert.*;

import java.util.List;
import java.util.UUID;

import javax.inject.Inject;

import org.junit.Test;

import com.jhj.product.ProductDAO;
import com.jhj.product.ProductDTO;
import com.jhj.util.Pager;

public class ConnectTest extends AbstractTestCase {
	@Inject
	private ProductDAO dao;

	@Test
	public void test() throws Exception {
		Pager pager = new Pager();
		int n = dao.getCount(pager);
		assertEquals(2, n);
	}

}
