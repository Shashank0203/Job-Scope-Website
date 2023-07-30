  
<!-- header -->
  <%@ include file="nav.jsp" %>
  
  
  
  <section class="vh-100" >
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col col-xl-10">
        <div class="card" style="border-radius: 1rem;">
          <div class="row g-0">
            <div class="col-md-6 col-lg-5 d-none d-md-block">
              <img src="logo.png"
                alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;" />
            </div>
            <div class="col-md-6 col-lg-7 d-flex align-items-center">
              <div class="card-body p-4 p-lg-5 text-black">

                  <form action="reg" method="post">

                  <div class="d-flex align-items-center mb-3 pb-1">
                    <i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i>
                    <span class="h1 fw-bold mb-0">Register</span>
                  </div>

                  <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Register your account</h5>

                  <div class="form-outline mb-4">
                      <input type="text" id="form2Example17" name="username" class="form-control form-control-lg" />
                    <label class="form-label" for="form2Example17">Full Name</label>
                  </div>
                  <div class="form-outline mb-4">
                      <input type="email" id="form2Example17" name="email" class="form-control form-control-lg" />
                    <label class="form-label" for="form2Example17">Email address</label>
                  </div>

                   <div class="form-outline mb-4">
                       <input type="password" id="form2Example27" name="password" class="form-control form-control-lg" />
                    <label class="form-label" for="form2Example27">Password</label>
                  </div>
                  
                  <div class="pt-1 mb-4">
                      <input class="btn btn-dark btn-lg btn-block" type="submit" value="Register">
                  </div>

               
                  <p class="mb-5 pb-lg-2" style="color: #393f81;">Already have an account?
                      <a href="login.jsp"  style="color: #393f81;">Login</a></p>
                
                </form>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
  
  <!-- Footer -->
  <%@ include file="footer.jsp" %>