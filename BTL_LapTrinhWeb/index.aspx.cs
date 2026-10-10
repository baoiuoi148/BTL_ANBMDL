using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_LapTrinhWeb
{
    public partial class index : System.Web.UI.Page
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
            if (Session["username"]!=null && Session["username"].ToString()=="admin")
            {
                menuQuanTri.Visible = true;
                menuDangBai.Visible = true;
                menuThongKe.Visible = true;
            }
        }
        protected void btnDangXuat_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/index.aspx");
        }

        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            string tukhoa = search_bar.Text;
            if (!string.IsNullOrEmpty(tukhoa))
            {
                Response.Redirect("pages/tim-kiem.aspx?q=" + tukhoa);
            }
        }
    }
}