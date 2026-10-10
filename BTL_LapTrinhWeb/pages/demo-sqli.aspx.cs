using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_LapTrinhWeb.pages
{
    public partial class demo_sqli : System.Web.UI.Page
    {
        public string currentMode = "Vulnerable";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SQLi_Mode"] != null)
            {
                currentMode = Session["SQLi_Mode"].ToString();
            }
            else
            {
                currentMode = "Vulnerable";
                Session["SQLi_Mode"] = "Vulnerable";
            }

            bool daDangNhap = Session["username"] != null;
            menuDangNhap.Visible = !daDangNhap;
            menuDangKy.Visible = !daDangNhap;
            menuDangXuat.Visible = daDangNhap;
            menuQuanTri.Visible = daDangNhap && Session["username"].ToString() == "admin";
            menuThongKe.Visible = daDangNhap && Session["username"].ToString() == "admin";

            btnToggleMode.Text = currentMode == "Vulnerable" 
                ? "Chuyển sang Chế độ Phòng chống (Secure)" 
                : "Chuyển sang Chế độ Lỗ hổng (Vulnerable)";
        }

        protected void btnToggleMode_Click(object sender, EventArgs e)
        {
            if (currentMode == "Vulnerable")
            {
                Session["SQLi_Mode"] = "Secure";
                currentMode = "Secure";
            }
            else
            {
                Session["SQLi_Mode"] = "Vulnerable";
                currentMode = "Vulnerable";
            }
            Response.Redirect("demo-sqli.aspx");
        }

        protected void btnDangXuat_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/index.aspx");
        }
    }
}
