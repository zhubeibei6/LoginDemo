<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<meta name="author" content="DeathGhost" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<!--[if lt IE 9]>
<script src="js/html5.js"></script>
<![endif]-->
<script src="js/jquery.js"></script>
<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
</head>

<body>

<section class="rt_wrap content mCustomScrollbar">
 <div class="rt_content">

      <section>
      <h2></h2>
      
     </section>
     
     <section>
      <div class="page_title">
       <h2 class="fl">书城管理员信息列表</h2>
      </div>
      <table class="table">
       <tr>
        <th>用户名</th>
         <th>密码</th>
        <th>操作</th>
       </tr>
       
       <c:forEach items="${list}"  var="bean">
       <tr>
        <td>${bean.username }</td>
         <td>${bean.password }</td>
        <td>
         <a href="method!managedelete?id=${bean.id }" onclick=" return confirm('确定要删除吗?');">删除</a>
        </td>
       </tr>
      </c:forEach>
      
      </table>
      
      <aside class="paging">
       <a>${pagerinfo }</a>
      </aside>
     </section>
    
   
   
 </div>
</section>
</body>
</html>
