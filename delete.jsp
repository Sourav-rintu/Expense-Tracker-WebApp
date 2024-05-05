<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%
    // Retrieve parameters
    String category = request.getParameter("category");

    // Database connection parameters
    String mySQLUser = "root";
    String mySQLPwd = "Sourav@24";
    String serverName = "jdbc:mysql://localhost:3306/expense_tracker";
    Connection con = null;

    try {
        // Establish database connection
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(serverName, mySQLUser, mySQLPwd);

        // Fetch the amount corresponding to the deleted category
        double deletedAmount = 0.0;
        PreparedStatement selectStmt = con.prepareStatement("SELECT amount FROM details WHERE Category = ?");
        selectStmt.setString(1, category);
        ResultSet rs = selectStmt.executeQuery();
        if (rs.next()) {
            deletedAmount = rs.getDouble("amount");
        }
        selectStmt.close();

        // Delete the record
        String deleteSQL = "DELETE FROM details WHERE Category = ?";
        PreparedStatement deleteStmt = con.prepareStatement(deleteSQL);
        deleteStmt.setString(1, category);
        deleteStmt.executeUpdate();
        deleteStmt.close();

        // Subtract the deleted amount from the total
        PreparedStatement updateTotalStmt = con.prepareStatement("UPDATE total SET amount = amount - ?");
        updateTotalStmt.setDouble(1, deletedAmount);
        updateTotalStmt.executeUpdate();
        updateTotalStmt.close();

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close the database connection
        if (con != null) {
            try { con.close(); } catch (SQLException e) { /* ignored */ }
        }
    }
%>

<script>
    alert("Expense Deleted Successfully!!");
    window.location.href = "Expenses.jsp";
</script>
