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
<link rel="stylesheet" type="text/css" href="css/test.css">

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
				<p class="cur-pos">您当前所在的位置：<a >首页</a> &gt; 订单管理</p>
			</div>
			<div class="inside-contenter">
				
				
            <table class="hovertable">
              <tr>
               <th>序号</th>
	           <th>单号</th>
	           <th>金额（元）</th>
	           <th>付款状态</th>
	           <th>购买用户</th>
	           <th>添加时间</th>
	           <th>操作</th>
              </tr>
              
               <c:forEach items="${list}" var="bean" varStatus="v">
             <tr >
	           <td>${v.index+1 }</td>
	           <td>${bean.orderid}</td>
	           <td>￥${bean.zongjia }</td>
	           <td>
	              <c:if test="${bean.status=='已收货' }"><span style="color: blue">已收货</span></c:if>
                  <c:if test="${bean.status=='已发货' }"><span style="color: green">已发货</span></c:if>
                  <c:if test="${bean.status=='已付款' }"><span style="color: red">已付款</span></c:if>
	           </td>
	            <td>${bean.user.username}</td>
	             <td> ${fn:substring(bean.createtime,0, 10)}</td>
	              <td>
	                      <c:if test="${bean.status=='已发货' }">
                             <a href="indexmethod!dingdanupdate?id=${bean.id } " onclick=" return confirm('确定要收货吗?'); "><span style="color: black">【确认收货】</span></a>
                             </c:if>  
                             
                                <c:if test="${bean.zt==0 }">
                             <c:if test="${bean.status=='已收货' }">
                            <a href="indexmethod!pjlist?id=${bean.id } "><span style="color: black">【评价】</span></a>
                          </c:if>  
                          </c:if>  
                          
                           <a href="indexmethod!dingdanupdate3?id=${bean.id } "><span style="color: black">【详情】</span></a>
                          <a href="indexmethod!dingdandelete?id=${bean.id }" onclick=" return confirm('确定要删除吗?'); "><span style="color: black">【删除】</span></a>
                        
                             
                             
	              </td>
             </tr>
              </c:forEach>
              
              


            </table>
            
				<table class="hovertable">
				 <tr>
               ${pagerinfo }
               </tr>
				 </table>
			</div>
			
			
		</div>
		
		
		
		  <jsp:include page="right.jsp"></jsp:include>
	</div>
	  <jsp:include page="down.jsp"></jsp:include>
</div>
</body>
</html>
