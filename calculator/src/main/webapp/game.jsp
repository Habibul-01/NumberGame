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
	position: fixed;       /* stay fixed on the screen */
    bottom: 0px;             /* distance from the top */
    left: 50%;             /* move to center horizontally */
    transform: translateX(-50%); /* truly center it */
    background: black;     
    color: white;
    padding: 5px 20px;    /* make it look like a button */
    border-radius: 5px;    /* optional: rounded corners */
    cursor: pointer;       /* optional: cursor pointer for button feel */
    text-align: center;
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
	
	<form action="index.html">
	<button type="submit">Play Again</button></form>
	<%
	}
	%>
</body>
	<footer>Number Game © 2025</footer>
</html>