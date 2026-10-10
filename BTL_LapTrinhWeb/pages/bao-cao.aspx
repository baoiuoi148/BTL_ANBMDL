<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="BTL_LapTrinhWeb.pages.WebForm1" %>

<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>Báo cáo</title>
    <link rel="stylesheet" href="../css/index.css" />
    <link rel="stylesheet" href="../css/bao-cao.css" />
  </head>
  <body>
    <form id="form1" runat="server">
    <header>
      <div class="container-header">
        <div class="header--logo">
          <div class="header--logo__images">
            <a href="../index.aspx"
              ><img src="../assest/images/Logo.png" alt="logo"
            /></a>
          </div>
        </div>
        <div class="nav">
          <ul class="nav-bar">
            <li><a href="">GIỚI THIỆU</a></li>
            <li><a href="">ĐÀO TẠO</a></li>
            <li><a href="">TIN TỨC</a></li>
            <li><a href="">TUYỂN SINH</a></li>
            <li><a href="">NCKH</a></li>
          </ul>
        </div>
        <div class="search">
  <div class="search_bar">
    <asp:TextBox ID="search_bar" runat="server" placeholder="Tìm kiếm"></asp:TextBox>
  </div>
  <asp:ImageButton ID="btnTimKiem" runat="server" ImageUrl="../assest/images/icon-search.png" OnClick="btnTimKiem_Click" />
</div>
        <div class="menu">
          <ul class="menu--main">
                 <li><a href="thong_tin_tai_khoan.aspx">THÔNG TIN TÀI KHOẢN</a></li>
 <li id="menuDangNhap" runat="server"><a href="dang-nhap.aspx">ĐĂNG NHẬP</a></li>
 <li id="menuDangKy" runat="server"><a href="dang-ky.aspx">ĐĂNG KÝ</a></li>
 <li><a href="tin-yeu-thich.aspx">TIN YÊU THÍCH</a></li>
 <li id="menuDangXuat" runat="server">
<asp:LinkButton ID="btnDangXuat" runat="server" OnClick="btnDangXuat_Click">ĐĂNG XUẤT</asp:LinkButton></li>
            <li id="menuQuanTri" runat="server">
                <a href="quan-tri-tin-tuc-chinh.aspx" >QUẢN TRỊ TIN TỨC</a>
            </li>
            <li id="menuDangBai" runat="server"><a href="trang-dang-bai.aspx" >ĐĂNG BÀI</a></li>
            <li id="menuThongKe" runat="server"><a href="bao-cao.aspx">BÁO CÁO THỐNG KÊ</a></li>
          </ul>
        </div>
        <div id="toggle">
          <img src="../assest/icon/menu.png" alt="icon" />
        </div>
      </div>
    </header>

    <main>
      <div class="nav-path">
        <a href="../index.aspx">Trang chủ</a>
        <span> > </span>
        <a href="bao-cao.aspx"> Báo cáo thống kê</a>
      </div>
      <div class="container content-bao-cao">
        <h1 class="page-title">BÁO CÁO THỐNG KÊ HỆ THỐNG</h1>

        <div class="report-summary" style="display:flex; gap:20px; margin-bottom:30px; justify-content:center; flex-wrap:wrap;">
          <div class="card" style="background:#0b3c5d; color:#fff; padding:20px; border-radius:8px; min-width:200px; text-align:center;">
            <h3>Tổng số bài đăng</h3>
            <p id="tongBaiViet" runat="server" class="big-number" style="font-size:32px; font-weight:bold; margin-top:10px;">0</p>
          </div>
          <div class="card" style="background:#1d2731; color:#fff; padding:20px; border-radius:8px; min-width:200px; text-align:center;">
            <h3>Tổng số tài khoản</h3>
            <p id="tongTaiKhoan" runat="server" class="big-number" style="font-size:32px; font-weight:bold; margin-top:10px;">0</p>
          </div>
          <div class="card" style="background:#328cc1; color:#fff; padding:20px; border-radius:8px; min-width:200px; text-align:center;">
            <h3>Tổng lượt xem tin</h3>
            <p id="tongLuotXem" runat="server" class="big-number" style="font-size:32px; font-weight:bold; margin-top:10px;">0</p>
          </div>
        </div>

        <h2 style="margin-top:20px; margin-bottom:10px; color:#0b3c5d;">Phân bố bài viết theo loại tin</h2>
        <div class="report-table" id="bang_thong_ke" runat="server">
        </div>

        <h2 style="margin-top:30px; margin-bottom:10px; color:#0b3c5d;">Top 5 bài viết được xem nhiều nhất</h2>
        <div class="report-table" id="top5" runat="server">
        </div>
      </div>
    </main>
    <footer>
      <div class="container-footer">
        <div class="footer--logo">
          <img src="../assest/images/Logo-co-chu.jpg" alt="logo" />
        </div>
        <div class="footer--info">
          <h2>Khoa Công Nghệ Thông Tin - Trường Đại Học Mở Hà Nội</h2>
          <p>Địa Chỉ: 96 P. Định Công, Phương Liệt, Thanh Xuân, Hà Nội</p>
          <p>Điện thoại: (+84) 024 38694824</p>
          <p>Bản quyền thuộc về Khoa CNTT - Trường Đại Học Mở Hà Nội</p>
        </div>
      </div>
    </footer>

    <script src="../js/menu.js"></script>
    <script src="../js/tim-kiem.js"></script>
    <script src="../js/bao-cao.js"></script>
    </form>
  </body>
</html>
