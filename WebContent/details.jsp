<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@ page import="entity.Items"%>
<%@ page import="entity.UseMan"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>商品详情</title>
<style type="text/css">
*{margin:0; padding:0;}
.head{height:50px;background:#F0F0F0}
.headright{position:absolute;right:0;top:0;left:1000px}
a.shapea:link{color:#C90F12;font-family:"Microsoft Yahei";text-decoration:none;}
.detail{position:absolute;right:0;top:100px;left:800px}
</style>
<script   language="javascript">  
function abc()
{	
	<%
    
    String use=(String)session.getAttribute("user");
               if(use==null)
            	  out.println("alert('请先登录！');");
    %>         
   
}
</script>
</head>
<body>
<div class="head">
 <form method="post" action="Select.do">
 <label><strong>您的城市</strong><img src="images/lamb.png"></label>
        <select name="city">
        <option value="北京">北京</option>
        <option value="长沙" selected="selected">长沙</option>
        <option value="重庆">重庆</option>
        <option value="海口">海口</option>
        <option value="杭州">杭州</option>
        <option value="天津">天津</option>
        <option value="合肥">合肥</option>
        <option value="上海">上海</option>
        <option value="其他">其他</option>
        </select>
        <input type="submit" id="submit"></input>
        <div class="headright">
        <br />
        <a class="shapea" href="login.jsp" target="_blank">登录</a>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a class="shapea" href="register.jsp" target="_blank">注册</a>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a class="shapea" href="#" target="_blank">收藏本页</a>   
            </div>
            </form>
        <hr />
</div>
<br />
<br />
          <form method="POST" action="carts">
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
           <%  UseMan itemsDao = new UseMan(); 
             ArrayList<Items> list = itemsDao.getAllItems();
               String s=request.getParameter("idd");
               int i = Integer.parseInt(s); 
               Items item = list.get(i-1);%>
            <img src="images/<%=item.getPicture()%>" width="300" height="350"/>
             <div class="detail">
             <p><input type="hidden" value="<%=item.getId()%>" name="goodid"></p>
             <p>名字：<%=item.getName()%></p>
             <br />
             <p>产地：<%=item.getCity()%></p>
             <br />
             <p>价格：￥<%=item.getPrice()%></p>
             <br />
             <p>库存：<%=item.getNumber()%></p>
             <br />
             <p>购买数量：<input type="text" id="number" value="1" name="number" size="2"/></p>
              <br />
              <input type="submit" value="添加到购物车" ></input></form>
              <br />
              <br />
               <a href="cart.jsp" target="_blank"> <input type="button" value="查看购物车"></input></a>
               <br />
               <br />
                <input type="button" onclick="abc()" value="立即购买"></input>        
             </div>
</body>
</html>