package game;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Random;

/**
 * Servlet implementation class gamerun
 */
@WebServlet("/gameservlet")
public class gameservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Random r = new Random();
	int randomnumber = r.nextInt(100);

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int guessnumber = Integer.parseInt(request.getParameter("num"));
		String message = null;
		if (guessnumber == randomnumber) {
			message = "🎉 Correct! The number was " + randomnumber + ".";
		    int num=Integer.parseInt(request.getParameter("chance"));
		    num=0;
		} else if (guessnumber < randomnumber) {
			message = "Your guess is going Low.";
		} else {
			message = "Your guess is going High.";
		}
		request.setAttribute("message", message);
		request.getRequestDispatcher("game.jsp").forward(request, response);
	}

}
