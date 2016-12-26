<%-- 
    Document   : taotruyvan
    Created on : Nov 27, 2016, 9:08:58 AM
    Author     : hv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hiển thị dữ liệu của bảng Product theo truy vấn</h1>
        <form action="showproduct.html" method="post">
            <h2>Select: <input type="text" name="select" value="*"/></h2>
            <h2>From: <input type="text" name="from" value="product"/></h2>
            <h2>Where: <input type="text" name="where"/></h2>
            <input type="submit" name="submit" value="Submit"/>
        </form>
    </body>
</html>
