<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Expense Tracker</title>
<style>
@import url('https://fonts.googleapis.com/css?family=Poppins');
* {
    padding: 0px;
    margin: 0px;
    box-sizing: border-box;
    font-family: Poppins;
}
body {
    height: 100vh;
    background: linear-gradient(to bottom, #0f0c29, #302b63, #24243e);
    background-size: cover;
}
.header {
    width: 100%;
    padding: 0px 4%;
    height: 75px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    background: whitesmoke;
    box-shadow: 0px 0px 10px black;
}

.header span {
    color: royalblue;
}

.header a {
    padding: 8px 23px;
    background: royalblue;
    color: white;
    outline: none;
    border: none;
    text-decoration: none;
    border-radius: 5px;
    font-size: 15px;
    cursor: pointer;
    transition: background-color 0.3s ease; /* Smooth transition on hover */
}

.header a:hover {
    background-color: dodgerblue; /* Darker blue on hover */
}
/* Navigation Styles */
.container {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
    background-color: whitesmoke; /* Light gray */
    border-radius: 10px;
    box-shadow: 0 0 12px rgba(0, 0, 0, 0.4); /* Add shadow for depth */
}

.buttons {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.Expenses,
.AddMoney {
    padding: 10px 20px;
    background-color: #3498db; /* Blue */
    color: #fff;
    border-radius: 10px;
    transition: background-color 0.3s ease; /* Smooth transition on hover */
}

.Expenses:hover,
.AddMoney:hover {
    background-color: #2980b9; /* Darker blue on hover */
}

.Expenses a,
.AddMoney a {
    color: #fff;
    text-decoration: none;
}

.gap {
	height:20px;
    width: 20px; /* Adjust the width of the gap */
}


</style>
</head>
    <%
        HttpSession ss = request.getSession();
        Object user = ss.getAttribute("user");
        String username="";
        if(user != null)
        {
            username = user.toString();
        }
        else
        {
            response.sendRedirect("Expenses.jsp");
        }
    %>
<body>

    <div class="header">
        <h4>Welcome | <span><%=username %></span></h4>
        <h2>Money Expense Tracker</h2>
        <a href = "logout1.jsp">Logout <i class="fa-solid fa-arrow-right-from-bracket"></i></a>
    </div>
    
	<div class="container">
	    <div class="button">
	        <div class="Expenses">
	            <a href="Expenses.jsp">Expenses</a>
	        </div>
	        <div class="gap"></div>
	        
	        <div class="AddMoney">
	            <a href="AddMoney.jsp">Add Money</a>
	        </div>
	    </div>
	</div>	
</body>
</html>