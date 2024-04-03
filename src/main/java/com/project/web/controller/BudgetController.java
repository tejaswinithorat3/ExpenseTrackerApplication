package com.project.web.controller;


import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.web.model.Budget;
import com.project.web.model.User;
import com.project.web.repository.BudgetRepository;
import com.project.web.repository.UserRepository;

@Controller
public class BudgetController {

	 @Autowired
	    private BudgetRepository budgetRepository;

	    @Autowired
	    private UserRepository userRepository;

	    @GetMapping("/set")
	    public String showSetBudgetForm(Model model, HttpSession session) {
	        User loggedInUser = (User) session.getAttribute("loggedInUser");
	        if (loggedInUser == null) {
	            return "redirect:/login";
	        }
	        model.addAttribute("budget", new Budget());
	        return "budget_set";
	    }

	    @PostMapping("/set")
	    public String setBudget(@RequestParam double amount, HttpSession session, Model model) {
	        User loggedInUser = (User) session.getAttribute("loggedInUser");
	        if (loggedInUser == null) {
	            return "redirect:/login";
	        }
	        Optional<Budget> existingBudget = budgetRepository.findByUser(loggedInUser);
	        if (existingBudget.isPresent()) {
	            Budget budget = existingBudget.get();
	            budget.setAmount(amount);
	            budgetRepository.save(budget);
	        } else {
	            Budget newBudget = new Budget(amount, loggedInUser);
	            budgetRepository.save(newBudget);
	        }
	        model.addAttribute("successMessage", "Budget set successfully!");
	        return "redirect:/view";
	    }

	    @GetMapping("/view")
	    public String viewBudget(Model model, HttpSession session) {
	        User loggedInUser = (User) session.getAttribute("loggedInUser");
	        if (loggedInUser == null) {
	            return "redirect:/login";
	        }
	        Optional<Budget> optionalBudget = budgetRepository.findByUser(loggedInUser);
	        if (optionalBudget.isPresent()) {
	            Budget budget = optionalBudget.get();
	            model.addAttribute("budget", budget);
	        }
	        else {
	            model.addAttribute("budget", 0.0); 
	        }
	        return "budget_view";
	    }
}