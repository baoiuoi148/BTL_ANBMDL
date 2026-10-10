using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_LapTrinhWeb.pages
{
    public partial class Sua : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string userSua = Request.QueryString["user"];
            if (string.IsNullOrEmpty(userSua))
            {
                Response.Redirect("quan-ly-tai-khoan.aspx");
                return;
            }
            if (!IsPostBack)
            {
                string sql = "SELECT * FROM TaiKhoan WHERE Username = @user";
                DataTable dt = database.GetData(sql, new SqlParameter[] { new SqlParameter("@user", userSua) });
                if (dt.Rows.Count > 0)
                {
                    fullname.Value = dt.Rows[0]["HoTen"].ToString();
                    email.Value = dt.Rows[0]["Email"].ToString();
                    username.Value = dt.Rows[0]["Username"].ToString();
                    registerPassword.Value = dt.Rows[0]["Password"].ToString();
                }
            }
            else
            {
                string sqlUpdate = "UPDATE TaiKhoan SET HoTen = @hoten, Email = @email, Password = @pass WHERE Username = @user";
                SqlParameter[] pars = new SqlParameter[]
                {
                    new SqlParameter("@hoten", fullname.Value),
                    new SqlParameter("@email", email.Value),
                    new SqlParameter("@pass", registerPassword.Value),
                    new SqlParameter("@user", userSua)
                };
                database.ExecuteNonQuery(sqlUpdate, pars);
                Response.Redirect("quan-ly-tai-khoan.aspx");
            }
        }
    }
}