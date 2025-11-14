<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Level 4</title>
</head>
<h2>🎯 Guess the number (0-550)</h2>
<h3>You have 10 chances to reach the number</h3>
<style>
body {
	font-size: 20px;
	text-align: center;
	background-color: default;
}
</style>
<body>

	<%
	String message = (String) session.getAttribute("message");
	Boolean gameOver = (Boolean) session.getAttribute("gameOver");
	Integer level = (Integer) session.getAttribute("level");

	level = 4;
	if (gameOver == null)
		gameOver = false;
	if (message != null) {
		out.print("<p>" + message + "</p>");
	}
	%>
	<%
	if (!gameOver) {
	%>
	<form action="gameservlet" method="post">
		<input type="hidden" name="level" value="<%=level%>"> <input
			type="number" name="num" id="num" inputmode="numeric" required
			autofocus><input type="submit" value="Check">
	</form>
	<%
	}
	%>
	<%
	if (gameOver) {
	%>
	<form action="levels.html" method="post">
		<button type="submit">Play Again</button>
	</form>
	<%
	}
	%>
	<script>
		window.onload = function() {
			const numInput = document.getElementById("num");
			if (numInput)
				numInput.focus();
		};
	</script>
	<script>
		// Disable browser back button navigation
		history.pushState(null, null, location.href);
		window.onpopstate = function() {
			history.go(1); // Prevent going back
		};
	</script>
	<%
	// Clean up temporary message after showing it once
	session.removeAttribute("message");
	session.removeAttribute("gameOver");
	%>
</body>
</html>