<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sua.aspx.cs" Inherits="BTL_LapTrinhWeb.pages.Sua" %>

<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <meta charset="UTF-8" />
    <title>Sửa Tài Khoản</title>
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
            
            <h2>Cập nhật tài khoản</h2>
            <p>Chỉnh sửa thông tin tài khoản.</p>
            
           <div class="form-group">
               <label for="fullname">Họ và tên</label>
                <input type="text" id="fullname" name="reg_fullname" runat="server" />
               <label id="errFullname" class="error"></label>
           </div>
           
            <div class="form-group">
                <label for="email">Email</label>
                <input type="text" id="email" name="reggg_email" runat="server" />
                <label id="errEmail" class="error"></label>
            </div>
            
            <div class="form-group">
                <label for="username">Tên đăng nhập (Không được sửa)</label>
                <input type="text" id="username" name="reg_username" runat="server" readonly="true" style="background-color: #e9ecef;" />
                <label id="errUsername" class="error"></label>
            </div>
            
            <div class="form-group">
                <label for="registerPassword">Mật khẩu</label>
                <div class="password-wrapper">
                    <input type="password" id="registerPassword" name="password" runat="server" /> 
                    <img id="iconPassword" src="../assest/icon/matbat.svg" onclick="togglePassword('registerPassword','iconPassword')" /> 
                </div>
                <label id="errPassword" class="error"></label>
            </div>
            
             <button type="submit" onclick="return validateRegister()">Lưu thay đổi</button>
             
            <div class="auth-footer">
              <a href="quan-ly-tai-khoan.aspx">Hủy và quay lại</a>
            </div>
            
          </div>
        </div>
      </div>
    </main>
    <script src="/js/dky.js"></script>
    </form>
  </body>
</html>