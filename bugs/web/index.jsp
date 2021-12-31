<%-- 
    Document   : index
    Created on : Nov 8, 2021, 12:11:09 PM
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
                margin-bottom: 8px;
                margin-right: 80px;
                font-size: 17px;
                cursor: pointer;

            }

            .ontopof.search-container button:hover {
                background: #ccc;
            }

            @media screen and (max-width: 600px) {
                .search-container {
                    float: none; 
                }
                .ontopof a, .ontopof input[type=text], .ontopof .search-container button {
                    float: none;
                    display: block;
                    text-align: left;
                    width: 100%;
                    margin: 0;
                    padding: 14px;
                }
                .topnav input[type=text] {
                    border: 1px solid #ccc;  
                }
            }
            .introduces-box{
                padding: 60px 0;
            }
            h2 {
                display: block;
                font-size: 1.5em;
                margin-block-start: 0.83em;
                margin-block-end: 0.83em;
                margin-inline-start: 0px;
                margin-inline-end: 0px;
                font-weight: bold;
            }
            .heding{
                margin-bottom:0 !important;
                padding-bottom: 0 !important;
            }
            .introduces {
                text-align: center !important;
            }

            h2, .h2 {
                font-size: 2rem;
                line-height: 1.375;
                text-align: center !important;
                padding-bottom: 10px;
            }
            h2, .h2 {
                line-height: 1.333;
            }
            h2, .h2 {
                font-size: calc(1.0rem + 2.1vw);
            }
            h1, .h1, h2, .h2, h3, .h3, h4, .h4, h5, .h5, h6, .h6 {
                margin-top: 0;
                margin-bottom: .5rem;
                font-family: "Quicksand Bold";
                font-weight: 400;
                line-height: 1.2;
            }
            h4, .h4 {
                line-height: 1.5;
            }

            h4, .h4 {
                font-size: calc(1.275rem + .3vw);
            }
            h4 {
                display: block;
                margin-block-start: 1.33em;
                margin-block-end: 1.33em;
                margin-inline-start: 0px;
                margin-inline-end: 0px;
                font-weight: bold;
            }
            p {
                margin-top: 0;
                margin-bottom: 1rem;
            }
            p {
                display: block;
                margin-block-start: 1em;
                margin-block-end: 1em;
                margin-inline-start: 0px;
                margin-inline-end: 0px;
            }
            .introduces{
                width: auto;
                margin: 0 auto;
            }

            .introduces-item{
                display: inline-table;
                width: 33%;
                padding: 8px 0;
            }
            .introduces-icon {
                margin-bottom: 24px;
            }
            img {
                max-width: 100%;
            }

            img, svg {
                vertical-align: middle;
            }
            @media only screen and (max-width: 1199px){
                .main-content {
                    padding-left: 20px;
                    padding-right: 20px;
                }
            }
            @media (min-width: 768px){
                .main-content {
                    max-width: 100%;
                }
            }
            @media (min-width: 576px){
                .main-content{
                    max-width: 100%;
                }
            }
            .main-contents{
                width: 100%;
                padding-right: var(--bs-gutter-x,15px);
                padding-left: var(--bs-gutter-x,15px);
                margin-right: auto;
                margin-left: auto;
            }
            .section {
                align-items: center !important;
                flex-direction: row-reverse !important;
                padding-bottom: 15px;
            }
            @media (min-width: 768px){
                .md-6{
                    flex: 0 0 auto;
                    width: 50%;
                }
            }
            .content-section [class*="-title"] {
                margin-bottom: 24px;
                overflow: hidden;
                text-overflow: ellipsis;
                display: -webkit-box;
                -webkit-box-orient: vertical;
            }
            h3, .h3 {
                line-height: 1.375;
                font-size: calc(1.325rem + .9vw);
            }
            h3 {
                display: block;
                font-size: 1.17em;
                margin-block-start: 1em;
                margin-block-end: 1em;
                margin-inline-start: 0px;
                margin-inline-end: 0px;
                font-weight: bold;
            }
            .content-section p {
                overflow: hidden;
                text-overflow: ellipsis;
                display: -webkit-box;
                -webkit-box-orient: vertical;
                margin-bottom: 24px;
                color: #5a5a5a;
            }
            .section:after{
                content: "";
                display: block;
                clear: both;
            }
            #content .readmore a{
                background-color: #ff3d00;
                padding: 6px 15px;
                color: #ffffff;
                font-weight: bold;
            }
            footer{
                position: relative;
                width: 100%;
                height: auto;
                padding: 50px 100px;
                background: #111;
                display: flex;
                justify-content: space-between;
                flex-wrap: wrap;
            }
            footer .container{
                display: flex;
                justify-content: space-between;
                flex-wrap: wrap;
                flex-direction: row;
            }
            footer .container .noi-dung{
                margin-right: 30px;
            }
            footer  .container .noi-dung.about{
                width:40%;
            }
            footer .container .noi-dung.about h3{
                position: relative;
                color: #fff;
                font-weight: 500;
                margin-bottom: 15px;
            }
            footer .container .noi-dung.about h3:before{
                content: '';
                position: absolute;
                bottom: -5px;
                left: 0;
                width: 50px;
                height: 2px;
                background: #f00;
            }
            footer .container .noi-dung.about p{
                color: #999;
            }

            .social-icon{
                margin-top: 20px;
                display: flex;
            }
            .social-icon li {
                list-style: none;
            }
            .social-icon li a{
                display: inline-block;
                width: 40px;
                height: 40px;
                background: #222;
                display: flex;
                justify-content: center;
                align-items: center;
                margin-right: 10px;
                text-decoration: none;
                border-radius: 4px;
            }
            .social-icon li a:hover{
                background: #f00;
            }
            .social-icon li a .fa{
                color: #fff;
                font-size: 20px;
            }
            .links h3{
                position: relative;
                color: #fff;
                font-weight: 500;
                margin-bottom: 15px;
            }
            .links h3{
                position: relative;
                color: #fff;
                font-weight: 500;
                margin-bottom: 15px;
            }
            .links h3::before{
                content: '';
                position: absolute;
                bottom: -5px;
                left: 0;
                width: 50px;
                height: 2px;
                background: #f00;
            }
            .links{
                position: relative;
                width: 25%;
            }
            .links ul li{
                list-style: none;
            }
            .links ul li a{
                color: #999;
                text-decoration: none;
                margin-bottom: 10px;
                display: inline-block;
            }
            .links ul li a:hover{
                color: #fff;
            }
            .contact h3{
                position: relative;
                color: #fff;
                font-weight: 500;
                margin-bottom: 15px;
            }
            .contact h3::before{
                content: '';
                position: absolute;
                bottom: -5px;
                left: 0;
                width: 50px;
                height: 2px;
                background: #f00;
            }
            .contact{
                width: calc(35% - 60px);
                margin-right: 0 !important;
            }
            .contact .info{
                position: relative;
            }

            .contact .info li{
                display: flex;
                margin-bottom: 16px;
            }
            .contact .info li span:nth-child(1) {
                color: #fff;
                font-size: 20px;
                margin-right: 10px;
            }
            .contact .info li span{
                color: #999;
            }
            .contact .info li a{
                color: #999;
                text-decoration: none;
            }
            .btn {
                display: inline-block;
                background: transparent;
                color: inherit;
                font: inherit;
                border: 0;
                outline: 0;
                padding: 0;
                margin-top:16px;
                transition: all 200ms ease-in;
                cursor: pointer;
            }
            .btn--primary {
                background: #222;
                color: #fff;
                box-shadow: 0 0 10px 2px rgba(0, 0, 0, .1);
                border-radius: 2px;
                padding: 8px 24px;
            }
            .btn--primary:hover {
                background: #f00;
            }
            .btn--primary:active {
                background: #f00;
                box-shadow: inset 0 0 10px 2px rgba(0, 0, 0, .2);
            }
            .form__field {
                width: 90%;
                background: #fff;
                color: #a3a3a3;
                font: inherit;
                box-shadow: 0 6px 10px 0 rgba(0, 0, 0, .1);
                border: 0;
                outline: 0;
                padding: 8px 4px;
            }
            @media  (max-width: 768px){
                footer{
                    padding: 40px;
                }
                footer .container{
                    flex-direction: column;
                }
                footer .container .noi-dung{
                    margin-right: 0;
                    margin-bottom: 40px;
                }
                footer .container, .noi-dung.about, .links, .contact{
                    width: 100%;
                } 
            }
        </style>
    </head>
    <body>
        <div>
            <div class="ontopof">
                <h1><a href="./index.jsp" >BUGS</a></h1>
                <div class="search-container">
                    <a href="./account?action=login">Đăng nhập</a>
                    <a href="">Đăng ký</a>
                </div>
            </div>
            <div class="topnav">
                <a class="active" href="./index.jsp">Trang chủ</a>
                <a href="./mathang">Hàng hóa</a>
                <a href="./xuathang">Giao dịch</a>
                <a href="./nhaphang">Kho</a> 
                <a href="">Báo cáo</a>
                <a href="">Bán hàng</a>
            </div>

            <div class="introduces-box">
                <div class="container">
                    <div class="text-center">
                        <h2 class="heding ">Tại sao bạn thích phần mềm quản lý bán hàng BUGS</h2>
                    </div>
                    <div class="introduces">
                        <div class=" introduces-item">
                            <img src="./resources/img/tren.jpg" alt="Đơn giản &amp; Dễ sử dụng" width="" height="" class="introduces-icon">
                            <h4 class="introduces-title">Đơn giản &amp; Dễ sử dụng</h4>
                            <p class="introduces-txt ">Giao diện đơn giản, thân thiện, thông minh. Nhân viên chỉ mất 15 phút làm quen để bắt đầu bán hàng với KiotViet.</p>
                        </div>
                        <div class="introduces-item">
                            <img src="./resources/img/giua.jpg" alt="Phù hợp cho từng ngành hàng" width="" height="" class="introduces-icon">
                            <h4 class="introduces-title">Phù hợp cho từng ngành hàng</h4>
                            <p class="introduces-txt">Chúng tôi nghiên cứu thiết kế phần mềm phù hợp đến hơn 15 ngành hàng dành cho cả bán buôn, bán lẻ và bán online.</p>
                        </div>
                        <div class=" introduces-item">
                            <img src="./resources/img/duoi.jpg" alt="Tiết kiệm chi phí" width="" height="" class="introduces-icon">
                            <h4 class="introduces-title">Tiết kiệm chi phí</h4>
                            <p class="introduces-txt">Miễn phí cài đặt, phí triển khai, nâng cấp và hỗ trợ. Rẻ hơn một ly trà đá, chỉ từ 6.000 đồng/ngày</p>
                        </div>
                    </div>
                </div>
            </div>
            <div id="content">
                <div class="text-center">
                    <h2 class="heding">Bán hàng online hiệu quả</h2>
                </div>
                <div class="main-content">
                    <div class="section">
                        <div class="card-img md-6">
                            <img src="./resources/img/instagam.jpg" alt="">
                        </div>
                        <div class="content-section md-6">
                            <h3>Đồng bộ với các sàn thương mại Shopee - Tiki - Lazada - Sendo </h3>
                            <p>BUGS đem đến giải pháp quản lý bán hàng dễ dàng & hiệu quả trên các 
                                TMĐT phổ biến nhất hiện nay như Tiki, Shopee, Lazada, Sendo... Quản lý
                                tập trung nhiều gian hàng trên một giao diện, tự động đồng bộ tồn kho - giá
                                bán, tiết kiệm thời gian, đon đi bạt ngàn.</p>
                            <div class="readmore"><a href="">Xem chi tiết</a></div>
                        </div>
                    </div>
                </div>
                <div class="main-content">
                    <div class="section">
                        <div class="card-img md-6">
                            <img src="./resources/img/tw.jpg" alt="">
                        </div>
                        <div class="content-section md-6">
                            <h3>Tạo website bán hàng nhanh chóng trong 5 phút</h3>
                            <p>Chỉ với 5 phút bán hàng, bạn đã có thể tạo ra một website bán hàng với nhiều giao diên phù hợp và bắt mắt, BUGS giúp bạn có thêm một giải pháp bán hàng thương mại điện tử thật dễ dàng và đơn giản chỉ với 100k/tháng.</p>
                            <div class="readmore"><a href="">Xem chi tiết</a></div>
                        </div>
                    </div>
                </div>
                <div class="main-content">
                    <div class="section">
                        <div class="card-img md-6">
                            <img src="./resources/img/fb.jpg" alt="">
                        </div>
                        <div class="content-section md-6">
                            <h3>Liên kết quản lý bán hàng trên Facebook</h3>
                            <p>BUGS cung cấp giải pháp quản lý & bán hàng trên Fanpage Facebook tiên lợi và nhanh chóng, đáp ứng đầy đủ nhu cầu của hàng triệu chủ shop kinh doanh online thuộc tất cả mọi ngành hàng. </p>
                            <div class="readmore"><a href="">Xem chi tiết</a></div>
                        </div>
                    </div>
                </div>
            </div>
            <footer>
                <div class="container">
                    <!--Bắt Đầu Nội Dung Giới Thiệu-->
                    <div class="noi-dung about">
                        <h3>Về Chúng Tôi</h3>
                        <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Molestias, maxime incidunt, a illo impedit totam, qui quae sapiente recusandae eius tenetur necessitatibus. Dolor a tenetur architecto deserunt porro magnam dignissimos</p>
                        <ul class="social-icon">
                            <li><a href=""><i class="fa fa-facebook"></i></a></li>
                            <li><a href=""><i class="fa fa-twitter"></i></a></li>
                            <li><a href=""><i class="fa fa-instagram"></i></a></li>
                            <li><a href=""><i class="fa fa-youtube"></i></a></li>
                        </ul>
                    </div>
                    <!--Kết Thúc Nội Dung Giới Thiệu-->
                    <!--Bắt Đầu Nội Dung Đường Dẫn-->
                    <div class="noi-dung links">
                        <h3>Đường Dẫn</h3>
                        <ul>
                            <li><a href="#">Trang Chủ</a></li>
                            <li><a href="#">Về Chúng Tôi</a></li>
                            <li><a href="#">Thông Tin Liên Lạc</a></li>
                            <li><a href="#">Dịch Vụ</a></li>
                            <li><a href="#">Điều Kiện Chính Sách</a></li>
                        </ul>
                    </div>
                    <!--Kết Thúc Nội Dung Đường Dẫn-->
                    <!--Bắt Đâu Nội Dung Liên Hệ-->
                    <div class="noi-dung contact">
                        <h3>Thông Tin Liên Hệ</h3>
                        <ul class="info">
                            <li>
                                <span><i class="fa fa-map-marker"></i></span>
                                <span>Đường Số 1<br />
                                    Quận 1, Thành Phố Hồ Chí Minh<br />
                                    Việt Nam</span>
                            </li>
                            <li>
                                <span><i class="fa fa-phone"></i></span>
                                <p><a href="#">+84 123 456 789</a>
                                    <br />
                                    <a href="#">+84 987 654 321</a></p>
                            </li>
                            <li>
                                <span><i class="fa fa-envelope"></i></span>
                                <p><a href="#">diachiemail@gmail.com</a></p>
                            </li>
                            <li>
                                <form class="form">
                                    <input type="email" class="form__field" placeholder="Đăng Ký Subscribe Email" />
                                    <button type="button" class="btn btn--primary  uppercase">Gửi</button>
                                </form>
                            </li>
                        </ul>
                    </div>

            </footer>
        </div>
    </body>
</html>



