package getsubyoutube.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import getsubyoutube.beans.UserAccount;
import getsubyoutube.utils.DBUtils;
import getsubyoutube.utils.MyUtils;


@WebServlet(urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public LoginServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String Email = request.getParameter("Email");
 
        UserAccount user = null;
        boolean hasError = false;
        String errorString = null;
 
        if (Email.length() == 0) {
            hasError = true;
            errorString = "Required Email!";
        } else {
            Connection conn = MyUtils.getStoredConnection(request);
            try {
                user = DBUtils.findUser(conn, Email);
 
                if (user == null) {
                    hasError = true;
                    errorString = "User Name invalid";
                }
            } catch (SQLException e) {
                e.printStackTrace();
                hasError = true;
                errorString = e.getMessage();
            }
        }
        if (hasError) {
            user = new UserAccount();
            user.setEmail(Email);
            request.setAttribute("errorString", errorString);
            request.setAttribute("user", user);

        }

        else {
            HttpSession session = request.getSession();
            MyUtils.storeLoginedUser(session, user); 
            MyUtils.storeUserCookie(response, user);
        }
	}

}
