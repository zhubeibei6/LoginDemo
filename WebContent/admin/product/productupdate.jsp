<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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

      
    <form action="method!productupdate2" method="post" onsubmit="return checkform()">
    <input type="hidden" name="id" value="${bean.id }"/>
     <section>
      <h2><strong style="color:grey;">商品信息修改</strong></h2>
      <ul class="ulColumn2">

       
       <li>
        <span class="item_name" style="width:120px;">分类：</span>
        <select name="fenlei"  class="select">
          <c:forEach items="${fenleilist}" var="bean2">
             <option value="${bean2.id }" <c:if test="${bean2.id==bean.fenlei.id }">selected</c:if> >${bean2.name }</option>
          </c:forEach>
        </select>
       </li>
       
       <li>
        <span class="item_name" style="width:120px;">商品名：</span>
        <input type="text" name="name"  id='nameid' value="${bean.name}" class="textbox textbox_295" />
       </li>
       
        
       <li>
        <span class="item_name" style="width:120px;">价格：</span>
        <input type="text" name="jiage"  id='jiageid' value="${bean.jiage}" class="textbox textbox_295" />
       </li>
       

       
        <li>
        <span class="item_name" style="width:120px;">简介：</span>
        <textarea name="maoshu"  id="maoshuid"   class="textarea" style="width:500px;height:100px;">${bean.maoshu}</textarea>
       </li>
       
       
       <li>
        <span class="item_name" style="width:120px;">图片：</span>
        <label class="uploadImg">
         <img src='<%=basePath %>/temp/${bean.imgpath}' width="80" height="100"/>
        </label>
       </li>
       
       
       
     
       <li>
         <span class="item_name" style="width:120px;"></span>
          <input type="submit" value="提交" class="link_btn"/>
         <input type="button" onclick="javascript:history.go(-1);" value="返回" class="group_btn"/>
       </li>
       
       
      </ul>
     </section>
     </form>
     
     
    
   
 </div>
</section>
</body>
</html>
