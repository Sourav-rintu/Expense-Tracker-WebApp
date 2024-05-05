<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Expense Tracker Web App</title>
   <style type="text/css">
		* {
    padding: 0px;
    margin: 0px;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

.container {
    position: relative;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    background: linear-gradient(to bottom, #0f0c29, #302b63, #24243e);
}

.welcome-section {
    text-align: center;
    animation: fadeInUp 1s ease forwards;
}

@keyframes fadeInUp {
    0% {
        opacity: 0;
        transform: translateY(50px);
    }
    100% {
        opacity: 1;
        transform: translateY(0);
    }
}

.welcome-section h1 {
    font-size: 4rem;
    color: white;
    margin-bottom: 30px;
}
.welcome-section h2 {
	font-size: 3rem;
    color: white;
    margin-bottom: 80px;
}

.login-option a {
    padding: 10px 20px;
    background-color: royalblue;
    color: white;
    text-decoration: none;
    border-radius: 5px;
    font-size: 1.2rem;
    transition: background-color 0.3s ease;
}

.login-option a:hover {
    background-color: dodgerblue;
}

.date {
    position: absolute;
    top: 20px;
    right: 20px;
    font-size: 1.2rem;
    color: white;
}

/* Responsive Styles */
@media screen and (max-width: 768px) {
    .welcome-section h1 {
        font-size: 2rem;
    }
    .login-option a {
        font-size: 1rem;
    }
    .date {
        font-size: 1rem;
    }
}



   		
   </style>
</head>
<body>
    <div class="container">
  
        <div class="welcome-section">
            <h1>Welcome</h1>
            <h2>Expense Tracker Web App</h2>
            <div class="login-option">
                <a href="login1.jsp">SignUp/LogIn</a>
            </div>
        </div>
        
        <div class="date">
            <p id="currentDate"></p>
        </div>
        
    </div>
     <script>
        // Get the current date
        const currentDate = new Date();
        const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
        document.getElementById('currentDate').textContent = currentDate.toLocaleDateString('en-US', options);
    </script>
</body>
</html>