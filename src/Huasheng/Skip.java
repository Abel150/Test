package Huasheng;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Skip
 */
@WebServlet("/Skip")
public class Skip extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Skip() {
        // TODO Auto-generated constructor stub
    }
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String c = request.getParameter("city");
		c = new String(c.getBytes("ISO-8859-1"), "UTF-8");
		session.setAttribute("city",c);
		request.getRequestDispatcher("success.jsp").forward(request, response);
			
	}

}
