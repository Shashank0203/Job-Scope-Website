import java.io.*;
import static java.lang.System.out;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import org.apache.catalina.User;

@WebServlet("/servlet")
public class servlet extends HttpServlet {
    

    private static Connection getConnection() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
  @Override
  public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    // Get input parameters from the request
    String fullname = request.getParameter("fullname");
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    // Set up database connection
    String url = "jdbc:mysql://localhost:3306/servlet";
    String dbUser = "root";
    String dbPass = "";
    try {
      Class.forName("com.mysql.jdbc.Driver");
      Connection conn = DriverManager.getConnection(url, dbUser, dbPass);
      String sql = "INSERT INTO mytable (fullname, email, password) VALUES (?, ?, ?)";
      PreparedStatement statement = conn.prepareStatement(sql);
      statement.setString(1, fullname);
      statement.setString(2, email);
      statement.setString(3, password);
      statement.executeUpdate();

      // Close connection
      conn.close();
      
     response.sendRedirect("adminlogin.jsp");
        } catch (SQLException se) {
            // Handle errors for JDBC
            se.printStackTrace();
            out.println("Error: " + se.getMessage());
        } catch (Exception e) {
            // Handle errors for Class.forName
            e.printStackTrace();
            out.println("Error: " + e.getMessage());
        } finally {
            // Clean-up environment
           
        }
  }
}
