<%-- 
    Document   : suamathang
    Created on : Nov 7, 2021, 9:53:28 AM
    Author     : Dell
--%>
<%@page  import="bugs.model.MatHang"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Website </title>

        <style>
            body {
                align-items: center;
                background-color: #90CAF9;
                display: flex;
                justify-content: center;
                height: 100vh;

            }
            .form1 {
                background-color: #15172b;
                border-radius: 24px;
                box-sizing: border-box;
                height: 700px;
                padding: 30px;
                width: 360px;
            }
            .title {
                color: #0091EA;
                font-family: sans-serif;
                font-size: 30px;
                font-weight: 400;
                margin-top: 10px;
            }

            .subtitle {
                color: #0091EA;
                font-family: sans-serif;
                font-size: 15px;
                font-weight: 400;
                margin-top: 10px;
            }

            .input-container {
                height: 40px;
                position: relative;
                width: 100%;

            }
            .asterisk_input::after {
                content:" *"; 
                color: red;
                position: absolute; 
                margin: 0px 0px 0px -20px; 
                font-size: xx-large; 
                padding: 0 5px 0 0; 
            }
            .ic1 {
                margin-top: 00px;
            }

            .ic2 {
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
            .placeholder {
                color: #65657b;
                font-family: sans-serif;
                left: 20px;
                line-height: 14px;
                pointer-events: none;
                position: absolute;
                transform-origin: 0 50%;
                transition: transform 200ms, color 200ms;
                top: 20px;
            }
            .label{
                margin-top: 20px;
                margin-bottom: 0px;
            }
            .label p{
                color: #0091EA;
                font-family: sans-serif;
                font-size: 15px;
                font-weight: 400;
                margin-top: 10px;
            }

            .input {
                background-color: #303245;
                border-radius: 12px;
                border: 0;
                box-sizing: border-box;
                color: #eee;
                font-size: 18px;
                height: 100%;
                outline: 0;
                padding: 4px 20px 0;
                width: 100%;
            }
            select{
                width: 300px;
                height: 30px;
                background-color: #303245;
                border-radius: 12px;
                border: 0;
                box-sizing: border-box;
                height: 40px;
                position: relative;
                width: 100%;
                font-size: 18px;
                background-color: #303245;
                padding: 4px 20px 0;

            }

            select option {
                margin: 60px;
                height:  10px;
                background: #84FFFF;
                color: #000000;
                text-shadow: 0 1px 0 rgba(0, 0, 0, 0.4);
                font-size: 20px;
                font-weight: 200;
                margin-top: 20px

            }


            select option[value="1"] {
                background: #84FFFF;
            }

            select option[value="2"] {
                background: #84FFFF;
            }

            select option[value="3"] {
                background: #84FFFF;
            }

            select option[value="4"] {
                background: #84FFFF;
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
                margin-top: 20px;
                /*outline: 0;*/

                width: 100%;
            }

            .submit:active {
                background-color: #06b;
            }
            .submit a{
                text-decoration: none;
                color: white;
            }




        </style>
    </head>
    <body>

        <div class="form1" >
            <form action="mathang?action=save" class="form" method="POST" enctype="multipart/form-data">
                <%
                    MatHang mh = (MatHang) request.getAttribute("suamathang");
                %>
                <div class="title">Sửa mặt hàng</div>
                <div class="subtitle">Nhập đầy đủ thông tin cần sửa</div>

                <div class="label lb1">
                    <p>Mã hàng:</p>
                </div>
                <div class="input-container ic1">

                    <input id="" class="input" type="text" name="txtMaHang" value="<%= mh.getMaHang()%>" readonly="readonly" required />
                    <div class="cut"></div> 
                </div>
                <div class="label lb2">
                    <p>Tên hàng:</p>
                </div>
                <div class="input-container ic2">

                    <input id="TenHang" class="input" type="text" name="txtTenHang" value="<%= mh.getTenHang()%>" required/>
                    <div class="cut"></div> 
                </div>
                <div class="label lb3">
                    <p>Giá Nhập:</p>
                </div>
                <div class="input-container ic3">

                    <input id="GiaNhap" class="input" type="text" name="txtGiaNhap" value="<%= mh.getGiaNhap()%>" required/>
                    <div class="cut"></div>
                </div>
                <div class="label lb4">
                    <p>Giá bán:</p>
                </div>
                <div class="input-container ic4">

                    <input id="GiaBan" class="input" type="text" name="txtGiaBan" value="<%= mh.getGiaBan()%>" required/> 
                    <div class="cut cut-short"></div>       
                </div>
                
                <div class="label lb5">
                    <p>Loại:</p>
                </div>

                <div class="input-container ic4">

                    <select class="input" name="txtLoai" id=""  >
                        <option hidden ><%= mh.getLoai()%></option>
                        <option value="Quần"  >Quần</option>
                        <option value="Áo">Áo</option>
                        <option value="Mũ">Mũ</option>
                    </select>
                    <div class="cut cut-short"></div>       
                </div>
                <input type="submit" class="submit" value="Lưu">
                <button type="text" class="submit"><a href="./mathang">Quay lại</a></button>
            </form>
        </div>

    </body>
</html>

