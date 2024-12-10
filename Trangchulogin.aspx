<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Trangchulogin.aspx.cs" Inherits="btl_ltw.Trangchulogin" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Trang chủ sau khi đăng nhập</title>
     <link rel="stylesheet" href="trangchulogincss/trangchulogin.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <style>
    .gridview-no-border,
    .gridview-no-border th,
    .gridview-no-border td {
        border: none;
    }
    .custom-column { 
        color: darkblue; /* Màu chữ */ 
        font-weight: bold; /* Độ đậm của font chữ */ 
    }
    .custom-button {
        width: 50px; /* Thiết lập chiều rộng */
        height: 30px; /* Thiết lập chiều cao */
        background-color: blue; /* Thiết lập màu nền */
        color: white; /* Thiết lập màu chữ */
        border: none; /* Loại bỏ viền */
        border-radius: 5px; /* Bo góc cho nút */
    }
    .custom-label {
        font-size: 40px; /* Thiết lập cỡ chữ */
        text-align: center; /* Căn giữa chữ */
        display: block; /* Đảm bảo rằng Label hoạt động như một khối */
    }

    .tp-name{
        display: block;
        height: 50px;
        background-color: snow;
    }
    .boxchat{
      display: block;
      height: 600px;
      overflow-y:scroll;
    }
    .send{
        display: block;
        height: 50px;
        padding: 10px;
        background-color: snow;
    }
    .tpl{
        margin-left:10px;
    }
</style>


</head>
<body>

    <form id="form1" runat="server">
        <div class="welcome">
            <div>
                <span class="kk">
                    <i onclick="window.location.href='/Trangchu.aspx/'" style="font-size:22px;cursor:pointer" class="fa-solid fa-house">Index</i>
                </span>
            </div>
            <div>
                <i class="fa-solid fa-user-circle"></i>
                <asp:Label ID="lblUsername" runat="server" CssClass="usernameLabel"></asp:Label>
                <asp:Button ID="btnLogout" runat="server" Text="Đăng xuất" CssClass="logoutButton" OnClick="btnLogout_Click" />
            </div>
        </div>

   <div class="hi">
    <div class="danhmuc">
        <div class="timkiem">
            <input class="input" type="text" placeholder="Tìm kiếm" />
            <i class="fa-solid fa-magnifying-glass"></i>
            <button type="button" id="taonhom">Tạo nhóm</button>
        </div>

        <div class="vvnhom">
            <asp:TextBox ID="inputGroupName" runat="server" placeholder="Nhập tên nhóm" style="display: none;" />
            <asp:Button ID="btnCreateGroup" runat="server" Text="Tạo Nhóm" OnClick="btnCreateGroup_Click" style="display: none;" />
            <asp:Button ID="btnCancel" runat="server" Text="Hủy" OnClientClick="cancelCreateGroup(); return false;" class="btn btn-secondary" style="display: none;" />
        </div>
        <div class="tpl">
            <div id="ToppicList" runat="server" class="Toppic-list" >
                <h2>Toppic list</h2>
                <asp:GridView ID="Gridtp" runat="server" AutoGenerateColumns="False" OnRowCommand="Gridtp_RowCommand" ShowHeader="False" CssClass="gridview-no-border" > 
                    <Columns> 
                        <asp:BoundField DataField="GroupName" HeaderText="Toppic" >
                                <ItemStyle Width="300px" Height="30px"/></asp:BoundField>
                        <asp:ButtonField ButtonType="Button" CommandName="Select" Text="Select" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        </div>

                <div class="khung">
                    <div class="tp-name">
                        <asp:Label ID="toppic" runat="server" Text="" CssClass="custom-label"></asp:Label>
                    </div>
                    <hr width="100%"/>
                    <div class="boxchat">
                        <asp:GridView ID="Gridmessage" runat="server" AutoGenerateColumns="False" ShowHeader="False" CssClass="gridview-no-border" OnRowDataBound="Gridmes_RowDataBound">
                            <Columns> 
                                <asp:BoundField DataField="Username" HeaderText="Tên" >
                                <ItemStyle Width="100px" Height="50px" /></asp:BoundField>
                                <asp:BoundField DataField="Message" HeaderText="Nội dung" >
                                <ItemStyle Height="50px" /></asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="send">
                        <asp:TextBox ID="txtMessage" runat="server" placeholder="Nhập tin nhắn..." Height="30px" Width="450px"></asp:TextBox>
                        <asp:Button ID="sendbtn" runat="server" Text="Gửi" OnClick="sendbtn_Click" CssClass="custom-button"/>
                    </div>
                </div>
                
       </div>


<script>
    // Khi nhấn vào nút "Tạo nhóm"
    document.getElementById('taonhom').addEventListener('click', function () {
        document.getElementById('<%= inputGroupName.ClientID %>').style.display = 'block';
        document.getElementById('<%= btnCreateGroup.ClientID %>').style.display = 'block';
        document.getElementById('<%= btnCancel.ClientID %>').style.display = 'block';
    });
    // Giả sử bạn có một phần tử con để chứa tin nhắn mới


    // Khi nhấn nút "Hủy" trong quá trình tạo nhóm
    function cancelCreateGroup() {
        document.getElementById('<%= inputGroupName.ClientID %>').style.display = 'none';
        document.getElementById('<%= btnCreateGroup.ClientID %>').style.display = 'none';
        document.getElementById('<%= btnCancel.ClientID %>').style.display = 'none';
    }



        function scrollToBottom() {
        var container = document.querySelector('.boxchat');
        container.scrollTop = container.scrollHeight;
    }

        // Gọi hàm khi trang đã tải xong
        window.onload = function() {
            scrollToBottom();
    };

        // Gọi hàm khi GridView được cập nhật
        document.addEventListener('DOMContentLoaded', function() {
            scrollToBottom();
        });


</script>

</form>
    </body>

   
</html>