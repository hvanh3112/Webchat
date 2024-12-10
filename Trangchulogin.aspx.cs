using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using System.Web.Services;
using System.Text.RegularExpressions;
using System.Text;
using System.Data;
using System.Web.UI.WebControls;

namespace btl_ltw
{
    public partial class Trangchulogin : System.Web.UI.Page
    {
        public int SelectedGroupId { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Username"] != null)
                {
                    lblUsername.Text = "Xin chào, " + Session["Username"].ToString();
                    BindGridView(str1);
                    Gridtp.DataSource = dt;
                    Gridtp.DataBind();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
                
            }

        }


        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Trangchu.aspx");
        }

        protected void Gridmes_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Áp dụng CSS cho cột đầu tiên (Column1)
                e.Row.Cells[0].CssClass = "custom-column";
            }
        }



        protected void sendbtn_Click(object sender, EventArgs e)
        {

            if (!string.IsNullOrEmpty(toppic.Text)&&!string.IsNullOrEmpty(txtMessage.Text))
            {
                BindGridView(str3+ toppic.Text + "'");
                string grID = dt.Rows[0][0].ToString();
                int.TryParse(grID, out int groupId);
                int userId = (int)Session["UserId"];
                string textMes = txtMessage.Text;

                string query = "INSERT INTO GroupMessages (GroupId, UserId, Message) VALUES ('" + groupId+"','"+ userId+"',N'"+ textMes +"')";
                // Retrieve the connection string from Web.config
                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connectionString))
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
                

                txtMessage.Text = string.Empty;

                // Reload messages after sending a new one
                BindGridView(str2+toppic.Text + "'");
                Gridmessage.DataSource = dt;
                Gridmessage.DataBind();
            }
        }
        protected void btnCreateGroup_Click(object sender, EventArgs e)
        {
            string groupName = inputGroupName.Text.Trim();
            if (!string.IsNullOrEmpty(groupName))
            {
                int userId = Convert.ToInt32(Session["UserId"]);
                string connStr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString();
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();
                    SqlTransaction transaction = conn.BeginTransaction();

                    try
                    {
                        string insertGroupQuery = "INSERT INTO Groups (GroupName, CreatedBy) OUTPUT INSERTED.GroupId VALUES (@GroupName, @CreatedBy)";
                        SqlCommand cmdInsertGroup = new SqlCommand(insertGroupQuery, conn, transaction);
                        cmdInsertGroup.Parameters.AddWithValue("@GroupName", groupName);
                        cmdInsertGroup.Parameters.AddWithValue("@CreatedBy", userId);

                        int groupId = (int)cmdInsertGroup.ExecuteScalar();

                        string insertMemberQuery = "INSERT INTO GroupMembers (GroupId, UserId) VALUES (@GroupId, @UserId)";
                        SqlCommand cmdInsertMember = new SqlCommand(insertMemberQuery, conn, transaction);
                        cmdInsertMember.Parameters.AddWithValue("@GroupId", groupId);
                        cmdInsertMember.Parameters.AddWithValue("@UserId", userId);

                        cmdInsertMember.ExecuteNonQuery();
                        transaction.Commit();
                        BindGridView(str1);
                        Gridtp.DataSource = dt;
                        Gridtp.DataBind();
                        Response.Write("<script>alert('Nhóm đã được tạo thành công!');</script>");
                    }
                    catch (Exception ex)
                    {
                        transaction.Rollback();
                        Response.Write("<script>alert('Có lỗi xảy ra khi tạo nhóm.');</script>");
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('Vui lòng nhập tên nhóm.');</script>");
            }
        }

        
        

        DataTable dt = new DataTable();
        String str3 = "Select GroupID from Groups where GroupName='";
        String str1 = "SELECT GroupName FROM Groups";
        String str2 = "Select Username, Message from GroupMessages join Users on GroupMessages.UserId=Users.UserId join Groups on GroupMessages.GroupId= Groups.GroupId Where GroupName='";
        private void BindGridView(String str)
        {
            string constr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(str))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        sda.Fill(dt);
                    }
                }
            }
        }
        protected void Gridtp_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = Gridtp.Rows[rowIndex];
                toppic.Text = row.Cells[0].Text;
                BindGridView(str2 + row.Cells[0].Text + "'");
                Gridmessage.DataSource = dt;
                Gridmessage.DataBind();
            }
        }



    }


}





