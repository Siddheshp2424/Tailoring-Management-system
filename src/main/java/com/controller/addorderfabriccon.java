package com.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.bean.UserBean;
import com.dao.UserDao;

/**
 * Servlet implementation class addorderfabriccon
 */
@WebServlet("/addorderfabriccon")
public class addorderfabriccon extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public addorderfabriccon() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		String fabricname = request.getParameter("fabricname");	
		String email = request.getParameter("email");
		String status = "Active";

		UserBean b = new UserBean();
		UserDao db = new UserDao();
		
		b.setFabricname(fabricname);
		b.setEmail(email);
		b.setStatus(status);

		

		if (db.AddOrderFabric(b)) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Added Successfully')");
			out.println("location='Addorder.jsp';");
			out.println("</script>");
		} else {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('UnSuccessful')");
			out.println("location='Addorder.jsp';");
			out.println("</script>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
