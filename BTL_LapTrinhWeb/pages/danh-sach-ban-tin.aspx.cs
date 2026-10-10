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
    public partial class danh_sach_ban_tin : System.Web.UI.Page
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

            // Load danh sách bài viết từ database
            LoadBaiViet();
        }

        private void LoadBaiViet()
        {
            string loai = Request.QueryString["loai"] ?? "";
            string sql;
            SqlParameter[] pars = null;

            if (!string.IsNullOrEmpty(loai))
            {
                sql = "SELECT ID, TieuDe, NoiDung, Anh, LoaiTin, TacGia, NgayDang, LuotXem FROM BaiViet WHERE LoaiTin = @loai ORDER BY NgayDang DESC";
                pars = new SqlParameter[] { new SqlParameter("@loai", loai) };
            }
            else
            {
                sql = "SELECT ID, TieuDe, NoiDung, Anh, LoaiTin, TacGia, NgayDang, LuotXem FROM BaiViet ORDER BY NgayDang DESC";
            }

            DataTable dt = database.GetData(sql, pars);
            news_container.InnerHtml = "";

            if (dt.Rows.Count == 0)
            {
                news_container.InnerHtml = "<p style='text-align:center; padding:40px;'>Chưa có bài viết nào.</p>";
                return;
            }

            foreach (DataRow row in dt.Rows)
            {
                string id      = row["ID"].ToString();
                string tieude  = row["TieuDe"].ToString();
                string tomtat  = row["NoiDung"].ToString();
                if (tomtat.Length > 200) tomtat = tomtat.Substring(0, 200) + "...";
                string anh     = row["Anh"].ToString();
                string loaiTin = row["LoaiTin"].ToString();
                string tacgia  = row["TacGia"].ToString();
                string ngay    = Convert.ToDateTime(row["NgayDang"]).ToString("dd/MM/yyyy");
                string luotxem = row["LuotXem"].ToString();

                news_container.InnerHtml +=
                    "<div class='container--body__news'>" +
                        "<a href='chi-tiet-ban-tin.aspx?id=" + id + "'>" +
                            "<img src='" + anh + "' alt='" + tieude + "' />" +
                        "</a>" +
                        "<div class='container--body__news__title'>" +
                            "<h2><a href='chi-tiet-ban-tin.aspx?id=" + id + "'>" + tieude + "</a></h2>" +
                            "<p class='meta'>" +
                                "<span>&#128100; " + tacgia + "</span>" +
                                " &nbsp;|&nbsp; " +
                                "<span>&#128197; " + ngay + "</span>" +
                                " &nbsp;|&nbsp; " +
                                "<span>&#128065; " + luotxem + " lượt xem</span>" +
                                " &nbsp;|&nbsp; " +
                                "<span class='loai-tin'>" + loaiTin + "</span>" +
                            "</p>" +
                            "<p>" + tomtat + "</p>" +
                        "</div>" +
                    "</div><br/>";
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
                Response.Redirect("tim-kiem.aspx?q=" + tukhoa);
            }
        }
    }
}