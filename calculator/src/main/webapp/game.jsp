<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Number Game</title>
</head>
<h2>🎯 Guess the number (1–100)</h2>
<h3>You have 10 chances to reach the number</h3>
<style>
body {
	font-size: 20px;
	text-align: center;
	background-color: default;
}

footer {
	position: fixed;
	bottom: 0;
	right: 0;
	background: black;
	color: white;
	padding: 6px 16px
}
</style>
<body>

	<%
	String message = (String) request.getAttribute("message");
	
	int chance = 10; 
	if (request.getParameter("chance") != null) {
		chance = Integer.parseInt(request.getParameter("chance"));
		if (chance > 0)
			chance--; 
	}

	boolean gameOver = (chance == 0);
	%>
	<form action="gameservlet" method="post">
		<input type="number" name="num" id="num" required> <input
			type="hidden" name="chance" value=<%=chance%>> <input
			type="submit" value="Check">
	</form>
	<%
	if (message != null) {
	%>
	<h3><%=message%></h3>
	<%
	}
	%>
	<h3>
		Attempts left:
		<%=chance%></h3>

	<%
	if (gameOver) {
	%>
	<p>Game Over! You have used all attempts.</p>
	
	<form action="indec.html"></form>
	<%
	}
	%>
</body>
	<footer>Number Game © 2025</footer>
</html>