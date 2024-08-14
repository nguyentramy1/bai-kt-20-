package com.laptrinhjavaweb.controller.web;

import com.laptrinhjavaweb.entity.ProductEntity;
import com.laptrinhjavaweb.service.ProductServiceWeb;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class ProductControllerWeb {

    @Autowired
    private ProductServiceWeb productServiceWeb;

    @GetMapping("/shop")
    public String shopPage(Model model) {
        List<ProductEntity> products = productServiceWeb.getAllProducts();
        model.addAttribute("products", products);
        return "shop"; // Đây là tên file JSP của bạn
    }
}
