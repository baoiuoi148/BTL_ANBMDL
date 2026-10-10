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
    public partial class WebForm2 : System.Web.UI.Page
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

            string idStr = Request.QueryString["id"];
            int baiId = 1;
            if (!string.IsNullOrEmpty(idStr))
            {
                int.TryParse(idStr, out baiId);
                LoadChiTietBaiViet(idStr);
                LoadBaiMoiNhat(baiId);

                // Xử lý gửi bình luận (LỖ HỔNG SQL INJECTION TRONG INSERT)
                if (IsPostBack && Request.Form["btnAction"] == "binhluan")
                {
                    string ten_bl = Request.Form["ten_bl"] ?? "";
                    string noidung_bl = Request.Form["noidung_bl"] ?? "";

                    if (!string.IsNullOrWhiteSpace(noidung_bl))
                    {
                        try
                        {
                            // LỖ HỔNG SQL INJECTION: Ghép chuỗi trực tiếp khi INSERT bình luận
                            string sqlBL = "INSERT INTO BinhLuan (MaBV, HoTen, NoiDung, NgayBL) VALUES (" + baiId + ", N'" + ten_bl + "', N'" + noidung_bl + "', GETDATE())";
                            database.ExecuteNonQuery(sqlBL);
                            thongbao_bl.InnerHtml = "<p style='color:green; font-weight:bold;'>✔ Bình luận đã được gửi!</p>";
                        }
                        catch (SqlException ex)
                        {
                            thongbao_bl.InnerHtml = "<div style='background:#fde8e8; border:1px solid #f8b4b4; color:#9b1c1c; padding:10px; border-radius:4px; margin-bottom:10px;'><b>Lỗi SQL Server:</b> " + Server.HtmlEncode(ex.Message) + "</div>";
                        }
                    }
                }

                // Tăng lượt xem (chỉ tăng 1 lần mỗi phiên truy cập bài đó)
                string sessionKey = "viewed_" + baiId;
                if (Session[sessionKey] == null && baiId > 0)
                {
                    string sqlView = "UPDATE BaiViet SET LuotXem = LuotXem + 1 WHERE ID = " + baiId;
                    database.ExecuteNonQuery(sqlView);
                    Session[sessionKey] = true;
                }

                LoadBinhLuan(baiId);
            }
            else
            {
                // Không có ID → load bài đầu tiên
                DataTable dtFirst = database.GetData("SELECT TOP 1 ID FROM BaiViet ORDER BY NgayDang DESC");
                if (dtFirst.Rows.Count > 0)
                {
                    Response.Redirect("chi-tiet-ban-tin.aspx?id=" + dtFirst.Rows[0]["ID"]);
                }
            }
        }

        private void LoadBinhLuan(int idBai)
        {
            danh_sach_bl.InnerHtml = "";
            try
            {
                string sql = "SELECT HoTen, NoiDung, NgayBL FROM BinhLuan WHERE MaBV = " + idBai + " ORDER BY MaBL DESC";
                DataTable dt = database.GetData(sql);

                if (dt != null && dt.Rows.Count > 0)
                {
                    foreach (DataRow row in dt.Rows)
                    {
                        string ten = row["HoTen"] != null ? row["HoTen"].ToString() : "Ẩn danh";
                        string nd = row["NoiDung"] != null ? row["NoiDung"].ToString() : "";
                        string ngay = row["NgayBL"] != DBNull.Value ? Convert.ToDateTime(row["NgayBL"]).ToString("dd/MM/yyyy HH:mm") : "";

                        string itemHtml = "<div class='comment--user container--comment' style='margin-bottom:15px; padding:10px; background:#f9f9f9; border-radius:6px;'>"
                            + "<div class='comment--user__content' style='display:flex; align-items:flex-start; gap:12px;'>"
                            + "<img src='../assest/images/icon_user_comment.png' alt='user' style='width:36px; height:36px; border-radius:50%;' />"
                            + "<div class='comment--user__name'>"
                            + "<p style='font-weight:bold; color:#0b3c5d; margin:0;'>" + Server.HtmlEncode(ten) + " <span style='font-size:11px; color:#888; font-weight:normal;'>(" + ngay + ")</span></p>"
                            + "<p style='margin-top:5px; color:#333; line-height:1.4;'>" + Server.HtmlEncode(nd) + "</p>"
                            + "</div></div></div>";

                        danh_sach_bl.InnerHtml += itemHtml;
                    }
                }
                else
                {
                    danh_sach_bl.InnerHtml = "<p style='color:#777; font-style:italic;'>Chưa có bình luận nào cho bài viết này.</p>";
                }
            }
            catch (SqlException ex)
            {
                danh_sach_bl.InnerHtml = "<div style='color:red;'>Lỗi tải bình luận: " + Server.HtmlEncode(ex.Message) + "</div>";
            }
        }

        private void LoadChiTietBaiViet(string idStr)
        {
            try
            {
                // LỖ HỔNG SQL INJECTION: Ghép chuỗi trực tiếp tham số id từ URL
                string sql = "SELECT * FROM BaiViet WHERE ID = " + idStr;
                DataTable dt = database.GetData(sql);

                if (dt == null || dt.Rows.Count == 0)
                {
                    article_content.InnerHtml = "<p style='padding:30px; text-align:center;'>Bài viết không tồn tại.</p>";
                    return;
                }

                DataRow row = dt.Rows[0];
                string tieude  = row["TieuDe"] != null ? row["TieuDe"].ToString() : "";
                string noidung = row.Table.Columns.Contains("NoiDung") && row["NoiDung"] != null ? row["NoiDung"].ToString() : "";
                string anh     = row.Table.Columns.Contains("Anh") && row["Anh"] != null ? row["Anh"].ToString() : "";
                string tacgia  = row.Table.Columns.Contains("TacGia") && row["TacGia"] != null ? row["TacGia"].ToString() : "admin";
                string ngay    = row.Table.Columns.Contains("NgayDang") && row["NgayDang"] != DBNull.Value ? Convert.ToDateTime(row["NgayDang"]).ToString("dd/MM/yyyy") : "";
                string luotxem = row.Table.Columns.Contains("LuotXem") && row["LuotXem"] != null ? row["LuotXem"].ToString() : "0";


            article_content.InnerHtml =
                "<h1>" + tieude + "</h1>" +
                "<div class='content--main__info'>" +
                    "<img class='icon' src='../assest/icon/login.png' alt='icon' />" +
                    "<p>" + tacgia + "</p>" +
                    "<img class='icon' src='../assest/icon/lich.svg' alt='icon' />" +
                    "<p>" + ngay + "</p>" +
                    "<img class='icon' src='../assest/icon/mat.svg' alt='icon' />" +
                    "<p>Lượt xem: " + luotxem + "</p>" +
                "</div>" +
                "<figure>" +
                    "<img class='news-image' src='" + anh + "' alt='" + tieude + "' />" +
                "</figure>" +
                "<div class='article-body'>" + noidung + "</div>";

                // Xử lý nút yêu thích
                List<string> dsYeuThich = Session["tinyeuthich"] as List<string> ?? new List<string>();
                if (dsYeuThich.Contains(idStr))
                {
                    btnyeuthich.ImageUrl = "../assest/icon/save-black.png";
                }
            }
            catch (SqlException ex)
            {
                article_content.InnerHtml = 
                    "<div style='background:#fde8e8; border:1px solid #f8b4b4; color:#9b1c1c; padding:15px; border-radius:6px; margin:20px 0;'>" +
                        "<h3>Lỗi SQL Server:</h3>" +
                        "<p>" + Server.HtmlEncode(ex.Message) + "</p>" +
                    "</div>";
            }
        }

        private void LoadBaiMoiNhat(int currentId)
        {
            string sql = "SELECT TOP 5 ID, TieuDe, Anh FROM BaiViet WHERE ID <> @id ORDER BY NgayDang DESC";
            DataTable dt = database.GetData(sql, new SqlParameter[] { new SqlParameter("@id", currentId) });
            sidebar_news.InnerHtml = "";
            foreach (DataRow row in dt.Rows)
            {
                string id     = row["ID"].ToString();
                string tieude = row["TieuDe"].ToString();
                string anh    = row["Anh"].ToString();
                sidebar_news.InnerHtml +=
                    "<div class='news--new__container'>" +
                        "<img src='" + anh + "' alt='" + tieude + "' />" +
                        "<div class='news--new__container__title'>" +
                            "<h4><a href='chi-tiet-ban-tin.aspx?id=" + id + "'>" + tieude + "</a></h4>" +
                        "</div>" +
                    "</div>";
            }
        }

        protected void btnyeuthich_click(object sender, EventArgs e)
        {
            string idStr = Request.QueryString["id"] ?? "";
            List<string> dsyeuthich;
            if (Session["tinyeuthich"] == null)
            {
                dsyeuthich = new List<string>();
            }
            else
            {
                dsyeuthich = (List<string>)Session["tinyeuthich"];
            }
            if (!dsyeuthich.Contains(idStr))
            {
                dsyeuthich.Add(idStr);
                btnyeuthich.ImageUrl = "../assest/icon/save-black.png";
            }
            else
            {
                dsyeuthich.Remove(idStr);
                btnyeuthich.ImageUrl = "../assest/icon/save.png";
            }
            Session["tinyeuthich"] = dsyeuthich;
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
