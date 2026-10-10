<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="thong_tin_tai_khoan.aspx.cs" Inherits="BTL_LapTrinhWeb.pages.thong_tin_tai_khoan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Thông tin tài khoản</title>
    <link rel="stylesheet" href="../css/thong_tin_tai_khoan.css" />
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
          <div class="search-bar">
            <input
              type="text"
              name="search-bar"
              id="search-bar"
              placeholder="Tìm kiếm"
            />
          </div>
          <img src="../assest/images/icon-search.png" alt="search" />
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
      <div class="container--body">
        <div class="nav-path">
          <a href="../index.aspx">Trang chủ</a>
          <span> > </span>
          <a href="thong_tin_tai_khoan.aspx"> Thông tin tài khoản</a>
        </div>
        <div class="container">
          <div class="nav-left">
            <ul class="nav-main">
              <li>
                <a href="thong_tin_tai_khoan.aspx">THÔNG TIN TÀI KHOẢN</a>
              </li>
              <li><a href="tin-yeu-thich.aspx">TIN YÊU THÍCH</a></li>
              <li><a href="">TIN ĐÃ XEM</a></li>
              <li><a href="">HOẠT ĐỘNG BÌNH LUẬN CỦA BẠN</a></li>
            </ul>
          </div>
          <div class="content">
            <h2>Thông tin tài khoản</h2>
              <label style="color:red" id="chuadangnhap" runat="server"></label>
            <p>Họ và tên:</p>
             <label class="noidung" id="hoten" runat="server"></label>
            <p>Email:</p>
              <label class="noidung" id="email" runat="server"></label>
            <p>Tên đăng nhập:</p>
              <label class="noidung" id="tendangnhap" runat="server"></label>
          </div>
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
    </form>
</body>
</html>
