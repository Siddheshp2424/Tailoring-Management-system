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
 * Servlet implementation class AddFabricCon
 */
@MultipartConfig
@WebServlet("/AddFabricCon")
public class AddFabricCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	InputStream image=null;		
	String imageName="";
	InputStream image1=null;		
	String imageName1="";
	InputStream image2=null;		
	String imageName2="";
	InputStream image3=null;		
	String imageName3="";
	InputStream image4=null;		
	String imageName4="";
	InputStream image5=null;		
	String imageName5="";
	String path=null;
	File upload=null; 
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddFabricCon() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		String fabricname = request.getParameter("fabricname");	
		/*String fabricname1 = request.getParameter("fabricname1");
		String fabricname2 = request.getParameter("fabricname2");
		String fabricname3 = request.getParameter("fabricname3");
		String fabricname4 = request.getParameter("fabricname4");
		String fabricname5 = request.getParameter("fabricname5");*/
		String email = request.getParameter("email");
		String status = "Active";
		AdminBean b = new AdminBean();
		
		AdminDao db=new AdminDao();
		Part part=request.getPart("file");
		/*Part part1=request.getPart("file1");
		Part part2=request.getPart("file2");
		Part part3=request.getPart("file3");
		Part part4=request.getPart("file4");
		Part part5=request.getPart("file5");*/
		
		if(part!=null)
		{
			image=part.getInputStream();
			System.out.println("is size:"+image.available());
			
			imageName=db.extractFileName(part);
			System.out.println("name:"+imageName);
		}
		/*if(part1!=null)
		{
			image1=part1.getInputStream();
			System.out.println("is size:"+image1.available());
			
			imageName1=db.extractFileName(part1);
			System.out.println("name:"+imageName1);
		}
		if(part2!=null)
		{
			image2=part2.getInputStream();
			System.out.println("is size:"+image2.available());
			
			imageName2=db.extractFileName(part2);
			System.out.println("name:"+imageName2);
		}
		if(part3!=null)
		{
			image3=part3.getInputStream();
			System.out.println("is size:"+image3.available());
			
			imageName3=db.extractFileName(part3);
			System.out.println("name:"+imageName3);
		}
		if(part4!=null)
		{
			image4=part4.getInputStream();
			System.out.println("is size:"+image4.available());
			
			imageName4=db.extractFileName(part4);
			System.out.println("name:"+imageName4);
		}
		if(part5!=null)
		{
			image5=part5.getInputStream();
			System.out.println("is size:"+image5.available());
			
			imageName5=db.extractFileName(part5);
			System.out.println("name:"+imageName5);
		}
		*/

		b.setImage(image);		
		b.setImage_name(imageName);
		b.setFabricname(fabricname);
		/*b.setImage(image1);		
		b.setImage_name(imageName1);
		b.setFabricname(fabricname1);
		b.setImage(image2);		
		b.setImage_name(imageName2);
		b.setFabricname(fabricname2);
		b.setImage(image3);		
		b.setImage_name(imageName3);
		b.setFabricname(fabricname3);
		b.setImage(image4);		
		b.setImage_name(imageName4);
		b.setFabricname(fabricname4);
		b.setImage(image5);		
		b.setImage_name(imageName5);
		b.setFabricname(fabricname5);*/
        b.setEmail(email);		
		b.setStatus(status);
		

		AdminDao dao = new AdminDao();

		if (dao.AddFabric(b)) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Added Successfully')");
			out.println("location='AddFabric.jsp';");
			out.println("</script>");
		} else {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Not send..Try Again')");
			out.println("location='AddFabric.jsp';");
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
