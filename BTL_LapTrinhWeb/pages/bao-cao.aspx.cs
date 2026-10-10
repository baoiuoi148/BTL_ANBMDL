using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_LapTrinhWeb.pages
{
    public partial class WebForm1 : System.Web.UI.Page
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

            LoadThongKe();
        }

        private void LoadThongKe()
        {
            // Tổng số bài viết
            object total = database.ExecuteScalar("SELECT COUNT(*) FROM BaiViet");
            tongBaiViet.InnerText = total != null ? total.ToString() : "0";

            // Tổng số tài khoản
            object totalUser = database.ExecuteScalar("SELECT COUNT(*) FROM TaiKhoan");
            tongTaiKhoan.InnerText = totalUser != null ? totalUser.ToString() : "0";

            // Tổng lượt xem
            object totalView = database.ExecuteScalar("SELECT ISNULL(SUM(LuotXem), 0) FROM BaiViet");
            tongLuotXem.InnerText = totalView != null ? totalView.ToString() : "0";

            // Thống kê theo loại tin
            DataTable dt = database.GetData(
                "SELECT LoaiTin, COUNT(*) AS SoBai, ISNULL(SUM(LuotXem),0) AS TongXem " +
                "FROM BaiViet GROUP BY LoaiTin ORDER BY SoBai DESC");

            bang_thong_ke.InnerHtml =
                "<table border='1' cellpadding='8' cellspacing='0' style='width:100%; border-collapse:collapse;'>" +
                "<thead><tr style='background:#f0f0f0;'>" +
                    "<th>Loại tin</th><th>Số bài đăng</th><th>Tổng lượt xem</th>" +
                "</tr></thead><tbody>";

            foreach (DataRow row in dt.Rows)
            {
                bang_thong_ke.InnerHtml +=
                    "<tr>" +
                        "<td>" + row["LoaiTin"] + "</td>" +
                        "<td style='text-align:center;'>" + row["SoBai"] + "</td>" +
                        "<td style='text-align:center;'>" + row["TongXem"] + "</td>" +
                    "</tr>";
            }
            bang_thong_ke.InnerHtml += "</tbody></table>";

            // Top 5 bài xem nhiều nhất
            DataTable dtTop = database.GetData(
                "SELECT TOP 5 TieuDe, LuotXem, ID FROM BaiViet ORDER BY LuotXem DESC");

            top5.InnerHtml =
                "<table border='1' cellpadding='8' cellspacing='0' style='width:100%; border-collapse:collapse;'>" +
                "<thead><tr style='background:#f0f0f0;'>" +
                    "<th>#</th><th>Tiêu đề</th><th>Lượt xem</th>" +
                "</tr></thead><tbody>";

            int stt = 1;
            foreach (DataRow row in dtTop.Rows)
            {
                string tieude = row["TieuDe"].ToString();
                if (tieude.Length > 60) tieude = tieude.Substring(0, 60) + "...";
                top5.InnerHtml +=
                    "<tr>" +
                        "<td>" + stt++ + "</td>" +
                        "<td><a href='chi-tiet-ban-tin.aspx?id=" + row["ID"] + "' target='_blank'>" + tieude + "</a></td>" +
                        "<td style='text-align:center;'>" + row["LuotXem"] + "</td>" +
                    "</tr>";
            }
            top5.InnerHtml += "</tbody></table>";
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
                Response.Redirect("tim-kiem.aspx?q=" + tukhoa);
            }
        }
    }
}