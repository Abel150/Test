package Huasheng;

import java.util.List;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import solrj.SolrSearch;


/**
 * Servlet implementation class Searchac
 */
@WebServlet("/Searchac")
public class Searchac extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Searchac() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		SolrSearch search=new SolrSearch();
		String parame1=new String(request.getParameter("searchName").getBytes("ISO-8859-1"),"UTF-8");
		String parame="name:"+parame1;
		System.out.println(parame);
		List list=search.search(parame);
		request.setAttribute("lista",list);
		request.getRequestDispatcher("searchsuccess.jsp").forward(request, response);
	}

}
