<%-- 
    Document   : login
    Created on : Nov 8, 2021, 12:40:30 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Đăng Nhập</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <style type="text/css">
        h1{
            color: #5966cf;
        }
        :root{
            --bg1:#9b59b6;
            --bg2:#3498db;

        }
        *{
            margin:0;
            padding:0;
            outline:none;
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
            margin-bottom: 30px;
            position: relative;
        }
        .from-name input{
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
        .from .register{
            height:35px;
            width:100%;
            margin-bottom: 30px;
            margin-top:20px;
            border:none;
            color:#fff;
            border-radius:5px;
            background: linear-gradient(to bottom right,var(--bg1),var(--bg2))
        }

        .from-checkbox {

            position: absolute;

        }
        #a{       
            padding-left:195px;
            color: #6b73d5;
        }
        #aa{
            color: #6b73d5;
        }
        #a:hover{
            color:#d02291;
        }
        #aa:hover{
            color:#d02291;
        }
        .register:hover{
            color:#d02291;
        }
        span{
            display: block;
            position:absolute;
            top:30px;
            right:0px;
        }
        span img{
            cursor: pointer;
        }
        
    </style>
    <body>
        <div class="container"> 
            <form class="from" action="account?action=checklogin" method="POST">
            <h1>Đăng Nhập</h1>
            <div class="from-name"> <br><br>
            <p>Tên đăng nhập</p>
            <input type="text" name="txtUserName" placeholder="Tài khoản hoặc số điện thoại" required><br>
            </div>
            <div class="from-name"> 
            <p>Mật khẩu</p> <a href=""id="a">Quên mật khẩu?<a>
            <input type="password" id="password" name="txtPassword" placeholder="Mật khẩu" required ><br>
             <span><img src="./resources/img/eye.jpg" width="30" onclick="myfunction()"></span>
            </div>
            <div class="from-checkbox"> 
            <input type="checkbox"> Nhớ mật khẩu
            </div>
            <input type="submit" value="Đăng nhập" class="register">
            <p>Bạn chưa có tài khoản? Đăng Ký ngay <a href="./register.jsp" id="aa"> tại đây</a></p>
           </form>     
            
        </div>
         <script type="text/javascript">
		var x = true;
		function myfunction(){
			if(x){
				document.getElementById('password').type = "text";
				x = false;
			}else{
				document.getElementById('password').type = "password";
				x = true;
			}
		}
	</script>
    </body>
</html>

