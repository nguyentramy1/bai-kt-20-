package com.laptrinhjavaweb.controller.web;

import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.service.LoginService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "homeControllerOfWeb")
public class HomeController {

    private LoginService loginService = new LoginService();

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView homePage() {
        // Điều hướng đến trang đăng nhập
        return new ModelAndView("redirect:/login");
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView loginPage() {
        return new ModelAndView("login");
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView loginProcess(@ModelAttribute("model") UserDTO model) {
        String role = loginService.loginProcess(model.getUserName(), model.getPassword());
        if ("ADMIN".equals(role)) {
            return new ModelAndView("redirect:/admin/home");
        } else if ("USER".equals(role)) {
            return new ModelAndView("redirect:/san-pham");
        } else {
            return new ModelAndView("redirect:/login?message=fail");
        }
    }

    @RequestMapping(value = "/san-pham", method = RequestMethod.GET)
    public ModelAndView productPage() {
        return new ModelAndView("web/product");
    }
}
