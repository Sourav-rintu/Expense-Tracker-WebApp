<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
<%@page import="java.sql.*"%>
<%
	String date;
	String category;
	double amount;
	date=request.getParameter("date");
	category=request.getParameter("category");
	amount=Double.parseDouble(request.getParameter("amount"));
	
	
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/expense_tracker","root","Sourav@24");
	String sql="INSERT INTO details VALUES(?,?,?);";
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setString(1,category);
	ps.setDouble(2,amount);
	ps.setString(3,date);
	
	
	
	ps.executeUpdate();ps.close();con.close();
%>
<script>
	alert('Successfull!!')
</script>
<%
	response.sendRedirect("Expenses.jsp");
%>		
	