<%-- 
    Document   : index
    Created on : Nov 5, 2016, 3:32:29 PM
    Author     : hv
--%>

<%@page import="java.util.List"%>
<%@page import="store.Product"%>
<%@page import="store.QLCSDL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en-US" xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
    <head>
        <title>Cửa hàng văn phòng phẩm</title>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" href="css/images/favicon.ico" />
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
        <!--[if IE 6]>
        <link rel="stylesheet" href="css/ie6.css" type="text/css" media="all" />	
        <![endif]-->
        <link rel="stylesheet" href="css/jquery.jscrollpane.css" type="text/css" media="all" />
        <script src="js/jquery-1.7.min.js" type="text/javascript"></script>
        <script src="js/DD_belatedPNG-min.js" type="text/javascript"></script>
        <script src="js/jquery.jscrollpane.min.js" type="text/javascript"></script>
        <script src="js/jquery.jcarousel.js" type="text/javascript"></script>
        <script src="js/functions.js" type="text/javascript"></script>
    </head>
    <body>
        <!-- Wrapper -->
        <div id="wrapper">
            <div id="wrapper-bottom">
                <div class="shell">
                    <!-- Header -->
                    <jsp:include page="header_quantri.jsp"></jsp:include>
                        <!-- END Header -->
                        <!-- Main -->
                        <div id="main">
                            <!-- Content -->
                            <div id="content">
                                <!-- Danh muc chuc nang -->
                                <div>
                                    <div>
                                        <br/>
                                    </div>
                                    <div>
                                        <h2>Danh mục sản phẩm</h2>
                                        <table width="1000" cellspacing="7" cellpadding="7">
                                            <tr>
                                                <th align="left">Mã sản phẩm</th>
                                                <th class="name" align="left">Tên sản phẩm</th>
                                                <th class="name">Đơn giá</th>
                                                <th class="name">Số lượng</th>
                                                <th class="name">Trạng thái</th>
                                                <th class="name">Cập nhật</th>
                                                <th class="name">Xóa</th>
                                            </tr>
                                        <%
                                            QLCSDL qlcsdl = new QLCSDL();
                                            String id = request.getParameter("id");
                                            if (id != null) {
                                                Product p1 = new Product();
                                                p1.setId(Integer.parseInt(id));
                                                p1.setAmount(Integer.parseInt(request.getParameter("amount")));
                                                p1.setPrice(Double.parseDouble(request.getParameter("price")));
                                                if (request.getParameter("delete") != null) {
                                                    qlcsdl.xoaProduct(p1.getId());
                                                }
                                                if (request.getParameter("update") != null) {
                                                    qlcsdl.capnhatProduct(p1);
                                                }
                                            }
                                        %>
                                        <% //Duyet tung dong san pham, hien thi moi dong tren 1 dong cua table dang form
                                            List<Product> lstProduct = qlcsdl.dsProduct();
                                            if (lstProduct.size() > 0) {
                                                for (Product pr : lstProduct) {
                                        %>
                                        <tr>
                                            <form action="quanlysanpham.jsp" method="post">
                                                <td class="name"><%=pr.getId()%><input type="hidden" name="id" value="<%=pr.getId()%>" /></td>
                                                <td class="name"><%=pr.getName()%><input type="hidden" name="name" value="<%=pr.getName()%>" /></td>
                                                <td class="name" align="center"><input type="text" name="price" value="<%=pr.getPrice()%>" /></td>
                                                <td class="name" align="center"><input type="text" name="amount" value="<%=pr.getAmount()%>" /></td>
                                                <td class="name" align="center"><input type="text" name="price" value="<%=pr.getPrice()%>" /></td>
                                                <td class="name" align="center"><input type="text" name="state" value="<%=(pr.getState() == 1) ? "Hiển thị" : "Tắt"%>" readonly="true"></td>
                                                <td class="name" align="center"><input type="submit" value="Update" name="update" /></td>
                                                <td class="name" align="center"><input type="submit" value="Delete" name="delete" /></td>
                                            </form>
                                            <%
                                                }
                                            %>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </table>
                                </div>
                            </div>
                            <!-- END Danh muc chuc nang -->				
                        </div>
                        <!-- END Content -->
                    </div>
                    <!-- END Main -->
                </div>
            </div>
            <div id="footer-push"></div>
        </div>
        <!-- END Wrapper -->
        <!-- Footer -->
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- END Footer -->
    </body>
</html>
