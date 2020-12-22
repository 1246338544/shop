package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ProductService;

/**
 * Servlet implementation class Shop
 */
@WebServlet("/Shop")
public class Shop extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Shop() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Integer offset = 0;
		Integer limit = 10;
		offset = request.getParameter("offset") != null ? Integer.valueOf(request.getParameter("offset")) : 0;
		String search = request.getParameter("search_query");
		ArrayList<Product> products;
		try {
			products = ProductService.getProduct(offset, limit, search);
			request.setAttribute("products", products);
		} catch (ClassNotFoundException | SQLException e1) {
			e1.printStackTrace();
		}

		if (request.getParameter("id") != null) {
			Integer productId = Integer.valueOf(request.getParameter("id"));
			Cart cart = null;
			try {
				cart = new Cart();
				cart.setProductId(productId);
				Object userName = request.getSession().getAttribute("userName");
				if (userName instanceof String) {
					cart.setUserName((String) userName);
					request.setAttribute("cartInsertResult", Integer.valueOf(1).equals(cart.insert()) ? "hidden" : false);

				}
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		}

		request.getRequestDispatcher("/shop").forward(request, response);
	}

}
