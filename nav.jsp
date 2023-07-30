<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Website</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    /* Dark Theme */

    /* Navbar */
    .navbar {
      background-color: #333333;
      position: sticky;
      top: 0;
      z-index: 100;
    }
    .navbar-brand {
      color: #ffffff;
    }
    .navbar-nav a {
      color: #ffffff;
    }
    .navbar-nav a:hover {
      color: #f5f5f5;
    }
    /* Footer */
    footer {
      background-color: #333333;
      color: #ffffff;
    }
    footer a {
      color: #ffffff;
    }
    footer a:hover {
      color: #f5f5f5;
    }
  </style>
</head>
<body>
  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="#">JobScope</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item active">
          <a class="nav-link" href="index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Contact</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="login.jsp">
            <i class="fas fa-user"></i> Login/Register
          </a>
        </li>
      </ul>
    </div>
  </nav>