<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title></title>
<meta name="author" content="DeathGhost" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<!--[if lt IE 9]>
<script src="js/html5.js"></script>
<![endif]-->
<script src="js/jquery.js"></script>
<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>

</head>
<body>
<!--header-->

 
 <h1>
   当前角色： <c:if test="${manage.username!='admin'}">书城管理员</c:if>
			     <c:if test="${manage.username=='admin'}">系统管理员</c:if>
 </h1>
 
 
		    
  <a href="method!changepwd" target="main" class="set_icon">密码修改</a>
  <a href="method!loginout" target=_top class="quit_icon">安全退出</a>





</body>
</html>
