package getsubyoutube.servlet;

import java.io.IOException;
import java.io.PrintWriter;
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

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

//		String Email = request.getParameter("Email");

//		UserAccount user = null;
//		boolean hasError = false;
//		String errorString = null;
//
//		if (Email.length() == 0) {
//			hasError = true;
//			errorString = "Required Email!";
//		} else {
//			Connection conn = MyUtils.getStoredConnection(request);
//			try {
//				user = DBUtils.findUser(conn, Email);
//
//				if (user == null) {
//					hasError = true;
//					errorString = "User Name invalid";
//				}
//			} catch (SQLException e) {
//				e.printStackTrace();
//				hasError = true;
//				errorString = e.getMessage();
//			}
//		}
//		if (hasError) {
//			user = new UserAccount();
//			user.setEmail(Email);
//			request.setAttribute("errorString", errorString);
//			request.setAttribute("user", user);
//
//		}
//
//		else {
//			HttpSession session = request.getSession();
//			MyUtils.storeLoginedUser(session, user);
//			MyUtils.storeUserCookie(response, user);
//		}
		String ID = request.getParameter("id");
		String Email = request.getParameter("email");
		String Name = request.getParameter("name");
		String Picture = request.getParameter("picture");
		
		UserAccount user = new UserAccount();
		user.setId(ID);
		user.setEmail(Email);
		user.setPicture(Picture);
		user.setName(Name);
		
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		PrintWriter out = response.getWriter();
		out.print("Hi, "+Name+"<div class='dropdown'>"+
			"<div class='dropdown-toggle' style='margin-left: 10px'"+
				"data-toggle='dropdown'>"+
				"<img style='border-radius: 50%; width: 30px'"+
					"src='"+Picture+"' alt='Avatar'> <span "+
					"class='caret'></span>"+
			"</div>"+
			"<ul class='dropdown-menu dropdown-menu-right'>"+
				"<li><a href='#'>List of lesson</a></li>"+
				"<li><a href='#' id='logout'>Logout</a></li>"+
			"</ul>"+
		"</div>");
	}

}
