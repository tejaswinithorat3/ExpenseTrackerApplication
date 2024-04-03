package com.project.web.controller;

public class ComparisonResult {

	private Integer month;
    private Double totalExpenseAmount;
    private Double budgetAmount;
    private boolean withinBudget;
    
    public ComparisonResult(Integer month, Double totalExpenseAmount, Double budgetAmount, boolean withinBudget) {
        this.month = month;
        this.totalExpenseAmount = totalExpenseAmount;
        this.budgetAmount = budgetAmount;
        this.withinBudget = withinBudget;
    }

	public Integer getMonth() {
		return month;
	}

	public void setMonth(Integer month) {
		this.month = month;
	}

	public Double getTotalExpenseAmount() {
		return totalExpenseAmount;
	}

	public void setTotalExpenseAmount(Double totalExpenseAmount) {
		this.totalExpenseAmount = totalExpenseAmount;
	}

	public Double getBudgetAmount() {
		return budgetAmount;
	}

	public void setBudgetAmount(Double budgetAmount) {
		this.budgetAmount = budgetAmount;
	}

	public boolean isWithinBudget() {
		return withinBudget;
	}

	public void setWithinBudget(boolean withinBudget) {
		this.withinBudget = withinBudget;
	}
}
