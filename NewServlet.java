import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


@WebServlet("/NewServlet")
public class NewServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  // JDBC driver and database URL
  private static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
  private static final String DB_URL = "jdbc:mysql://localhost:3306/servlet";

  // Database credentials
  private static final String USER = "root";
  private static final String PASS = "";

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // Set response content type
    response.setContentType("text/html");

    // Get parameters from request
    String email    = request.getParameter("email");
    String password = request.getParameter("password");

    // Initialize output writer
    PrintWriter out = response.getWriter();

    // Create database connection
    Connection conn = null;
    PreparedStatement stmt = null;
    try {
      // Register JDBC driver
      Class.forName(JDBC_DRIVER);

      // Open a connection
      conn = DriverManager.getConnection(DB_URL, USER, PASS);

      // Prepare SQL statement to check username and password
      String sql = "SELECT * FROM mytable WHERE email = ? AND password = ?";
      stmt = conn.prepareStatement(sql);
      stmt.setString(1, email);
      stmt.setString(2, password);

      // Execute the SQL statement
      ResultSet rs = stmt.executeQuery();

      // Check if there is a match for the given username and password
      if (rs.next()) {
       
        response.sendRedirect("adminhome.jsp");
      } else {
        // User is not authenticated
        out.println("<script type=\"text/javascript\">" +
                         "alert(\"Username of Password is Worng!\");" +
                         "</script>");
               RequestDispatcher r=request.getRequestDispatcher("/index.html");
               r.include(request,response);
      }
      
      rs.close();
      stmt.close();
      conn.close();
    } catch (ClassNotFoundException | SQLException e) {
      e.printStackTrace();
    } finally {
      // Finally block to close resources
      try {
        if (stmt != null)
          stmt.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
      try {
        if (conn != null)
          conn.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
  }
}