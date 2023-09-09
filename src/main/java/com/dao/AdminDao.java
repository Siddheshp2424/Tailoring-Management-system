package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.Part;

import com.bean.AdminBean;
import com.bean.ClothBean;
import com.connection.DBConnection;

public class AdminDao {
	
	Connection connection=null;
	Boolean resultStatus=Boolean.FALSE;
	PreparedStatement ps;
	ResultSet rs;
    Statement st=null;
    String sql;
    boolean flag = false;

	public boolean InsertAdminData(AdminBean b) {
		sql = "insert into admin(name,address,email,mobileno,password,status) values(?,?,?,?,?,?)";

		Connection con = DBConnection.getConnection();

		try {
			ps = con.prepareStatement(sql);
			
			
			ps.setString(1, b.getName());
			ps.setString(2, b.getAddress());
			ps.setString(3, b.getEmail());
			ps.setString(4, b.getMobileno());			
			ps.setString(5, b.getPassword());
			ps.setString(6, b.getStatus());
			

			int index = ps.executeUpdate();

			if (index > 0) {
				flag = true;
			} else {
				flag = false;
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return flag;
	}

	public AdminBean CheckAdmin(String email, String password) {
		AdminBean bean=new AdminBean();
		sql = "select * from admin where email='" + email + "' and password='" + password + "' ";
		int flag = 0;
		try {
			Statement stmt = DBConnection.getConnection().createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				flag = 1;
				bean.setId(rs.getInt(1));
				bean.setName(rs.getString(2));					
				bean.setAddress(rs.getString(3));
				bean.setEmail(rs.getString(4));
				bean.setMobileno(rs.getString(5));				
				bean.setPassword(rs.getString(6));
				bean.setStatus(rs.getString(7));
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}
		if(flag ==1)
			return bean;
		else 
			return null;
	}

	public String extractFileName(Part part) {
		final String partHeader = part.getHeader("content-disposition");
	    for (String content : part.getHeader("content-disposition").split(";")) {
	        if (content.trim().startsWith("filename")) {
	            return content.substring(
	                    content.indexOf('=') + 1).trim().replace("\"", "");
	        }
	    }
		return null;
	}

	public boolean AddWomenDressStyle(AdminBean b) {
		sql = "insert into addwdresswstyle(image,imagename,dressname,sprice,email,status) values(?,?,?,?,?,?)";

		Connection con = DBConnection.getConnection();

		try {
			ps = con.prepareStatement(sql);
			
			ps.setBlob(1, b.getImage());
			ps.setString(2, b.getImage_name());
			ps.setString(3, b.getDressname());
			ps.setString(4, b.getSprice());
			ps.setString(5, b.getEmail());
			ps.setString(6, b.getStatus());		

			int index = ps.executeUpdate();

			if (index > 0) {
				flag = true;
			} else {
				flag = false;
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return flag;
		
	}

	public boolean AddFabric(AdminBean b) {
		/*sql = "insert into addfabric(image,imagename,fabricname,image1,imagename1,fabricname1,image2,imagename2,fabricname2,image3,imagename3,fabricname3,image4,imagename4,fabricname4,image5,imagename5,fabricname5,email,status) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
*/
		sql = "insert into addfabric(image,imagename,fabricname,email,status) values(?,?,?,?,?)";

		Connection con = DBConnection.getConnection();

		try {
			ps = con.prepareStatement(sql);
			
			ps.setBlob(1, b.getImage());
			ps.setString(2, b.getImage_name());
			ps.setString(3, b.getFabricname());
			/*ps.setBlob(4, b.getImage1());
			ps.setString(5, b.getImage_name1());
			ps.setString(6, b.getFabricname1());
			ps.setBlob(7, b.getImage2());
			ps.setString(8, b.getImage_name2());
			ps.setString(9, b.getFabricname2());
			ps.setBlob(10, b.getImage3());
			ps.setString(11, b.getImage_name3());
			ps.setString(12, b.getFabricname3());
			ps.setBlob(13, b.getImage4());
			ps.setString(14, b.getImage_name4());
			ps.setString(15, b.getFabricname4());
			ps.setBlob(16, b.getImage5());
			ps.setString(17, b.getImage_name5());
			ps.setString(18, b.getFabricname5());*/
			ps.setString(4, b.getEmail());
			ps.setString(5, b.getStatus());		

			int index = ps.executeUpdate();

			if (index > 0) {
				flag = true;
			} else {
				flag = false;
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return flag;
	}

	public boolean DeleteOrder(int id) {
		String sql="delete from addorder where id='"+id+"'";
		 Connection con=DBConnection.getConnection();
		 try {
			ps=con.prepareStatement(sql);
			int index =ps.executeUpdate();
			if(index>0)
			{
				flag=true;
			}
			else
			{
				flag=false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 
			return flag;
	}

	public boolean UpdateOrderStatus(int id, String status) {
		if(status.equalsIgnoreCase("Confirmed"))
			status="Pending";
		else
			status="Confirmed";
		
		String sql="update addorder set status=? where id=?";
		
		try {
			ps=DBConnection.getConnection().prepareStatement(sql);
			ps.setString(1, status);
			ps.setInt(2, id);
			
			int index=ps.executeUpdate();
			if(index>0)
			{
				flag=true;
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return flag;
	}

	public ResultSet SelectOrder() {
		ResultSet rs= null;
		String sql ="Select * from addorder";
		try {
			PreparedStatement pstmt = DBConnection.getConnection().prepareStatement(sql);
			rs = pstmt.executeQuery();			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return rs;
	}

	public boolean UpdateOrderStatuss(int id, String statuss) {
		if(statuss.equalsIgnoreCase("Already Send"))
			statuss="Send";
		else
			statuss="Already Send";
		
		String sql="update addorder set statuss=? where id=?";
		
		try {
			ps=DBConnection.getConnection().prepareStatement(sql);
			ps.setString(1, statuss);
			ps.setInt(2, id);
			
			int index=ps.executeUpdate();
			if(index>0)
			{
				flag=true;
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return flag;
	}

	public ResultSet SelectOrders() {
		ResultSet rs= null;
		String sql ="Select * from addorder";
		try {
			PreparedStatement pstmt = DBConnection.getConnection().prepareStatement(sql);
			rs = pstmt.executeQuery();			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return rs;
	}

	public boolean UpdateOrderTailor(int id, String statusss) {
		if(statusss.equalsIgnoreCase("Confirm"))
			statusss="Pending";
		else
			statusss="Confirm";
		
		String sql="update addorder set statusss=? where id=?";
		
		try {
			ps=DBConnection.getConnection().prepareStatement(sql);
			ps.setString(1, statusss);
			ps.setInt(2, id);
			
			int index=ps.executeUpdate();
			if(index>0)
			{
				flag=true;
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return flag;
	}

	public ResultSet SelectOrderTailor() {
		ResultSet rs= null;
		String sql ="Select * from addorder";
		try {
			PreparedStatement pstmt = DBConnection.getConnection().prepareStatement(sql);
			rs = pstmt.executeQuery();			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return rs;
	}

	

	

}
