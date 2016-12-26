<%-- 
    Document   : testCSDL
    Created on : Nov 6, 2016, 10:53:12 AM
    Author     : hv
--%>

<%@page import="store.Product"%>
<%@page import="java.util.List"%>
<%@page import="store.QLCSDL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div align="center">
            <h1>Thông tin sản phẩm</h1>
            <table width="500" border="1">
                <tr>
                    <td>Mã sản phẩm</td>
                    <td>Tên sản phẩm</td>
                    <td>Đơn giá (vnđ)</td>
                    <td>Số lượng</td>
                </tr>
                <%
                    QLCSDL qlcsdl = new QLCSDL();
                    List<Product> lstProduct = qlcsdl.dsProduct();
                    if (lstProduct.size() > 0) {
                        for (Product pr : lstProduct) {
                %>
                <tr>
                    <td><%=pr.getId()%></td>
                    <td><%=pr.getName()%></td>
                    <td><%=pr.getPrice()%></td>
                    <td><%=pr.getAmount()%></td>
                </tr>
                <%
                        }//end for
                    }//end if
                %>
            </table>
        </div>
    </body>
</html>
