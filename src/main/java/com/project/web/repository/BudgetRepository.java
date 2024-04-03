package com.project.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.project.web.model.Budget;
import com.project.web.model.User;

import java.util.Optional;


public interface BudgetRepository extends JpaRepository<Budget, Integer>{

	 Optional<Budget> findByUser(User user);
	 @Query("SELECT b FROM Budget b WHERE b.user.id = :userId")
	 Budget findBudgetByUserId(@Param("userId") Integer userId);
	 
}
