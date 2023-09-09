<%-- <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.connection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<html>
<head></head>
    <!-- <form action="VirtualTrialServlet" enctype="multipart/form-data">
    
    <input type="file" name="clothingItem" >
    <img src="assets/img/dress.jpg" name="userImage" height="100px" width="100px">
    <input type="submit" value="submit">
    </form> -->
    
    <!DOCTYPE html>
<html>
<head>
    <title>Virtual Trial</title>
    <style>
        #canvas {
            position: absolute;
            top: 0;
            left: 0;
            z-index: 1;
        }

        #image {
            position: absolute;
            top: 0;
            left: 0;
            z-index: 2;
        }

        #controls {
            position: absolute;
            bottom: 0;
            left: 0;
            z-index: 3;
            padding: 20px;
        }
    </style>
</head>
<body>
    <canvas id="canvas"></canvas>
    <img src="" id="image" />

    <div id="controls">
        <input type="file" id="file-input" accept=".png, .jpg, .jpeg" />
        <button id="upload-btn">Upload Image</button>
        <button id="reset-btn">Reset</button>
        <button id="save-btn">Save Image</button>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fabric.js/4.3.0/fabric.min.js"></script>
    <script src="virtual_trial.js"></script>
</body>
</html>
    
</body>
</html>
 --%>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Virtual Trial - Clothing Item Using Original Image</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
#virtual-trial-image {
  width: 500px;
  height: auto;
  transform-origin: top left;
}
</style>
</head>
<body>
  <h1>Virtual Trial - Clothing Item Using Original Image</h1>
  <form>
    <label>Chest:</label>
    <input type="number" name="chest" value="40"><br>
    <label>Waist:</label>
    <input type="number" name="waist" value="32"><br>
    <label>Hips:</label>
    <input type="number" name="hips" value="40"><br>
    <label>Shoulder:</label>
    <input type="number" name="shoulder" value="17"><br>
    <label>Sleeve Length:</label>
    <input type="number" name="sleeve-length" value="24"><br>
    <label>Inseam:</label>
    <input type="number" name="inseam" value="30"><br>
  </form>
  <img id="virtual-trial-image" src="virtual-trial-image.png">
  <script>
    // Calculate the measurements
 