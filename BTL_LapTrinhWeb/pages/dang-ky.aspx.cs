using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_LapTrinhWeb.pages
{
    public partial class dang_ky : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            successMessage.Text = "";
            if (IsPostBack)
            {
                string hoten = Request.Form["reg_fullname"];
                string email = Request.Form["reggg_email"];
                string tendangnhap = Request.Form["reg_username"];
                string matkhau = Request.Form["password"];
                string sqlCheckUser = "SELECT COUNT(*) FROM TaiKhoan WHERE Username = @user";
                int countUser = Convert.ToInt32(database.ExecuteScalar(sqlCheckUser, new SqlParameter[] { new SqlParameter("@user", tendangnhap) }));
                string sqlCheckEmail = "SELECT COUNT(*) FROM TaiKhoan WHERE Email = @email";
                int countEmail = Convert.ToInt32(database.ExecuteScalar(sqlCheckEmail, new SqlParameter[] { new SqlParameter("@email", email) }));
                string script = "";
                if (countUser > 0)
                {
                    script += "document.getElementById('errUsername').innerText='Tên đăng nhập đã tồn tại';";
                    script += "document.getElementById('errUsername').classList.add('show');";
                    script += "document.getElementById('username').classList.add('input-error');";
                }
                if (countEmail > 0)
                {
                    script += "document.getElementById('errEmail').innerText='Email đã được sử dụng';";
                    script += "document.getElementById('errEmail').classList.add('show');";
                    script += "document.getElementById('email').classList.add('input-error');";
                }
                if (countUser > 0 || countEmail > 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "loi", script, true);
                    return;
                }
                string sqlInsert = "INSERT INTO TaiKhoan (Username, Password, HoTen, Email, Role) VALUES (@user, @pass, @hoten, @email, 'User')";
                SqlParameter[] pars = new SqlParameter[]
                {
                    new SqlParameter("@user", tendangnhap),
                    new SqlParameter("@pass", matkhau),
                    new SqlParameter("@hoten", hoten),
                    new SqlParameter("@email", email)
                };
                database.ExecuteNonQuery(sqlInsert, pars);
                successMessage.Text = "Bạn đã đăng ký tài khoản thành công!";
                Session["hoten"] = hoten;
                Session["email"] = email;
                Session["username"] = tendangnhap;
            }
        }
    }
}