package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.entity.ProductEntity;
import com.laptrinhjavaweb.repository.ProductRepositoryWeb;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceWeb {

    @Autowired
    private ProductRepositoryWeb productRepositoryWeb;

    public List<ProductEntity> getAllProducts() {
        return productRepositoryWeb.findAll();
    }
}
