<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Expense-Tracker</title>
<link rel="stylesheet" href="AddMoney.css">
</head>
<body>
	<div class="header">
		<div>
			<button onclick="location.href='dash1.jsp'"><i class="fa-solid fa-house-user"></i></button>
		</div>		
	</div>	
    
	<div class="title">	
			<h2>Add Money</h2>
		
		<form method="post" action="AddExpenses.jsp">
			<div class="field">
				<label>Amount</label>
				<input type="number" name="amount" required>
			</div>
			<div class="field">
				<label>Date</label>
				<input type="date" id="date" name="date" required>
			</div>
			<div class="action-field">
				<input type="submit" value="Add Money">
			</div>
		</form>
	</div>	
</body>
</html>