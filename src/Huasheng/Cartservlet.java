package Huasheng;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import entity.Cart;
import entity.Items;
import entity.UseMan;

public class Cartservlet extends HttpServlet {

	private UseMan idao = new UseMan();
	
	public Cartservlet() {
		super();
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		String user=(String)session.getAttribute("user");
		if(addToCart(request,response))
		{
			if(user!=null)
			request.getRequestDispatcher("ok1.jsp").forward(request, response);
			else
		   request.getRequestDispatcher("ok2.jsp").forward(request, response);	
		}	
        String lists="";
         Cookie[] cookies = request.getCookies();
         if(cookies!=null&&cookies.length>0)
         {
             for(Cookie c:cookies)
             {
                 if(c.getName().equals("ListViewCookie"))
                 {
                    lists = c.getValue();
                 }
             }
         }
         lists+=request.getParameter("goodid")+",";
         Cookie cookie = new Cookie("ListViewCookie",lists);
         response.addCookie(cookie); 
         
	}
	private boolean addToCart(HttpServletRequest request, HttpServletResponse response)
	{
		String goodid = request.getParameter("goodid");
		String goodnum = request.getParameter("number");
		Items item = idao.getItemsById(Integer.parseInt(goodid));	
		if(request.getSession().getAttribute("cart")==null)
		{
			Cart cart = new Cart();
			request.getSession().setAttribute("cart",cart);
		}
		Cart cart = (Cart)request.getSession().getAttribute("cart");
		if(cart.addGoodsInCart(item,Integer.parseInt(goodnum)))
		{
			return true;
		}
		else
		{
			return false;
		}
		
	}
}
