<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="entity.UseMan" %>
<%@ page import="entity.Ordergoods" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>订单详情</title>
<style type="text/css">
.one{float:left;margin-right:30px;}
</style>
</head>
<body>
 <center><h1>我的订单</h1></center>
 <div class="one">
 <%
 String user=(String)session.getAttribute("user");
 UseMan goodDao=new UseMan();
 HashMap<String,Ordergoods> productmap = new HashMap<String,Ordergoods>();
 productmap =goodDao.getOrderList(user);
 System.out.println(productmap.size());
 Iterator iterator = productmap.keySet().iterator();
  while(iterator.hasNext()){
	 // System.out.print("s");
  Ordergoods products = (Ordergoods)productmap.get(iterator.next());
 %>
<img src="images/<%= products.getPic()%>" width="130" height="150"/>
<br />
商品名称：<%= products.getOwnerName()%>
<br />
商品数量：<%= products.getpNUM()%>
</div>
<%} %>

</body>
</html>