package LogoutProcess;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

public class LogoutProcess extends HttpServlet{

	@Override
	public void init() throws ServletException {
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	
		HttpSession session = req.getSession();
		session.removeAttribute("myName");
		resp.sendRedirect("home/index.jsp");
	}

	@Override
	public void destroy() {
	}

}
