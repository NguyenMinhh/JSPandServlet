<%-- 
    Document   : index
    Created on : Nov 5, 2016, 3:32:29 PM
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

                                    <div class="label">
                                        <h3>Danh mục sản phẩm</h3>									
                                    </div>
                                    <div class="cl"></div>	
                                <%
                                    Pager p = new Pager(); //Khai bao va khoi tao viec phan trang
                                    int limit = 8; // so san pham toi da tren 1 trang
                                    int selectPage = 0;//trang duoc chon
                                    if (request.getParameter("page") != null) {//khi nguoi dung co chon trang
                                        selectPage = Integer.parseInt(request.getParameter("page"));
                                    }
                                    int start = p.findStart(limit, selectPage);

                                    QLCSDL qlcsdl = new QLCSDL();

                                    String sql = "select * from product where category_id = '" + request.getParameter("category_id") + "'";
                                    int count = qlcsdl.dsProductTheoSQL(sql).size();
                                    int pages = p.findPages(count, limit);

                                    sql = "select * from product where category_id = '" + request.getParameter("category_id") + "' limit " + start + ", " + limit + "";
                                    List<Product> listSPPT = qlcsdl.dsProductTheoSQL(sql);
                                    System.out.println("size " +listSPPT.size());

                                    String ddHinh = "";
                                    if (listSPPT.size() > 0) {//co san pham
                                        for (Product pr : listSPPT) {
                                            ddHinh = "images/product/" + pr.getImage();
                                %>
                                <div class="product">																										
                                    <a title="Chi tiết" href="chitietsanpham.jsp?id=<%=pr.getId()%>"><img src="<%=ddHinh%>" alt="<%=pr.getName()%>" /></a>
                                    <div class="desc">
                                        <p class="name"><%=pr.getName()%></p>
                                        <p>SL còn:<span><%=pr.getAmount()%></span></p>
                                    </div>	
                                    <div class="price-box">
                                        <p><span class="price"><%=Math.round(pr.getPrice())%></span></p>
                                        <p class="per-peace">VNĐ</p>
                                    </div>
                                    <div class="cl"></div>	
                                </div>
                                <%
                                    }//end for
                                %>
                                <div class="cl"></div>
                                <div class="paging">
                                    <h3><%=p.nextPrevQueryString(selectPage, pages, request.getRequestURI(), "&category_id=" + request.getParameter("category_id"))%></h3>
                                    <h3><%=p.pageListQueryString(selectPage, pages, request.getRequestURI(), "&category_id=" + request.getParameter("category_id"))%></h3>
                                </div> 
                                <%
                                    }// end if
                                %>
                                <div class="cl"></div>
                                <div class = "bottom"></div>									
                            </div>
                            <!-- END Featured Products -->
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
