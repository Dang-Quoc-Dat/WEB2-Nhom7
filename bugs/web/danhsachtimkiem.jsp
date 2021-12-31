<%-- 
    Document   : danhsachtimkiem
    Created on : Nov 8, 2021, 10:15:13 PM
    Author     : Dell
--%>
<%@page import="bugs.model.TaiKhoan"%>
<%@page import="bugs.model.MatHang"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
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

            /*            day la phan danh sach mat hang*/
            #mid{
                margin-top:80px;
            }
            #th{
                background: linear-gradient(to bottom right,var(--bg2),var(--bg3))

            }
            #th:hover{
                background: linear-gradient(to bottom right,var(--bg1),var(--bg3))
            }
            body{
                background: linear-gradient(to bottom right,var(--bg1),var(--bg2));
                height:auto;
            }
            :root{
                --bg1:#9b59b6;
                --bg2:#3498db;
                --bg3:#5b66cd;
                --bg4:#ddf6fd;

            }
            #left{
                float:left;
                width:10%;
                display: flex;
            }
            #right{
                float:right;
                width:10%;
                display: flex;
            }
            .chung{
                /* căn thẳng trên cùng 1 hàng*/

                height: auto;
                width: 100%;
                padding-bottom:40px;
            }
            .chung input{
                border-radius:20px;
                width:250px;
                height:25px;
                border:none;
                border-bottom: 3px solid #ccc;

            }
            .rieng1{
                float:left;
                width:50%;
                display: flex;

            }
            .rieng2{

                position: absolute;/* 2  cái này để căn từ bên  phải  */
                right:40px;

            }
            #button1{

                border-radius:50%;
                height:27px;


            }
            #button1 img{
                border-radius:50%;
                height:23.5px;

            }
            #button2{
                padding:0px;
                border-radius:50%;
                height:30px;
                width:30px;

            }
            #button2 img{
                border-radius:50%;
                width:25px;
                height:26px;
                padding-right:1px;


            }
            table tr td{
                border:none;  
                color:#fff;

            }
            table tr th{
                border:none;
                color:#fff;

            }
            #th th{
                border-right:0.5px solid gray;
                color:#fff;
            }
            table { 
                border-collapse:collapse;
                padding-left: 2px;
            }
            #b2{
                width: 30px;
                height: 30px;
                border-radius: 50%;
            }
            #b2 img{
                width: 26px;

                border-radius: 50%;

            }
            #b1{
                width: 30px;
                height: 30px;
                border-radius: 50%;
            }
            #b1 img{
                width: 36px;
                height:26px;
                border-radius: 50%;
                padding-right:10px;

            }
            #chung{
                margin:0 auto;
                width:95%;

            }
            .rieng0{
                float:left;
                width: 223px;
            }
            /*            //day la het phan danh sach mat hang*/

        </style>
    </head>
    <body>
        <div>
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
                    <a href="">Báo cáo</a>
                    <a href="">Bán hàng</a>
                </div>
            </div>
        </div>
        <!--day la danh sach mat hang-->      

        <div id="mid" >
            <div id="chung">
                <div id="left"></div>
                <div class="chung">
                    <div class="rieng1">
                        <form action="mathang?action=search" method="POST" enctype="multipart/form-data" >
                            <div class="rieng0">
                                <input tyle="text" id="search" name='txtTimKiem' placeholder="Tìm kiếm" >
                            </div>
                            <button id="button1" type="submit"><img src="./resources/img/search.png" alt="alt" width="23" /></button>
                        </form>
                    </div> 
<!--                    <div class="rieng2">
                        <button id="button2" type="submit"><a href="./themmathang.jsp"><img src="./resources/img/thêm.jpg" alt="alt" width="35" /></a></button>
                    </div>-->
                </div>
                <div class="chung">
                    <%
                        if (request.getAttribute("searchMatHang") != null) {
                            List<MatHang> slMatHang = (List<MatHang>) request.getAttribute("searchMatHang");
                            if (slMatHang != null) {
                    %>
                    <div id="center">
                        <table border="1" width="100%" height="100" cellpadding="0" cellspacing="0">
                            <tr id="th" align="left" >
                                <th>Mã hàng</th>
                                <th>Tên hàng</th>
                                <th>Giá Nhập</th>
                                <th>Giá bán</th>
                                <th>Số lượng</th>
                                <th>Loại</th>
                                <th colspan="2"></th>

                            </tr>
                            <%
                                for (MatHang mh : slMatHang) {
                            %>
                            <tr>
                                <td ><%= mh.getMaHang()%></td>
                                <td ><%= mh.getTenHang()%></td>
                                <td ><%= mh.getGiaNhap()%></td>
                                <td ><%= mh.getGiaBan()%></td>
                                <td ><%= mh.getSoLuong()%></td>
                                <td ><%= mh.getLoai()%></td>
                                <td ><button id="b1"><a href="mathang?action=edit&id=<%= mh.getMaHang()%>"><img src="./resources/img/sửa.png" alt="alt" width="30"/></a></button></td>
                                <td ><button id="b2"><a href="mathang?action=delete&id=<%= mh.getMaHang()%>" onclick="return confirm('Do you want to delete this goods?');"><img src="./resources/img/xóa.jpg" alt="alt" width="30"/></a></button> </td>
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
