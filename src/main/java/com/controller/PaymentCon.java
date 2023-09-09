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
 * Servlet implementation class PaymentCon
 */
@WebServlet("/PaymentCon")
public class PaymentCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentCon() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");		
		String accountno = request.getParameter("accountno");
		String ifsc = request.getParameter("ifsc");
		String email = request.getParameter("email");
		String status = "Received";
		
		UserBean b = new UserBean();
		
		UserDao db=new UserDao();
		
		b.setName(name);
		b.setAccountno(accountno);
		b.setIfsc(ifsc);
		b.setEmail(email);
		b.setStatus(status);
		

		if (db.CreatePaymentUser(b)) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Payment Done Successfully...')");
			out.println("location='PaymentOrder.jsp';");
			out.println("</script>");
		} else {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Payment not done..Pls Try Again')");
			out.println("location='PaymentOrder.jsp';");
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
