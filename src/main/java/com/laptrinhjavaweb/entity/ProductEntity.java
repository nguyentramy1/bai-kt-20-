package com.laptrinhjavaweb.entity;

import jakarta.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "product")
public class ProductEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "ten_san_pham")
    private String name;

    @Column(name = "gia")
    private BigDecimal price;

    @Column(name = "gia_khuyen_mai")
    private BigDecimal discountPrice;

    @Column(name = "url_anh")
    private String imageUrl;

    @Column(name = "mo_ta")
    private String description;

    @Column(name = "danh_muc")
    private String category;  // Sửa từ enum thành String

    @Column(name = "trang_thai")
    private String status;  // Sửa từ enum thành String

    // Getters và setters
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getDiscountPrice() {
        return discountPrice;
    }

    public void setDiscountPrice(BigDecimal discountPrice) {
        this.discountPrice = discountPrice;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
