<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login</title>
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
	text-align: center;
}

h2 {
	margin-bottom: 20px;
}

form {
	display: inline-block;
	width: 300px;
	padding: 20px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	text-align: left; 
}

input[type="email"], input[type="password"], button {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
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
	text-decoration: none;
	color: #007bff;
}
</style>
</head>
<body>
	<div class="container">
		<h2>User Login</h2>
		<form action="/login" method="post">
			Email: <input type="email" name="email" required><br>
			Password: <input type="password" name="password" required><br>
			<button type="submit">Login</button>
		</form>
		<p>
			Not Registered Yet? Then <a href="/register">Click Here</a>
		</p>
	</div>
</body>
</html>
