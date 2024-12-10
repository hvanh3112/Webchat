<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Trangchu.aspx.cs" Inherits="btl_ltw.Trangchu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link rel ="stylesheet" href ="trangchucss/trangchu.css" />
<link rel ="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <title>Trang chủ</title>

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
    <div class="nd">
        <div class="wc">
            <h1> Chào mừng đến với WebchatATT !</h1>
        </div>
        <div class="content">
            <div class="column">
                <h2>Kết nối Dễ dàng</h2>
                <hr />
                <p>Bạn có thể dễ dàng kết nối với những người có chung ý tưởng trò chuyện chỉ với một vài cú nhấp chuột. Web chat của chúng tôi cung cấp giao diện thân thiện và dễ sử dụng, giúp bạn nhanh chóng liên lạc và trao đổi mọi lúc, mọi nơi.</p>
            </div>

            <div class="column">
                <h2>Bảo mật và An toàn</h2>
                <hr />
                <p>Chúng tôi luôn đặt sự an toàn và quyền riêng tư của bạn lên hàng đầu. Với các biện pháp bảo mật tiên tiến, bạn có thể yên tâm rằng các cuộc trò chuyện của mình luôn được bảo vệ. Hãy tận hưởng trải nghiệm giao tiếp trực tuyến an toàn và tin cậy.</p>
            </div>

            <div class="column">
                <h2>Tích hợp Đa nền tảng</h2>
                <hr />
                <p>Web chat của chúng tôi có thể tích hợp và sử dụng trên nhiều nền tảng khác nhau, bao gồm máy tính, điện thoại di động và máy tính bảng. Dù bạn đang ở đâu, chỉ cần có kết nối internet, bạn đã có thể trò chuyện mọi lúc mọi nơi.</p>
            </div>
       </div>

    </div>
    <div class="footer" id="footer">
        <div class="fh1">
            <h2>Credit</h2>
                <li>Hoàng Việt Anh</li>
                <li>Bùi Văn Trung</li>
                <li>Nguyễn Văn Thuấn</li>
        </div>
        <div class="fh1">
            <h2>SOCIAL</h2>
            <li><a href="https://www.facebook.com/profile.php?id=100014383924130">Facebook</a></li>
        </div>
        <div class="Thongtin">
            <h3>TRƯỜNG ĐẠI HỌC MỞ HÀ NỘI</h3>
            <li>Chịu trách nhiệm quản lý nội dung: <strong>Hoàng Việt Anh, Bùi Văn Trung</strong> </li>
            <li><strong>Admin:</strong> Bùi Văn Trung, Hoàng Việt Anh, Nguyễn Văn Thuấn</li>
            <li><strong>Địa chỉ:</strong> 96 Định Công, Hoàng Mai, Hà Nội</li>
            <li><strong>Email:</strong> vanhtdk53@gmail.com</li>
        </div>
    </div>

</form>
</body>

</html>
