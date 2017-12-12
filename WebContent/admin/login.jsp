
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
    <center>
        <h1 style="color:BLACK">管理后台登录</h1>
            <form  method="post"  action="method!login" >
                <table border="0">
                    <tr>
                        <td>账号：</td>
                        <td><input type="text" name="username"></td>
                    </tr>
                   
                    <tr>
                        <td>密码：</td>
                        <td><input type="password" name="password">
                        </td>
                    </tr>
                </table>
            <br>
                <input type="submit" value="登录" style="width:50px;height:25px;">
                <input type="reset" value="重置" style="width:50px;height:25px;">
            </form>
           
    </center>
</body>
</html>