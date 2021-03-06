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
                    <a href="./account?action=login">????ng nh???p</a>
                    <a href="">????ng k??</a>
                </div>
            </div>
            <div class="topnav">
                <a class="active" href="./index.jsp">Trang ch???</a>
                <a href="./mathang">H??ng h??a</a>
                <a href="./xuathang">Giao d???ch</a>
                <a href="./nhaphang">Kho</a> 
                <a href="">B??o c??o</a>
                <a href="">B??n h??ng</a>
            </div>

            <div class="introduces-box">
                <div class="container">
                    <div class="text-center">
                        <h2 class="heding ">T???i sao b???n th??ch ph???n m???m qu???n l?? b??n h??ng BUGS</h2>
                    </div>
                    <div class="introduces">
                        <div class=" introduces-item">
                            <img src="./resources/img/tren.jpg" alt="????n gi???n &amp; D??? s??? d???ng" width="" height="" class="introduces-icon">
                            <h4 class="introduces-title">????n gi???n &amp; D??? s??? d???ng</h4>
                            <p class="introduces-txt ">Giao di???n ????n gi???n, th??n thi???n, th??ng minh. Nh??n vi??n ch??? m???t 15 ph??t l??m quen ????? b???t ?????u b??n h??ng v???i KiotViet.</p>
                        </div>
                        <div class="introduces-item">
                            <img src="./resources/img/giua.jpg" alt="Ph?? h???p cho t???ng ng??nh h??ng" width="" height="" class="introduces-icon">
                            <h4 class="introduces-title">Ph?? h???p cho t???ng ng??nh h??ng</h4>
                            <p class="introduces-txt">Ch??ng t??i nghi??n c???u thi???t k??? ph???n m???m ph?? h???p ?????n h??n 15 ng??nh h??ng d??nh cho c??? b??n bu??n, b??n l??? v?? b??n online.</p>
                        </div>
                        <div class=" introduces-item">
                            <img src="./resources/img/duoi.jpg" alt="Ti???t ki???m chi ph??" width="" height="" class="introduces-icon">
                            <h4 class="introduces-title">Ti???t ki???m chi ph??</h4>
                            <p class="introduces-txt">Mi???n ph?? c??i ?????t, ph?? tri???n khai, n??ng c???p v?? h??? tr???. R??? h??n m???t ly tr?? ????, ch??? t??? 6.000 ?????ng/ng??y</p>
                        </div>
                    </div>
                </div>
            </div>
            <div id="content">
                <div class="text-center">
                    <h2 class="heding">B??n h??ng online hi???u qu???</h2>
                </div>
                <div class="main-content">
                    <div class="section">
                        <div class="card-img md-6">
                            <img src="./resources/img/instagam.jpg" alt="">
                        </div>
                        <div class="content-section md-6">
                            <h3>?????ng b??? v???i c??c s??n th????ng m???i Shopee - Tiki - Lazada - Sendo </h3>
                            <p>BUGS ??em ?????n gi???i ph??p qu???n l?? b??n h??ng d??? d??ng & hi???u qu??? tr??n c??c 
                                TM??T ph??? bi???n nh???t hi???n nay nh?? Tiki, Shopee, Lazada, Sendo... Qu???n l??
                                t???p trung nhi???u gian h??ng tr??n m???t giao di???n, t??? ?????ng ?????ng b??? t???n kho - gi??
                                b??n, ti???t ki???m th???i gian, ??on ??i b???t ng??n.</p>
                            <div class="readmore"><a href="">Xem chi ti???t</a></div>
                        </div>
                    </div>
                </div>
                <div class="main-content">
                    <div class="section">
                        <div class="card-img md-6">
                            <img src="./resources/img/tw.jpg" alt="">
                        </div>
                        <div class="content-section md-6">
                            <h3>T???o website b??n h??ng nhanh ch??ng trong 5 ph??t</h3>
                            <p>Ch??? v???i 5 ph??t b??n h??ng, b???n ???? c?? th??? t???o ra m???t website b??n h??ng v???i nhi???u giao di??n ph?? h???p v?? b???t m???t, BUGS gi??p b???n c?? th??m m???t gi???i ph??p b??n h??ng th????ng m???i ??i???n t??? th???t d??? d??ng v?? ????n gi???n ch??? v???i 100k/th??ng.</p>
                            <div class="readmore"><a href="">Xem chi ti???t</a></div>
                        </div>
                    </div>
                </div>
                <div class="main-content">
                    <div class="section">
                        <div class="card-img md-6">
                            <img src="./resources/img/fb.jpg" alt="">
                        </div>
                        <div class="content-section md-6">
                            <h3>Li??n k???t qu???n l?? b??n h??ng tr??n Facebook</h3>
                            <p>BUGS cung c???p gi???i ph??p qu???n l?? & b??n h??ng tr??n Fanpage Facebook ti??n l???i v?? nhanh ch??ng, ????p ???ng ?????y ????? nhu c???u c???a h??ng tri???u ch??? shop kinh doanh online thu???c t???t c??? m???i ng??nh h??ng. </p>
                            <div class="readmore"><a href="">Xem chi ti???t</a></div>
                        </div>
                    </div>
                </div>
            </div>
            <footer>
                <div class="container">
                    <!--B???t ?????u N???i Dung Gi???i Thi???u-->
                    <div class="noi-dung about">
                        <h3>V??? Ch??ng T??i</h3>
                        <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Molestias, maxime incidunt, a illo impedit totam, qui quae sapiente recusandae eius tenetur necessitatibus. Dolor a tenetur architecto deserunt porro magnam dignissimos</p>
                        <ul class="social-icon">
                            <li><a href=""><i class="fa fa-facebook"></i></a></li>
                            <li><a href=""><i class="fa fa-twitter"></i></a></li>
                            <li><a href=""><i class="fa fa-instagram"></i></a></li>
                            <li><a href=""><i class="fa fa-youtube"></i></a></li>
                        </ul>
                    </div>
                    <!--K???t Th??c N???i Dung Gi???i Thi???u-->
                    <!--B???t ?????u N???i Dung ???????ng D???n-->
                    <div class="noi-dung links">
                        <h3>???????ng D???n</h3>
                        <ul>
                            <li><a href="#">Trang Ch???</a></li>
                            <li><a href="#">V??? Ch??ng T??i</a></li>
                            <li><a href="#">Th??ng Tin Li??n L???c</a></li>
                            <li><a href="#">D???ch V???</a></li>
                            <li><a href="#">??i???u Ki???n Ch??nh S??ch</a></li>
                        </ul>
                    </div>
                    <!--K???t Th??c N???i Dung ???????ng D???n-->
                    <!--B???t ????u N???i Dung Li??n H???-->
                    <div class="noi-dung contact">
                        <h3>Th??ng Tin Li??n H???</h3>
                        <ul class="info">
                            <li>
                                <span><i class="fa fa-map-marker"></i></span>
                                <span>???????ng S??? 1<br />
                                    Qu???n 1, Th??nh Ph??? H??? Ch?? Minh<br />
                                    Vi???t Nam</span>
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
                                    <input type="email" class="form__field" placeholder="????ng K?? Subscribe Email" />
                                    <button type="button" class="btn btn--primary  uppercase">G???i</button>
                                </form>
                            </li>
                        </ul>
                    </div>

            </footer>
        </div>
    </body>
</html>



