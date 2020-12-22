package service;

import java.io.IOException;
import java.net.PasswordAuthentication;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.User;
import filter.CheckLogin;

public class CustomLogin implements Login{

	@Override
	public void doLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		String id = request.getSession().getId();
		try {
			if (User.isExist(new PasswordAuthentication(userName, password.toCharArray()))) {
				request.getSession().setAttribute("userName", userName);
				CheckLogin.userSessionId.put(id, new Date());
				response.sendRedirect("welcome");
			} else {
				request.setAttribute("checkLogin", "用户名或密码错误");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		} catch (Exception e) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write(e.getMessage() + "\n");
			response.getWriter().write("<a href=\"/index.html\">回到登录页面</a>");
		}
	}
}
