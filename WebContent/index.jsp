<%@ page import="java.util.*" %>
<%@ page import="entity.User" %>
<%@ page import="entity.UseMan" %>
<%@ page import="entity.Items" %>
<%@ taglib uri="http://java.sun.com/jstl/core"  prefix="c"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="mine" uri="Dice" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
<meta charset="UTF-8">
<title>花生二手电脑城首页</title>
<link href="yangshi.css" rel="stylesheet" type="text/css">
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
<div class="logo">
<img src="images/logox.jpg">
</div>
<form action="Searching" method="Post">		     
<div class="searchbox">
	<div class="bodys">
	<p><input type="text" name="searchName" class="one" placeholder="输入宝贝" /><button type="submit" class="one1">搜索</button></p>
    </div>
 </div>
 </form>
 <div class="gouwuche">
  <a href="cart.jsp"  target="_blank">
    <img src="images/cart.jpg" width="50" height="50"></a></div>
 <div class="classify"><a class="shapec" href="#" target="_blank">全场商品分类</a></div>
 <div class="nav">
<ul>
<li><a href="#">首 页</a></li>
<li><a href="#">电脑二手</a></li>
<li><a href="#">配件二手</a></li>
<li><a href="#">二手特惠</a></li>
<li><a href="#">今日最新</a></li>
<li><a href="#">智能生活</a></li>
</ul>
</div>
 
<div class="classifysheet">
  <img src="images/macbook.png">&nbsp;&nbsp;&nbsp;<a class="fontbt" href="#" target="_blank">笔记本</a>
  <br />
  <br />
  <hr style=" height:1px;border:none;border-top:2px solid gray" />
  <img src="images/pc.png">&nbsp;&nbsp;&nbsp;<a class="fontbt" href="#" target="_blank">台式机</a>               
  <br />
  <br />
  <hr style=" height:1px;border:none;border-top:2px solid gray" />
  <img src="images/pad.png">&nbsp;&nbsp;<a class="fontbt" href="#" target="_blank">平板电脑</a>
  <br />
  <br />
  <hr style=" height:1px;border:none;border-top:2px solid gray" />
  <img src="images/mouse.png">&nbsp;&nbsp;<a class="fontbt" href="#" target="_blank">数码3C配件</a>
  <br />
  <br />
  <hr style=" height:1px;border:none;border-top:2px solid gray" />
  <img src="images/headphones19.png">&nbsp;&nbsp;<a class="fontbt" href="#" target="_blank">智能穿戴</a>
  <br />
  <br />
