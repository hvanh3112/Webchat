<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dangky.aspx.cs" Inherits="btl_ltw.Dangky" %>

<!DOCTYPE html>

<html >
<head runat="server">
    <link rel ="stylesheet" href ="dangkycss/dangky.css" />
    <link rel ="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
    <title>Đăng ký tài khoản</title>
</head>
<body>

    <form id="form1" runat="server" >
     
         <nav class="sidebar" >
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
                    <h2 class="hu">Đăng kí tài khoản</h2>

                    <div class="account">
                        
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="inputt input1" placeholder="Tài khoản"></asp:TextBox>
                        <i id="icon1" class="fa-solid fa-user"></i>

                        <div>
                            
                            <div class="password">
                                <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" CssClass="inputt input2" placeholder="Mật Khẩu"></asp:TextBox>
                              
                            </div>

                           
                            <div class="outpassword">
                                <asp:TextBox ID="txtConfirmPassword" TextMode="Password" runat="server" CssClass="inputt input3" placeholder="Nhập lại mật khẩu"></asp:TextBox>
                            
                            </div>
                        </div>

                      
                        <asp:Button ID="btnRegister" runat="server" CssClass="btn" Text="Đăng Ký" OnClick="btnRegister_Click" />
                    </div>
                </div>
    </form>
    

</body>
</html>