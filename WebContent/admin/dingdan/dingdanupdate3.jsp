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

      
   
     <section>
      <h2><strong style="color:grey;">订单详情</strong></h2>
      <ul class="ulColumn2">
      
       <li>
        <span class="item_name" style="width:120px;">收件人姓名：</span>
        <input type="text" value="${bean.user.truename  }" readonly class="textbox textbox_295" />
       </li>
       
        <li>
        <span class="item_name" style="width:120px;">收件地址：</span>
        <input type="text" value="${bean.user.address  }" readonly class="textbox textbox_295" />
       </li>
       
        <li>
        <span class="item_name" style="width:120px;">联系电话：</span>
        <input type="text" value="${bean.user.phone }" readonly class="textbox textbox_295" />
       </li>
       
        <li>
        <span class="item_name" style="width:120px;">订购明细：</span>
        <textarea   id="contentid" readonly class="textarea" style="width:500px;height:100px;">${bean.xiangqing }</textarea>
       </li>
       
        <li>
        <span class="item_name" style="width:120px;">总价：</span>
        <input type="text" value="${bean.zongjia }" readonly class="textbox textbox_295" />
       </li>
       
     
       <li>
         <span class="item_name" style="width:120px;"></span>
       <button class="link_btn" onclick="javascript:history.go(-1);">返回</button>
       </li>
       
       
      </ul>
     </section>
     
     
     
    
   
 </div>
</section>
</body>
</html>
