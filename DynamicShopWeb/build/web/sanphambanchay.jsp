<%-- 
    Document   : sanphambanchay
    Created on : Nov 5, 2016, 3:51:02 PM
    Author     : hv
--%>

<%@page import="store.Product"%>
<%@page import="java.util.List"%>
<%@page import="store.QLCSDL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="products-holder">
    <div class="top"></div>
    <div class="best-sellers middle">									
        <div class="label">								
            <h3>Sản phẩm bán chạy</h3>																		
        </div>
        <div class="cl"></div>
        <!-- Scroll Pane -->
        <div class="left-border"></div>
        <div class="scroll-pane horizontal-only">	
            <%
                QLCSDL qlcsdl = new QLCSDL();
                List<Product> listSP = qlcsdl.dsProductTheoSQL("select product.* from product, report where product.id = report.product_id and report.type='X' order by report.amount desc limit 0,9");
                String ddHinh = "";
                if (listSP.size() > 0) {//co san pham
                    for (Product p : listSP) {
                        ddHinh = "images/product/" + p.getImage();
            %>
            <div class="product">																										
                <a title="Chi tiết" href="chitietsanpham.jsp?id=<%=p.getId()%>"><img src="<%=ddHinh%>" alt="<%=p.getName()%>" /></a>
                <div class="desc">
                    <p class="name"><%=p.getName()%></p>
                    <p>SL còn:<span><%=p.getAmount()%></span></p>
                </div>	
                <div class="price-box">
                    <p><span class="price"><%=Math.round(p.getPrice())%></span></p>
                    <p class="per-peace">VNĐ</p>
                </div>
                <div class="cl"></div>
            </div>
            <%}
                }
            %>








        </div>
        <!-- END Scroll Pane -->
        <div class="right-border"></div>
        <div class="cl"></div>								
    </div>
    <div class="bottom"></div>							
</div>
