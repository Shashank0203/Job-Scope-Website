<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>JobScope Admin Panel</title>
  
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

  <!-- Custom CSS -->
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <!-- Navigation -->
  <nav class="navbar navbar-inverse">
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
          <span class="sr-only">Toggle Navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">JobScope Admin Panel</a>
      </div>
      
      <div class="collapse navbar-collapse" id="navbar-collapse">
        <ul class="nav navbar-nav">
          <li class="active"><a href="#">Dashboard</a></li>
          <li><a href="#">Users</a></li>
        
        </ul>
        
        <ul class="nav navbar-nav navbar-right">
          <li><a href="index.jsp">Logout</a></li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Content -->
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-3">
        <div class="list-group">
          <a href="adminhome.jsp" class="list-group-item active">Overview</a>
            <a  class="list-group-item"></a>
            <a href="addjob.jsp" class="list-group-item active">Add Job</a>
             <a  class="list-group-item"></a>
              <a href="data.jsp" class="list-group-item active">View Users</a>
          
        </div>
      </div>
      
      <div class="col-md-9">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title">Dashboard</h3>
          </div>
             <div class="col-md-9">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title">Dashboard</h3>
           
        <table id = "myTable" class = "table table-bordered table-striped" style = "width:100%">
<thead>
<tr>
<th> ID</th>
<th> JOB</th>
<th> DESCRIPTION </th>
<th> IMAGE</th>
<th> DELETE</th>


</tr>
</thead>
<tbody>
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
        Statement statement = connection.createStatement();
        // Execute the query
        ResultSet rs = statement.executeQuery("SELECT * FROM JOBS");
        // Print the results
        while (rs.next()) {
        int id = rs.getInt("id");
                String name = rs.getString("name");
                String description = rs.getString("description");
                String image = rs.getString("image");
          out.println("<tr>");
          out.println("<td>" + id + "</td>");
          out.println("<td>" + name + "</td>");
          out.println("<td>" + description + "</td>");
          out.println("<td><img src="+image + "></td>");
          
          %>
          
       

<td><b>   <form action="deletejob" method="post">
        <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
        <button class="btn btn-danger" type="submit">Delete</button>
      </form></b></td>
    </tr>
    
      <%  }
        connection.close();
      } catch (Exception e) {
        e.printStackTrace();
      }
    %>


  </table>
  
 
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfB4WYbYbKdLklKIV+OxpX2bY6J6d5t0Ckkbsksd " crossorigin="anonymous"></script>
</body>
</html>
