using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Services;
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

    //[System.Web.Services.WebMethod]
    [System.Web.Services.WebMethod(EnableSession = true)]
    public static string SendOtpForgotPassword(string email)
    {
        try
        {
            if (string.IsNullOrEmpty(email))
            {
                return "NOT_FOUND";
            }

            // Validate email format
            try
            {
                var emailAddr = new System.Net.Mail.MailAddress(email);
            }
            catch
            {
                return "INVALID_EMAIL";
            }

            dbcsdlDataContext db = new dbcsdlDataContext();
            
            // Normalize email: trim and convert to lowercase for comparison
            string normalizedEmail = email.Trim().ToLower();
            
            // Find account by email only (case-insensitive comparison)
            tbAccount account = (from a in db.tbAccounts
                               where a.account_email != null 
                               && a.account_email.Trim().ToLower() == normalizedEmail
                               && a.account_active == true
                               select a).FirstOrDefault();

            if (account == null)
            {
                return "NOT_FOUND";
            }

            // Get email for sending OTP (use original email from database)
            string emailToSend = account.account_email;
            if (string.IsNullOrEmpty(emailToSend))
            {
                return "NO_EMAIL";
            }
            
            // Trim email before sending
            emailToSend = emailToSend.Trim();

            // Generate OTP
            Random rnd = new Random();
            string otp = rnd.Next(100000, 999999).ToString();

            // Save OTP and account info to session
            HttpContext.Current.Session["ForgotPasswordOTP"] = otp;
            HttpContext.Current.Session["ForgotPasswordAccountId"] = account.account_id;
            HttpContext.Current.Session["ForgotPasswordOTP_Expiry"] = DateTime.Now.AddMinutes(5);

            // Send email
            try
            {
                MailMessage msg = new MailMessage();
                msg.From = new MailAddress("thongbaovietnhatschool@gmail.com", "KoiGo!");
                msg.To.Add(emailToSend);
                msg.Subject = "OTP đặt lại mật khẩu";
                msg.Body = "Mã OTP để đặt lại mật khẩu của bạn là: " + otp;
                msg.IsBodyHtml = false;

                SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                client.EnableSsl = true;
                client.Credentials = new NetworkCredential("thongbaovietnhatschool@gmail.com", "neiabcekdjluofid");
                client.Timeout = 30000; // 30 seconds timeout

                client.Send(msg);

                return "OK";
            }
            catch (SmtpException smtpEx)
            {
                // Log lỗi SMTP
                System.Diagnostics.Debug.WriteLine("SMTP Error: " + smtpEx.Message);
                
                // Kiểm tra lỗi giới hạn gửi email
                if (smtpEx.Message.Contains("Daily user sending limit exceeded") || 
                    smtpEx.Message.Contains("5.4.5"))
                {
                    return "LIMIT_EXCEEDED";
                }
                
                return "ERROR: Lỗi gửi email. " + smtpEx.Message;
            }
            catch (System.Net.Sockets.SocketException socketEx)
            {
                // Lỗi kết nối mạng
                System.Diagnostics.Debug.WriteLine("Network Error: " + socketEx.Message);
                return "ERROR: Lỗi kết nối mạng. Vui lòng thử lại sau.";
            }
            catch (Exception mailEx)
            {
                // Lỗi khác khi gửi email
                System.Diagnostics.Debug.WriteLine("Mail Error: " + mailEx.Message);
                return "ERROR: " + mailEx.Message;
            }
        }
        catch (Exception ex)
        {
            // Log lỗi để debug
            System.Diagnostics.Debug.WriteLine("SendOtpForgotPassword Error: " + ex.ToString());
            return "ERROR: " + ex.Message;
        }
    }

    [System.Web.Services.WebMethod(EnableSession = true)]
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
