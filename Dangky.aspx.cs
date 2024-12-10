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
    public partial class Dangky : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            // Kiểm tra nếu mật khẩu và xác nhận mật khẩu không trùng khớp
            if (password != confirmPassword)
            {
                Response.Write("<script>alert('Mật khẩu và xác nhận mật khẩu không trùng khớp!');</script>");
                return;
            }

            // Mã hóa mật khẩu trước khi lưu vào cơ sở dữ liệu
            string hashedPassword = HashPassword(password);

            // Lấy chuỗi kết nối từ web.config
            string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();

                    // Kiểm tra xem tên đăng nhập đã tồn tại chưa
                    string checkUserQuery = "SELECT COUNT(*) FROM Users WHERE Username = @Username";
                    using (SqlCommand checkCmd = new SqlCommand(checkUserQuery, conn))
                    {
                        checkCmd.Parameters.AddWithValue("@Username", username);

                        int userExists = (int)checkCmd.ExecuteScalar();
                        if (userExists > 0)
                        {
                            Response.Write("<script>alert('Tên đăng nhập đã tồn tại!');</script>");
                            return;
                        }
                    }

                    // Chèn thông tin người dùng vào cơ sở dữ liệu
                    string insertQuery = "INSERT INTO Users (Username, Password) VALUES (@Username, @Password)";
                    using (SqlCommand cmd = new SqlCommand(insertQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@Username", username);
                        cmd.Parameters.AddWithValue("@Password", hashedPassword);

                        int rowsAffected = cmd.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            Response.Write("<script>alert('Đăng ký thành công!');</script>");
                        }
                        else
                        {
                            Response.Write("<script>alert('Có lỗi xảy ra, vui lòng thử lại!');</script>");
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Lỗi: " + ex.Message + "');</script>");
                }
            }
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
