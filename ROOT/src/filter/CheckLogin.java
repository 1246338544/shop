package filter;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

/**
 * Servlet Filter implementation class Login
 */

public class CheckLogin implements Filter {
	public static HashMap<String, Date> userSessionId = new HashMap<String, Date>();

	/**
	 * Default constructor.
	 */
	public CheckLogin() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		HttpServletRequest hsr = null;
		if(request instanceof HttpServletRequest) {
			hsr = (HttpServletRequest) request;
		}else {
			request.getRequestDispatcher("/error").forward(request, response);
			return;
		}
		System.out.println(hsr.getRequestURI());
		if (hsr.getRequestURI().equals("/index.jsp") ||
				hsr.getRequestURI().equals("/Login") ||
				hsr.getRequestURI().contains("register"))
			chain.doFilter(request, response);
		else {
			Date date1 = userSessionId.get(hsr.getRequestedSessionId());
			if (date1 == null) {
				request.setAttribute("checkLogin", "你还未登录");
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			} else {
				chain.doFilter(request, response);
			}
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
