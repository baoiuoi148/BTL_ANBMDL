using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace BTL_LapTrinhWeb
{
    public class TaiKhoan
    {
        public string HoTen { get; set; }
        public string Email { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
    }
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            //List<TaiKhoan> taikhoan = new List<TaiKhoan>();
            //taikhoan.Add(new TaiKhoan
            //{
            //    HoTen = "Bao Dinh",
            //    Email = "admin@.com",
            //    Username = "admin",
            //    Password = "123456",
            //});
            //Application["DanhSachTaiKhoan"] = taikhoan;
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}