<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="btl_ltw.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="logincss/login.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
</head>
<body>

 <form id="form1" runat="server">

        <nav class="sidebar">
            <ul>
                <span class="kk">
                    <i onclick="window.location.href='/Trangchu.aspx/'" style="font-size:22px;cursor:pointer" class="fa-solid fa-house">Index</i>
                </span>
            </ul>
            <ul>
                <button class="btl btn1" onclick="event.preventDefault(); window.location.href='/Login.aspx';">
                    <i class="fa-regular fa-user"></i> Đăng nhập
                </button>
                <button class="btl btn1" onclick="event.preventDefault(); window.location.href='/Dangky.aspx';">
                    <i class="fa-solid fa-key"></i> Đăng Ký
                </button>
            </ul>
        </nav>


       <div class="formlogin">

          <h1 class="hu">Đăng nhập</h1>

           <div class="account">
           <asp:TextBox ID="txtUsername" runat="server" Class="inputt input1" placeholder="Tài khoản"></asp:TextBox>
           <i id="icon1" class="fa-solid fa-user"></i>
           </div>

         
           <div class="password">
               <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" Class="inputt input2" placeholder="Mật khẩu"></asp:TextBox>
           </div>

           <button class="btn" runat="server" onserverclick="btnLogin_Click">Login</button>

           <div class="huhu">
               <p>Bạn chưa có tài khoản ? <a class="#" style="color:blue" href="/Dangky.aspx">Đăng Ký</a></p>
           </div>

       </div>

 

</form>
</body>
</html>