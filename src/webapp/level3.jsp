<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LEVEL 3</title>

<style>
body {
	font-size: 20px;
	text-align: center;
	background-color: white;
}
</style>

</head>

<body>

	<h2>🎯 Guess the number (1–400)</h2>
	<h3>You have limited chances to reach the number</h3>

	<%
	String message = (String) session.getAttribute("message");
	Boolean gameover = (Boolean) session.getAttribute("gameover");

	if (gameover == null) {
		gameover = false;
	}

	int level = 3;
	int range = 400;
	Integer chance = (Integer) session.getAttribute("chance");

	if (chance == null) {
		chance = 10;
	}

	if (message != null) {
	%>
	<p><%=message%></p>
	<%
	}
	%>

	<%
	if (!gameover) {
	%>

	<form action="game2" method="post">
		<input type="number" name="num" id="num" required autofocus> <input
			type="hidden" name="level" value="<%=level%>"> <input
			type="hidden" name="range" value="<%=range%>"> <input
			type="hidden" name="chance" value="<%=chance%>"> <input
			type="submit" value="Check">
	</form>

	<%
	} else {
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

		// disable back button
		history.pushState(null, null, location.href);
		window.onpopstate = function() {
			history.go(1);
		};
	</script>

	<%
	// clear one-time messages
	session.removeAttribute("message");
	session.removeAttribute("gameover");
	%>

</body>
</html>