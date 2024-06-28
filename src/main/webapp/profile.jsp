<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.example.model.User" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RideEase - User Profile</title>
    <style>
        /* Global Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        
        /* Navigation Styles */
        nav {
            background-color: #2563eb;
            padding: 1rem;
        }
        nav .container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
        }
        nav .logo {
            color: white;
            font-size: 1.5rem;
            font-weight: bold;
        }
        nav ul {
            list-style-type: none;
            display: flex;
            gap: 1rem;
        }
        nav a {
            color: white;
            text-decoration: none;
        }
        nav a:hover {
            text-decoration: underline;
        }
        .get-started {
            background-color: #22c55e;
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 9999px;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
        }
        .get-started:hover {
            background-color: #16a34a;
        }
        
        /* Form Styles */
        form {
            margin: 2rem;
        }
        label {
            display: block;
            margin-bottom: 0.5rem;
        }
        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="date"] {
            width: 100%;
            padding: 0.5rem;
            margin-bottom: 1rem;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #2563eb;
            color: white;
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #1e40af;
        }
        
        .logout-button {
		    background-color: #e53e3e; /* Red background for logout */
		    color: white; /* White text color */
		    padding: 0.75rem 1.5rem; /* Padding for the button */
		    border: none; /* No border */
		    border-radius: 4px; /* Rounded corners */
		    cursor: pointer; /* Pointer cursor on hover */
		    transition: background-color 0.3s; /* Smooth transition effect */
		    margin-left: 30px;
		    margin-bottom: 30px;
		}
		
		.logout-button:hover {
		    background-color: #c53030; /* Darker red on hover */
		}
		        
        
        /* Footer Styles */
        footer {
            background-color: #1f2937;
            color: white;
            padding: 2rem;
        }
        .footer-content {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 2rem;
            max-width: 1200px;
            margin: 0 auto;
        }
        .footer-section h3 {
            font-size: 1.25rem;
            margin-bottom: 0.5rem;
        }
        .footer-section ul {
            list-style-type: none;
            padding: 0;
        }
        .footer-section a {
            color: white;
            text-decoration: none;
        }
        .footer-section a:hover {
            text-decoration: underline;
        }
        .social-icons {
            display: flex;
            gap: 1rem;
            margin-top: 0.5rem;
        }
        .social-icons a {
            color: white;
            text-decoration: none;
        }
        .copyright {
            text-align: center;
            margin-top: 2rem;
        }
    </style>
</head>
<body>
    <nav>
        <div class="container">
            <span class="logo">RideEase</span>
            <ul>
                <li><a href="#">Home</a></li>
                <li><a href="#">Book a Ride</a></li>
                <li><a href="#">My Bookings</a></li>
                <li><a href="#">Contact</a></li>
                <li><a href="#" class="get-started">Get Started</a></li>
            </ul>
        </div>
    </nav>

    <%
        // Retrieve the user object from session and check if user is logged in
        User user = (User) session.getAttribute("user");
        if (user == null) {
            // Redirect to login if not logged in
            response.sendRedirect("login.jsp");
        } else {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    %>
        <center><h2>Welcome, <%= user.getUsername() %>!</h2></center>
        <h3>Your Profile</h3>
        <!-- Profile Update Form -->
        <form action="profile" method="post">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="<%= user.getEmail() %>" required><br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" value="<%= user.getPassword() %>" required><br>
            <label for="fullName">Full Name:</label>
            <input type="text" id="fullName" name="fullName" value="<%= user.getFullName() %>" required><br>
            <label for="dateOfBirth">Date of Birth:</label>
            <input type="date" id="dateOfBirth" name="dateOfBirth" value="<%= sdf.format(user.getDateOfBirth()) %>" required><br>
            <input type="submit" value="Update Profile">
        </form>

        <!-- Profile Deletion Form -->
        <h3>Delete Profile</h3>
        <form action="deleteProfile" method="post" onsubmit="return confirm('Are you sure you want to delete your profile? This action cannot be undone.');">
            <input type="submit" value="Delete Profile">
        </form>

        <!-- Success or Error Messages -->
        <%
            String successMessage = (String) request.getAttribute("successMessage");
            if (successMessage != null) {
        %>
            <p style="color: green;"><%= successMessage %></p>
        <%
            }
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null) {
        %>
            <p style="color: red;"><%= errorMessage %></p>
        <%
            }
        %>

        <!-- Logout Button -->
        <a href="logout"><button class="logout-button">Logout</button></a>
    <% } %>
    

    <footer>
        <div class="footer-content">
            <div class="footer-section">
                <h3>RideEase</h3>
                <p>Your trusted partner for comfortable and reliable transportation.</p>
            </div>
            <div class="footer-section">
                <h3>Quick Links</h3>
                <ul>
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Services</a></li>
                    <li><a href="#">Terms of Service</a></li>
                    <li><a href="#">Privacy Policy</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h3>Connect With Us</h3>
                <div class="social-icons">
                    <a href="#">Facebook</a>
                    <a href="#">Twitter</a>
                    <a href="#">Instagram</a>
                </div>
                <p>Email: info@rideease.com</p>
                <p>Phone: (555) 123-4567</p>
            </div>
        </div>
        <div class="copyright">
            <p>&copy; 2024 RideEase. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
