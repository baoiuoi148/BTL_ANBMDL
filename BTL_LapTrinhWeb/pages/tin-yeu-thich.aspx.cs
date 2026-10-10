using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_LapTrinhWeb.pages
{
    public partial class tin_yeu_thich : System.Web.UI.Page
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
            List<string> dsyeuthich = Session["tinyeuthich"] as List<string>;
            news_container.InnerHtml = "";
            if (dsyeuthich == null || dsyeuthich.Count == 0)
            {
                news_container.InnerHtml = "<h3 style='text-align:center; padding:50px 0;'>Bạn chưa có tin yêu thích nào!</h3>";
            }
            else
            {
                // Lọc chỉ lấy các id hợp lệ dạng số
                List<string> validIds = dsyeuthich.Where(x => int.TryParse(x, out _)).ToList();
                if (validIds.Count > 0)
                {
                    string idList = string.Join(",", validIds);
                    System.Data.DataTable dt = database.GetData("SELECT ID, TieuDe, NoiDung, Anh, NgayDang FROM BaiViet WHERE ID IN (" + idList + ")");
                    
                    foreach (System.Data.DataRow row in dt.Rows)
                    {
                        string id = row["ID"].ToString();
                        string tieude = row["TieuDe"].ToString();
                        string anh = row["Anh"].ToString();
                        string noidung = row["NoiDung"].ToString();
                        if (noidung.Length > 200) noidung = noidung.Substring(0, 200) + "...";

                        news_container.InnerHtml += 
                            "<div class='noidung' style='margin-bottom: 20px; border-bottom: 1px solid #ccc; padding-bottom: 10px; display: flex; align-items:center;'>" +
                                "<div class='noidung_anh' style='flex-shrink:0;'>" +
                                    "<a href='chi-tiet-ban-tin.aspx?id=" + id + "'><img src='" + anh + "' style='width:220px; height:140px; object-fit:cover; border-radius:6px;' /></a>" +
                                "</div>" +
                                "<div class='noidung_chu' style='margin-left:20px;'>" +
                                    "<h2><a href='chi-tiet-ban-tin.aspx?id=" + id + "' style='color:#0b3c5d; text-decoration:none;'>" + tieude + "</a></h2>" +
                                    "<p style='margin-top:10px; color:#555;'>" + noidung + "</p>" +
                                "</div>" +
                            "</div>";
                    }
                }
                else
                {
                    news_container.InnerHtml = "<h3 style='text-align:center; padding:50px 0;'>Bạn chưa có tin yêu thích nào!</h3>";
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