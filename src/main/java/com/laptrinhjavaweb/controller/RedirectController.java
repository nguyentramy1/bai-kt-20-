package com.laptrinhjavaweb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RedirectController {

    @RequestMapping(value = "/")
    public ModelAndView redirectToLogin() {
        return new ModelAndView("redirect:/login");
    }
}
