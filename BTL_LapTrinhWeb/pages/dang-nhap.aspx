<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dang-nhap.aspx.cs" Inherits="BTL_LapTrinhWeb.pages.dang_nhap" %>

<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Đăng Nhập</title>
    <link rel="stylesheet" href="../css/index.css" />

    <link rel="stylesheet" href="../css/dangnhap.css" />
  </head>
  <body>
    <form id="form1" runat="server">
    <main>
      <div class="auth-card">
        <div class="auth-image">
          <img src="../assest/images/truongdhmo.png" alt="Trường Đại Học Mở Hà Nội" />
        </div>
        <div class="auth-form">
          <div class="form-box">
            <div class="form-logo">
              <img src="../assest/images/Logo.png" alt="logo" />
            </div>
<h2>Đăng nhập vào HOU</h2>
<p>Đăng nhập bằng tài khoản của bạn để tiếp tục.</p>

<div class="form-container">

    <div class="form-group">
        <label for="username">Tên đăng nhập</label>
        <input type="text" id="username" name="username" />
        <label id="errUsername" class="error"></label>
    </div>

    <div class="form-group">
        <label for="login-password">Mật khẩu</label>

        <div class="password-wrapper">
            <input type="password" id="login-password" name="password" />

          <img id="Loginpassword"
     src="../assest/icon/matbat.svg"
     alt="Hiện mật khẩu"
     onclick="togglePassword('login-password','Loginpassword')" />
        </div>

        <label id="errPassword" class="error"></label>
        <label id="saiDN" runat="server" style="color: red;"></label>
    </div>

    <button type="submit" onclick="return validateLogin()">
        Đăng nhập
    </button>
    
    <div class="auth-footer">
        <span>Chưa có tài khoản?</span>
        <a href="dang-ky.aspx">Đăng ký</a>
    </div>


</div>
        </div>
      </div>
    </main>

        <script src="../js/dn.js"></script>
    </form>
  </body>
</html>