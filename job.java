import java.io.IOException;
import java.io.InputStream;
import static java.lang.System.out;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
@MultipartConfig
@WebServlet("/job")
public class job extends HttpServlet {
  private static final long serialVersionUID = 1L;
  
  // MySQL database details
  private final String jdbcURL = "jdbc:mysql://localhost:3306/servlet";
  private final String dbUser = "root";
  private final String dbPassword = "";
  
  // Database table name and columns
  private final String tableName = "jobs";
  private final String idColumn = "id";
  private final String nameColumn = "name";
  private final String imageColumn = "image";
  private final String descriptionColumn = "description";
  
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // Get the form data
    String jobName = request.getParameter("job_name");
    Part jobImagePart = request.getPart("job_image");
    String file = jobImagePart.getSubmittedFileName();
    String jobDescription = request.getParameter("job_description");
   
    
    // Create a database connection and statement
    Connection conn = null;
    Statement stmt = null;
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
      stmt = conn.createStatement();
      
      // Create the table if it doesn't exist
      createTableIfNotExists(conn, stmt);
      
      // Insert the job data into the database
      PreparedStatement ps = conn.prepareStatement("INSERT INTO " + tableName + " (" + nameColumn + ", " + imageColumn + ", " + descriptionColumn + ") VALUES (?, ?, ?)");
      ps.setString(1, jobName);
      ps.setString(2, file);
      ps.setString(3, jobDescription);
      ps.executeUpdate();
      out.println("<script type=\"text/javascript\">" +
                         "alert(\"New Job Added\");" +
                         "</script>");
               RequestDispatcher r=request.getRequestDispatcher("/adminhome.jsp");
               r.include(request,response);
    } catch (ClassNotFoundException | SQLException e) {
      e.printStackTrace();
        out.println("<script type=\"text/javascript\">" +
                         "alert(\"New Job Added\");" +
                         "</script>");
               RequestDispatcher r=request.getRequestDispatcher("/addjob.jsp");
               r.include(request,response);
    } finally {
      try {
        if (stmt != null) {
          stmt.close();
        }
        if (conn != null) {
          conn.close();
        }
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
  }
  
  /**
   * Creates the jobs table if it doesn't exist.
   */
  private void createTableIfNotExists(Connection conn, Statement stmt) throws SQLException {
    ResultSet rs = conn.getMetaData().getTables(null, null, tableName, null);
    if (!rs.next()) {
      String createTableSql = "CREATE TABLE " + tableName + " (" +
          idColumn + " INT NOT NULL AUTO_INCREMENT, " +
          nameColumn + " VARCHAR(255) NOT NULL, " +
          imageColumn + " LONGBLOB NOT NULL, " +
          descriptionColumn + " TEXT NOT NULL, " +
          "PRIMARY KEY (" + idColumn + ")" +
          ")";
      stmt.executeUpdate(createTableSql);
    }
  }
}
