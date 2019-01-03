package com.jhj.product;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class ProductService {
	
	@Inject
	private ProductDAO productDAO;

}
