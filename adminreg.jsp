     
  <%@ include file="nav.jsp" %> 

<div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header bg-primary text-white">
                            Admin Registration 
                        </div>
                        <div class="card-body">
                            <form action="servlet" method="post" >
                                <div class="form-group">
                                    <label for="fullname">Full Name:</label>
                                    <input type="text" class="form-control" id="fullname" placeholder="Enter full name" name="fullname" required>
                                </div>
                                <div class="form-group">
                                    <label for="email">Email address:</label>
                                    <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" required>
                                </div>
                                <div class="form-group">
                                    <label for="password">Password:</label>
                                    <input type="password" class="form-control" id="password" placeholder="Enter password" name="password" required>
                                </div>
                                <input type="submit" class="btn btn-success" value="Submit">
                                <input type="reset" class="btn btn-warning" value="Reset">
                                <a class="btn btn-primary" href="adminlogin.jsp"> Login </a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>



