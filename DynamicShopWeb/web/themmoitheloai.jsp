
<%-- 
    Document   : index
    Created on : Nov 5, 2016, 3:32:29 PM
    Author     : hv
--%>

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
                                    <h2>Thêm thể loại mới</h2>
                                    <table width="700" cellspacing="7" cellpadding="7" border="0">
                                        <tr>
                                            <td>
                                                <form action="insertnewcategory" method="post">
                                                    <table>
                                                        <tr>
                                                            <td>Tên thể loại</td>
                                                            <td><label for="name"></label>
                                                                <input type="text" name="name" id="name"/></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Mô tả</td>
                                                            <td><label for="description"></label>
                                                                <textarea name="description" id="description" cols="40"></textarea>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>&nbsp;</td>
                                                            <td><input type="submit" name="insert" id="insert" value="Thêm mới"/></input></td>
                                                        </tr>
                                                    </table>
                                                </form>
                                            </td>
                                        </tr>
                                    </table>
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
