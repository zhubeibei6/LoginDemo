<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
			
			<div class="inside-contenter">
				<div class="contact-content">
					<input type="hidden" name="id" value="${bean.id }"/>
					<div class="incontact-way">
						<p>订购号：${bean.orderid  }</p>
						<p>购买商品：${bean.xiangqing }</p>
						<p>购买总价：${bean.zongjia }元</p>
						<p>订购用户：${bean.user.username  }</p>
						<p>收件地址：${bean.user.address }</p>
						<p>联系电话：${bean.user.phone }</p>
						<p> <a href="javascript:history.go(-1);" >返回上页</a></p>
					</div>
					
					
					
				</div>
				
			</div>
		</div>
		
		
		
		 <jsp:include page="right.jsp"></jsp:include>
		
		
		
		
	</div>
	 <jsp:include page="down.jsp"></jsp:include>
</div>
</body>
</html>
