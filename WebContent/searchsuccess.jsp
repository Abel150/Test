<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="entity.Items" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
<meta charset="UTF-8">
<title>搜索结果</title>
<link href="yangshi.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="head">
<div class="header">
 <c:choose>
<c:when test="${city!=null}">
<p>Hello!，您在<c:out value='${sessionScope.city}'/>
<img src="images/lamb.png"></p>
</c:when>
<c:otherwise>
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
        </form>
        </c:otherwise>
  </c:choose>    
    <div class="headright">
    <br />
   <b>Welcome,&nbsp;&nbsp;<c:out value='${sessionScope.user}' default='guest'/></b>
            </div>
            <div class="headuser">
             <img src="images/user111.png">
            </div>
            <hr />
</div>
</div>
<div class="logo">
<img src="images/logox.jpg">
</div>		
<br/>
<br/>  
<br/>  
<br/>  
<br/>  
<br />
<br />
<br />     
<h1><center>搜索结果</center></h1>
<% 
   ArrayList list=(ArrayList)request.getAttribute("lista");
   Items ii=new Items();
%>

<table width="100%" height="125" border="1">
  <tr>
    <th  bgcolor="#cccccc" scope="col">商品号</th>
    <th  bgcolor="#cccccc" scope="col">商品名称</th>
    <th  bgcolor="#cccccc" scope="col">产地</th>
    <th  bgcolor="#cccccc" scope="col">库存</th>
    <th  bgcolor="#cccccc" scope="col">价格</th>
    <th  bgcolor="#cccccc" scope="col">商品图片</th>
  
  </tr>
 <%for(int i=0;i<list.size();i++){
	 ii=(Items)list.get(i);
	  
	 %>

  <tr>
  <td align="center">
    <%=ii.getId() %>
  </td>
  <td align="center">
    <a href="details.jsp?idd=<%=ii.getId() %>" style="border:0">
   <%=ii.getName() %>
     </a>
  </td >
  <td align="center">
   <%=ii.getCity() %>
  </td>
  <td align="center">
   <%=ii.getNumber() %>
  </td>
  <td align="center">
   ￥<%=ii.getPrice() %>
  </td>
  <td align="center">
   <img src="images/<%=ii.getPicture()%>" width="130" height="150"/>
   <%
   System.out.println(ii.getPicture());
   %>
  </td>
  </tr>

   <%   } %>
</table>

</body>
</html>