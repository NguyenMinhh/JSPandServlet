<%-- 
    Document   : themsanphammoi
    Created on : Dec 3, 2016, 1:50:20 PM
    Author     : hv
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="java.util.List"%>
<%@page import="store.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="insertnew" method="post" enctype="multipart/form-data">
            <table width="600" border="0" cellspacing="3" cellpadding="3">
                <tr>
                    <td>Tên sản phẩm</td>
                    <td><label for="name"></label>
                        <input type="text" name="name" id="name"/></td>
                </tr>
                <tr>
                    <td>Đơn giá</td>
                    <td><label for="price"></label>
                        <input type="text" name="price" id="price"/></td>
                </tr>
                <tr>
                    <td>Số lượng</td>
                    <td><label for="amount"></label>
                        <input type="text" name="amount" id="amount"/></td>
                </tr>
                <tr>
                    <td>Hình</td>
                    <td><label for="image"></label>
                        <input type="file" name="image"/></td>
                </tr>
                <tr>
                    <td>Loại sản phẩm</td>
                    <td><label for="category_id"></label>
                        <select name="category_id" id="category_id">
                            <%
                                List<Category> temp = (List < Category>) request.getAttribute("lstcategory");
                                if(temp.size()>0){
                                    for(Category c : temp){
                                    %>
                                    <option value="<%=c.getId()%>"><%=c.getName()%></option>
                                    <%  }
                                    }%>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td><input type="submit" name="insert" id="insert" value="Thêm mới" /></td>
                </tr>
            </table>
        </form>
    </body>
</html>
