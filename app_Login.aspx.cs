using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class app_Login : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_ServerClick(object sender, EventArgs e)
    {
        cls_security md5 = new cls_security();
        string passmd5 = md5.HashCode(txtPassword.Value);
        string userName = txtUser.Value.Trim().ToLower();

        var checkTaiKhoan = db.tbAccounts
            .FirstOrDefault(tb =>
                tb.account_sodienthoai == userName &&
                tb.account_matkhau == passmd5);

        if (checkTaiKhoan == null)
        {
            ScriptManager.RegisterClientScriptBlock(
                this.Page, this.Page.GetType(),
                "AlertBox",
                "swal('Sai tên đăng nhập hoặc mật khẩu!', '', 'warning')",
                true);
            return;
        }

        if (checkTaiKhoan.account_active == false)
        {
            ScriptManager.RegisterClientScriptBlock(
                this.Page, this.Page.GetType(),
                "AlertBox",
                "swal('Tài khoản của bạn đã bị chặn. Vui lòng liên hệ bộ phận hỗ trợ!', '', 'warning')",
                true);
            return;
        }

        // ✅ LOGIN THÀNH CÔNG
        HttpCookie ck = new HttpCookie("taikhoan");
        ck.Value = userName;
        ck.Expires = DateTime.Now.AddDays(365);
        Response.Cookies.Add(ck);
        Response.Redirect("/app-thcs");
    }

    [System.Web.Services.WebMethod]
    public static string SendOtpForgotPassword(string phoneOrEmail)
    {
        try
        {
            dbcsdlDataContext db = new dbcsdlDataContext();
            
            // Find account by phone or email
            tbAccount account = (from a in db.tbAccounts
                               where (a.account_sodienthoai == phoneOrEmail || a.account_email == phoneOrEmail)
                               && a.account_active == true
                               select a).FirstOrDefault();

            if (account == null)
            {
                return "NOT_FOUND";
            }

            // Get email for sending OTP
            string emailToSend = account.account_email;
            if (string.IsNullOrEmpty(emailToSend))
            {
                return "NO_EMAIL";
            }

            // Generate OTP
            Random rnd = new Random();
            string otp = rnd.Next(100000, 999999).ToString();

            // Save OTP and account info to session
            HttpContext.Current.Session["ForgotPasswordOTP"] = otp;
            HttpContext.Current.Session["ForgotPasswordAccountId"] = account.account_id;
            HttpContext.Current.Session["ForgotPasswordOTP_Expiry"] = DateTime.Now.AddMinutes(5);

            // Send email
            MailMessage msg = new MailMessage();
            msg.From = new MailAddress("thongbaovietnhatschool@gmail.com", "KoiGo!");
            msg.To.Add(emailToSend);
            msg.Subject = "OTP đặt lại mật khẩu";
            msg.Body = "Mã OTP để đặt lại mật khẩu của bạn là: " + otp;
            msg.IsBodyHtml = false;

            SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
            client.EnableSsl = true;
            client.Credentials = new NetworkCredential("thongbaovietnhatschool@gmail.com", "neiabcekdjluofid");

            client.Send(msg);

            return "OK";
        }
        catch (Exception ex)
        {
            return "ERROR: " + ex.Message;
        }
    }

    [System.Web.Services.WebMethod]
    public static string VerifyOtpForgotPassword(string otpClient)
    {
        try
        {
            var sessionOTP = HttpContext.Current.Session["ForgotPasswordOTP"];
            var expiry = HttpContext.Current.Session["ForgotPasswordOTP_Expiry"] as DateTime?;

            if (sessionOTP == null)
            {
                return "EXPIRED";
            }

            if (expiry == null || DateTime.Now > expiry.Value)
            {
                return "EXPIRED";
            }

            string otpServer = sessionOTP.ToString();

            if (otpClient == otpServer)
            {
                return "OK";
            }

            return "INVALID";
        }
        catch
        {
            return "ERROR";
        }
    }

    [System.Web.Services.WebMethod]
    public static string ResetPassword(string newPassword)
    {
        try
        {
            var accountIdObj = HttpContext.Current.Session["ForgotPasswordAccountId"];
            var sessionOTP = HttpContext.Current.Session["ForgotPasswordOTP"];

            if (accountIdObj == null || sessionOTP == null)
            {
                return "SESSION_EXPIRED";
            }

            int accountId = Convert.ToInt32(accountIdObj);

            dbcsdlDataContext db = new dbcsdlDataContext();
            tbAccount account = (from a in db.tbAccounts
                               where a.account_id == accountId
                               && a.account_active == true
                               select a).FirstOrDefault();

            if (account == null)
            {
                return "NOT_FOUND";
            }

            // Hash new password
            cls_security md5 = new cls_security();
            string passmd5 = md5.HashCode(newPassword);

            // Update password
            account.account_matkhau = passmd5;
            db.SubmitChanges();

            // Clear session
            HttpContext.Current.Session["ForgotPasswordOTP"] = null;
            HttpContext.Current.Session["ForgotPasswordAccountId"] = null;
            HttpContext.Current.Session["ForgotPasswordOTP_Expiry"] = null;

            return "OK";
        }
        catch (Exception ex)
        {
            return "ERROR: " + ex.Message;
        }
    }
}