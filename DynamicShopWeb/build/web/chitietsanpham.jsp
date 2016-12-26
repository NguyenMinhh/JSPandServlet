<%-- 
    Document   : sanphammoi
    Created on : Nov 5, 2016, 3:50:52 PM
    Author     : hv
--%>



<%@page import="store.Pager"%>
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
                    <jsp:include page="header.jsp"></jsp:include>
                        <!-- END Header -->
                        <!-- Main -->
                        <div id="main">
                            <!-- Slider -->
                        <jsp:include page="slider.jsp"></jsp:include>	
                            <!-- END Slider -->
                            <!-- Content -->
                            <div id="content">
                                <!-- Featured Products -->
                                <div class="products-holder">
                                    <div class="top"></div>
                                    <div class="middle">													
                                        <div class="cl"></div>	
                                    <%
                                        QLCSDL qlcsdl = new QLCSDL();
                                        List<Product> listSP = qlcsdl.dsProductTheoSQL("select * from product where id=" + request.getParameter("id"));
                                        String ddHinh = "";
                                        if (listSP.size() > 0) {//co san pham
                                            for (Product p : listSP) {
                                                ddHinh = "images/product/" + p.getImage();
                                    %>
                                    <div class="label">
                                        <h3><%=p.getName()%></h3>									
                                    </div>
                                    <table class="product-detail">
                                        <tr>
                                            <td>
                                                <img src="<%=ddHinh%>" alt="<%=p.getName()%>"/>
                                            </td>
                                            <td>
                                                <div class="desc">
                                                    <p class="name">
                                                        Đơn giá: <span><%=Math.round(p.getPrice())%></span> vnđ/đvt
                                                    </p>
                                                    <p class="name">
                                                        SL còn: <span><%=p.getAmount()%></span>
                                                    </p>
                                                </div>
                                                <div>
                                                    <p>
                                                        <form action="chitietsanpham.jsp?id=<%=p.getId()%>" method="post">
                                                            <input type="hidden" name="id_pr" value="<%=p.getId()%>" />
                                                            <input type="hidden" name="name" value="<%=p.getName()%>" />
                                                            <input type="hidden" name="price" value="<%=p.getPrice()%>" />
                                                            <input type="number" value="1" name="amount" min="1" max="<%=p.getAmount()%>" step="1" />
                                                            <!--<input type="text" class="field" value="" title="Nhập số lượng" name="amount" id="amount" size="10" /> -->
                                                            <input type="submit" name="dathang" value="" class="buy-button">
                                                        </form>
                                                    </p>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                    <%}
                                        }
                                    %>
                                    <div class="cl"></div>																														
                                </div>
                                <div class="cl"></div>
                            </div>
                            <div class="bottom"></div>									
                        </div>                            <!-- END Featured Products -->
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