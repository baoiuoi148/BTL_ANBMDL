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
    public partial class tim_kiem : System.Web.UI.Page
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
            string tuKhoa = Request.QueryString["q"];
            results.InnerHtml = "";

            if (!string.IsNullOrEmpty(tuKhoa))
            {
                try
                {
                    // LỖ HỔNG SQL INJECTION: Ghép chuỗi trực tiếp từ người dùng nhập
                    string sql = "SELECT TieuDe, Anh, LinkBai FROM BaiViet WHERE TieuDe LIKE '%" + tuKhoa + "%'";
                    DataTable dt = database.GetData(sql);

                    int soKetQua = dt != null ? dt.Rows.Count : 0;
                    if (dt != null)
                    {
                        foreach (DataRow row in dt.Rows)
                        {
                            string tieude = row[0] != null ? row[0].ToString() : "";
                            string anh = row[1] != null ? row[1].ToString() : "";
                            string link = row.Table.Columns.Count > 2 && row[2] != null ? row[2].ToString() : "#";
                            
                            // Nếu là ảnh hợp lệ hoặc là dữ liệu trích xuất từ SQL Injection
                            string imgHtml = (anh.EndsWith(".jpg") || anh.EndsWith(".png") || anh.StartsWith("../"))
                                ? "<img src='" + anh + "' width='100' style='border-radius:4px; object-fit:cover;' />"
                                : "<span style='background:#fde8e8; color:#c81e1e; padding:4px 8px; font-size:12px; border-radius:3px; display:inline-block;'>" + Server.HtmlEncode(anh) + "</span>";

                            results.InnerHtml += "<li style='display:flex; align-items:center; gap:15px; margin-bottom:15px; padding-bottom:10px; border-bottom:1px solid #eee;'>" +
                                imgHtml + " <div><a href='" + link + "' style='font-size:16px; font-weight:bold; color:#0b3c5d;'>" + Server.HtmlEncode(tieude) + "</a>" +
                                (link != "#" && !link.StartsWith("chi-tiet") ? "<br/><span style='font-size:12px; color:#666;'>" + Server.HtmlEncode(link) + "</span>" : "") +
                                "</div></li>";
                        }
                    }

                    if (soKetQua > 0)
                    {
                        searchHint.InnerHtml = "Tìm thấy <b>" + soKetQua + "</b> kết quả cho từ khóa: <i>" + Server.HtmlEncode(tuKhoa) + "</i>";
                    }
                    else
                    {
                        searchHint.InnerHtml = "Không tìm thấy bài viết nào chứa từ khóa: <i>" + Server.HtmlEncode(tuKhoa) + "</i>";
                    }
                }
                catch (SqlException ex)
                {
                    // Lỗi SQL Server hiển thị khi payload gây lỗi cú pháp (Error-based SQLi)
                    searchHint.InnerHtml = 
                        "<div style='background:#fde8e8; border:1px solid #f8b4b4; color:#9b1c1c; padding:12px; border-radius:6px; margin-bottom:15px;'>" +
                            "<b>Lỗi SQL Server:</b> " + Server.HtmlEncode(ex.Message) +
                        "</div>";
                }
            }
            else
            {
                searchHint.InnerHtml = "Vui lòng nhập từ khóa để tìm kiếm!";
            }
        }


        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            string tuKhoaMoi = search_bar.Text;
            if (!string.IsNullOrEmpty(tuKhoaMoi))
            {
                Response.Redirect("tim-kiem.aspx?q=" + tuKhoaMoi);
            }
        }
        protected void btnDangXuat_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/index.aspx");
        }
        protected void btnLoc_Click(object sender, EventArgs e)
        {
            // Xử lý lọc hoặc để trống nếu chưa dùng tới
        }
    }
}