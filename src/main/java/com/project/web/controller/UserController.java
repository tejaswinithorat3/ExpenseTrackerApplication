package com.project.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.project.web.model.User;
import com.project.web.repository.UserRepository;

@Controller
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/register")
    public String showRegistrationForm() {
        return "user_registration";
    }

    @PostMapping("/register")
    public String registerUser(@RequestParam("email") String email,
                               @RequestParam("password") String password,
                               Model model) {
        User user = new User(email, password);
        userRepository.save(user);
        model.addAttribute("successMessage", "User registered successfully!");
        return "user_login";
    }

    @GetMapping("/login")
    public String showLoginForm() {
        return "user_login";
    }

    @PostMapping("/login")
    public String loginUser(@RequestParam("email") String email,
                            @RequestParam("password") String password,
                            HttpSession session,
                            Model model) {
        User existingUser = userRepository.findByEmailAndPassword(email, password);
        if (existingUser != null) {
            session.setAttribute("loggedInUser", existingUser);
            return "redirect:/manage";
        } else {
            model.addAttribute("errorMessage", "Invalid email or password");
            return "user_login";
        }
    }
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }

}