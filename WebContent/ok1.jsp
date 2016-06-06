<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>提示</title>
    <script type="text/javascript">
function delayedRedirect()
{
window.location ="http://localhost:8080/SecondPC/success.jsp";
}
</script>
  </head>
  
  <body onLoad="setTimeout('delayedRedirect()',3000)">
    <center>
                   <h1> 添加购物车成功！</h1> 
                    <h2>3秒钟后将自动跳转到主页面 </h2> 
    </center> 
  </body>
</html>