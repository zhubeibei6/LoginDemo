<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

 <!doctype html>
 <html lang="zh-CN">
 <head>
  
    <link rel="stylesheet" href="css/common.css">
   <link rel="stylesheet" href="css/main.css">
   <script type="text/javascript" src="js/jquery.min.js"></script>
   <script type="text/javascript" src="js/colResizable-1.3.min.js"></script>
   <script type="text/javascript" src="js/common.js"></script>
   <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
   
   <script type="text/javascript">
      $(function(){  
        $(".list_table").colResizable({
          liveDrag:true,
          gripInnerHtml:"<div class='grip'></div>", 
          draggingClass:"dragging", 
          minWidth:30
        }); 
        
      }); 
   </script>
   <script language="javascript" type="text/javascript" src="../js/jquery.min.js"></script>

   <title></title>
 </head>
 <body>
  <form action="indexmethod!register" method="post"  onsubmit="return checkform()">
  <div class="container">
    
     <div id="forms" class="mt10">
        <div class="box">
          <div class="box_border">
            <div class="box_top"><b class="pl15">用户注册</b></div>
            <div class="box_center">
             
               <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">

                  <tr>
                  <td class="td_right">用户名:</td>
                  <td class="">
                  <input type="text" name="username" id="usernameid" class="input-text lh30" size="40">
                  </td>
                 </tr>
                 
                 <tr>
                  <td class="td_right">姓名:</td>
                  <td class="">
                  <input type="text" name="truename" id="truenameid" class="input-text lh30" size="40">
                  </td>
                 </tr>
                 
                 <tr>
                  <td class="td_right">密码:</td>
                  <td class="">
                  <input type="password" name="password" id="passwordid" class="input-text lh30" size="40">
                  </td>
                 </tr>
                 
                  <tr>
                  <td class="td_right">确认密码:</td>
                  <td class="">
                  <input type="password"  id="password2id" class="input-text lh30" size="40">
                  </td>
                 </tr>
                 
                 
                
                 
                   <tr>
                  <td class="td_right">性别:</td>
                  <td class="">
                  <span class="fl">
                  <select  name="sex" id="sexid"> 
                    <option value="男">男</option>
                    <option value="女">女</option>
                   </select>
                    </span> 
                  </td>
                 </tr>
                 
                  <tr>
                  <td class="td_right">手机号:</td>
                  <td class="">
                  <input type="text" name="phone" id="phoneid" class="input-text lh30" size="40">
                  </td>
                 </tr>
                
                  <tr>
                  <td class="td_right">地址:</td>
                  <td class="">
                  <input type="text" name="address" id="addressid" class="input-text lh30" size="40">
                  </td>
                 </tr>
                   
                     <tr>
                  <td class="td_right">邮箱:</td>
                  <td class="">
                  <input type="text" name="email" id="emailid" class="input-text lh30" size="40">
                  </td>
                 </tr>  

                 <tr>
                   <td class="td_right">&nbsp;</td>
                   <td class="">
                     <input type="submit" name="submit" class="btn btn82 btn_save2" value="保存"> 
                    <input type="reset"  class="btn btn82 btn_res" value="重置"> 
                   </td>
                 </tr>
               </table>
               
            </div>
          </div>
        </div>
     </div>
   </div> 
   </form>
 </body>
 <script language="javascript" type="text/javascript">

function checkform()
{
	 
	 if (document.getElementById('usernameid').value=="")
	{
		alert("用户名不能为空");
		return false;
	}

	if (document.getElementById('passwordid').value=="")
	{
		alert("密码不能为空");
		return false;
	}
	if (document.getElementById('passwordid').value.length<6)
	{
		alert("密码长度必须大于6位");
		return false;
	}
	if (document.getElementById('password2id').value != document.getElementById('passwordid').value)
	{
		alert("确认密码与密码不一致");
		return false;
	}	 
	if (document.getElementById('truenameid').value=="")
	{
		alert("姓名不能为空");
		return false;
	}
	

   if(document.getElementById('phoneid').value==""){
    alert("电话不能为空");
    return false;
   }	
   if(document.getElementById('phoneid').value.length!=11){
    alert("电话必须为11位 ");
    return false;
   }
  
	if(document.getElementById('addressid').value==""){
    alert("地址不能为空 ");
    return false;
   }	
   if(document.getElementById('ageid').value==""){
    alert("年龄不能为空 ");
    return false;
   }
   if(document.getElementById('ageid').value.length!=2){
    alert("年龄必须为0-100间的整数  ");
    return false;
   }  
   if(document.getElementById("emailid").value==""){
		
		alert('email不能为空');
		return false;
	}
	
	var reg = new RegExp('^[a-zA-Z0-9]+@[a-zA-Z0-9]+.[a-z][a-z.]{2,8}$');
	
	if(!reg.test(document.getElementById("emailid").value)){
		
		alert('请输入正确的邮箱地址');
		return false;
	}
	
	return true;
}

</script>
 </html>
  