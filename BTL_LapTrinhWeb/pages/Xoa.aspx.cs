using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_LapTrinhWeb.pages
{
    public partial class Xoa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string userXoa = Request.QueryString["user"];
            if (!string.IsNullOrEmpty(userXoa))
            {
                string sqlDelete = "DELETE FROM TaiKhoan WHERE Username = @user";
                database.ExecuteNonQuery(sqlDelete, new SqlParameter[] { new SqlParameter("@user", userXoa) });
            }
            Response.Redirect("quan-ly-tai-khoan.aspx");
        }
    }
}