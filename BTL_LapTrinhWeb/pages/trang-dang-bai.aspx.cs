using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_LapTrinhWeb.pages
{
    public partial class trang_dang_bai : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Chỉ admin mới được vào trang này
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

            if (IsPostBack)
            {
                string tieude  = Request.Form["tieude"];
                string noidung = Request.Form["noidung"];
                string loaitin = Request.Form["loaitin"];
                string anh     = Request.Form["anh"];
                string tacgia  = Session["username"].ToString();

                if (!string.IsNullOrWhiteSpace(tieude) && !string.IsNullOrWhiteSpace(noidung))
                {
                    // Tạo link bài dựa theo MaBV sẽ được sinh tự động
                    string sqlInsert = @"INSERT INTO BaiViet (TieuDe, NoiDung, Anh, LinkBai, TheLoai, TacGia, NgayDang, LuotXem)
                                        OUTPUT INSERTED.MaBV
                                        VALUES (@tieude, @noidung, @anh, '', @loaitin, @tacgia, GETDATE(), 0)";

                    SqlParameter[] pars = new SqlParameter[]
                    {
                        new SqlParameter("@tieude",  tieude),
                        new SqlParameter("@noidung", noidung),
                        new SqlParameter("@anh",     string.IsNullOrWhiteSpace(anh) ? "../assest/images/TinHoatDong_Anh1.jpg" : anh),
                        new SqlParameter("@loaitin", string.IsNullOrWhiteSpace(loaitin) ? "Hoạt động" : loaitin),
                        new SqlParameter("@tacgia",  tacgia)
                    };

                    object newId = database.ExecuteScalar(sqlInsert, pars);

                    // Cập nhật LinkBai với MaBV vừa tạo
                    if (newId != null)
                    {
                        string sqlLink = "UPDATE BaiViet SET LinkBai = 'chi-tiet-ban-tin.aspx?id=' + CAST(MaBV AS NVARCHAR) WHERE MaBV = @id";
                        database.ExecuteNonQuery(sqlLink, new SqlParameter[] { new SqlParameter("@id", newId) });
                    }

                    thongbao.InnerHtml = "<p style='color:green; font-weight:bold;'>✔ Đăng bài thành công! ID bài viết: " + newId + "</p>";
                }
                else
                {
                    thongbao.InnerHtml = "<p style='color:red;'>Vui lòng nhập đầy đủ tiêu đề và nội dung!</p>";
                }
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