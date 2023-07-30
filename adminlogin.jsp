   
  <%@ include file="nav.jsp" %>
<div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header bg-primary text-white">
                            Admin Login
                        </div>
                        <div class="card-body">
                            <form action="NewServlet" method="post">
                                <div class="form-group">
                                    <label for="username">Username or Email</label>
                                    <input type="text" class="form-control" id="email" name="email" required>
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" class="form-control" id="password" name="password" required >
                                </div>
                                <input type="submit" class="btn btn-success" value="Submit">
                                <input type="reset" class="btn btn-warning" value="Reset">
                                <a class="btn btn-primary" href="adminreg.jsp"> Registration</a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

  <!-- Footer -->
