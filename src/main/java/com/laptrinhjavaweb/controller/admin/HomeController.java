package com.laptrinhjavaweb.controller.admin;

import com.laptrinhjavaweb.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/home")
public class HomeController {

    @Autowired
    private ProductService productService;

    @GetMapping
    public String showHomePage(Model model) {
        model.addAttribute("products", productService.findAll());
        return "admin/home"; // Trả về trang home.jsp
    }
}
