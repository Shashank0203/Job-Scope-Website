
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
     <%
        String email=(String)session.getAttribute("email");
        
        //redirect user to login page if not logged in
        if(email==null){
         response.sendRedirect("index.jsp");
        }
        %>
 

  
  <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Navigation Bar</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="style.css">
</head>
<body>

  <!-- Navigation Bar -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
      <!-- Logo and Company Name -->
      <a class="navbar-brand" href="#">
          <img src="icon.png" alt="Company Logo" class="logo-img" style="border-radius: 50%;">
        JobScope
      </a>
      <!-- Toggler for responsive design -->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <!-- Navigation Links -->
      <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item active">
            <a class="nav-link" href="#">About <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item active">
            <a class="nav-link" href="#">Contact Us<span class="sr-only">(current)</span></a>
          </li>
            <li class="nav-item active">
            <a class="nav-link" href="#">Jobs <span class="sr-only">(current)</span></a>
          </li>
        </ul>
      </div>
      

      <!-- Login/Sign Up Buttons -->
      <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
        <ul class="navbar-nav">
          
        
        <li class="nav-item active">
            <a class="nav-link" >Welcome <%=email%></a> 
          </li>
          <li class="nav-item active">
            <a class="nav-link" href="logout.jsp"></p>Logout</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  
       <%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>All Jobs</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container-fluid">
		<h1 class="text-center">All Jobs</h1>
		<hr>

		<div class="row">
			<%
			try {
				 // Load the MySQL JDBC driver
        Class.forName("com.mysql.jdbc.Driver");
        // Connect to the database
        String jdbcURL = "jdbc:mysql://localhost:3306/servlet";
        String jdbcUsername = "root";
        String jdbcPassword = "";
        Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        // Create a statement
        Statement stmt = connection.createStatement();
        // Execute the query
        ResultSet rs = stmt.executeQuery("SELECT * FROM JOBS");

				while (rs.next()) {
					String jobName = rs.getString("name");
					String jobImage = rs.getString("image");
					String jobDescription = rs.getString("description");
			%>

					<div class="col-sm-2">
						<div class="card">
							<img class="card-img-top" src="<%= jobImage %>" alt="<%= jobName %>">
							<div class="card-body">
								<h5 class="card-title"><%= jobName %></h5>
								<p class="card-text"><%= jobDescription %></p>
                                                                <a><a href="job.jsp" target="target"> <button type="submit" class="btn btn-warning"" >Apply</button></a>
							</div>
						</div>
					</div>
                                                                

			<%
				}
				rs.close();
				stmt.close();
				connection.close();
			} catch (Exception e) {
				out.println(e);
			}
			%>
		</div>
	</div>

</body>
</html>


  <!-- Footer -->
  <%@ include file="footer.jsp" %>
  