<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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

      
    <form action="method!fenleiupdate2" method="post" onsubmit="return checkform()">
    <input type="hidden" name="id" value="${bean.id }"/>
     <section>
      <h2><strong style="color:grey;">分类名修改</strong></h2>
      <ul class="ulColumn2">
      
        <li>
        <span class="item_name" style="width:120px;">分类名：</span>
        <input type="text" name="name"  id='nameid' value="${bean.name }" class="textbox textbox_295" />
       </li>
       
     
       <li>
         <span class="item_name" style="width:120px;"></span>
          <input type="submit" value="提交" class="link_btn"/>
       <button class="link_btn" onclick="javascript:history.go(-1);">返回</button>
       </li>
       
       
      </ul>
     </section>
     </form>
     
     
    
   
 </div>
</section>
</body>
</html>
