<%-- 
    Document   : nhaphang
    Created on : Nov 13, 2021, 11:59:41 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Nhập hàng </title> 
        <script type="text/javascript">

            function mydate()
            {
                var date = today.getDate() + '-' + (today.getMonth() + 1) + '-' + today.getFullYear();


            }
        </script>
        <style>  

            body {
                background: linear-gradient(45deg, #FC466B, #3F5EFB);
                height: 100vh;
                font-family: 'Montserrat', sans-serif;
                align-items: center;
                background-color: #90CAF9;
                display: flex;
                justify-content: center;
            }
            .container {
                position: absolute;
                transform: translate(-50%,-50%);
                top: 50%;
                left: 50%;
            }
            form {
                background: #ffffff;
                border-left: 1px solid #ffffff;
                border-top: 1px solid #ffffff;
                backdrop-filter: blur(10px);
                box-shadow: 20px 20px 40px -6px rgba(0,0,0,0.2);
                position: relative;
                transition: all 0.2s ease-in-out;
                border-radius: 24px;
                box-sizing: border-box;
                height: px;
                padding: 30px;
                width: 360px;
            }
            .title {
                font-weight: 650;
                color: #5966cf;
                opacity: 0.7;
                margin-top: 0;
                margin-bottom: 30px;
                font-family: sans-serif;
                font-size: 30px;  
                margin-top: 10px;
                text-align: center;
            }
            .input-container {
                height: 40px;
                position: relative;
                width: 100%;

            }
            .ic1 {
                margin-top: 00px;
            }


            .ic3 {
                margin-top: 00px;
            }
            .ic4 {
                margin-top: 00px;
            }
            .ic5 {
                margin-top: 00px;
            }

            .label{
                margin-top: 20px;
                margin-bottom: 0px;
            }
            .label p{
                color: #000000;
                font-family: sans-serif;
                font-size: 15px;
                font-weight: 400;
                margin-top: 10px;
                padding-left: 10px;
            }

            .input {
                background-color: rgba(255, 0, 0, 0.4);
                width: 270px;
                padding: 1em;
                padding-left: 20px;
                margin-bottom: 2em;
                border: none;
                border-left: 1px solid white;
                border-top: 1px solid white;
                border-radius: 5000px;
                backdrop-filter: blur(5px);
                box-shadow: 4px 4px 60px rgba(0,0,0,0.2);
                color: #000;
                font-family: Montserrat, sans-serif;
                font-weight: 500;
                transition: all 0.2s ease-in-out;

            }

            


            .submit {
                background-color: #08d;
                border-radius: 12px;
                border: 0;
                box-sizing: border-box;
                color: #eee;
                cursor: pointer;
                font-size: 18px;
                height: 40px;
                margin-top: 50px;
                margin-bottom: 20px;
                /*  // outline: 0;*/

                width: 100%;
            }

            .submit:active {
                background-color: #06b;
            }
            #a{       
                color: #6b73d5;
            }
            #aa{       
                color:#1266F1;
                padding-left: 220px;
                text-decoration: none;
            }
            #a:hover{
                color:#F44336;
            }
            #aa:hover{
                color:#F44336;
            }


        </style>

    </head>
    <body>
        
        <div class="container" >
            <form class="form" action="nhaphang?action=newNhapHang" method="POST">
                <div class="title">Nhập Hàng</div>

                <div class="label lb1">
                    <p>Mã hàng:</p>
                </div>
                <div class="input-container ic1">

                    <input id="MaHang" class="input" type="text" placeholder="Mã Hàng" name="txtMaHang"  required />
                    <div class="cut"></div> 
                </div>

                <div class="label lb3">
                    <p>Ngày nhập:</p>
                </div>
                <div class="input-container ic3">

                    <input id="NgayNhap" class="input" type="date" onchange="mydate();" name="txtNgayNhap"  required/>

                    <div class="cut"></div> 
                </div>


                <div class="label lb4">
                    <p>Số lượng:</p>
                </div>
                <div class="input-container ic4">

                    <input id="Soluong" class="input" type="number" placeholder="0"  min="0" name="txtSoLuong" required/>
                    <div class="cut"></div> 
                </div>

                <div>

                </div>
                <input type="submit" class="submit" value="Nhập">
                <a href="./nhaphang" id="aa">Quay lại</a>
            </form>
        </div>
    </body>
</html>

