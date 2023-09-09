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
import com.bean.ClothBean;
import com.dao.AdminDao;
import com.dao.ClothDao;


@MultipartConfig
@WebServlet("/AddDesignByTailorController")
public class AddDesignByTailorController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	InputStream image=null;		
	String imageName="";
	String path=null;
	File upload=null; 
    
    public AddDesignByTailorController() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		String designname = request.getParameter("designname");			
		String price = request.getParameter("price");
		String email = request.getParameter("email");
		String status = "Active";
		ClothBean b = new ClothBean();
		
		ClothDao db=new ClothDao();
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
		b.setDesignname(designname);
		b.setPrice(price);
        b.setEmail(email);		
		b.setStatus(status);
		

		if (db.AddDesignByTailor(b)) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Added Successfully')");
			out.println("location='AddDesignsByTailor.jsp';");
			out.println("</script>");
		} else {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Not send..Try Again')");
			out.println("location='AddDesignsByTailor.jsp';");
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
