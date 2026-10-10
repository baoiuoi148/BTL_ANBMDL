<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="demo-sqli.aspx.cs" Inherits="BTL_LapTrinhWeb.pages.demo_sqli" %>

<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Thực hành Khai thác và Phòng chống SQL Injection</title>
    <link rel="stylesheet" href="../css/index.css" />
    <style>
      .lab-container { max-width: 1100px; margin: 30px auto; padding: 0 20px; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif; }
      .lab-hero { background: linear-gradient(135deg, #0b3c5d, #1d2731); color: #fff; padding: 30px; border-radius: 10px; margin-bottom: 25px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); }
      .mode-switcher { background: #fff; border: 2px solid #0b3c5d; border-radius: 8px; padding: 20px; margin-bottom: 30px; display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 15px; }
      .scenario-card { background: #fff; border: 1px solid #e2e8f0; border-radius: 8px; padding: 25px; margin-bottom: 25px; box-shadow: 0 2px 8px rgba(0,0,0,0.05); }
      .badge-vuln { background: #fee2e2; color: #dc2626; padding: 4px 10px; border-radius: 20px; font-weight: bold; font-size: 13px; }
      .badge-sec { background: #dcfce7; color: #16a34a; padding: 4px 10px; border-radius: 20px; font-weight: bold; font-size: 13px; }
      .code-box { background: #1e293b; color: #f8fafc; padding: 15px; border-radius: 6px; font-family: 'Consolas', monospace; font-size: 13px; overflow-x: auto; margin: 10px 0; }
      .payload-pill { background: #fef3c7; border: 1px dashed #d97706; color: #92400e; padding: 6px 12px; border-radius: 4px; font-family: monospace; font-weight: bold; display: inline-block; margin: 5px 0; }
      .btn-action { display: inline-block; padding: 8px 16px; background: #0b3c5d; color: #fff; border-radius: 6px; text-decoration: none; font-weight: 500; transition: background 0.2s; }
      .btn-action:hover { background: #1d2731; color: #fff; }
      .diff-table { width: 100%; border-collapse: collapse; margin-top: 15px; }
      .diff-table th, .diff-table td { border: 1px solid #cbd5e1; padding: 12px; font-size: 13px; text-align: left; }
      .diff-table th { background: #f1f5f9; }
    </style>
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
            <li><a href="../index.aspx">TRANG CHỦ</a></li>
            <li><a href="danh-sach-ban-tin.aspx">TIN TỨC</a></li>
            <li><a href="demo-sqli.aspx" style="color:#d32f2f; font-weight:bold;">LAB SQL INJECTION</a></li>
          </ul>
        </div>
        <div class="menu">
          <ul class="menu--main">
            <li><a href="thong_tin_tai_khoan.aspx">TÀI KHOẢN</a></li>
            <li id="menuDangNhap" runat="server"><a href="dang-nhap.aspx">ĐĂNG NHẬP</a></li>
            <li id="menuDangKy" runat="server"><a href="dang-ky.aspx">ĐĂNG KÝ</a></li>
            <li id="menuDangXuat" runat="server"><asp:LinkButton ID="btnDangXuat" runat="server" OnClick="btnDangXuat_Click">ĐĂNG XUẤT</asp:LinkButton></li>
            <li id="menuQuanTri" runat="server"><a href="quan-tri-tin-tuc-chinh.aspx">QUẢN TRỊ</a></li>
            <li id="menuThongKe" runat="server"><a href="bao-cao.aspx">BÁO CÁO</a></li>
          </ul>
        </div>
      </div>
    </header>

    <main class="lab-container">
      <div class="lab-hero">
        <h1 style="font-size: 26px; margin-bottom: 10px;">🎯 ĐỀ TÀI: THỰC HÀNH KHAI THÁC & PHÒNG CHỐNG SQL INJECTION</h1>
        <p style="opacity: 0.9; line-height: 1.6;">
          Website Demo được thiết kế có 2 chế độ độc lập: 
          <b>Chế độ Lỗ hổng (Vulnerable)</b> để thực hành tấn công & 
          <b>Chế độ Phòng chống (Secure)</b> để chứng minh hiệu quả của các biện pháp bảo mật.
        </p>
      </div>

      <!-- BẢNG ĐIỀU KHIỂN CHẾ ĐỘ -->
      <div class="mode-switcher">
        <div>
          <h3 style="margin: 0 0 5px 0;">Trạng thái hệ thống hiện tại:</h3>
          <span class='<%= currentMode == "Vulnerable" ? "badge-vuln" : "badge-sec" %>'>
            <%= currentMode == "Vulnerable" ? "🔴 Đang ở Chế độ DỄ BỊ TỔN THƯƠNG (Ghép chuỗi SQL thô)" : "🟢 Đang ở Chế độ ĐÃ PHÒNG CHỐNG (Parameterized Query)" %>
          </span>
        </div>
        <div>
          <asp:Button ID="btnToggleMode" runat="server" Text="Chuyển chế độ bảo mật" OnClick="btnToggleMode_Click" 
                      CssClass="btn-action" style="cursor:pointer; background:#2563eb;" />
        </div>
      </div>

      <!-- KỊCH BẢN 1 -->
      <div class="scenario-card">
        <div style="display:flex; justify-content:space-between; align-items:center;">
          <h2 style="color:#0b3c5d; font-size:18px;">1. Kịch bản Authentication Bypass (Vượt qua đăng nhập)</h2>
          <span class="badge-vuln">Authentication Bypass</span>
        </div>
        <p style="margin-top:10px; color:#475569; font-size:14px;">
          <b>Mô tả:</b> Kẻ tấn công lợi dụng việc ghép chuỗi trực tiếp trong câu lệnh kiểm tra thông tin đăng nhập để đăng nhập tài khoản <code>admin</code> mà không cần mật khẩu.
        </p>
        <div class="code-box">
-- Câu lệnh gốc:<br/>
SELECT * FROM TaiKhoan WHERE Username = '&lt;input_user&gt;' AND Password = '&lt;input_pass&gt;'<br/><br/>
-- Khi chèn payload admin' -- :<br/>
SELECT * FROM TaiKhoan WHERE Username = 'admin' --' AND Password = '123'
        </div>
        <div style="margin: 12px 0;">
          <b>Payload thực nghiệm:</b> <span class="payload-pill">admin' --</span> hoặc <span class="payload-pill">' OR '1'='1</span><br/>
          <i>Mật khẩu: Nhập bất kỳ ký tự nào (ví dụ 123)</i>
        </div>
        <div style="margin-top:15px;">
          <a href="dang-nhap.aspx" class="btn-action">👉 Đến trang Đăng nhập để thực hành</a>
        </div>
      </div>

      <!-- KỊCH BẢN 2 -->
      <div class="scenario-card">
        <div style="display:flex; justify-content:space-between; align-items:center;">
          <h2 style="color:#0b3c5d; font-size:18px;">2. Kịch bản UNION-Based SQL Injection (Trích xuất CSDL qua Tìm kiếm)</h2>
          <span class="badge-vuln">Data Extraction</span>
        </div>
        <p style="margin-top:10px; color:#475569; font-size:14px;">
          <b>Mô tả:</b> Sử dụng toán tử <code>UNION SELECT</code> để kết hợp kết quả truy vấn tìm kiếm với bảng <code>TaiKhoan</code> hoặc bảng hệ thống, trích xuất dữ liệu nhạy cảm ra giao diện người dùng.
        </p>
        <div class="code-box">
SELECT TieuDe, Anh, LinkBai FROM BaiViet WHERE TieuDe LIKE '%&lt;tu_khoa&gt;%'<br/><br/>
-- Khi chèn payload UNION:<br/>
SELECT TieuDe, Anh, LinkBai FROM BaiViet WHERE TieuDe LIKE '%' UNION SELECT Username, Password, Email FROM TaiKhoan --%'
        </div>
        <div style="margin: 12px 0;">
          <b>Payload thực nghiệm:</b><br/>
          • Lấy tài khoản & mật khẩu: <span class="payload-pill">' UNION SELECT Username, Password, Email FROM TaiKhoan --</span><br/>
          • Lấy thông tin Server: <span class="payload-pill">' UNION SELECT @@version, DB_NAME(), USER_NAME() --</span>
        </div>
        <div style="margin-top:15px;">
          <a href="tim-kiem.aspx?q=' UNION SELECT Username, Password, Email FROM TaiKhoan --" class="btn-action">👉 Thực thi ngay Payload UNION trên Tìm kiếm</a>
        </div>
      </div>

      <!-- KỊCH BẢN 3 -->
      <div class="scenario-card">
        <div style="display:flex; justify-content:space-between; align-items:center;">
          <h2 style="color:#0b3c5d; font-size:18px;">3. Kịch bản Error-Based SQL Injection</h2>
          <span class="badge-vuln">Error-Based</span>
        </div>
        <p style="margin-top:10px; color:#475569; font-size:14px;">
          <b>Mô tả:</b> Cố tình ép SQL Server thực hiện phép chuyển đổi kiểu dữ liệu không tương thích (ví dụ ép chuỗi thành int) để làm lộ thông tin hệ thống ngay trong thông báo lỗi trả về.
        </p>
        <div class="code-box">
' OR 1 = CONVERT(int, @@version) --
        </div>
        <div style="margin: 12px 0;">
          <b>Payload thực nghiệm:</b> <span class="payload-pill">' OR 1=CONVERT(int, @@version) --</span>
        </div>
        <div style="margin-top:15px;">
          <a href="tim-kiem.aspx?q=' OR 1=CONVERT(int, @@version) --" class="btn-action">👉 Thực thi ngay Payload Error-based</a>
        </div>
      </div>

      <!-- SO SÁNH GIẢI PHÁP PHÒNG CHỐNG -->
      <div class="scenario-card">
        <div style="display:flex; justify-content:space-between; align-items:center;">
          <h2 style="color:#16a34a; font-size:18px;">🛡️ GIẢI PHÁP PHÒNG CHỐNG (REMEDIATION)</h2>
          <span class="badge-sec">Defense Best Practices</span>
        </div>
        <p style="margin-top:10px; color:#475569; font-size:14px;">
          Phương pháp cốt lõi và hiệu quả nhất để phòng chống SQL Injection là <b>Parameterized Queries (Câu lệnh tham số hóa)</b>:
        </p>
        <table class="diff-table">
          <thead>
            <tr>
              <th style="color:#dc2626;">❌ Code Dễ Bị Tấn Công (Vulnerable)</th>
              <th style="color:#16a34a;">✔ Code An Toàn (Secure - Phòng Chống)</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>
                <pre style="margin:0; font-family:monospace; color:#dc2626;">
// Nối chuỗi trực tiếp
string sql = "SELECT * FROM TaiKhoan " +
             "WHERE Username = '" + user + "' " +
             "AND Password = '" + pass + "'";
DataTable dt = database.GetData(sql);</pre>
              </td>
              <td>
                <pre style="margin:0; font-family:monospace; color:#16a34a;">
// Dùng Tham số Parameterized
string sql = "SELECT * FROM TaiKhoan " +
             "WHERE Username = @user " +
             "AND Password = @pass";
SqlParameter[] pars = new SqlParameter[] {
    new SqlParameter("@user", user),
    new SqlParameter("@pass", pass)
};
DataTable dt = database.GetData(sql, pars);</pre>
              </td>
            </tr>
          </tbody>
        </table>
        <div style="margin-top:15px; font-size:13px; color:#334155; line-height:1.6;">
          <b>Các nguyên tắc phòng thủ bổ sung:</b><br/>
          1. <b>Stored Procedures:</b> Sử dụng thủ tục lưu trữ có tham số trên SQL Server.<br/>
          2. <b>Input Validation & Whitelisting:</b> Kiểm tra định dạng dữ liệu đầu vào (Regex, số nguyên, ngày tháng).<br/>
          3. <b>Nguyên tắc đặc quyền tối thiểu (Least Privilege):</b> Tài khoản ứng dụng kết nối SQL Server không nên cấp quyền <code>sa</code> hoặc <code>sysadmin</code>, chỉ cấp quyền SELECT/INSERT/UPDATE trên các bảng cần thiết.<br/>
          4. <b>Tắt chi tiết lỗi môi trường Production (CustomErrors):</b> Không hiển thị stack trace hay mã lỗi CSDL chi tiết cho người dùng cuối.
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
          <p>Đề tài: Thực hành khai thác và phòng chống tấn công SQL Injection trên website demo</p>
        </div>
      </div>
    </footer>
    </form>
  </body>
</html>
