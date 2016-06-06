package entity;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import Huasheng.DBBean;

public class UseMan { 

//	private HashMap<String,Items> userList;

	public UseMan() {
		super();
	}
		

	public int verifyUser(String username, String password) {
		Connection conn = null; //创建新连接
		Statement stmt = null;
//创建一个Statement对象，用于发送SQL语句到数据库。没有使用绑定变量的SQL语句一般使用Statement来执行。
		ResultSet rset = null; //执行数据查询语句
		int result = -1;
		try {
			conn = DBBean.getConnection();
			String sql = "select * from users where username='" + username
					+ "' and password='" + password + "'";
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			if (rset.next()) {
				result = rset.getInt("num");
			}
		} catch (SQLException e) {
			System.out.println("SQLException inside verify user");
			e.printStackTrace();

		} finally {
			try {
				rset.close();
				stmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	public int addUser(User newUser) {
		int result = 4; 
		if (findUser(newUser)) {
			result = -1; 
		} 
		else {
			String sql = "insert into users(username,password,realname,email,num,telenum)values('"
					+ newUser.getUsername()
					+ "','"
					+ newUser.getPassword()
					+ "','"
					+ newUser.getRealname()
					+ "','"
					+ newUser.getEmail() + "','" + newUser.getNum()+ "','" + newUser.getTele() + "')";
			if (DBBean.update(sql)) {
				result = 1; 
			}
		}
		return result;
	}
	public boolean findUser(User user) {
		boolean result = false;
		String sql = "select * from users where username=('"
				+ user.getUsername() + "')";
		result = DBBean.hasRecord(sql);
		return result;
	}
	
	public ArrayList<Items> getAllItems() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Items> list = new ArrayList<Items>(); 
		try {
			conn = DBBean.getConnection();
			String sql = "select * from items";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {				
			Items	item= new Items(rs.getString("id"),
						rs.getString("name"), rs.getString("city"),
	 rs.getInt("price"), rs.getInt("number"),rs.getString("picture"));
			//	System.out.println(item.getName());
			list.add(item);
			}
                
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} finally {
			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	
	
	public Items getItemsById(int id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBBean.getConnection();
			String sql = "select * from items where id=?;"; // SQL���
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			if (rs.next()) {
				Items item = new Items();
				item.setId(rs.getString("id"));
				item.setName(rs.getString("name"));
				item.setCity(rs.getString("city"));
				item.setNumber(rs.getInt("number"));
				item.setPrice(rs.getInt("price"));
				item.setPicture(rs.getString("picture"));
				return item;
			} else {
				return null;
			}

		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} finally {
			
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}

		}
	}

	public ArrayList<Items> getViewList(String list)
	{
		System.out.println("list:"+list);
		ArrayList<Items> itemlist = new ArrayList<Items>();
		int iCount=5; 
		if(list!=null&&list.length()>0)
		{
		    String[] arr = list.split(",");
		    System.out.println("arr.length="+arr.length);
		   
		    if(arr.length>=5)
		    {
		       for(int i=arr.length-1;i>=arr.length-iCount;i--)
		       {
		    	  itemlist.add(getItemsById(Integer.parseInt(arr[i])));  
		       }
		    }
		    else
		    {
		    	for(int i=arr.length-1;i>=0;i--)
		    	{
		    		itemlist.add(getItemsById(Integer.parseInt(arr[i])));
		    	}
		    }
		    return itemlist;
		}
		else
		{
			return null;
		}
		
	}
	
	
	public HashMap getOrderList(String user) {
		HashMap orderList = new HashMap();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		Ordergoods Order = null;
		try {
			
			conn = DBBean.getConnection();
			String sql = "select * from orders where username='" + user
				+ "'";
		//	System.out.print(sql);
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			while (rset.next()) {
				Order = new Ordergoods(rset.getString("username"),
						rset.getInt("pid"),rset.getString("ownername"), 
						rset.getInt("pnum"),rset.getString("pic"));
				//System.out.println("one");
				orderList.put(rset.getString("pid"), Order);
			}
       //     System.out.println(orderList.size());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} finally {
			try {
				rset.close();
				stmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return orderList;
	}

	public int addOrder(Ordergoods newOrder) {
		int result = 0; //
			String sql = "insert into orders(username,pid,ownername,pnum,pic)values('"
					+ newOrder.getUserName()
					+ "',"
					+ newOrder.getPID()
					+ ",'"
					+ newOrder.getOwnerName()
					+ "',"
					+ newOrder.getpNUM()+",'"+newOrder.getPic()+ "')";
			if (DBBean.update(sql)) {
				result = 2; 
			}
		return result;
	}
	
	public Ordergoods getOrder(String username) {
		String sql = "select * from orders where username=('" + username
				+ "')";
		Ordergoods Order = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;

		try {
			conn = DBBean.getConnection();
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			int i = 0;
			while (rset.next()) {
				Order = new Ordergoods(rset.getString("username"),
						rset.getInt("pid"),rset.getString("ownername"), 
						rset.getInt("pnum"),rset.getString("pic"));
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			DBBean.clean(conn, stmt, rset);
		}
		return Order;
	}

}