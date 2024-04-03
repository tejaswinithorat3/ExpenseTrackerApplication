<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Set Budget</title>
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

form {
	margin-bottom: 20px;
}

input[type="text"], button {
	width: 100%;
	padding: 12px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	transition: border-color 0.3s;
}

input[type="text"]:focus, button:focus {
	border-color: #007bff;
}

button {
	background-color: #007bff;
	color: #fff;
	cursor: pointer;
}

button:hover {
	background-color: #0056b3;
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
		<h2>Set Budget</h2>
		<form action="/set" method="post">
			<label for="amount">Budget Amount:</label> <input type="text"
				id="amount" name="amount" required><br>
			<button type="submit">Set Budget</button>
		</form>
		<a href="/view">View Budget</a>
	</div>
</body>
</html>
