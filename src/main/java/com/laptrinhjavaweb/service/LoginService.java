package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.repository.LoginRepository;

public class LoginService {
    private LoginRepository loginRepository = new LoginRepository();

    public String loginProcess(String username, String password) {
        String role = loginRepository.getUserRole(username, password);
        if (role != null) {
            return role; // Trả về role nếu đăng nhập thành công
        } else {
            return "fail";
        }
    }
}
