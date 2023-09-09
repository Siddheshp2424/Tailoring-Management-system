package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.TailorDao;
import com.dao.UserDao;

/**
 * Servlet implementation class TailorChangePasswordController
 */
@WebServlet("/TailorChangePasswordController")
public class TailorChangePasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TailorChangePasswordController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
PrintWriter out=response.getWriter();
		
		String oldpass=request.getParameter("oldpass");
		String newpass=request.getParameter("newpass");
		
		TailorDao dao=new TailorDao();
		
		if(dao.UpdateTailorPassword(oldpass,newpass))
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('password change successfully')");
			out.println("location='TailorHome.jsp';");
			out.println("</script>");
		}
		else
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Fail..........')");
			out.println("location='TailorHome.jsp';");
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
