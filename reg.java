import java.io.IOException;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/reg")
public class reg extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve user data from the form
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Create a SQL query to insert the user data into a database table
        String sqlQuery = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";

        try {
            // Load the database driver
            Class.forName("com.mysql.jdbc.Driver");

            // Connect to the database
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/servlet", "root", "");

            // Create a prepared statement with the SQL query
            PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);

            // Set the parameters of the prepared statement with the user data
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, password);

            // Execute the prepared statement to insert the user data into the database table
            int rowsInserted = preparedStatement.executeUpdate();

            if (rowsInserted > 0) {
                // User data was successfully inserted into the database table
              out.println("<script type=\"text/javascript\">" +
                         "alert(\"Rconrd Update!\");" +
                         "</script>");
               RequestDispatcher r=request.getRequestDispatcher("/login.jsp");
               r.include(request,response);
            } else {
                // User data was not inserted into the database table
                String message = "User registration failed!";
                response.sendRedirect("register.jsp?message=" + message);
            }

        } catch (ClassNotFoundException e) {
            // Database driver not found
            e.printStackTrace();
        } catch (SQLException e) {
            // Database connection error or SQL query error
            e.printStackTrace();
        }
    }
}
