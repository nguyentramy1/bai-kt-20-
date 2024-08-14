package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.entity.ProductEntity;

import java.util.List;

public interface ProductService {

    List<ProductEntity> findAll();

    ProductEntity findById(Integer id);

    void save(ProductEntity product);

    void update(ProductEntity product);

    void deleteById(Integer id);
}
