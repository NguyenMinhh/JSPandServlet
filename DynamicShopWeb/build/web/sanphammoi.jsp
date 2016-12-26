<%-- 
    Document   : sanphammoi
    Created on : Nov 5, 2016, 3:50:52 PM
    Author     : hv
--%>

<%@page import="java.util.List"%>
<%@page import="store.Product"%>
<%@page import="store.QLCSDL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="products-holder">
    <div class="top"></div>
    <div class="middle">													
        <div class="label">
            <h3>Sản phẩm mới</h3>									
        </div>
        <div class="cl"></div>	
        <%
            QLCSDL qlcsdl = new QLCSDL();
            List<Product> listSP = qlcsdl.dsProductTheoSQL("select * from product order by create_date desc limit 0,4");
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
        </div>
        <%}
            }
        %>
        <div class="cl"></div>																														
    </div>
    <div class="cl"></div>
</div>
<div class="bottom"></div>									
</div>
