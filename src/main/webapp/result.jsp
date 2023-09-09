<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tailoring System - Virtual Trial Result</title>
</head>
<body>
<h1>Tailoring System - Virtual Trial Result</h1>
<p>Hello <c:out value="${name}" />, based on your measurements:</p>
<ul>
    <li>Your height is <c:out value="${height}" /> cm</li>
    <li>Your weight is <c:out value="${weight}" /> kg</li>
    <li>Your recommended clothing size is <c:out value="${size}" /></li>
</ul>
</body>
</html>
