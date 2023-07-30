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
        <a class="navbar-brand" href="andminhome.jsp">JobScope Admin Panel</a>
      </div>
      
      <div class="collapse navbar-collapse" id="navbar-collapse">
        <ul class="nav navbar-nav">
          <li class="active"><a href="adminhome.jsp">Dashboard</a></li>
          <li><a href="data.jsp">Users</a></li>
        
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
           
        <table id = "myTable" class = "table table-bordered table-striped" style = "width:100%">
<thead>
<tr>
<th> ID</th>
<th> NAME </th>
<th> EMAIL </th>
<th> EDIT</th>

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
        ResultSet resultSet = statement.executeQuery("SELECT * FROM mytable");
        // Print the results
        while (resultSet.next()) {
          int id = resultSet.getInt("id");
          String fullname = resultSet.getString("fullname");
          String email = resultSet.getString("email");
          out.println("<tr>");
          out.println("<td>" + id + "</td>");
          out.println("<td>" + fullname + "</td>");
          out.println("<td>" + email + "</td>");
          
          %>
          
       

<td><b>   <form action="RetrieveDataServlet" method="post">
        <input type="hidden" name="id" value="<%= resultSet.getInt("id") %>">
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
      
        
      