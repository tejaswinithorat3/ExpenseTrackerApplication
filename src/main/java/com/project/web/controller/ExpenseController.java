package com.project.web.controller;

import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import com.project.web.model.Budget;
import com.project.web.model.Expense;
import com.project.web.model.User;
import com.project.web.repository.BudgetRepository;
import com.project.web.repository.ExpenseRepository;
import com.project.web.repository.UserRepository;

@Controller
public class ExpenseController {

	@Autowired
    private ExpenseRepository expenseRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BudgetRepository budgetRepository;
    
    @GetMapping("/manage")
    public String showExpenseManagementPage(Model model, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/login";
        }
        List<Object[]> totalExpensesByMonth = expenseRepository.findTotalExpenseByMonth(loggedInUser.getUser_id());
        
        model.addAttribute("totalExpensesByMonth", totalExpensesByMonth);
        Budget budget = budgetRepository.findBudgetByUserId(loggedInUser.getUser_id());
        if (budget != null) {
            model.addAttribute("budget", budget.getAmount());
        } else {
            model.addAttribute("budget", 0.0); 
        }
        List<Expense> expenses = expenseRepository.findByUser(loggedInUser);
        model.addAttribute("expenses", expenses);
        
        
        return "expense_management";
    }

    @PostMapping("/add")
    public String addExpense(@ModelAttribute Expense expense, HttpSession session, Model model) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/login";
        }
        expense.setUser(loggedInUser);
        expenseRepository.save(expense);
        model.addAttribute("successMessage", "Expense added successfully!");
        return "redirect:/manage";
    }

    @PostMapping("/delete/{id}")
    public String deleteExpense(@PathVariable int id, HttpSession session, Model model) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/login";
        }
        expenseRepository.deleteById(id);
        model.addAttribute("successMessage", "Expense deleted successfully!");
        return "redirect:/manage";
    }
    
}