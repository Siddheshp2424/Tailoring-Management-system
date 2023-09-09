package com.controller;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class VirtualImageServlet
 */
@WebServlet("/VirtualImageServlet")
public class VirtualImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VirtualImageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  // create a new buffered image with a size of 100x100 and type of RGB
        BufferedImage image = new BufferedImage(100, 100, BufferedImage.TYPE_INT_RGB);

        // get the graphics object from the image
        Graphics2D g2d = image.createGraphics();

        // set the color to red
        g2d.setColor(Color.RED);

        // draw a line from (0, 0) to (50, 50)
        g2d.drawLine(0, 0, 50, 50);

        // draw a line from (50, 50) to (0, 100)
        g2d.drawLine(50, 50, 0, 100);

        // dispose of the graphics object
        g2d.dispose();

        // set the content type to "image/png"
        response.setContentType("image/png");

        // write the image to the response output stream
        ImageIO.write(image, "png", response.getOutputStream());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
