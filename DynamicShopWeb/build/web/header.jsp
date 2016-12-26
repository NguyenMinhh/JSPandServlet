<%-- 
    Document   : header
    Created on : Nov 5, 2016, 3:47:31 PM
    Author     : hv
--%>

<%@page import="java.util.List"%>
<%@page import="store.Category"%>
<%@page import="store.QLCSDL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="cart" scope="session" class="store.ShoppingCart"/>
<div id="header">
    <!-- Logo -->
    <h1 id="logo"><a title="Home" href="index.jsp">Văn phòng phẩm KTP</a></h1>
    <%
        String id = request.getParameter("id_pr");
        if(id!=null){
            String name = request.getParameter("name");
            double price = Double.parseDouble(request.getParameter("price"));
            int amount = Integer.parseInt(request.getParameter("amount"));
            
            //them moi hang vao gio
            cart.addItem(id, name, price, amount);
        }
        %>
    <p class="shopping-cart"><a class="cart" href="giohang.jsp" title="Giỏ hàng">Giỏ hàng</a>
        <span>Số SP:</span><%=cart.getNumOfItems()%><span>Giá:</span><%=cart.getSumOfPrice()%></p>					
    <!-- Search -->
    <div class="search-expand"></div>
    <div id="search">
        <div class="retract-button">
            <p>retract</p>
        </div>
        <form action="" method="post">
            <input type="text" class="field" value="Search" title="Tìm..." />
            <input type="submit" value="" class="submit-button" />
        </form>						
    </div>
    <!-- END Search -->
    <div class="cl"></div>
    <!-- Navigation -->
    <div id="navigation">
        <ul>
            <li><a title="Home" href="index.jsp">Trang chủ</a></li>
            <li><a title="Catalog" href="#">Danh mục hàng hóa</a></li>
            <li><a title="About Us" href="#">Giới thiệu</a></li>
            <li><a title="Login" href="login.jsp">Đăng nhập</a></li>
        </ul>						
    </div>	
    <div class="cl"></div>				
    <!-- END Navigation -->
    <!-- Dropdown Navigation -->
    <div id="sort-nav">						
        <span class="label-left"></span>
        <div class="label-bg">						
            <ul>
                <li>
                    <a title="Danh mục sản phẩm" href="#">Danh mục sản phẩm</a>							
                    <div class="dd">
                        <ul>
                            <%
                                QLCSDL qlcsdl = new QLCSDL();
                                List<Category> listDM = qlcsdl.dsCategory();
                                if (listDM.size() > 0) {
                                    for (Category c : listDM) {

                            %>
                            <li><a title="Sản phẩm theo loại" href="sanphamtheoloai.jsp?category_id=<%=c.getId()%>"><%=c.getName()%></a></li>
                                <%}//end for
                                    }//end if
                                %>
                        </ul>																
                    </div>
                </li>							
                
                <li class="last">
                    <a title="Theo giá" class="Sản phẩm" href="#">Sản phẩm</a>
                    <div class="dd">
                        <ul>
                            <li><a title="Sản phẩm" href="sanphamtheogia.jsp?type=0">Giá tăng dần</a></li>
                            <li><a title="Sản phẩm" href="sanphamtheogia.jsp?type=1">Giá giảm dần</a></li>												
                        </ul>									
                    </div>
                </li>
            </ul>
        </div>
        <span class="label-right"></span>									
    </div>					
    <!-- END Dropdown Navigation -->
    <div class="cl"></div>
</div>
