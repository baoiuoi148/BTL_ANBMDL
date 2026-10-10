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
    public partial class quan_tri_tin_tuc_chinh : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Chỉ admin mới được vào
            if (Session["username"] == null || Session["username"].ToString() != "admin")
            {
                Response.Redirect("../index.aspx");
                return;
            }

            menuQuanTri.Visible = true;
            menuDangBai.Visible = true;
            menuThongKe.Visible = true;
            menuDangNhap.Visible = false;
            menuDangKy.Visible = false;
            menuDangXuat.Visible = true;

            // Xử lý xóa bài
            string xoaId = Request.QueryString["xoa"];
            if (!string.IsNullOrEmpty(xoaId) && int.TryParse(xoaId, out int delId))
            {
                database.ExecuteNonQuery("DELETE FROM BaiViet WHERE ID = @id",
                    new SqlParameter[] { new SqlParameter("@id", delId) });
                Response.Redirect("quan-tri-tin-tuc-chinh.aspx");
                return;
            }

            LoadDanhSachBai();
        }

        private void LoadDanhSachBai()
        {
            DataTable dt = database.GetData("SELECT ID, TieuDe, LoaiTin, TacGia, NgayDang, LuotXem FROM BaiViet ORDER BY NgayDang DESC");
            danh_sach_bai.InnerHtml = "";

            if (dt.Rows.Count == 0)
            {
                danh_sach_bai.InnerHtml = "<p>Chưa có bài viết nào. <a href='trang-dang-bai.aspx'>Thêm bài mới</a></p>";
                return;
            }

            danh_sach_bai.InnerHtml = "<table border='1' cellpadding='8' cellspacing='0' style='width:100%; border-collapse:collapse;'>" +
                "<tr style='background:#f0f0f0;'>" +
                    "<th>ID</th><th>Tiêu đề</th><th>Loại tin</th><th>Tác giả</th><th>Ngày đăng</th><th>Lượt xem</th><th>Thao tác</th>" +
                "</tr>";

            foreach (DataRow row in dt.Rows)
            {
                string id     = row["ID"].ToString();
                string tieude = row["TieuDe"].ToString();
                if (tieude.Length > 60) tieude = tieude.Substring(0, 60) + "...";
                string loai   = row["LoaiTin"].ToString();
                string tacgia = row["TacGia"].ToString();
                string ngay   = Convert.ToDateTime(row["NgayDang"]).ToString("dd/MM/yyyy");
                string luotxem = row["LuotXem"].ToString();

                danh_sach_bai.InnerHtml +=
                    "<tr>" +
                        "<td>" + id + "</td>" +
                        "<td><a href='chi-tiet-ban-tin.aspx?id=" + id + "' target='_blank'>" + tieude + "</a></td>" +
                        "<td>" + loai + "</td>" +
                        "<td>" + tacgia + "</td>" +
                        "<td>" + ngay + "</td>" +
                        "<td>" + luotxem + "</td>" +
                        "<td>" +
                            "<a href='sua-bai.aspx?id=" + id + "' style='color:blue; margin-right:10px;'>✏ Sửa</a>" +
                            "<a href='quan-tri-tin-tuc-chinh.aspx?xoa=" + id + "' " +
                               "onclick=\"return confirm('Xóa bài ID " + id + "?')\" style='color:red;'>🗑 Xóa</a>" +
                        "</td>" +
                    "</tr>";
            }
            danh_sach_bai.InnerHtml += "</table>";
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