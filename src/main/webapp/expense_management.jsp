<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Expense Management</title>
    <style>
        body {
            font: 1em/1.618 Inter, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            padding: 20px;
            background: url(https://plus.unsplash.com/premium_photo-1675603849746-4ca44ed748a0?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D) center/cover no-repeat fixed;
            flex-direction: column;
        }

        .container {
            width: 90%; 
            max-width: 1000px; 
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            overflow: auto; 
            display: flex;
            flex-direction: column;
        }

        .row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .left-column, .right-column {
            width: calc(50% - 10px);
        }

        .row > div {
            border: 1px solid rgba(0, 0, 0, 0.1); 
            padding: 10px;
            border-radius: 8px;
        }

        .row > div:first-child {
            margin-right: 20px; 
        }

        h2, h3 {
            text-align: center;
            margin-bottom: 20px;
        }

        form, table {
            width: 100%;
        }

        input[type="text"],
        input[type="date"],
        button, a {
            width: calc(100% - 24px); 
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus,
        input[type="date"]:focus,
        button:focus, a:focus {
            border-color: #007bff;
        }

        button, a {
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            display: inline-block;
            width: calc(100% - 24px);
            padding: 12px;
            margin-bottom: 15px;
            text-align: center;
            text-decoration: none;
            border: 1px solid #007bff;
            border-radius: 4px;
            transition: background-color 0.3s, border-color 0.3s;
        }

        button:hover, a:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 8px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        a:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        #del {
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            display: inline-block;
            width: 100px;
            padding: 12px;
            margin-bottom: 15px;
            text-align: center;
            text-decoration: none;
            border: 1px solid #007bff;
            border-radius: 4px;
            transition: background-color 0.3s, border-color 0.3s;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Expense Management</h2>

        <div class="row">
            <div class="left-column">
                <div class="form-section">
                    <h3>Add Expense</h3>
                    <form action="/add" method="post">
                        Description: <input type="text" name="description" required><br>
                        Amount: <input type="text" name="amount" required><br>
                        Expense Date: <input type="date" name="expenseDate" required><br>
                        <button type="submit">Add Expense</button>
                    </form>
                </div>
            </div>

            <div class="right-column">
                <div class="expense-list">
                    <h3>Expense List</h3>
                    <table>
                        <tr>
                            <th>Description</th>
                            <th>Amount</th>
                            <th>Date</th>
                            <th>Action</th>
                        </tr>
                        <c:forEach items="${expenses}" var="expense">
                            <tr>
                                <td>${expense.description}</td>
                                <td>${expense.amount}</td>
                                <td>${expense.expenseDate}</td>
                                <td>
                                    <form action="/delete/${expense.expense_id}" method="post">
                                        <input type="hidden" name="_method" value="delete">
                                        <button type="submit" id="del">Delete</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>

        <div class="expenses-by-month">
            <h3>Expenses by Month</h3>
            <table>
                <tr>
                    <th>Month</th>
                    <th>Total Expense</th>
                    <th>Expense Review</th>
                </tr>
                <c:forEach items="${totalExpensesByMonth}" var="result">
                    <tr>
                        <td>${result[0]}</td>
                        <td>${result[1]}</td>
                        <td><c:choose>
                                <c:when test="${result[1] < budget}">
                                    <span style="color: green;">Under Budget</span>
                                </c:when>
                                <c:otherwise>
                                    <span style="color: red;">Over Budget</span>
                                </c:otherwise>
                            </c:choose></td>
                    </tr>
                </c:forEach>
            </table>
        </div>

        <a href="/set">Set Budget</a>

        <form action="/logout" method="get">
            <button type="submit">Logout</button>
        </form>
    </div>
</body>
</html>
