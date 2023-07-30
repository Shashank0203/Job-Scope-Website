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
           
        <form method="post" action="job" enctype="multipart/form-data">
      <label for="job_name">Job Name:</label>
      <input type="text" id="job_name" name="job_name"><br>
      <label for="job_image">Job Image:</label>
      <input type="file" id="job_image" name="job_image"><br>
      <label for="job_description">Job Description:</label><br>
      <textarea id="job_description" name="job_description" rows="5" cols="40"></textarea><br>
      <input type="submit" value="Submit">
    </form>

 
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfB4WYbYbKdLklKIV+OxpX2bY6J6d5t0Ckkbsksd " crossorigin="anonymous"></script>
</body>
</html>
      
    