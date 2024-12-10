using System;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;

namespace btl_ltw
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Kiểm tra thông tin đăng nhập
            if (IsValidUser(username, password))
            {
                // Nếu đăng nhập thành công, lưu tên người dùng và UserId vào session
                Session["Username"] = username;

                // Lấy UserId từ cơ sở dữ liệu
                int userId = GetUserId(username, password);
                Session["UserId"] = userId; // Lưu UserId vào session

                // Chuyển hướng tới trang Trangchulogin.aspx
                Response.Redirect("Trangchulogin.aspx");
            }
            else
            {
                // Nếu đăng nhập không thành công, hiển thị thông báo lỗi
                Response.Write("<script>alert('Tên đăng nhập hoặc mật khẩu không đúng!');</script>");
            }
        }

        // Hàm kiểm tra thông tin đăng nhập
        public bool IsValidUser(string username, string password)
        {
            bool isValid = false;

            // Mã hóa mật khẩu trước khi so sánh với dữ liệu trong cơ sở dữ liệu
            string hashedPassword = HashPassword(password);

            // Lấy chuỗi kết nối từ web.config
            string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();

                    // Truy vấn kiểm tra người dùng có tồn tại không và mật khẩu có khớp không
                    string query = "SELECT COUNT(*) FROM Users WHERE Username = @Username AND Password = @Password";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Username", username);
                        cmd.Parameters.AddWithValue("@Password", hashedPassword);

                        int count = (int)cmd.ExecuteScalar();
                        if (count > 0)
                        {
                            isValid = true; // Nếu có kết quả, đăng nhập thành công
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Xử lý lỗi (nếu có)
                    Response.Write("<script>alert('Lỗi: " + ex.Message + "');</script>");
                }
            }

            return isValid;
        }

        // Hàm lấy UserId từ cơ sở dữ liệu
        public int GetUserId(string username, string password)
        {
            int userId = 0;
            string hashedPassword = HashPassword(password);

            string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString();
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();

                    // Truy vấn lấy UserId từ tên đăng nhập
                    string query = "SELECT UserId FROM Users WHERE Username = @Username AND Password = @Password";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Username", username);
                        cmd.Parameters.AddWithValue("@Password", hashedPassword);

                        object result = cmd.ExecuteScalar();
                        if (result != null)
                        {
                            userId = Convert.ToInt32(result);
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Xử lý lỗi (nếu có)
                    Response.Write("<script>alert('Lỗi: " + ex.Message + "');</script>");
                }
            }

            return userId;
        }

        // Hàm mã hóa mật khẩu sử dụng SHA256
        public string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                StringBuilder builder = new StringBuilder();
                foreach (byte b in bytes)
                {
                    builder.Append(b.ToString("x2"));
                }
                return builder.ToString();
            }
        }
    }
}
