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
<meta >
<link rel="stylesheet" type="text/css" href="css/base.css">
<link rel="stylesheet" type="text/css" href="css/common.css">

<script src="js/jquery-1.7.2.min.js"></script>
<script src="js/jquery.SuperSlide.2.1.js"></script>
<script src="js/common.js"></script>
<script language="javascript" type="text/javascript">

function changenum(id){
		var num = document.getElementById(id+"_num").value;
		var reg1 =  /^\d+$/;
	if (num.match(reg1) == null)
	{
		alert("购买数量必须为正整数");
		return false;
	}
		if (num == 0 )
	{
		alert("购买数量必须大于0的正整数");
		return false;
	}
		var now = new Date(); 
		var t = now.getTime()+''; 
		window.location.href="indexmethod!gouwucheupdate?id="+id+"&number="+num+"&t="+t;
		
		
	}

</script>
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
				<p class="cur-pos">您当前所在的位置：<a >首页</a> &gt; 购物车</p>
			</div>
			<div class="inside-contenter">
				
	          <table style="width:100%;">
   
                     <tr style="width:100%;" >
                    	<td  style="float:left;width:28%" >	
                         <span > 商品</span>
                        </td>
                        
                         <td style="float:left;width:15%" >	
                           <span > 单价</span>
                        </td>
                        
                         <td style="float:left;width:27%" >	
                           <span >   数量</span>
                        </td>
                        
                         <td style="float:left;width:15%" >	
                           <span > 金额</span>
                        </td>
                         <td style="float:left;width:15%" >	
                          <span >  操作</span>
                        </td>
                          </tr>
                          </table>
                        
                        
                        
                        
                         <table style="width:100%;">
                         <c:forEach items="${list}" var="bean">
                       
                         <tr style="width:100%;">
                        
                         <td  style="float:left;width:28%" >	
                          ${bean.product.name }
                        </td>
                        
                         <td style="float:left;width:15%" >	
                                                                       ￥${bean.product.jiage}
                        </td>
                        
                         <td style="float:left;width:27%" >
                          <input type="text" name="number"  value="${bean.number }" id="${bean.id }_num"  size="3"/>&nbsp;
                          <input style="height:20px;" onclick="changenum(${bean.id });"  type="button" value="保存" />
                        </td>
                         
                         <td style="float:left;width:15%" >	
                         <span style="color: red">￥${bean.product.jiage * bean.number}</span>
                        </td>
                         <td style="float:left;width:15%" >	
                          <a href="indexmethod!gouwuchedelete?id=${bean.id }" onclick=" return confirm('确定要删除吗?'); "><span style="color: black">删除</span></a>
                        </td>
                     
                    </tr>
                  
              </c:forEach>
              
    </table>
	
	<br/>  
    <div style="text-align:right;" class="pagelist"> 合计:￥${zongjia }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	<a href="indexmethod!dingdanadd?id=${bean.id }" >【结算】</a> </div>
	

			</div>		
		</div>
		
		
	<jsp:include page="right.jsp"></jsp:include>
		
		
		
	</div>
	<jsp:include page="down.jsp"></jsp:include>
</div>
</body>
</html>
