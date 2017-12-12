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
             
                <div class="inside-contenter">
                    <ul class="pros-list row-list-2 clearfix">
                     <c:forEach  items="${list}" var="bean">
                        <li>
                            <div class="pros-one clearfix">
                                <a href="indexmethod!xq_productupdate?id=${bean.id }" class="pic">
                                    <img src="<%=basePath%>/temp/${bean.imgpath }"></a>
                                <div >
                                    <p> 名称：${bean.name }</p>
                                    <p> 类别：${bean.fenlei.name }</p>
                                    <p> 单价：${bean.jiage }元</p>
                                   
                                </div>
                            </div>
                        </li>
                         </c:forEach>
                  
                       
                       
                       
                    </ul>
                </div>
                
                    <div > ${pagerinfo }</div>
                
            </div>
            
            
           <jsp:include page="right.jsp"></jsp:include>
        </div>
        
       <jsp:include page="down.jsp"></jsp:include>
    </div>
</body>
</html>
