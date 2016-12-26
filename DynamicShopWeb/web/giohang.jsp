<%-- 
    Document   : index
    Created on : Nov 5, 2016, 3:32:29 PM
    Author     : hv
--%>

<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="cart" scope="session" class="store.ShoppingCart"></jsp:useBean>
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
        <%
            //Cập nhật số lượng sản phẩm
            String id = request.getParameter("id_1");
            if (id != null) {
                //Cập nhật số lượng sản phẩm
                if (request.getParameter("update") != null) {
                    if (Integer.parseInt(request.getParameter("amount")) != 0) {
                        cart.updateQuantity(id, Integer.parseInt(request.getParameter("amount")));
                    } else {
                        cart.removeItem(id);
                    }
                }
                if (request.getParameter("delete") != null) {
                    cart.removeItem(id);
                }
            }
        %>
        <!-- Wrapper -->
        <div id="wrapper">
            <div id="wrapper-bottom">
                <div class="shell">
                    <!-- Header -->
                    <jsp:include page="header.jsp"></jsp:include>
                        <!-- END Header -->
                        <!-- Main -->
                        <div id="main">
                            <!-- Slider -->
                        <jsp:include page="slider.jsp"></jsp:include>	
                            <!-- END Slider -->
                            <!-- Content -->
                                <h3>Chi tiết giỏ hàng</h3>
                            <div class="product-detail">
                                <table width="600" cellspacing="7" cellpadding="7" border="0">
                                    <tr>
                                        <th class="name" align="left">Tên sản phẩm</th>
                                        <th class="name">Đơn giá</th>
                                        <th class="name">Số lượng</th>
                                        <th class="name">Thành tiền</th>
                                        <th class="name">Cập nhật</th>
                                        <th class="name">Xóa</th>
                                    </tr>
                                <%
                                    Enumeration e = cart.getEnumeration();
                                    String[] tmpItem;
                                    double thanhTien = 1;
                                    //Iterate over the cart
                                    while (e.hasMoreElements()) {
                                        tmpItem = (String[]) e.nextElement();
                                        thanhTien = Double.parseDouble(tmpItem[2]) * Integer.parseInt(tmpItem[3]);
                                        byte[] b = tmpItem[1].getBytes();
                                        String name = new String(b, "UTF-8");
                                %>
                                <tr border="1">
                                    <form action="giohang.jsp" method="get">
                                        <td class="name"><%=name%></td>
                                        <td class="name" align="center"><%=tmpItem[2]%></td>
                                        <td class="name" align="center">
                                            <input type="text" value="<%=tmpItem[3]%>" name="amount" id="amount" size="5"/>
                                        </td>
                                        <td class="name" align="center"><%=thanhTien%></td>
                                        <td class="name" align="center">
                                            <input type="hidden" name="id_1" value="<%=tmpItem[0]%>"/>
                                            <input type="submit" value="Cập nhật" name="update"/>
                                        </td>
                                        <td class="name" align="center">
                                            <input type="submit" value="Xóa" name="delete"/>
                                        </td>
                                    </form>
                                </tr>
                                <% }
                                %>
                            </table>
                        </div>
                        <!-- END Content -->
                    </div>
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
