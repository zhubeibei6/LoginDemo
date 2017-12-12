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
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
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
      <form action="method!tj_dingdanlist"  method="post">
    <input type="text" name="time" class="textbox" value="${time}" onfocus="WdatePicker({isShowWeek:true})"><img onclick="WdatePicker({el:'d12'})" src="js/My97DatePicker/skin/datePicker.gif" width="16" height="22" align="absmiddle">
      <input type="submit" value="查询" class="group_btn"/>
      </form>
     </section>
     
     <section>
      <div class="page_title">
       <h2 class="fl">统计信息</h2>
      </div>
      <table class="table">
       <tr>
        <th>日期</th>
        <th>金额(元)</th>
    
       </tr>
       
       <c:forEach items="${list}"  var="bean" varStatus="v">
       <tr>
        
        <td>${bean[0] }</td>
        <td>${bean[1] }</td>

       </tr>
      </c:forEach>
      
      </table>
      
      
     </section>
    
   
   
 </div>
</section>
</body>
</html>
