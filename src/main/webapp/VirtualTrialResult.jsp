<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <h1>Virtual Trial Result</h1>
    <p>Here is your trial image:</p>
    <img src="path/to/<%= request.getAttribute("trialImageFileName") %>" alt="Trial Image">
    <br><br>
    <a href="VirtualTrial.jsp">Try Again</a>
</body>
</html>