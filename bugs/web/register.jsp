<%-- 
    Document   : register
    Created on : Nov 9, 2021, 10:56:24 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Đăng Ký</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style type="text/css">
            h1{
                color: #5966cf;
                padding-bottom: 10px;
            }

            *{
                margin:0 auto;
                padding:0;
                outline:none;
            }
            :root{
                --bg1:#9b59b6;
                --bg2:#3498db;

            }
            a{
                text-decoration: none;


            }
            .container{
                padding-top: 20px;
                display:flex;
                justify-content: center;
                align-content: center;
                text-align: center;
                width:100vw;
                height:100vh;
                background: linear-gradient(to bottom right,var(--bg1),var(--bg2))
            }
            .from{
                width:300px;
                height:500px;
                background: #fff;
                border-radius: 10px;
                padding: 40px 30px;
            }
            .from-name{
                margin-bottom: 40px;
                position: relative;
            }
            .from-name input{
                width:100%;
                height:35px;
                border:none;
                border-bottom: 2px solid #ccc;
                cursor: pointer;

            }
            #loai{
                width:100%;
                height:35px;
                border:none;
                border-bottom: 2px solid #ccc;
                cursor: pointer;

            }
            .from-name p{
                position: absolute;
                bottom: 35px;

            }
            .from button{
                height:35px;
                width:100%;
                margin-bottom: 30px;
                margin-top:20px;
                border:none;
                color:#fff;
                border-radius:5px;
                background: linear-gradient(to bottom right,var(--bg1),var(--bg2))
            }
            #a{
                color: #6b73d5;
            }
            #a:hover{
                color:#d02291;
            }
            button:hover{
                color:#d02291;
            }
            span{
                display: block;
                position:absolute;
                top:14px;
                right:0px;
            }
            span img{
                cursor: pointer;
            }
            select option {
                margin: 60px;
                height:  10px;
                background: #e9e9e9;
                color: #000000;
                text-shadow: 0 1px 0 rgba(0, 0, 0, 0.4);
                font-size: 20px;
                font-weight: 200;
                margin-top: 20px

            }

        </style>

    </head> 
    <body>

        <div class="container">
            <form class="from" action="account?action=addAccount" method="POST">
                <h1>Đăng Ký</h1>
                <p>Nhanh chóng và dễ dàng</p><br><br> 
                <div class="from-name">
                    <p> Tên Đăng Nhập</p>
                    <input type="text" name="txtGetUserName" placeholder="Sử dụng số điện thoại hoặc email" required><br>
                </div>
                <div class="from-name">
                    <p>Mật Khẩu </p>
                    <input type="password" id="password" name="txtGetPassword" placeholder="password" required><br>
                    <span><img src="./resources/img/eye.jpg"  width="30" onclick="myfunction()"></span>
                </div>
                <div class="from-name">
                    <p> Nhập lại mật khẩu</p>
                    <input type="password" id="pass" name="txtCheckPassword" placeholder="Xác nhận" required><br>
                    <span><img src="./resources/img/eye.jpg"  width="30" onclick="tfunction()"></span>
                </div>
                <div class="from-name">
                    <p> Loại tài khoản</p>
                    <select name="txtLoai" id="loai">
                        <option hidden ></option>
                        <option value="member">member</option>
                        <option value="admin">admin</option>
                    </select>  
                </div>
                <button type="submit">Đăng Ký</button>
                <a href="./login.jsp" id="a">Bạn đã có tài khoản?</a>
            </form>

        </div>
        <script type="text/javascript">
            var x = true;
            function myfunction() {
                if (x) {
                    document.getElementById('password').type = "text";
                    x = false;
                } else {
                    document.getElementById('password').type = "password";
                    x = true;
                }
            }
            var x = true;
            function tfunction() {
                if (x) {
                    document.getElementById('pass').type = "text";
                    x = false;
                } else {
                    document.getElementById('pass').type = "password";
                    x = true;
                }
            }
        </script>
    </body>
</html>
