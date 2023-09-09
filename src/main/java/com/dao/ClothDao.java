package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.Part;

import com.bean.ClothBean;
import com.connection.DBConnection;

public class ClothDao {
	
	Connection connection=null;
	Boolean resultStatus=Boolean.FALSE;
	PreparedStatement ps;
	ResultSet rs;
    Statement st=null;
    String sql;
    boolean flag = false;
    
	public boolean InsertClothType(ClothBean b) {
		sql = "insert into clothtype(clothtype,price,status) values(?,?,?)";

		Connection con = DBConnection.getConnection();

		try {
			ps = con.prepareStatement(sql);
			
			
			ps.setString(1, b.getClothtype());
			ps.setString(2, b.getPrice());				
			ps.setString(3, b.getStatus());
			

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

	public boolean AddOrder(ClothBean b) {
		sql = "insert into addorder(dressname,price,fabricname,shoulder,back,armhole,neck,waist,bottom,toplength,trouserlength,hip,shortsleevelength,longsleevelength,name,email,status,statuss,statusss) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		Connection con = DBConnection.getConnection();

		try {
			ps = con.prepareStatement(sql);
			
			
			ps.setString(1, b.getDressname());
			ps.setString(2, b.getPrice());	
			ps.setString(3, b.getFabricname());
			ps.setString(4, b.getShoulder());				
			ps.setString(5, b.getBack());
			ps.setString(6, b.getArmhole());
			ps.setString(7, b.getNeck());				
			ps.setString(8, b.getWaist());
			ps.setString(9, b.getBottom());
			ps.setString(10, b.getToplength());				
			ps.setString(11, b.getTrouserlength());
			ps.setString(12, b.getHip());
			ps.setString(13, b.getShortsleevelength());				
			ps.setString(14, b.getLongsleevelength());
			ps.setString(15, b.getName());
			ps.setString(16, b.getEmail());
			ps.setString(17, b.getStatus());
			ps.setString(18, b.getStatuss());
			ps.setString(19, b.getStatusss());

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

	public boolean AddBrand(ClothBean b) {
		sql = "insert into addbrand(brandname,email,status) values(?,?,?)";

		Connection con = DBConnection.getConnection();

		try {
			ps = con.prepareStatement(sql);
			
			
			ps.setString(1, b.getBrandname());
			ps.setString(2, b.getEmail());				
			ps.setString(3, b.getStatus());
			

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

	public boolean DeleteOrderFabric(int id) {
		String sql="delete from addorderfabric where id='"+id+"'";
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

	public boolean DeleteOrderCloth(int id) {
		String sql="delete from addordercloth where id='"+id+"'";
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

	public boolean AddDesignByTailor(ClothBean b) {
		sql = "insert into adddesignbytailor(image,imagename,designname,price,email,status) values(?,?,?,?,?,?)";

		Connection con = DBConnection.getConnection();

		try {
			ps = con.prepareStatement(sql);
			
			ps.setBlob(1, b.getImage());
			ps.setString(2, b.getImage_name());
			ps.setString(3, b.getDesignname());
			ps.setString(4, b.getPrice());
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

	

	
}

