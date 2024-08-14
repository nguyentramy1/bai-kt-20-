package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.entity.ProductEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepositoryWeb extends JpaRepository<ProductEntity, Integer> {
}
