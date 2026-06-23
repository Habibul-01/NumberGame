package com.game;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/game2")
public class NumberGame extends HttpServlet {

	public int randomNumber(int range) {
		return new Random().nextInt(range) + 1;// number range start from 1
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();

		int guessnumber = Integer.parseInt(req.getParameter("num"));
		int levels = Integer.parseInt(req.getParameter("level"));
		int range = Integer.parseInt(req.getParameter("range"));

		Integer ch = (Integer) session.getAttribute("chance");// first run initialization
		Integer randomnumber = (Integer) session.getAttribute("randomnum");// first run initialization

		// random number generation
		if (randomnumber == null) {
			randomnumber = randomNumber(range);
			session.setAttribute("randomnum", randomnumber);
		}

		if (ch == null) {
			ch = Integer.parseInt(req.getParameter("chance"));
			session.setAttribute("chance", ch);
			session.setAttribute("totalChance", ch);
		}

		Integer totalchance = (Integer) session.getAttribute("totalChance");

		String message;
		boolean gameover = false;

		ch--;
		session.setAttribute("chance", ch);

		if (totalchance == null) {
			totalchance = ch;
		}

		if (guessnumber == randomnumber) {
			message = "Correct! The number was " + randomnumber + ". You won in " + (totalchance - ch) + " attempts!";
			gameover = true;

			session.removeAttribute("randomnum");
			session.removeAttribute("chance");
			session.removeAttribute("totalChance");

		} else if (ch == 0) {
			message = "Game Over! The number was " + randomnumber;
			gameover = true;

			session.removeAttribute("randomnum");
			session.removeAttribute("chance");
			session.removeAttribute("totalChance");

		} else if (guessnumber < randomnumber) {
			message = "Too low! Chances left: " + ch;
		} else {
			message = "Too high! Chances left: " + ch;
		}
		// setting the objects for jsp file
		session.setAttribute("message", message);
		session.setAttribute("gameover", gameover);
		session.setAttribute("level", levels);
		session.setAttribute("range", range);

		// dynamically choose the page depending on game level
		String page = "level" + levels + ".jsp";
		req.getRequestDispatcher(page).forward(req, resp);
	}
}
