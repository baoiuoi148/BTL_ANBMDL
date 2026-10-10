<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="BTL_LapTrinhWeb.pages.WebForm2" %>

<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="vi">
  <head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Chi tiết bản tin</title>
    <link rel="stylesheet" href="../css/chi-tiet-ban-tin.css" />
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
      <div class="banner-main">
        <img src="../assest/images/Banner_truong.png" alt="" />
      </div>
      <div class="nav-path">
        <a href="../index.aspx">Trang chủ</a>
        <span> > </span>
        <a href="danh-sach-ban-tin.aspx"> Tin hoạt động</a>
        <span> > </span>
        <a href="chi-tiet-ban-tin.aspx"> Chi tiết bài viết</a>
      </div>
      <div class="container--body">
        <div class="content--main">
          <div id="article_content" runat="server"></div>
          <div class="btn--save">
            <asp:ImageButton
              id="btnyeuthich" runat="server"
              ImageUrl="../assest/icon/save.png"
              onclick="btnyeuthich_click"
            />
            <div class="btn--save_title">
              <p>Lưu</p>
            </div>
          </div>
        </div>
        <div class="news--new">
          <h3>Bài viết mới nhất</h3>
          <div id="sidebar_news" runat="server"></div>
        </div>
        <div class="btn--return_header">
          <button>
            <a href="#"
              ><img src="../assest/icon/quay-lai-dau-trang.png" alt=""
            /></a>
          </button>
        </div>
      </div>

      <div class="comment">
        <p>Bình luận</p>
        <input
          type="text"
          placeholder="Viết bình luận của bạn?"
          id="comment"
        /><br />
        <div class="container--comment">
          <input type="submit" id="submit" />
        </div>
        <div class="comment--user container--comment">
          <div class="comment--user__content">
            <img src="../assest/images/icon_user_comment.png" alt="anh" />
            <div class="comment--user__name">
              <p>24A1001D0048</p>
              <p id="comment_user">Bài viết thật sự rất hữu ích</p>
            </div>
          </div>
          <div class="comment--user__reply">
            <img src="../assest/icon/rep_comment.png" alt="icon" />
            <p>Trả lời</p>
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