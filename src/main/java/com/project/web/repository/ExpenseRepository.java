package com.project.web.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.project.web.model.Expense;
import com.project.web.model.User;

public interface ExpenseRepository extends JpaRepository<Expense, Integer>{

	List<Expense> findByUser(User user);
	
	@Query("SELECT MONTH(e.expenseDate) AS month, SUM(e.amount) AS totalAmount FROM Expense e WHERE e.user.id = :userId GROUP BY MONTH(e.expenseDate)")
    List<Object[]> findTotalExpenseByMonth(@Param("userId") int userId);

   
}
