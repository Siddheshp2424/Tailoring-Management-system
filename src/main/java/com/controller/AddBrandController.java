package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.ClothBean;
import com.dao.ClothDao;

/**
 * Servlet implementation class AddBrandController
 */
@WebServlet("/AddBrandController")
public class AddBrandController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBrandController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		String brandname = request.getParameter("brandname");		
		String email = request.getParameter("email");	
		String status = "Active";

		ClothBean b = new ClothBean();
		

		b.setBrandname(brandname);
		b.setEmail(email);		
		b.setStatus(status);

		ClothDao dao = new ClothDao();

		if (dao.AddBrand(b)) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Brand added successfully')");
			out.println("location='AddBrand.jsp';");
			out.println("</script>");
		} else {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Brand not added')");
			out.println("location='AddBrand.jsp';");
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
