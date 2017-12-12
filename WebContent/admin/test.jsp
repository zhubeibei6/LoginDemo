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
      <h2></h2>
      <input type="text" class="textbox" placeholder="默认宽度..."/>
      <select class="select">
       <option>下拉菜单</option>
       <option>菜单1</option>
      </select>
      <input type="button" value="查询" class="group_btn"/>
     </section>
     <section>
      <div class="page_title">
       <h2 class="fl">例如产品详情标题</h2>
       <a class="fr top_rt_btn">右侧按钮</a>
      </div>
      <table class="table">
       <tr>
        <th>项目1</th>
        <th>项目2</th>
        <th>项目3</th>
        <th>项目4</th>
        <th>项目5</th>
        <th>项目6</th>
        <th>项目7</th>
       </tr>
       <tr>
        <td style="width:265px;"><div class="cut_title ellipsis">265px宽·长标题字符串截取，仅适合单行截取，多行截取程序定义一下。</div></td>
        <td>内容二</td>
        <td>内容三</td>
        <td>内容四</td>
        <td>内容五</td>
        <td>内容六</td>
        <td>
         <a href="#">表内链接</a>
         <a href="#" class="inner_btn">表内按钮</a>
        </td>
       </tr>
       <tr>
        <td style="width:265px;"><div class="cut_title ellipsis">265px宽·长标题字符串截取，仅适合单行截取，多行截取程序定义一下。</div></td>
        <td>内容二</td>
        <td>内容三</td>
        <td>内容四</td>
        <td>内容五</td>
        <td>内容六</td>
        <td>
         <a href="#">表内链接</a>
         <a href="#" class="inner_btn">表内按钮</a>
        </td>
       </tr>
      
      </table>
      <aside class="paging">
       <a>第一页</a>
       <a>1</a>
       <a>2</a>
       <a>3</a>
       <a>…</a>
       <a>1004</a>
       <a>最后一页</a>
      </aside>
     </section>
     <section>
      <h2><strong style="color:grey;">分列内容布局</strong></h2>
      <ul class="ulColumn2">
       <li>
        <span class="item_name" style="width:120px;">商品名称：</span>
        <input type="text" class="textbox textbox_295" placeholder="文本信息提示..."/>
        <span class="errorTips">错误提示信息...</span>
       </li>
       <li>
        <span class="item_name" style="width:120px;">品牌：</span>
        <select class="select">
         <option>选择品牌</option>
        </select>
        <span class="errorTips">错误提示信息...</span>
       </li>
       <li>
        <span class="item_name" style="width:120px;">是否热销：</span>
        <label class="single_selection"><input type="radio" name="name"/>推荐</label>
        <label class="single_selection"><input type="radio" name="name"/>不推荐</label>
       </li>
       <li>
        <span class="item_name" style="width:120px;">摘要：</span>
        <textarea placeholder="摘要信息" class="textarea" style="width:500px;height:100px;"></textarea>
       </li>
       <li>
        <span class="item_name" style="width:120px;">上传图片：</span>
        <label class="uploadImg">
         <input type="file"/>
         <span>上传图片</span>
        </label>
       </li>
       <li>
        <span class="item_name" style="width:120px;"></span>
        <input type="submit" class="link_btn"/>
       </li>
      </ul>
     </section>
     
       <section>
      <h2><strong style="color:grey;">常用按钮（水平块元素，无区域限制）</strong></h2>
      <a class="link_btn" id="loading">点击加载</a>
      <button class="link_btn" id="showPopTxt">测试弹出框</button>
      <input type="button" value="按钮input" class="link_btn"/>
     </section>
     <!--tabStyle-->
    
   
 </div>
</section>
</body>
</html>
