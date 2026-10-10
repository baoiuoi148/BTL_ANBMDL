<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="BTL_LapTrinhWeb.index" %>
<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Danh sách bản tin</title>
    <link rel="stylesheet" href="../css/index.css" />
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
            <li><a href="pages/thong_tin_tai_khoan.aspx">THÔNG TIN TÀI KHOẢN</a></li>
            <li id="menuDangNhap" runat="server"><a href="pages/dang-nhap.aspx">ĐĂNG NHẬP</a></li>
            <li id="menuDangKy" runat="server"><a href="pages/dang-ky.aspx">ĐĂNG KÝ</a></li>
            <li><a href="pages/tin-yeu-thich.aspx">TIN YÊU THÍCH</a></li>
            <li id="menuDangXuat" runat="server">
            <asp:LinkButton ID="btnDangXuat" runat="server" OnClick="btnDangXuat_Click">ĐĂNG XUẤT</asp:LinkButton></li>
            <li id="menuQuanTri" runat="server">
              <a href="pages/quan-tri-tin-tuc-chinh.aspx" >QUẢN TRỊ TIN TỨC</a>
            </li>
            <li id="menuDangBai" runat="server"><a href="pages/trang-dang-bai.aspx" >ĐĂNG BÀI</a></li>
            <li id="menuThongKe" runat="server"><a href="pages/bao-cao.aspx">BÁO CÁO THỐNG KÊ</a></li>
          </ul>
        </div>
        <div id="toggle">
          <img src="../assest/icon/menu.png" alt="icon" />
        </div>
      </div>
    </header>
    <main>
      <div class="banner--main">
        <img src="../assest/images/Banner_truong.png" alt="anh" />
      </div>
      <div class="container-body">
        <div class="banner--secondary">
          <div class="banner--secondary__image">
            <img src="../assest/images/TS_DinhTuanLong.png" alt="anh" />
          </div>
          <div class="banner--secondary__content">
            <img src="../assest/icon/Dau-nhay.png" alt="icon" />
            <p class="quote">
              "Việc đào tạo công nghệ thông tin ở Việt Nam ngày càng phát triển
              và đóng vai trò quan trọng trong việc cung cấp nguồn nhân lực chất
              lượng cao cho lĩnh vực công nghệ thông tin. Với sự đầu tư vào cơ
              sở vật chất, chương trình đào tạo tiên tiến, hợp tác quốc tế và
              khuyến khích khởi nghiệp, Khoa Công nghệ thông tin đã thật sự xây
              dựng được môi trường đào tạo giúp cho sinh viên nắm vững kiến thức
              chuyên môn, phát triển toàn diện, sẵn sàng đóng góp vào sự phát
              triển của xã hội".
            </p>
            <br />
            <p class="author">TS. Đinh Tuấn Long</p>
            <p class="author">
              Trưởng khoa Khoa Công nghệ Thông tin, Trường Đại học Mở Hà Nội
            </p>
          </div>
        </div>
        <div class="news--container">
          <h2><a href="pages/danh-sach-ban-tin.aspx">TIN HOẠT ĐỘNG</a></h2>
          <br />
          <div class="news--content">
            <div class="news--content__left">
              <a
                href="pages/chi-tiet-ban-tin.aspx?id=1"
                ><img src="../assest/images/TinHoatDong_Anh1.jpg" alt="anh"
              /></a>
              <div class="news--content__left__title">
                <h3>
                  <a
                    href="pages/chi-tiet-ban-tin.aspx?id=1"
                  >
                    Hướng tới Đại hội Đại biểu Đảng Cộng sản Việt Nam lần thứ
                    XIV</a
                  >
                </h3>
                <p> 
                  Trong không khí thi đua sôi nổi chào mừng Đại hội Đại biểu
                  Đảng Cộng sản Việt Nam lần thứ XIV...
                </p>
              </div>
            </div>
            <div class="news--content__right">
              <div class="news--content__right_1">
                <img src="../assest/images/TinHoatDong_Anh2.jpg" alt="anh" />
                <div class="news--content__right_1_title">
                  <h3>
                    <a
                      href="pages/chi-tiet-ban-tin.aspx?id=2"
                    >
                      [TỔNG KẾT] ĐỐI THOẠI CẤP KHOA CÔNG NGHỆ THÔNG TIN -
                      TRƯỜNG ĐẠI HỌC MỞ HÀ NỘI</a
                    >
                  </h3>
                  <br />
                  <p>
                    Vừa qua chiều ngày 20/3/2026 tại Giảng đường Khoa Công Nghệ
                    Thông Tin, Khoa đã tổ chức thành công buổi Đối thoại cấp
                    Khoa với sự tham gia của Ban Lãnh Đạo Khoa...
                  </p>
                </div>
              </div>
              <div class="news--content__right_1">
                <img src="../assest/images/TinHoatDong_Anh4.jpg" alt="anh" />
                <div class="news--content__right_1_title">
                  <h3>
                    <a
                      href="pages/chi-tiet-ban-tin.aspx?id=4"
                    >
                      CUỘC THI MÃ NGUỒN MỞ – GIẢI THUẬT LẬP TRÌNH VÒNG SƠ LOẠI
                      OLYMPIC TIN HỌC 2025 ĐÃ DIỄN RA THÀNH CÔNG!</a
                    >
                  </h3>
                  <br />
                  <p>
                    Sáng nay (04/10/2025), tại Khoa Công nghệ Thông tin...
                  </p>
                </div>
              </div>
              <div class="news--content__right_1">
                <img src="../assest/images/TinHoatDong_Anh3.jpg" alt="anh" />
                <div class="news--content__right_1_title">
                  <h3>
                    <a
                      href="pages/chi-tiet-ban-tin.aspx?id=3"
                    >
                      KHOA CÔNG NGHỆ THÔNG TIN HÂN HOAN CHÀO MỪNG KHAI GIẢNG NĂM
                      HỌC 2025 – 2026</a
                    >
                  </h3>
                  <br />
                  <p>
                    Sáng ngày 05/09/2025, thầy và trò Khoa Công nghệ Thông tin...
                  </p>
                </div>
              </div>
            </div>
          </div>
          <a href="pages/danh-sach-ban-tin.aspx" class="btn--xemThem"
            >Xem thêm tin -></a
          >
        </div>
        <div class="news--container">
          <h2>TIN ĐÀO TẠO</h2>
          <br />
          <div class="news--content">
            <div class="news--content__right">
              <div class="news--content__right_1">
                <img src="../assest/images/TinHoatDong_Anh5.jpg" alt="anh" />
                <div class="news--content__right_1_title">
                  <h3>
                    <a href="pages/chi-tiet-ban-tin.aspx"
                      >Thông báo v/v Nộp hồ sơ xét tốt nghiệp tháng 6 - 2026</a
                    >
                  </h3>
                  <br />
                  <p>
                    Thông báo quy trình nộp hồ sơ xét công nhận tốt nghiệp tới
                    các sinh viên hệ Chính quy đã hoàn thành CTĐT, có dự kiến
                    xét tốt nghiệp theo quy định và có nguyện vọng được xét tốt
                    nghiệp vào tháng 6 - 2026, cụ thể như sau...
                  </p>
                </div>
              </div>
              <div class="news--content__right_1">
                <img src="../assest/images/TinHoatDong_Anh6.jpg" alt="anh" />
                <div class="news--content__right_1_title">
                  <h3>
                    <a
                      href="pages/chi-tiet-ban-tin.aspx"
                      onclick="tangView('dang-ky-xet-chuyen-nganh')"
                      >Thông báo đăng ký xét chuyên ngành khóa nhập học năm
                      2024</a
                    >
                  </h3>
                  <br />
                  <p>
                    Khoa CNTT thông báo đăng ký xét chuyên ngành Khóa nhập học
                    2024 Đối tượng: Toàn bộ sinh viên khoá 2024 Thời gian đăng
                    ký: hoàn thành trước 12h ngày 20/05/2026. ..
                  </p>
                </div>
              </div>
              <div class="news--content__right_1">
                <img src="../assest/images/TinHoatDong_Anh7.jpg" />
                <div class="news--content__right_1_title">
                  <h3>
                    <a
                      href="pages/chi-tiet-ban-tin.aspx"
                      onclick="tangView('hop-lop-xet-ket-qua-ren-luyen')"
                    >
                      >Thông báo họp lớp xét Kết quả Rèn luyện HK2 năm học
                      2025-2026</a
                    >
                  </h3>
                  <br />
                  <p>
                    Căn cứ Kế hoạch học kỳ/năm học của Nhà trường và của Khoa về
                    việc đánh giá kết quả rèn luyện cho sinh viên học kỳ 2 năm
                    học 2025-2026....
                  </p>
                </div>
              </div>
            </div>
            <div class="news--content__left">
              <img src="../assest/images/TinHoatDong_Anh8.jpg" alt="anh" />
              <div class="news--content__left__title">
                <h3>
                  <a
                    href="pages/chi-tiet-ban-tin.aspx"
                    onclick="tangView('duyet-huy-lop-tin-chi')"
                  >
                    THÔNG BÁO SỐ 03 V/V Duyệt và huỷ các lớp tín chỉ học kỳ II
                    (2025-2026)</a
                  >
                </h3>
                <p>
                  Căn cứ vào số lượng đăng ký và nguyện vọng sau thông báo số
                  02, Khoa CNTT thông báo về tình trạng các lớp như sau:...
                </p>
              </div>
            </div>
          </div>
          <a href="pages/danh-sach-ban-tin.aspx" class="btn--xemThem">Xem thêm tin -></a>
        </div>
        <div class="news--container">
          <h2>KẾ HOẠCH</h2>
          <br />
          <div class="news--content">
            <div class="news--content__left">
              <img src="../assest/images/TinHoatDong_Anh9.jpg" alt="anh" />
              <div class="news--content__left__title">
                <h3>
                  <a
                    href="pages/chi-tiet-ban-tin.aspx"
                    onclick="tangView('ai-4-life')"
                  >
                    >SIÊU PHẨM CUỘC THI "AI 4 LIFE" – FITHOU 2025 ĐÃ SẴN SÀNG
                    BÙNG NỔ!</a
                  >
                </h3>
                <p>
                  Cảm ơn các bạn sinh viên FITHOU đã bùng cháy đam mê, đăng ký
                  tham gia sân chơi học thuật đỉnh cao này...
                </p>
              </div>
            </div>
            <div class="news--content__right">
              <div class="news--content__right_1">
                <img src="../assest/images/TinHoatDong_Anh2.jpg" alt="anh" />
                <div class="news--content__right_1_title">
                  <h3>
                    <a
                      href="pages/chi-tiet-ban-tin.aspx"
                      onclick="tangView('doi-thoai-cap-khoa')"
                    >
                      [TỔNG KẾT] ĐỐI THOẠI CẤP KHOA CÔNG NGHỆ THÔNG TIN - TRƯỜNG
                      ĐẠI HỌC MỞ HÀ NỘI</a
                    >
                  </h3>
                  <br />
                  <p>
                    Vừa qua chiều ngày 20/3/2026 tại Giảng đường Khoa Công Nghệ
                    Thông Tin, Khoa đã tổ chức thành công buổi Đối thoại cấp
                    Khoa với sự tham gia của Ban Lãnh Đạo Khoa, quý thầy cô
                    giảng viên cùng đông đảo các bạn sinh viên...
                  </p>
                </div>
              </div>
              <div class="news--content__right_1">
                <img src="../assest/images/TinHoatDong_Anh4.jpg" alt="anh" />
                <div class="news--content__right_1_title">
                  <h3>
                    <a
                      href="pages/chi-tiet-ban-tin.aspx"
                      onclick="tangView('cuoc-thi-ma-nguon-mo')"
                    >
                      >CUỘC THI MÃ NGUỒN MỞ – GIẢI THUẬT LẬP TRÌNH VÒNG SƠ LOẠI
                      OLYMPIC TIN HỌC 2025 ĐÃ DIỄN RA THÀNH CÔNG!</a
                    >
                  </h3>
                  <br />
                  <p>
                    Sáng nay (04/10/2025), tại Khoa Công nghệ Thông tin – Trường
                    Đại học Mở Hà Nội, vòng sơ loại cấp Khoa Olympic Tin học
                    Sinh viên Việt Nam 2025 đã được tổ chức thành công tốt đẹp.
                    ..
                  </p>
                </div>
              </div>
              <div class="news--content__right_1">
                <img src="../assest/images/TinHoatDong_Anh3.jpg" alt="anh" />
                <div class="news--content__right_1_title">
                  <h3>
                    <a
                      href="pages/chi-tiet-ban-tin.aspx"
                      onclick="tangView('khai-giang-nam-hoc')"
                    >
                      KHOA CÔNG NGHỆ THÔNG TIN HÂN HOAN CHÀO MỪNG KHAI GIẢNG NĂM
                      HỌC 2025 – 2026</a
                    >
                  </h3>
                  <br />
                  <p>
                    Sáng ngày 05/09/2025, thầy và trò Khoa Công nghệ Thông tin –
                    Trường Đại học Mở Hà Nội đã cùng tham gia Lễ Khai giảng năm
                    học mới và kỷ niệm 80 năm truyền thống ngành Giáo dục Việt
                    Nam qua hình thức trực tuyến....
                  </p>
                </div>
              </div>
            </div>
          </div>
          <a href="" class="btn--xemThem">Xem thêm tin -></a>
          <div class="btn--return_header">
            <button>
              <a href="#"
                ><img src="../assest/icon/quay-lai-dau-trang.png" alt=""
              /></a>
            </button>
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