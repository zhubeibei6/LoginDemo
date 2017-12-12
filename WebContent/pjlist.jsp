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
			<div class="cur-pos-wrap">
				<p class="cur-pos">您当前所在的位置：<a href="index.html">首页</a> &gt; 评价</p>
			</div>
			<div class="inside-contenter">
				<div class="contact-content">
					
				
						<form id="form-feedback" action="indexmethod!pjadd" method="post" onsubmit="return checkform()" >
							<input type="hidden" name=id value="${bean.id }"/>
							 <c:forEach items="${list}" var="bean2" varStatus="v">
							<ul class="feedback-form-list">
								<li>
									<label class="title" for="fback-title">商品：</label>${bean2.product.name}
								</li>
								<li>
									<label class="title" for="fback-name">单价：</label>${bean2.product.jiage}
								</li>
								<li>
									<label class="title" for="fback-phone">数量：</label>${bean2.number}
								</li>
								<li>
									<label class="title" for="fback-email">购买时间：</label>${fn:substring(bean2.createtime,0, 11)} 
								</li>
								<li>
									<label class="title" for="fback-content">评价内容：</label>
									  <input  name='ct${v.index }' type="hidden"  value="${bean2.id }" />
									<textarea name="content${v.index }" id="contentid" class="form-textarea-normal" >
									</textarea>
								</li>
								
							</ul>
							</c:forEach>
							<ul class="feedback-form-list">
							<li>
									<label class="title"></label><input style="width:80px; height:20px;" type="submit" name="submit"  value="提交"  />
								</li>
								</ul>
						</form>
				
				</div>
				
			</div>
		</div>
		
		
		
		 <jsp:include page="right.jsp"></jsp:include>
		
		
		
		
	</div>
	 <jsp:include page="down.jsp"></jsp:include>
</div>
</body>
</html>
