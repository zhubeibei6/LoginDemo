<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>后台管理系统</title>
<meta name="author" content="DeathGhost" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<!--[if lt IE 9]>
<script src="js/html5.js"></script>
<![endif]-->
<script src="js/jquery.js"></script>
<script type=text/javascript>
$(document).ready(function(){
	$("#firstpane .menu_body:eq(0)").show();
	$("#firstpane p.menu_head").click(function(){
		$(this).addClass("current").next("div.menu_body").slideToggle(300).siblings("div.menu_body").slideUp("slow");
		$(this).siblings().removeClass("current");
	});
	$("#secondpane .menu_body:eq(0)").show();
	$("#secondpane p.menu_head").mouseover(function(){
		$(this).addClass("current").next("div.menu_body").slideDown(500).siblings("div.menu_body").slideUp("slow");
		$(this).siblings().removeClass("current");
	});
	
});
</script>
<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
<link rel=stylesheet type=text/css href="css/zzsc.css"/>
<script type=text/javascript src="js/jquery.min.js"></script>
</head>
<body>



<aside class="lt_aside_nav ">

<!-- 书城管理员 -->

  <div id="firstpane" class="menu_list">

   <p class="menu_head">用户管理</p>
    <div style="display:none" class=menu_body >
       <a href="method!userlist" target="main">用户信息管理</a>
    </div>
    
   
   <p class="menu_head">公告管理</p>
    <div style="display:none" class=menu_body >
      <a href="method!gonggaoadd" target="main">公告添加</a>
       <a href="method!gonggaolist" target="main">公告信息管理</a>
    </div>
   
    <p class="menu_head">分类管理</p>
    <div style="display:none" class=menu_body >
      <a href="method!fenleiadd" target="main">分类信息添加</a>
       <a href="method!fenleilist" target="main">分类信息管理</a>
    </div>
    
    <p class="menu_head">商品信息管理</p>
    <div style="display:none" class=menu_body >
      <a href="method!productadd" target="main">商品信息添加</a>
       <a href="method!productlist" target="main">商品信息管理</a>
    </div>
    <p class="menu_head">订单管理</p>
    <div style="display:none" class=menu_body >
       <a href="method!dingdanlist" target="main">订单管理</a>
    </div>
      <p class="menu_head">统计管理</p>
    <div style="display:none" class=menu_body >
      <a href="method!tj_dingdanlist" target="main">统计管理</a>
    </div>
    
    <p class="menu_head">系统操作</p>
    <div style="display:none" class=menu_body >
         <a href="method!changepwd" target="main" >密码修改</a>
          <a href="method!loginout" target=_top >安全退出</a>
    </div>
   
  
</div>


 
</aside>






</body>
</html>
