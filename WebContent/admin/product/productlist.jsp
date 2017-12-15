<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
%>
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
      <form action="method!productlist"  method="post">
      <input name="name" type="text"  value="${name }" class="textbox" placeholder="类名"/>
        商品分类：<select name="fenlei" class="select" >
      <option value="">--所有--</option>
       <c:forEach items="${fenleilist}"  var="bean2">
         <option value="${bean2.id }" <c:if test="${fenlei== bean2.id }">selected</c:if>>${bean2.name }</option>
       </c:forEach>
      </select>
      <input type="submit" value="查询" class="group_btn"/>
      </form>
     </section>
     
     <section>
      <div class="page_title">
       <h2 class="fl">商品信息列表</h2>
      </div>
      <table class="table">
       <tr>
        <th>商品名</th>
		<th>商品分类</th>
		<th>商品价格 （元）</th>
		<th>商品图片</th>
		<th>商品销量</th>
		<th>简介</th>
		<th>发布时间</th>
		<th>操作</th>
       </tr>
       
       <c:forEach items="${list}"  var="bean">
       <tr>
        <td>${bean.name }</td>
		<td>${bean.fenlei.name }</td>
		<td>${bean.jiage }</td>
		<td><img src='<%=basePath %>/temp/${bean.imgpath}' width="80" height="100"/></td>
		<td>${bean.xiaoliang }</td>
		<td>${bean.maoshu }</td>
        <td>${fn:substring(bean.createtime,0, 19)}</td>
        <td>
         <a href="method!productupdate?id=${bean.id }" >修改</a> &nbsp;
         <a href="method!productdelete?id=${bean.id }" onclick=" return confirm('确定要删除吗?');">删除</a>
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
