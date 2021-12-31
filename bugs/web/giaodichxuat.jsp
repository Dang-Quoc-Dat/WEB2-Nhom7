<%-- 
    Document   : nhaphang
    Created on : Nov 10, 2021, 9:11:19 PM
    Author     : Dell
--%>

<%@page import="bugs.model.XuatHang"%>
<%@page import="bugs.model.TaiKhoan"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Giao Dịch</title>

        <style>
            /*Phần menu*/
            * {box-sizing: border-box;}
            *{
                margin:0;
                padding:0;
                outline:none;
                font-family: Roboto;
            }
            div{
                display: block;
            }
            a{
                text-decoration: none;
            }
            body {
                margin: 0;
                font-family: Arial, Helvetica, sans-serif;
                width: 100%;
                justify-content: flex-end;
                align-items: center;
                min-height: 100vh;
                flex-direction: column;
            }

            .ontopof{
                width: 100%;
                height: 120px;
                background-color: #2196F3;
                margin-bottom: 0;
            }

            .topnav {
                overflow: hidden;
                background-color: #e9e9e9;
                width:80%;
                border-radius: 25px;
                padding:0 20%;
                margin: auto ;


            }
            .topnav a {
                float: left;
                display: block;
                color: black;
                text-align: center;
                padding: 14px 16px;
                font-size: 17px;

            }
            .topnav{
                position: sticky;
                top: 0;
                right: 0;
                left: 0;
            }
            .topnav a:hover {
                background-color: #ddd;
                color: black;
            }

            .search-container {
                float: right;
            }
            h1 a{
                width: 50px;
                padding:50px; 
                margin: 25px;
                font-family: arial;
                top: 40px;
                font-size: 50px;
                color: white;
                position: relative;
            }
            .topnav input[type=text] {
                padding: 6px;
                margin-top: 8px;
                font-size: 17px;
                border: none;
            }
            .search-container a{
                margin: 50px 5px;
                bottom: 10px;
                padding:15px; 
                font-size: 20px;
                color: black;
                box-shadow: 0px 0px 15px currentcolor;
                border: 5px solid currentcolor;

            }
            .search-container a{

                position: relative;
                background-color: black;
                border-radius: 4em;
                font-size: 16px;
                color: white;
                padding: 0.8em 1.8em;
                cursor:pointer;
                user-select:none;
                text-align: center;
                text-decoration: none;
                cursor: pointer;
                transition-duration: 0.4s;
                -webkit-transition-duration: 0.4s; /* Safari */
            }

            .search-container a:hover {
                transition-duration: 0.1s;
                background-color: #3A3A3A;
            }

            .search-container a:after {
                content: "";
                display: block;
                position: absolute;
                border-radius: 4em;
                left: 0;
                top:0;
                width: 100%;
                height: 100%;
                opacity: 0;
                transition: all 0.5s;
                box-shadow: 0 0 10px 40px white;
            }

            .search-container a:active:after {
                box-shadow: 0 0 0 0 white;
                position: absolute;
                border-radius: 4em;
                left: 0;
                top:0;
                opacity: 1;
                transition: 0s;
            }
            .button:active {
                top: 1px;
            }

            .search-container{
                float: right;
                padding: 6px;
                margin-bottom: 30px;
                margin-right: 80px;
                font-size: 17px;
                cursor: pointer;

            }

            .ontopof.search-container button:hover {
                background: #ccc;
            }
            /*hêt phần header*/


            /*phần giữa*/
            body{
                background-color: #e9e9e9;
            }
            #mid{
                height: 700px;
                width: auto;
                margin-top: 50px;
                position:static;
            }

            /*sidebar bên trái*/
            #sidebar_left{

                height: 100%;

                float: left;
                width: 30%;
            }
            #h3{
                font-size: 30px;
                padding-left: 20%;
                margin-top: 60px;
            }
            .form_search1{
                margin-left: 10%;
                margin-top: 10%;
                margin-right: 25%;
                padding-left: 10%;
                padding-top: 5%;
                width: auto;
                background-color: white;
                border-radius: 5%;
                box-shadow: 0px 0px 10px 1px #ddd;
            }
            .form_search1 h3{
                margin-bottom: 10px;
                font-size:20px;
            }
            .form_search1 input{
                margin-bottom: 10px;
            }
            .form_search1 label{
                padding-left:  5px;
            }

            .form_search2{
                margin-left: 10%;
                margin-top: 10%;
                margin-right: 25%;
                padding-left: 10%;
                padding-top: 5%;
                width: auto;
                background-color: white;
                border-radius: 5%;
                box-shadow: 0px 0px 10px 1px #ddd;
            }
            .form_search2 h3{
                margin-bottom: 10px;
                font-size:20px;
            }
            .form_search2 input{
                margin-bottom: 15px;
            }
            /*hết sidebar bên trái*/

            /* sidebar bên phải*/
            #sidebar_right{

                float: right;
                height: 100%;
                width: 70%;
            }
            #sidebar_right div h3{
                margin-top: 60px;
                text-align: center;
                font-size: 30px;

            }

            #wrap{
                width:100%;
                height:auto;
                display:flex;
                margin-top: 5%;
            } 
            .search{
                width:66%;
                text-align: left;
                padding-bottom: 4px;
            } 
            .add{
                width:auto;
                display:flex;
                height:auto;
                padding-bottom: 4px;
                margin-left: 60px;
            }
            .f0{
                float:right;
                margin-right:7px;
            }
            .f1{
                float:right;
            }

            .flat-table {
                display: block;
                font-family: sans-serif;
                -webkit-font-smoothing: antialiased;
                font-size: 115%;
                width: auto;
                lenght: 10px;
                overflow: auto;
            }
            th {
                background-color: #B3E5FC;
                color: black;
                font-weight: bold;
                font-size: 17px;
                font-weight: normal;
                padding: 0px 5px;
                text-align: center;
            }
            td {
                background-color: rgb(238, 238, 238);
                color: rgb(111, 111, 111);
                font-size: 15px;
                padding: 3px 35px;
                text-align: center;
            }
            #sidebar_right{
                padding-left: 5%;
            }
            /*hết sidebar bên phải*/
        </style>

    </head>
    <body>
        <div id="head">
            <div class="ontopof">
                <h1><a href="" >BUGS</a></h1>
                <div class="search-container">
                    <%
                        TaiKhoan tk = (TaiKhoan) request.getSession().getAttribute("taiKhoan");
                    %>
                    <a href="./account?action=login" onclick="return confirm('confirm back to login page?');"><%=tk.getTenTaiKhoan()%></a> 

                    <%
                        if (tk.getLoaiTaiKhoan().equalsIgnoreCase("admin")) {%>
                    <a href="./account?action=register">Đăng ký</a>                   
                    <%
                        }
                    %>  
                </div>
                <div class="topnav">
                    <a class="active" href="./index.jsp">Trang chủ</a>
                    <a href="./mathang">Hàng hóa</a>
                    <a href="./xuathang">Giao dịch</a>
                    <a href="./nhaphang">Kho</a> 
                    <a href="#">Báo cáo</a>
                    <a href="#">Bán hàng</a>
                </div>
            </div>
        </div>
        <div id="mid">
            <!--ben trai-->
            <div id="sidebar_left">
                <!--hoa don-->
                <h3 id="h3">Hóa đơn</h3>
                <div class="form_search1">
                    <form action="xuathang?action=searchXuatHangTrangThai" method="POST">
                        <h3>Trạng thái đơn</h3>
                        <input type="radio" name="txtTrangThai" value="Chưa giao"><label>Chưa giao</label><br>
                        <input type="radio" name="txtTrangThai" value="Đang giao"><label>Đang giao</label><br>
                        <input type="radio" name="txtTrangThai" value="Đã giao"><label>Đã giao</label><br>
                        <input type="submit" value="Tìm kiếm">
                    </form>
                </div>

                <!--xem bang ngay thang-->
                <div class="form_search2">
                    <form action="xuathang?action=searchXuatHangNgay" method="POST">
                        <h3>Ngày xuất hàng</h3>
                        <input type="date" name="txtNgayXuat">
                        <input type="submit" value="Xem">
                    </form>
                    <form>
                        <h3>Xem lịch</h3>
                        <input type="date" name="txtNgayXuat" >
                        <input type="submit" value="Xem">
                    </form>
                </div>

            </div>
            <!--ben phai-->
            <div id="sidebar_right">
                <div>
                    <h3>Đơn Hàng</h3>
                    <div id="wrap">
                        <div class="search">
                            <form action="xuathang?action=searchXuatHang" method="POST" >
                                <input type="text" placeholder="tìm theo mã đơn" name="txtTimKiem"  />
                                <input type="submit" value="Tìm kiếm"/><br>
                            </form>
                        </div>
                        <div class="add">
                            <form action="#">
                                <input class="f0" type="submit" value="Nhập hàng"></input>
                            </form>   
                            <form  action="./xuathang.jsp">
                                <input class="f1" type="submit" value="Tạo đơn hàng"></input>
                            </form>
                        </div>
                    </div>
                </div>

                <%
                    if (request.getAttribute("listxuathang") != null) {
                        List<XuatHang> a = (List<XuatHang>) request.getAttribute("listxuathang"); // ép kiểu 
                        if (a != null) {
                %>
                <table class="flat-table">                  
                    <tr>
                        <th><h3>Mã đơn</h3></th>
                        <th><h3>Mã hàng</h3></th>
                        <th><h3>Ngày xuất</h3></th>
                        <th><h3>Số lượng</h3></th>
                        <th><h3>Đơn giá</h3></th>
                        <th><h3>Trạng thái</h3></th>
                        <th colspan="2"><h3>Action</h3></th>
                    </tr>   

                    <%
                        for (XuatHang xh : a) {
                    %>

                    <tr class="overfl">

                        <td><%= xh.getId()%></td>
                        <td><%= xh.getMaHang()%></td>
                        <td><%= xh.getNgayXuat()%></td>
                        <td><%= xh.getSoLuong()%></td>
                        <td><%= xh.getDonGia()%></td>
                        <td><%= xh.getTrangThai()%></td>
                        <td>
                            <button class="button" type="submit">
                                <a href="xuathang?action=editTrangThai&id=<%= xh.getId()%>"><i class="fas fa-edit"></i></a>
                            </button>
                        </td>
                        <td>
                            <button class="button" type="submit">
                                <a href="xuathang?action=deleteXuatHang&id=<%= xh.getId()%>" onclick="return confirm('Do you want to delete this bill?');" ><i class="fas fa-trash-alt"></i></a>
                            </button>
                        </td>

                    </tr>  
                    <%
                        }
                    %>
                </table>
                <%
                        }
                    }
                %>
            </div>
        </div>
    </div>
</div>

</body>
</html>



