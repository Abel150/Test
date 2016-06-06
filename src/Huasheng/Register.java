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

import entity.UseMan;
import entity.User;

@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Register() {
        super();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		processRequest(request,response);
	
	}

	private void processRequest(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");//客户端浏览器，区分不同种类的数据，并根据不同的MIME调用浏览器内不同的程序嵌入模块来处理相应的数据。
	
		HttpSession session = request.getSession();//返回的是httpSession 类型的，从后台servlet到jsp的时候把数据放到session里给传到jsp页面。
		UseMan userMgr = new UseMan();
		String username = request.getParameter("usernames");
		String passwords = request.getParameter("passwords");
		String realnames = request.getParameter("realnames");
		String emails = request.getParameter("emails");
		String telephones = request.getParameter("telephones");
		int result = -2;
		/*List<String> brands=new ArrayList<String>();
		brands.add(username);
		List r=brands;
		request.setAttribute("users",r); */
		session.setAttribute("user",username);
		User u=new User(username,passwords,realnames,emails,telephones,1);
		result = userMgr.addUser(u);
		if(result==1){	
			request.getRequestDispatcher("success.jsp").forward(request, response);		
		}
		else
			response.sendError(HttpServletResponse.SC_SERVICE_UNAVAILABLE,"注册失败");	
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request,response);
		
	}

}

