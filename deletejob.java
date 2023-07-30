import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deletejob")
public class deletejob extends HttpServlet {
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // Get user ID from request parameter
    int id = Integer.parseInt(request.getParameter("id"));

    // Connect to database
    String url = "jdbc:mysql://localhost:3306/servlet";
    String user = "root";
    String password = "";
    try {
      Class.forName("com.mysql.jdbc.Driver");
      Connection conn = DriverManager.getConnection(url, user, password);

      // Delete user from database
      String sql = "DELETE FROM jobs WHERE id=?";
      PreparedStatement statement = conn.prepareStatement(sql);
      statement.setInt(1, id);
      statement.executeUpdate();

      // Clean up resources
      statement.close();
      conn.close();
PrintWriter out = response.getWriter();
        out.println("<script type=\"text/javascript\">" +
                         "alert(\"Rconrd Deleted!\");" +
                         "</script>");
               RequestDispatcher r=request.getRequestDispatcher("/adminhome.jsp");
               r.include(request,response);
    } catch (ClassNotFoundException | SQLException e) {
      e.printStackTrace();
      response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
    }
  }
}
