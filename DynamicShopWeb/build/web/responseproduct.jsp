<%-- 
    Document   : responsecategory
    Created on : Nov 27, 2016, 2:38:38 PM
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
        <h1>Kết quả</h1>
        <h2><%=request.getAttribute("message")%> </h2>
        <h3><a href="showcategory.jsp">Tiếp tục thêm mới sản phẩm</a></h3>
    </body>
</html>
