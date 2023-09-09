package com.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class VirtualTrialServlet
 */
@WebServlet("/VirtualTrialServlet")
public class VirtualTrialServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VirtualTrialServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String clothingItem = request.getParameter("clothingItem");
        Part userImagePart = request.getPart("userImage");
        String userImageFileName = userImagePart.getSubmittedFileName();
        String userImageFileExt = userImageFileName.substring(userImageFileName.lastIndexOf(".") + 1);
        String userImageContentType = userImagePart.getContentType();
        if (userImageContentType.equals("image/jpeg") || userImageContentType.equals("image/png")) {
            BufferedImage userImage = ImageIO.read(userImagePart.getInputStream());
            BufferedImage clothingImage = ImageIO.read(new File("path/to/" + clothingItem + ".jpg"));
            Graphics2D graphics = userImage.createGraphics();
            graphics.drawImage(clothingImage, 0, 0, userImage.getWidth(), userImage.getHeight(), null);
            graphics.dispose();
            String trialImageFileName = "trial_" + userImageFileName;
            File trialImageFile = new File("path/to/" + trialImageFileName);
            ImageIO.write(userImage, userImageFileExt, trialImageFile);
            request.setAttribute("trialImageFileName", trialImageFileName);
            request.getRequestDispatcher("VirtualTrialResult.jsp").forward(request, response);
        } else {
            response.sendRedirect("VirtualTrialError.jsp");
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
