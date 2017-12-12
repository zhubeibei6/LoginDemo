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
      <form action="method!fenleilist"  method="post">
      <input name="name" type="text"  value="${name }" class="textbox" placeholder="分类名"/>
      <input type="submit" value="查询" class="group_btn"/>
      </form>
     </section>
     
     <section>
      <div class="page_title">
       <h2 class="fl">分类信息列表</h2>
      </div>
      <table class="table">
       <tr>
        <th>分类名</th>
        <th>操作</th>
       </tr>
       
       <c:forEach items="${list}"  var="bean">
       <tr>
        <td>${bean.name }</td>
        <td>
         <a href="method!fenleiupdate?id=${bean.id }" >修改</a> &nbsp;
         <a href="method!fenleidelete?id=${bean.id }" onclick=" return confirm('确定要删除吗?');">删除</a>
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
