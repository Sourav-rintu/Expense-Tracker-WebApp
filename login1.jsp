<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Expense Tracker</title>
	<link rel="stylesheet" href="login1.css">
</head>


<body>
<%	
	String username="",pwd="";
	HttpSession ss=request.getSession();
	Object user=ss.getAttribute("user");
	if(user!=null)
	{
		response.sendRedirect("dash1.jsp");
	}else{
		Cookie cookies[]=request.getCookies();
		for(int i=0;i<cookies.length;i++){
			if(cookies[i].getName().equals("username")){
				username=cookies[i].getValue();
			}
			if(cookies[i].getName().equals("password")){
				pwd=cookies[i].getValue();	
			}
		}
	}
%>
	<div class="main">  	
		<input type="checkbox" id="chk" aria-hidden="true">

			<div class="signup">
				<form>
					<label for="chk" aria-hidden="true">Sign up</label>
					<input type="text" name="txt" placeholder="User name" required>
					<input type="email" name="email" placeholder="Email" required>
					<input type="password" name="pswd" placeholder="Password" required>
					<button>Sign up</button>
				</form>
			</div>

			<div class="login">
				<form  action="checkLogin1.jsp" method="post">
					<label for="chk" aria-hidden="true">Login</label>
					<input type="email" name="username" value="<%=username%>" required placeholder="username">
					<input type="password" name="pwd" value=""<%=pwd%> required placeholder="password">
					<button>Login</button>
				</form>
			</div>
	</div>
<body>

</body>
</html>