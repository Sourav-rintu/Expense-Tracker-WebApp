<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Expense-Tracker</title>
<link rel="stylesheet" href="Expenses.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>
<%@ page import="java.sql.*"%>
<div class="header">
	<div>
		<button onclick="location.href='dash1.jsp'"><i class="fa-solid fa-house-user"></i></button>
		<button onclick="goBack()"><i class="fa-solid fa-angles-left"></i></button>
	</div>	
	<h1>Expenses<span>List</span></h1>
	<button onclick="toggle()">Add Expenses<i class="fa-solid fa-plus"></i></button>
</div>

<div class="details">
		<table>
			<thead>
				<tr>
					<th>Category</th>
					<th>Amount</th>
					<th>Date</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<%
					Class.forName("com.mysql.jdbc.Driver");
					String mySQLUser="root";
					String mySQLPwd="Sourav@24";
					String serverName="jdbc:mysql://localhost:3306/expense_tracker";
					Connection con = DriverManager.getConnection(serverName,mySQLUser,mySQLPwd);
					
					PreparedStatement ps=con.prepareStatement("SELECT * FROM details;");
					ResultSet rs=ps.executeQuery();
	
					double totalAmount = 0.0; // Initialize total amount
					
					while(rs.next()){
						String category = rs.getString(1);
						double amount = rs.getDouble(2);
						String date = rs.getString(3);
						
						// Add amount to total
						totalAmount += amount;
						
				%>
					<tr>
						<td><%=category%></td>
						<td><%=amount%></td>
						<td><%=date%></td>
						<td>
							<a href="delete.jsp?category=<%=category%>&amount=<%=amount%>"><i class="fa-solid fa-trash"></i></a>
						</td>	
					</tr>
					<%
				}
				%>
			</tbody>
		</table>
	</div>

<!-- Display total amount -->
<div class="total">
    <h2>Total Expenses: <%= totalAmount %></h2>
</div>

<!-- Add Expenses popup -->
<div class="popup" id="popup">
    <div class="title">
        <h2>Add Expenses Details</h2>
    </div>
    <form method="post" action="AddExpenses.jsp">
        <div class="field">
            <label>Category</label>
            <input type="text" name="category" required>
        </div>
        <div class="field">
            <label>Amount</label>
            <input type="number" name="amount" required>
        </div>
        <div class="field">
            <label>Date</label>
            <input type="date" id="date" name="date" required>
        </div>
        <div class="action-field">
            <input type="submit" value="Add Expenses">
        </div>
    </form>
</div>

<script>
    window.onload = toggle();

    function toggle() {
        var popup = document.querySelector("#popup");
        if (popup.style.display == 'none') {
            popup.style.display = 'block';
        } else {
            popup.style.display = 'none';
        }
    }

    function goBack() {
        // Use the history object to navigate back
        window.history.back();
    }
</script>
</body>
</html>
