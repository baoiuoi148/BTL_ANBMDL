<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sua-bai.aspx.cs" Inherits="BTL_LapTrinhWeb.pages.sua_bai" %>

<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sửa bài viết</title>
    <link rel="stylesheet" href="../css/index.css" />
    <link rel="stylesheet" href="../css/trang-dang-bai.css" />
  </head>
  <body>
    <form id="form1" runat="server">
    <header>
      <div class="container-header">
        <div class="header--logo">
          <div class="header--logo__images">
            <a href="../index.aspx"><img src="../assest/images/Logo.png" alt="logo" /></a>
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
              <asp:LinkButton ID="btnDangXuat" runat="server" OnClick="btnDangXuat_Click">ĐĂNG XUẤT</asp:LinkButton>
            </li>
            <li id="menuQuanTri" runat="server"><a href="quan-tri-tin-tuc-chinh.aspx">QUẢN TRỊ TIN TỨC</a></li>
            <li id="menuDangBai" runat="server"><a href="trang-dang-bai.aspx">ĐĂNG BÀI</a></li>
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
      <a href="quan-tri-tin-tuc-chinh.aspx">Quản trị tin tức chính</a>
      <span> > </span>
      <a href="#">Sửa bài viết</a>

      <div class="admin-page__header">
        <br/>
        <h1>CHỈNH SỬA BÀI VIẾT</h1>
      </div>

      <div id="thongbao" runat="server"></div>

      <div class="news-form">
        <div class="editor-title">
          <label>Tiêu đề bài viết:</label>
          <input type="text" id="tieude" name="tieude" runat="server" required style="width:100%; padding:8px; margin-bottom:10px;" />
        </div>
        <div class="editor-title">
          <label>Loại tin:</label>
          <select id="loaitin" name="loaitin" runat="server" style="padding:8px; margin-bottom:10px;">
            <option value="Tin hoạt động">Tin hoạt động</option>
            <option value="Tin đào tạo">Tin đào tạo</option>
            <option value="Kế hoạch">Kế hoạch</option>
          </select>
        </div>
        <div class="editor-title">
          <label>Đường dẫn ảnh:</label>
          <input type="text" id="anh" name="anh" runat="server" style="width:100%; padding:8px; margin-bottom:10px;" />
        </div>
        <div class="editor-title">
          <label>Nội dung bài viết:</label>
          <textarea id="editor" name="noidung" runat="server" rows="15" style="width:100%;"></textarea>
        </div>
        <div class="form-actions">
          <button type="submit" class="submit">Lưu thay đổi</button>
          <a href="quan-tri-tin-tuc-chinh.aspx" style="margin-left:15px; padding:10px 15px; background:#777; color:#fff; text-decoration:none; border-radius:4px;">Hủy bỏ</a>
        </div>
      </div>

      <div class="btn--return_header">
        <button>
          <a href="#"><img src="../assest/icon/quay-lai-dau-trang.png" alt="" /></a>
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
