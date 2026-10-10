<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="quan-tri-tin-tuc-chinh.aspx.cs" Inherits="BTL_LapTrinhWeb.pages.quan_tri_tin_tuc_chinh" %>

<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Quản trị tin tức chính</title>
    <link rel="stylesheet" href="../css/index.css" />
    <link rel="stylesheet" href="../css/quan-tri-tin-tuc-chinh.css" />
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
                 <li id="menuDangXuat" runat="server"><asp:LinkButton ID="btnDangXuat" runat="server" OnClick="btnDangXuat_Click">ĐĂNG XUẤT</asp:LinkButton></li>
                 <li id="menuQuanTri" runat="server"><a href="quan-tri-tin-tuc-chinh.aspx" >QUẢN TRỊ TIN TỨC</a></li>
                 <li id="menuDangBai" runat="server"><a href="trang-dang-bai.aspx" >ĐĂNG BÀI</a></li>
                 <li id="menuThongKe" runat="server"><a href="bao-cao.aspx">BÁO CÁO THỐNG KÊ</a></li>
          </ul>
        </div>
        <div id="toggle">
          <img src="../assest/icon/menu.png" alt="icon" />
        </div>
      </div>
    </header>

    <main class="admin-page">
       <a href="../index.aspx">Trang chủ</a>
       <span> > </span>
       <a href="quan-tri-tin-tuc-chinh.aspx">Quản trị tin tức</a>
      <div class="admin-page__header">
        <br/>
        <h1>QUẢN TRỊ TIN TỨC</h1><br/>
        <br>
          <div class="admin-add">
            <a href="trang-dang-bai.aspx">+ Thêm bài mới</a>
        </div>
      </div><br/>

      <div id="danh_sach_bai" runat="server"></div>

      <div class="btn--return_header">
        <button>
          <a href="#"
            ><img src="../assest/icon/quay-lai-dau-trang.png" alt=""
          /></a>
        </button>
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