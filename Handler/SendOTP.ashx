<%@ WebHandler Language="C#" Class="SendOTP" %>

using System;
using System.Web;
using System.Net.Mail;
using System.Web.SessionState;

public class SendOTP : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        string email = context.Request["email"];

        // 1. Tạo mã OTP Random 6 số
        Random rand = new Random();
        string otp = rand.Next(100000, 999999).ToString();

        // 2. Lưu OTP vào Session (Cách đơn giản nhất cho Web Forms)
        // Lưu ý: Session sẽ mất nếu server reset. 
        // "Sang" hơn thì lưu vào Cache hoặc Database kèm thời gian hết hạn.
        context.Session["CurrentOTP"] = otp;
        context.Session["CurrentEmail"] = email;
        context.Session["OTP_Expiry"] = DateTime.Now.AddMinutes(5); // Hết hạn sau 5 phút

        // 3. Gửi Mail (Dùng SMTP Google hoặc dịch vụ khác)
        bool isSent = SendEmailFunction(email, "Mã xác thực đăng ký", "Mã OTP của bạn là: " + otp);

        context.Response.ContentType = "application/json";
        if (isSent)
            context.Response.Write("{\"status\": \"ok\"}");
        else
            context.Response.Write("{\"status\": \"error\", \"msg\": \"SMTP Error\"}");
    }

    // Hàm gửi mail cơ bản
    public bool SendEmailFunction(string to, string subject, string body)
    {
        try
        {
            MailMessage mail = new MailMessage();
            mail.To.Add(to);
            mail.From = new MailAddress("your_email@gmail.com");
            mail.Subject = subject;
            mail.Body = body;
            mail.IsBodyHtml = true;

            SmtpClient smtp = new SmtpClient("smtp.gmail.com");
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.Credentials = new System.Net.NetworkCredential("your_email@gmail.com", "app_password_google"); // Nhớ dùng App Password

            smtp.Send(mail);
            return true;
        }
        catch { return false; }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}