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
<script language="javascript" type="text/javascript">
 function checkform()
 {

	if (document.getElementById('fenleiid').value=="")
	{
		alert("商品分类不能为空");
		return false;
	}	
	if (document.getElementById('nameid').value=="")
	{
		alert("商品名不能为空");
		return false;
	}	
	if (document.getElementById('jiageid').value=="")
	{
		alert("商品价格不能为空");
		return false;
	}	
	if (document.getElementById('maoshuid').value=="")
	{
		alert("商品介绍不能为空");
		return false;
	}	
	if (document.getElementById('uploadfileid').value=="")
	{
		alert("商品图片不能为空");
		return false;
	}
	var valid=/^\d*$/;
	
	if(!valid.test(document.getElementById('jiageid').value)){
		alert("商品价格必须是数字");
		return false;
	}
	
	return true;	
 }
	
</script>
</head>
<body>


<section class="rt_wrap content mCustomScrollbar">
 <div class="rt_content">

      
    <form action="method!productadd2" method="post" onsubmit="return checkform()" enctype="multipart/form-data">
     <section>
      <h2><strong style="color:grey;">商品信息添加</strong></h2>
      <ul class="ulColumn2">
      
       <li>
        <span class="item_name" style="width:120px;">分类：</span>
        <select name="fenlei"  id='fenleiid' class="select">
          <option value="">--请选择--</option>
         <c:forEach items="${fenleilist}" var="bean">
           <option value="${bean.id }"  >${bean.name }</option>
         </c:forEach>
        </select>
       </li>
       
       <li>
        <span class="item_name" style="width:120px;">商品名：</span>
        <input type="text" name="name"  id='nameid' class="textbox textbox_295" />
       </li>
       
        
       <li>
        <span class="item_name" style="width:120px;">价格：</span>
        <input type="text" name="jiage"  id='jiageid' class="textbox textbox_295" />
       </li>
       

       
        <li>
        <span class="item_name" style="width:120px;">简介：</span>
        <textarea name="maoshu"  id="maoshuid"  placeholder="简介输入" class="textarea" style="width:500px;height:100px;"></textarea>
       </li>
       
       
       <li>
        <span class="item_name" style="width:120px;">上传图片：</span>
        <label class="uploadImg">
         <input type="file"  name="uploadfile"  id="uploadfileid"/>
        </label>
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
