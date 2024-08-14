package com.laptrinhjavaweb.controller.admin;

import com.laptrinhjavaweb.entity.ProductEntity;
import com.laptrinhjavaweb.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin/products")
public class ProductController {

    @Autowired
    private ProductService productService;

    @GetMapping
    public String listProducts(Model model) {
        List<ProductEntity> products = productService.findAll();
        model.addAttribute("products", products);
        return "admin/home"; // Return to the home.jsp view
    }

    @PostMapping("/add")
    public String addProduct(@ModelAttribute ProductEntity product) {
        productService.save(product);
        return "redirect:/admin/products";
    }

    @PostMapping("/edit")
    public String editProduct(@ModelAttribute ProductEntity product) {
        productService.update(product);
        return "redirect:/admin/products";
    }

    @PostMapping("/delete")
    public String deleteProduct(@RequestParam("id") Integer id) {
        productService.deleteById(id);
        return "redirect:/admin/products";
    }

    @GetMapping("/{id}")
    @ResponseBody
    public ProductEntity getProductById(@PathVariable("id") Integer id) {
        return productService.findById(id);
    }
}
