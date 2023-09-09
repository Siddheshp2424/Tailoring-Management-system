package com.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.bean.AdminBean;
import com.dao.AdminDao;

/**
 * Servlet implementation class AddWomensClothingStyleCon
 */
@MultipartConfig
@WebServlet("/AddWomensClothingStyleCon")
public class AddWomensClothingStyleCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	InputStream image=null;		
	String imageName="";
	String path=null;
	File upload=null; 
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddWomensClothingStyleCon() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		String dressname = request.getParameter("dressname");			
		String sprice = request.getParameter("sprice");
		String email = request.getParameter("email");
		String status = "Active";
		AdminBean b = new AdminBean();
		
		AdminDao db=new AdminDao();
		Part part=request.getPart("file");
		
		if(part!=null)
		{
			image=part.getInputStream();
			System.out.println("is size:"+image.available());
			
			imageName=db.extractFileName(part);
			System.out.println("name:"+imageName);
		}
		

		b.setImage(image);		
		b.setImage_name(imageName);
		b.setDressname(dressname);
		b.setSprice(sprice);
        b.setEmail(email);		
		b.setStatus(status);
		

		AdminDao dao = new AdminDao();

		if (dao.AddWomenDressStyle(b)) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Added Successfully')");
			out.println("location='AddWomensClothingStyle.jsp';");
			out.println("</script>");
		} else {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Not send..Try Again')");
			out.println("location='AddWomensClothingStyle.jsp';");
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
