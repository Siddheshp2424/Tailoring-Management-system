package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.AdminBean;
import com.bean.ClothBean;
import com.dao.AdminDao;
import com.dao.ClothDao;

/**
 * Servlet implementation class AddOrderController
 */
@WebServlet("/AddOrderController")
public class AddOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddOrderController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		String dressname = request.getParameter("dressname");		
		String price = request.getParameter("price");		
		String fabricname = request.getParameter("fabricname");
		String shoulder = request.getParameter("shoulder");		
		String back = request.getParameter("back");	
		String armhole = request.getParameter("armhole");		
		String neck = request.getParameter("neck");		
		String waist = request.getParameter("waist");
		String bottom = request.getParameter("bottom");		
		String toplength = request.getParameter("toplength");
		String trouserlength = request.getParameter("trouserlength");
		String hip = request.getParameter("hip");
		String shortsleevelength = request.getParameter("shortsleevelength");
		String longsleevelength = request.getParameter("longsleevelength");	
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String status = "Pending";
		String statuss = "Send";
		String statusss = "Pending";

		ClothBean b = new ClothBean();

		b.setDressname(dressname);
		b.setPrice(price);
		b.setFabricname(fabricname);
		b.setShoulder(shoulder);
		b.setBack(back);
		b.setArmhole(armhole);
		b.setNeck(neck);
		b.setWaist(waist);
		b.setBottom(bottom);
		b.setToplength(toplength);
		b.setTrouserlength(trouserlength);
		b.setHip(hip);
		b.setShortsleevelength(shortsleevelength);
		b.setLongsleevelength(longsleevelength);
	    b.setName(name);
		b.setEmail(email);
		b.setStatus(status);
		b.setStatuss(statuss);
		b.setStatusss(statusss);

		ClothDao dao = new ClothDao();

		if (dao.AddOrder(b)) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Order Successful')");
			out.println("location='PaymentOrder.jsp';");
			out.println("</script>");
		} else {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('UnSuccessful')");
			out.println("location='AddFOrder.jsp';");
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
