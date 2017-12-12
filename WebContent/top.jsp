<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html>
<html>
<head>
    <meta >
    <link rel="stylesheet" type="text/css" href="css/base.css">
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/jquery.SuperSlide.2.1.js"></script>
    <script src="js/common.js"></script>
</head>
<body>
    
        <div class="header">
            <span style="font-size:50px;font-weight: bold;color: black; margin-left:39%;">
                              网上商城
    </span>
            <div class="header-nav">
                <ul class="header-nav-list clearfix">
                    <li class="nav-one"><a href="index.jsp" >首页</a> </li>
                    <li class="nav-one"><a href="indexmethod!productlist" >商品信息</a></li>
                    <li class="nav-one"><a href="indexmethod!gouwuchelist" >购物车</a> </li>
                    <li class="nav-one"><a href="indexmethod!dingdanlist" >订单管理</a> </li>
                    <li class="nav-one"><a href="indexmethod!sy_gonggaolist" >公告信息</a> </li>
                    <li class="nav-one"></li>
                    <li class="nav-one"></li>
                </ul>
            </div>
            <div class="header-search">
                <div class="header-search-input clearfix">
                 <form action="indexmethod!productlist" method="post"  >
                    <input name="name" type="text"  value="${name }" class="form-text-search"  placeholder="请输入商品名称" >
                    <input style="width:50px; height:22px;" type="submit" name="submit"  value="查询"  />  
                    </form>
                </div>
                <div class="header-search-words">
               
                </div>
            </div>
        </div>
        
    
</body>
</html>
