package demo;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final String VALID_USERNAME = "admin";
    private static final String VALID_PASSWORD = "1234";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (VALID_USERNAME.equals(username) && VALID_PASSWORD.equals(password)) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);

            request.getRequestDispatcher("/welcome.jsp")
                   .forward(request, response);
        } else {
            request.setAttribute("error", "Invalid username or password!");
            request.getRequestDispatcher("/login.jsp")
                   .forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        response.sendRedirect("login.jsp");
    }
}
