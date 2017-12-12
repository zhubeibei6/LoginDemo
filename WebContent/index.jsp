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



</head>

   <%
org.springframework.web.context.WebApplicationContext app = org.springframework.web.context.support.WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
dao.ProductDao productDao = (dao.ProductDao)app.getBean("productDao");
List<model.Product> list = productDao.selectBeanList(0,9999," where deletestatus=0 ");


%>

<body>
    <div class="wrapper">
         <jsp:include page="top.jsp"></jsp:include>
        
        <div class="contenter clearfix">
            <jsp:include page="left.jsp"></jsp:include>
            
            <div class="contenter-main">
                <div class="column-one-wrap">
                    <div class="index-banner">
                        <div class="banner-pics">
                            <ul class="banner-pics-list clearfix">
                                <li><a ><img src="images/pic_banner_1.jpg"></a></li>
                                
                            </ul>
                        </div>
                        <div class="banner-tit clearfix">
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
