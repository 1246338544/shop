package com.joker.bean;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Message
 */
@WebServlet("/Message")
public class Message extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String title;
	String datetime;
	String content;
	String author;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDatetime() {
		return datetime;
	}
	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Message() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		ServletContext sc = request.getSession().getServletContext();
		ArrayList<Message> messages = cast((ArrayList<?>) sc.getAttribute("messages"));
		Message message = new Message(); 
		message.setContent(request.getParameter("content"));
		message.setDatetime(
		new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		message.setTitle(request.getParameter("title"));
		message.setAuthor(request.getParameter("author"));
		messages.add(message);
		sc.setAttribute("messages", messages);
		response.sendRedirect("message/box");
	
	}
	public static ArrayList<Message> cast(ArrayList<?> arrayList){
		ArrayList<Message> messages = new ArrayList<Message>();
		if (arrayList != null) {
			for(Object e:arrayList) {
				if(e instanceof Message)
			        messages.add((Message)e);
			}
		}
		return messages;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
