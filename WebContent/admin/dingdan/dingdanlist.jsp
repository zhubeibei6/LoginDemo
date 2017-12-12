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
      <form action="method!dingdanlist"  method="post">
      <input name="orderid" type="text"  value="${orderid }" class="textbox" placeholder="订单编号"/>
       状态：<select name="status" class="select" >
      <option value="">--所有--</option>
     
      <option value="已付款" <c:if test="${status=='已付款' }">selected</c:if>>已付款</option>
       <option value="已发货" <c:if test="${status=='已发货' }">selected</c:if> >已发货</option>
        <option value="已收货" <c:if test="${status=='已收货' }">selected</c:if> >已收货</option>
      </select>
      <input type="submit" value="查询" class="group_btn"/>
      </form>
     </section>
     
     <section>
      <div class="page_title">
       <h2 class="fl">订单列表</h2>
      </div>
      <table class="table">
       <tr>
        <th>序号</th>
        <th>订单号</th>
        <th>总价(元)</th>
        <th>购买用户</th>
        <th>订单状态</th>
        <th>订单生成时间</th>
        <th>操作</th>
       </tr>
       
       <c:forEach items="${list}"  var="bean" varStatus="v">
       <tr>
        <td>${v.index+1 }</td>
        <td>${bean.orderid }</td>
        <td>${bean.zongjia  }</td>
        <td>${bean.user.username }</td>
        <td>
         <c:if test="${bean.status=='已收货' }"><span style="color: blue">已收货</span></c:if>
         <c:if test="${bean.status=='已发货' }"><span style="color: green">已发货</span></c:if>
         <c:if test="${bean.status=='已付款' }"><span style="color: red">已付款</span></c:if>
        </td>
        <td>${fn:substring(bean.createtime,0, 19)}</td>
        <td>
         <c:if test="${bean.status=='已付款' }">
         <a href="method!fh_dingdanupdate?id=${bean.id }" >发货</a>
         </c:if>
         <a href="method!dingdanupdate3?id=${bean.id }" >查看</a> &nbsp;
         <a href="method!dingdandelete?id=${bean.id }" onclick=" return confirm('确定要删除吗?');">删除</a>
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
