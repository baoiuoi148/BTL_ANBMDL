using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_LapTrinhWeb.pages
{
    public partial class thong_tin_tai_khoan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            menuQuanTri.Visible = false;
            menuDangBai.Visible = false;
            menuThongKe.Visible = false;
            bool daDangNhap = Session["username"] != null;

            menuDangNhap.Visible = !daDangNhap;
            menuDangKy.Visible = !daDangNhap;
            menuDangXuat.Visible = daDangNhap;
            if (Session["username"] != null && Session["username"].ToString() == "admin")
            {
                menuQuanTri.Visible = true;
                menuDangBai.Visible = true;
                menuThongKe.Visible = true;
            }
            if (Session["username"] != null)
            {
                hoten.InnerHtml = Session["hoten"].ToString();
                email.InnerHtml = Session["email"].ToString();
                tendangnhap.InnerHtml = Session["username"].ToString();
                 chuadangnhap.InnerHtml = "";
            }
            else
            {
                chuadangnhap.InnerHtml = "Ban chua dang ky tai khoan ";
            }
            
        }
        protected void btnDangXuat_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/index.aspx");
        }

    }
}