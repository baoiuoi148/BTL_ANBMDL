<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dang-ky.aspx.cs" Inherits="BTL_LapTrinhWeb.pages.dang_ky" %>

<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Đăng Ký</title>
    <link rel="stylesheet" href="../css/index.css" />
    <link rel="stylesheet" href="../css/dangnhap_dangki_quenmk.css" />
  </head>
  <body>
    <form id="form1" runat="server" autocomplete="off">
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
            <h2>Tạo tài khoản mới</h2>
            <p>Hãy điền thông tin để đăng ký tài khoản HOU.</p>
           <div class="form-group">
               <label for="fullname">Họ và tên</label>
                <input type="text" id="fullname" name="reg_fullname"autocomplete="off"  />
               <label id="errFullname" class="error"></label>
           </div>
            <div class="form-group">
                <label for="email">Email</label>
                    <input type="text" id="email" name="reggg_email" autocomplete="new-password"/>
                <label id="errEmail" class="error"></label>
            </div>
            <div class="form-group">
                <label for="username">Tên đăng nhập</label>
                    <input type="text"  id="username"  name="reg_username"autocomplete="off"   />
                <label id="errUsername" class="error"></label>
            </div>


            <div class="form-group">
                <label for="register-password">Mật khẩu</label>
            <div class="password-wrapper">
                <input  type="password"  id="register-password" name="password" autocomplete="off" /> 
                <img  id="iconPassword"  src="../assest/icon/matbat.svg"  alt="Hiện mật khẩu"
                    onclick="togglePassword('register-password','iconPassword')" /> 
            </div>
                <label id="errPassword" class="error"></label>
            </div>
            <div class="form-group">
                <label for="confirm-password">Xác nhận mật khẩu</label>
            <div class="password-wrapper">
                <input type="password" id="confirm-password" name="confirm_password"  />
                
                <img id="iconConfirmPassword" src="../assest/icon/matbat.svg" alt="Hiện mật khẩu" onclick="togglePassword('confirm-password','iconConfirmPassword')" />
             </div>
                <label id="errConfirm" class="error"></label>
            </div>
              <asp:Label ID="successMessage" runat="server" CssClass="success"></asp:Label>
             <button id="btnDangKy" type="submit" onclick="if(!validateRegister()) return false;"> Đăng ký</button>
            <div class="auth-footer">
              <span>Đã có tài khoản?</span>
              <a href="dang-nhap.aspx">Đăng nhập</a>
            </div>
          </div>
        </div>
      </div>
    </main>
            <script src="/js/dky.js"></script>
    </form>
  </body>
</html>