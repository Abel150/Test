<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html lang="en-US">
<head>
 <base href="<%=basePath%>">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <meta charset="utf-8">
    <title>登录界面</title>
    <style type="text/css">
        body {
            background-color:#F48383;
            color: #000;
            font-family: "Varela Round", Arial, Helvetica, sans-serif;
            font-size: 16px;
            line-height: 1.5em;
        }
        input {
            border: none;
            font-family: inherit;
            font-size: inherit;
            font-weight: inherit;
            line-height: inherit;
            -webkit-appearance: none;
        }
        #login {
            margin: 80px auto;
            width: 400px;
        }
        #login h2 {
            background-color: #f95252;
            -webkit-border-radius: 20px 20px 0 0;
            -moz-border-radius: 20px 20px 0 0;
            border-radius: 20px 20px 0 0;
            color: #fff;
            font-size: 28px;
            padding: 20px 26px;
        }
        #login h2 span[class*="fontawesome-"] {
            margin-right: 14px;
        }
        #login fieldset {
            background-color: #fff;
            -webkit-border-radius: 0 0 20px 20px;
            -moz-border-radius: 0 0 20px 20px;
            border-radius: 0 0 20px 20px;
            padding: 20px 26px;
        }
        #login fieldset p {
            color: #777;
            margin-bottom: 14px;
        }
        #login fieldset p:last-child {
            margin-bottom: 0;
        }
        #login fieldset input {
            -webkit-border-radius: 3px;
            -moz-border-radius: 3px;
            border-radius: 3px;
        }
        #login fieldset input[type="text"], #login fieldset input[type="password"] {
            background-color: #eee;
            color: #777;
            padding: 4px 10px;
            width: 328px;
        }
        #login fieldset input[type="submit"] {
            background-color: #33cc77;
            color: #fff;
            display: block;
            margin: 0 auto;
            padding: 4px 0;
            width: 100px;
        }
        #login fieldset input[type="reset"] {
            background-color: red;
            color: #fff;
            display: block;
            margin: 0 auto;
            padding: 4px 0;
            width: 100px;
        }
    </style>
</head>

<body>
<div id="login">
    <h2><span class="fontawesome-lock"></span>Sign In</h2>
    <form action="helpLoogin" method="POST">
        <fieldset>

            <p><label for="email">Login name</label></p>
            <p><input type="text" id="username" value="loginname" onBlur="if(this.value=='')this.value='loginname'" onFocus="if(this.value=='loginname')this.value=''" name="username"></p> 
            <p><label for="password">Password</label></p>
            <p><input type="password" id="password" value="password" onBlur="if(this.value=='')this.value='password'" onFocus="if(this.value=='password')this.value=''" name="password"></p>
            <p><input type="submit" name="Submit" value="Sign In"></p>
            <p><input type="reset" value="Reset"></p>
        </fieldset>
    </form>
</div>
</body>
</html>