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
    public partial class sua_bai : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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

            string idStr = Request.QueryString["id"];
            if (string.IsNullOrEmpty(idStr) || !int.TryParse(idStr, out int id))
            {
                Response.Redirect("quan-tri-tin-tuc-chinh.aspx");
                return;
            }

            if (!IsPostBack)
            {
                DataTable dt = database.GetData("SELECT * FROM BaiViet WHERE ID = @id",
                    new SqlParameter[] { new SqlParameter("@id", id) });

                if (dt.Rows.Count > 0)
                {
                    DataRow row = dt.Rows[0];
                    tieude.Value = row["TieuDe"].ToString();
                    loaitin.Value = row["LoaiTin"].ToString();
                    anh.Value = row["Anh"].ToString();
                    editor.Value = row["NoiDung"].ToString();
                }
                else
                {
                    Response.Redirect("quan-tri-tin-tuc-chinh.aspx");
                }
            }
            else
            {
                string newTieuDe = tieude.Value;
                string newLoaiTin = loaitin.Value;
                string newAnh = anh.Value;
                string newNoiDung = editor.Value;

                string sqlUpdate = @"UPDATE BaiViet 
                                     SET TieuDe = @tieude, TheLoai = @loaitin, Anh = @anh, NoiDung = @noidung 
                                     WHERE MaBV = @id";

                SqlParameter[] pars = new SqlParameter[]
                {
                    new SqlParameter("@tieude", newTieuDe),
                    new SqlParameter("@loaitin", newLoaiTin),
                    new SqlParameter("@anh", newAnh),
                    new SqlParameter("@noidung", newNoiDung),
                    new SqlParameter("@id", id)
                };

                database.ExecuteNonQuery(sqlUpdate, pars);
                thongbao.InnerHtml = "<p style='color:green; font-weight:bold;'>✔ Cập nhật bài viết thành công!</p>";
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
