package com.project.web.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;


@Entity
public class Budget {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int budget_id;

    private double amount;

    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;

    public Budget() {
    }

    public Budget(double amount, User user) {
        this.amount = amount;
        this.user = user;
    }

	public int getBudget_id() {
		return budget_id;
	}

	public void setBudget_id(int budget_id) {
		this.budget_id = budget_id;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}
