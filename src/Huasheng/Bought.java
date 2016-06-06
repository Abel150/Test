package Huasheng;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Cart;
import entity.Items;
import entity.Ordergoods;
import entity.UseMan;
import entity.User;

/**
 * Servlet implementation class Bought
 */
@WebServlet("/Bought")
public class Bought extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UseMan idao = new UseMan();  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Bought() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		HttpSession session = request.getSession();
		String user=(String)session.getAttribute("user");
		int result=-3;
		String goodid = request.getParameter("goodid");
		String goodnum = request.getParameter("number");
		String goodname = request.getParameter("goodname");
		String pic = request.getParameter("picture");
		goodname = new String(goodname.getBytes("ISO-8859-1"), "UTF-8");
		System.out.print(goodnum);
		if(user==null){
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		else{	
		UseMan userMgr = new UseMan();		
		Ordergoods o=new Ordergoods(user,Integer.parseInt(goodid),goodname,Integer.parseInt(goodnum),pic);
		result = userMgr.addOrder(o);
		if(result==2&&deleteFromCart(request,response)){	
			request.getRequestDispatcher("order.jsp").forward(request, response);		
		}
		else
			response.sendError(HttpServletResponse.SC_SERVICE_UNAVAILABLE,"添加订单失败");	}
		
	}
	
	
	private boolean deleteFromCart(HttpServletRequest request, HttpServletResponse response)
	{
		String id = request.getParameter("goodid");
		Cart cart = (Cart)request.getSession().getAttribute("cart");
	    Items item = idao.getItemsById(Integer.parseInt(id));
	    if(cart.removeGoodsFromCart(item))
	    {
	    	return true;
	    }
	    else
	    {
	    	return false;
	    }
	}
}