</div>
 
 <div class="promotion">
           <table     >
                <TD>
                    <EMBED  
                           src="peanut.swf" width="820" height="300"
                           type=application/x-shockwave-flash  wmode="transparent"
                           quality="high"></EMBED></TD><td ></td></table>
 </div>
 
   <div class="selloperate">
            <a href="index.jsp">
            <p><img src="images/zm1.png" width="150" height="120"></p>   
            </a>
            <br />
            <p><img src="images/zm3.png" width="150" height="120"></p>
    </div>
    <br />
      <div class="recommend">
            <div class="photolist">
                <br />
                <br />
               
                <img src="images/user.png" width="140" height="140">
            </div>
            <div class="judge">
            <form  method="post" action="save.php">
                <br />
                <br />
                <br />
                <p>Hi!</p>
                <br />
                <p><strong>您可能感兴趣</strong></p>
            </form>
            </div>
            <div class="promo">
                <p class="product1">
                <p>&nbsp;&nbsp;<strong>猜你喜欢</strong></p>
                <br />
                <div class="note2"></div>
                <hr style=" height:1px;border:none;border-top:2px solid gray" width="700"/>
                </p>
                <div class="photolist">
                  <c:forEach var="i"  begin="0" end="5">         
             <a href="details.jsp?idd=${mine:itemImportid(i)}" target="_blank"><img src="images/${mine:itemImportpic(i)}" width="130" height="150"/></a> 
             </c:forEach>
              <p><shaped>
              <c:forEach var="i"  begin="0" end="5">
             &nbsp;&nbsp;&nbsp;&nbsp;# ${mine:itemImportname(i)}&nbsp;&nbsp;&nbsp;</c:forEach></shaped></p>
                    
                </div>
            </div>
        </div>
      
       <div class="shuma">
       <p class="product1">
       <br />
       <p><div class="note"></div>&nbsp;&nbsp;&nbsp;&nbsp;<strong>数码控.3C也性感</strong></p>
       <br />
       <hr style=" height:1px;border:none;border-top:2px solid gray" />
       </p>
        <div class="pro1">
        <br />
        <br />
                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;显示器&nbsp;&nbsp;&nbsp;&nbsp;内存&nbsp;&nbsp;&nbsp;主板</p>
                <br />
                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;硬盘&nbsp;&nbsp;&nbsp;&nbsp;CPU&nbsp;&nbsp;&nbsp;&nbsp;显卡</p>
                <br />
                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;无线路由器&nbsp;&nbsp;&nbsp;&nbsp;充电宝</p>
                <br />
                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;无线鼠标&nbsp;&nbsp;&nbsp;&nbsp;音响</p>
                <br />
                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数据线&nbsp;&nbsp;&nbsp;&nbsp;</p>
            </div>
            <div class="photolist">
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;
               <c:forEach var="i"  begin="6" end="10">         
              <a href="details.jsp?idd=${mine:itemImportid(i)}" target="_blank"><img src="images/${mine:itemImportpic(i)}" width="130" height="150"/></a> 
             </c:forEach>
              <p><shaped>
              <c:forEach var="i"  begin="6" end="10">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# ${mine:itemImportname(i)}&nbsp;&nbsp;</c:forEach></shaped></p>
                    
            </div>
              <div class="photolist">
                <img src="images/1.jpg" height="50";width="10">
                <img src="images/2.jpg" height="50";width="10">
                <img src="images/3.jpg" height="50";width="10">
                <p><strong>戴上耳机，倾听</strong></p>
                <br />
                <p><span>想要暂时告别千篇一律的生活，踏上没有</span></p>
                <br />
                <p><span>目的的旅途？记得在行囊里烧伤自己心爱的</span></p>
                <br />
                <p><span>耳机和音乐，有了它们，一路上，不寂寞。</span></p>
                <br />
            </div>
       </div>
       
       <div class="shuma1">
       <p class="product1">
       <br />
       <p><div class="note"></div>&nbsp;&nbsp;&nbsp;&nbsp;<strong>平板控.玩转高科技</strong></p>
       <br />
       <hr style=" height:1px;border:none;border-top:2px solid gray" />
       </p>
        <div class="pro1">
        <br />
        <br />
                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;surface&nbsp;&nbsp;&nbsp;&nbsp;ipad&nbsp;&nbsp;&nbsp;mini2</p>
                <br />
                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;台电科技&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;双系统平板</p>
                <br />
                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ipad air&nbsp;&nbsp;&nbsp;&nbsp;平板键盘</p>
                <br />
                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;无线鼠标&nbsp;&nbsp;&nbsp;&nbsp;音响</p>
                <br />
                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;平板保护套&nbsp;&nbsp;&nbsp;&nbsp;</p>
            </div>
            <div class="photolist">
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;
                <c:forEach var="i"  begin="11" end="15">         
              <a href="details.jsp?idd=${mine:itemImportid(i)}" target="_blank"><img src="images/${mine:itemImportpic(i)}" width="130" height="150"/></a> 
             </c:forEach>
              <p><shaped>
              <c:forEach var="i"  begin="11" end="15">
             &nbsp;&nbsp;&nbsp;&nbsp;# ${mine:itemImportname(i)}&nbsp;&nbsp;&nbsp;</c:forEach></shaped></p>
                    
            </div>
              <div class="photolist">
                <img src="images/5.jpg" height="50";width="10">
                <img src="images/6.jpg" height="50";width="10">
                <img src="images/7.jpg" height="50";width="10">
                <p><strong>最顺手的那只鼠标</strong></p>
                <br />
                <p><span>鼠标的发明是计算机诞生50年来最重大的事</span></p>
                <br />
                <p><span>件之一。但，不说可能还没发现，我们每天</span></p>
                <br />
                <p><span>碰触最多的，竟然都是那只小老鼠！</span></p>
                <br />
            </div>
       </div>
       
        <div class="shuma2">
       <p class="product1">
       <br />
       <p><div class="note"></div>&nbsp;&nbsp;&nbsp;&nbsp;<strong>笔记本.办公随时随地</strong></p>
       <br />
       <hr style=" height:1px;border:none;border-top:2px solid gray" />
       </p>
        <div class="pro1">
        <br />
        <br />
                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联想&nbsp;&nbsp;&nbsp;&nbsp;戴尔&nbsp;&nbsp;&nbsp;索尼</p>
                <br />
                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;宏基&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;macbook</p>
                <br />
                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;游戏本&nbsp;&nbsp;&nbsp;&nbsp;超极本</p>
                <br />
                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;外星人&nbsp;&nbsp;&nbsp;&nbsp;华硕</p>
                <br />
            </div>
            <div class="photolist">
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;
             <c:forEach var="i"  begin="16" end="20">         
              <a href="details.jsp?idd=${mine:itemImportid(i)}" target="_blank"><img src="images/${mine:itemImportpic(i)}" width="130" height="150"/></a> 
             </c:forEach>
              <p><shaped>
              <c:forEach var="i"  begin="16" end="20">
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# ${mine:itemImportname(i)}&nbsp;&nbsp;</c:forEach></shaped></p>
                    
            </div>
              <div class="photolist">
                <img src="images/17.jpg" height="50";width="10">
                <img src="images/18.jpg" height="50";width="10">
                <img src="images/19.jpg" height="50";width="10">
                <p><strong>还以为台式机比笔记本快？</strong></p>
                <br />
                <p><span>很多人还认为台式电脑一定比笔记本电脑快</span></p>
                <br />
                <p><span>其实相同配置的笔记本和台式一样快哦</span></p>
                <br />
                <p><span>来花生网就捡性价比高的买！</span></p>
                <br />
            </div>
       </div>
       
        <div class="footer">
        <img src="images/foot.png" width=100%>
        <img src="images/catch.png" width=100%>
    </div>
</div>
</body>
</html>