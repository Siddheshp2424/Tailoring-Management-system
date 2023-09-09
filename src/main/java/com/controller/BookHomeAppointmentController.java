package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.UserBean;
import com.dao.UserDao;

/**
 * Servlet implementation class BookHomeAppointmentController
 */
@WebServlet("/BookHomeAppointmentController")
public class BookHomeAppointmentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookHomeAppointmentController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		String name = request.getParameter("name");		
		String address = request.getParameter("address");		
		String email = request.getParameter("email");
		String mobileno = request.getParameter("mobileno");		
			
		String status = "Pending";

		UserBean b = new UserBean();
		

		b.setName(name);		
		b.setAddress(address);
		b.setEmail(email);
		b.setMobileno(mobileno);				
		b.setStatus(status);

		UserDao dao = new UserDao();

		if (dao.BookHomeAppointment(b)) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Appointment Booked Successfully')");
			out.println("location='UserHome.jsp';");
			out.println("</script>");
		} else {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Appointment Not Booked Successfully')");
			out.println("location='BookAnAppointment.jsp';");
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
