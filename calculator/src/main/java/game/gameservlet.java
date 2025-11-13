package game;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.Random;

@WebServlet("/gameservlet")
public class gameservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		int guessnumber = Integer.parseInt(request.getParameter("num"));
		int levels = Integer.parseInt(request.getParameter("level"));
		Integer randomnumber = (Integer) session.getAttribute("randomnumber");
		Integer chance = (Integer) session.getAttribute("chance");
		Integer range = (Integer) session.getAttribute("chance");

		if (randomnumber == null || range == null || levels == 0) {
			switch (levels) {
			case 1:
				range = 100;
				session.setAttribute("levels", levels);
				session.setAttribute("range", range);
				break;
			case 2:
				range = 250;
				session.setAttribute("levels", levels);
				session.setAttribute("range", range);
				break;
			case 3:
				range = 500;
				session.setAttribute("levels", levels);
				session.setAttribute("range", range);
				break;
			case 4:
				range = 650;
				session.setAttribute("levels", levels);
				session.setAttribute("range", range);
				break;
			case 5:
				range = 800;
				session.setAttribute("levels", levels);
				session.setAttribute("range", range);
				break;
			}
			randomnumber = new Random().nextInt(range);
			session.setAttribute("randomnumber", randomnumber);
			chance=10;
			session.setAttribute("chance", chance);
		}

		String message = null;
		boolean gameover = false;

		chance--;
		if (guessnumber == randomnumber) {
			message = "🎉 Correct! The number was " + randomnumber + ". You won in " + (10 - chance)
					+ " attempt!";
			gameover = true;
		} else if (chance == 0) {
			message = "❌ Game Over! You ran out of chances. The number was " + randomnumber + ".";
			gameover = true;
		} else if (guessnumber < randomnumber) {
			message = "Your guess is too low! Chances left: " + chance;
		} else {
			message = "Your guess is too high! Chances left: " + chance;
		}
		if (gameover) {
			session.removeAttribute("randomnumber");
			session.removeAttribute("chance");
			session.removeAttribute("levels");
			session.removeAttribute("range");
		}

		session.setAttribute("levels", levels);
		session.setAttribute("range", range);
		session.setAttribute("chance", chance);
		session.setAttribute("message", message);
		session.setAttribute("gameOver", gameover);
		String page = "level" + levels + ".jsp";
		response.sendRedirect(page);
	}

}
