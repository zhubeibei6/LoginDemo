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
    <!--[if IE 6]>
<script src="js/DD_belatedPNG.js"></script>
<script>
  DD_belatedPNG.fix('#');
</script>
<![endif]-->
</head>

     <%
org.springframework.web.context.WebApplicationContext app = org.springframework.web.context.support.WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
dao.FenleiDao fenleiDao = (dao.FenleiDao)app.getBean("fenleiDao");
List<model.Fenlei> list = fenleiDao.selectBeanList(0,9999," where deletestatus=0 ");


%>

<body>
    <div class="wrapper">
      
       
       
            <div class="sidebar-nav">
                <h3 class="sidebar-nav-list">商品分类</h3>
                <ul class="sidebar-nav-list">
                    <li class="nav-one on">
                        <ul class="sidebar-nav2-list">
                          <%
        for(model.Fenlei bean:list){
        %>
                            <li><a href="indexmethod!productlist?fenlei=<%=bean.getId() %>"><%=bean.getName() %></a></li>
                             <% 
        }
        %>
                        </ul>
                    </li>
                </ul>
            </div>
            
            
          
   
         
        </div>
        
   
</body>
</html>
