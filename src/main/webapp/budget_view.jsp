<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Budget</title>
<style>
body {
	font: 1em/1.618 Inter, sans-serif;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
	background-color: #f5f5f5;
	flex-direction: column;
	padding: 1.5em;
	background: url(https://plus.unsplash.com/premium_photo-1675603849746-4ca44ed748a0?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D)
		center/cover no-repeat fixed;
	justify-content: center;
}

.container {
	max-width: 400px;
	margin: 0 auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
	text-align: center;
	margin-bottom: 20px;
}

p {
	text-align: center;
	margin-bottom: 20px;
}

a {
	display: block;
	text-align: center;
	text-decoration: none;
	color: #007bff;
}
</style>
</head>
<body>
	<div class="container">
		<h2>View Budget</h2>
		<c:if test="${budget ne null}">
			<p>Budget Amount: ${budget.amount}</p>
		</c:if>
		<a href="/manage">Go back to Expense Management</a>
	</div>
</body>
</html>
