using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace BTL_LapTrinhWeb.pages
{
    public partial class dang_nhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                string user = Request.Form["username"] ?? "";
                string password = Request.Form["password"] ?? "";

                try
                {
                    // LỖ HỔNG SQL INJECTION: Ghép chuỗi trực tiếp không qua kiểm tra hoặc tham số hóa
                    string sql = "SELECT * FROM TaiKhoan WHERE Username = '" + user + "' AND Password = '" + password + "'";
                    DataTable dt = database.GetData(sql);

                    if (dt != null && dt.Rows.Count > 0)
                    {
                        DataRow row = dt.Rows[0];
                        Session["username"] = row["Username"].ToString();
                        Session["email"] = row["Email"].ToString();
                        Session["hoten"] = row["HoTen"].ToString();
                        Session["role"] = row["Role"].ToString();
                        Response.Redirect("../index.aspx");
                    }
                    else
                    {
                        saiDN.InnerHtml = "Sai tên đăng nhập hoặc mật khẩu!";
                    }
                }
                catch (SqlException ex)
                {
                    // Hiển thị lỗi SQL Server khi nhập payload gây lỗi cú pháp (Error-based SQLi)
                    saiDN.InnerHtml = "<b>Lỗi SQL Server:</b> " + Server.HtmlEncode(ex.Message);
                }
            }
        }
    }
}