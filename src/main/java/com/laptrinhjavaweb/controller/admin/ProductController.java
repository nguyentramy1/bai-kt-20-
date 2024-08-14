package com.laptrinhjavaweb.controller.admin;

import com.laptrinhjavaweb.entity.ProductEntity;
import com.laptrinhjavaweb.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

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
    public String addProduct(@ModelAttribute ProductEntity product, Model model) {
        productService.save(product);
        model.addAttribute("products", productService.findAll());
        return "admin/home";
    }

    @PostMapping("/edit")
    public String editProduct(@ModelAttribute ProductEntity product, Model model) {
        productService.update(product);
        model.addAttribute("products", productService.findAll());
        return "admin/home";
    }

    @PostMapping("/delete")
    public String deleteProduct(@RequestParam("id") Integer id, Model model) {
        productService.deleteById(id);
        model.addAttribute("products", productService.findAll());
        return "admin/home";
    }

    @GetMapping("/{id}")
    @ResponseBody
    public ProductEntity getProductById(@PathVariable("id") Integer id) {
        return productService.findById(id);
    }



}
