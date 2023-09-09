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
 * Servlet implementation class AddDressTypeCon
 */
@WebServlet("/AddDressTypeCon")
public class AddDressTypeCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDressTypeCon() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		String clothtype = request.getParameter("clothtype");		
		String price = request.getParameter("price");	
		String status = "Active";

		ClothBean b = new ClothBean();
		

		b.setClothtype(clothtype);
		b.setPrice(price);		
		b.setStatus(status);

		ClothDao dao = new ClothDao();

		if (dao.InsertClothType(b)) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Clothing choose successfully')");
			out.println("location='AddFabricDetails.jsp';");
			out.println("</script>");
		} else {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Clothing not choose successfully')");
			out.println("location='MensClothing.jsp';");
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
