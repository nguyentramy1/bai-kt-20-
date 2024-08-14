package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.entity.ProductEntity;
import com.laptrinhjavaweb.repository.ProductRepository;
import com.laptrinhjavaweb.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductRepository productRepository;

    @Override
    public List<ProductEntity> findAll() {
        return productRepository.findAll();
    }

    @Override
    public ProductEntity findById(Integer id) {
        Optional<ProductEntity> product = productRepository.findById(id);
        return product.orElse(null);
    }

    @Override
    public void save(ProductEntity product) {
        productRepository.save(product);
    }

    @Override
    public void update(ProductEntity product) {
        productRepository.save(product);
    }

    @Override
    public void deleteById(Integer id) {
        productRepository.deleteById(id);
    }
}
