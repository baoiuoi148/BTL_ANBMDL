using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_LapTrinhWeb.pages
{
    public partial class quan_ly_tai_khoan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = database.GetData("SELECT * FROM TaiKhoan");
            noidung.InnerHtml = "<table border='1'>";
            noidung.InnerHtml += "<tr>";
            noidung.InnerHtml += "<th>Họ tên</th>";
            noidung.InnerHtml += "<th>Email</th>";
            noidung.InnerHtml += "<th>Tên đăng nhập</th>";
            noidung.InnerHtml += "<th>Mật khẩu</th>";
            noidung.InnerHtml += "<th>Quyền</th>";
            noidung.InnerHtml += "<th>Sửa</th>";
            noidung.InnerHtml += "<th>Xóa</th>";
            noidung.InnerHtml += "</tr>";
            foreach (DataRow row in dt.Rows)
            {
                noidung.InnerHtml += "<tr>";
                noidung.InnerHtml += "<td>" + row["HoTen"] + "</td>";
                noidung.InnerHtml += "<td>" + row["Email"] + "</td>";
                noidung.InnerHtml += "<td>" + row["Username"] + "</td>";
                noidung.InnerHtml += "<td>" + row["Password"] + "</td>";
                noidung.InnerHtml += "<td>" + row["Role"] + "</td>";
                noidung.InnerHtml += "<td><a href='Sua.aspx?user=" + row["Username"] + "'>Sửa</a></td>";
                noidung.InnerHtml += "<td><a href='Xoa.aspx?user=" + row["Username"] + "'>Xóa</a></td>";
                noidung.InnerHtml += "</tr>";
            }
            noidung.InnerHtml += "</table>";

        }
    }
}