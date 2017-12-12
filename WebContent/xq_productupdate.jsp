<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="css/base.css">
<link rel="stylesheet" type="text/css" href="css/common.css">
<script src="js/jquery-1.7.2.min.js"></script>
<script src="js/jquery.SuperSlide.2.1.js"></script>
<script src="js/common.js"></script>
<!--[if IE 6]>
<script src="js/DD_belatedPNG.js"></script>
<script>
  DD_belatedPNG.fix('#');
</script>
<![endif]-->
</head>

<body>
<div class="wrapper">
	<jsp:include page="top.jsp"></jsp:include>
	
	
	
	<div class="contenter clearfix">
		<jsp:include page="left.jsp"></jsp:include>
		
		
		
		
		<div class="contenter-main">
			<div class="cur-pos-wrap">
				<p class="cur-pos">您当前所在的位置：<a href="index.html">首页</a> &gt; <a href="pro.html">商品信息</a> &gt; 商品详细</p>
			</div>
			<div class="inside-contenter">
				<div class="pro-det">
					<div class="pro-det-head clearfix">
				    <input type="hidden" name="id" value="${bean.id }"/>
						<div class="pic"><img src="<%=basePath%>/temp/${bean.imgpath }"></div>
						<div class="text">
							 <p> 名称：${bean.name }</p>
                             <p> 类别：${bean.fenlei.name }</p>
                             <p> 价格：${bean.jiage }元</p>
						</div>
					</div>
					<div class="pro-det-mess">
						<h3 class="title">商品简介：</h3>
						
						<p>
						${bean.maoshu }
						</p>
						
					</div>
				</div>
				<div class="column-common-one">
					<div class="column-common-tit">
						<i class="tag-view"></i>
						<h3 class="title">	 
						&nbsp; &nbsp; &nbsp; &nbsp; 	
				
					<a href="indexmethod!gouwucheadd?productid=${bean.id }">【加入购物车】</a>&nbsp; &nbsp; &nbsp; &nbsp; 
                	 <a href="javascript:history.go(-1);" >【返回上页】</a>
						</h3> 
					</div>
					<ul >
					<c:forEach items="${list}" var="bean">
      <li class="tag-view">
      
      <span>
      评论用户:${bean.user.username }&nbsp; 
       评论时间:${fn:substring(bean.createtime,0, 10)}&nbsp; &nbsp; &nbsp; &nbsp; 
       </span>
       ${bean.content}</li>
     </c:forEach> 
      </ul>
					
				</div>
			</div>
		</div>
		
		
		
		<jsp:include page="right.jsp"></jsp:include>
		
		
		
	</div>
	<jsp:include page="down.jsp"></jsp:include>
</div>
</body>
</html>
