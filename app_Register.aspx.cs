using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class app_Register : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    public string hoten, sodienthoai, email, lop, goi, style1, style2;
    protected void Page_Load(object sender, EventArgs e)
    {
        style1 = "display: none;";
        style2 = "display: none;";
        if (!IsPostBack)
        {
            style1 = "";
            style2 = "display: none;";
            var getLop = from l in db.tbKhoiLops where l.khoilop_active == true && l.khoilop_name != null select l;
            ddlLop.Items.Clear();
            ddlLop.AppendDataBoundItems = true;
            ddlLop.Items.Add("Chọn lớp");
            ddlLop.DataSource = getLop;
            ddlLop.DataTextField = "khoilop_name";
            ddlLop.DataValueField = "khoilop_id";
            ddlLop.DataBind();
        }
    }

    protected void btnLuu_Click(object sender, EventArgs e)
    {
        cls_security md5 = new cls_security();
        string passmd5 = md5.HashCode(txtPassWord.Value);
        tbAccount account = new tbAccount();
        account.account_sodienthoai = txtSoDienThoai.Value;
        account.account_matkhau = passmd5;
        account.account_active = true;
        account.account_email = txtEmail.Value;
        db.tbAccounts.InsertOnSubmit(account);
        db.SubmitChanges();
        tbAccount_Children account_Children = new tbAccount_Children();
        account_Children.account_children_fullname = txtHoTen.Value;
        account_Children.account_children_active = true;
        account_Children.lop_id = Convert.ToInt32(ddlLop.SelectedValue);
        account_Children.account_id = account.account_id;
        account_Children.account_children_image = "/images/user_noimage.jpg";
        db.tbAccount_Childrens.InsertOnSubmit(account_Children);
        db.SubmitChanges();
        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "AlertBox", "swal('Đăng kí tài khoản thành công!', '','success').then(function(){window.location = '/app-login';})", true);

    }

    protected void btnsendMail_ServerClick(object sender, EventArgs e)
    {
        //SendMail(txtEmail.Value.Trim());
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "text", "showStep()", true); 
    }

   
    [System.Web.Services.WebMethod]
    public static string SendOtp(string email)
    {
        try
        {
            // Kiểm tra email có hợp lệ không
            if (string.IsNullOrEmpty(email) || !email.Contains("@"))
            {
                return "INVALID_EMAIL";
            }

            // Tạo OTP
            Random rnd = new Random();
            string otp = rnd.Next(100000, 999999).ToString();

            // Lưu OTP và thời gian vào session
            HttpContext.Current.Session["OTP"] = otp;
            HttpContext.Current.Session["OTP_Time"] = DateTime.Now;
            HttpContext.Current.Session["OTP_Email"] = email;

            // Gửi email
            MailMessage msg = new MailMessage();

            // QUAN TRỌNG: GÁN FROM
            msg.From = new MailAddress("thongbaovietnhatschool@gmail.com", "KoiGo!");

            msg.To.Add(email);
            msg.Subject = "OTP xác thực";
            msg.Body = "Mã OTP của bạn là: " + otp;
            msg.IsBodyHtml = false;

            SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
            client.EnableSsl = true;
            client.Credentials = new NetworkCredential("thongbaovietnhatschool@gmail.com", "neiabcekdjluofid");

            client.Send(msg);

            return "OK";
        }
        catch (SmtpException smtpEx)
        {
            // Lỗi gửi email
            return "SEND_FAILED";
        }
        catch (Exception ex)
        {
            return "ERROR: " + ex.Message;
        }
    }
    [System.Web.Services.WebMethod]
    public static string VerifyOtp(string otpClient)
    {
        var sessionObj = HttpContext.Current.Session["OTP"];
        string otpServer = sessionObj == null ? null : sessionObj.ToString();

        if (otpServer == null)
        {
            // Kiểm tra xem có email trong session không để phân biệt chưa gửi hay đã hết hạn
            var emailObj = HttpContext.Current.Session["OTP_Email"];
            if (emailObj == null)
            {
                return "NOT_SENT"; // OTP chưa được gửi
            }
            return "EXPIRED"; // OTP đã hết hạn
        }

        // Kiểm tra thời gian hết hạn (5 phút)
        var timeObj = HttpContext.Current.Session["OTP_Time"];
        if (timeObj != null && timeObj is DateTime)
        {
            DateTime otpTime = (DateTime)timeObj;
            if ((DateTime.Now - otpTime).TotalMinutes > 5)
            {
                HttpContext.Current.Session["OTP"] = null;
                HttpContext.Current.Session["OTP_Time"] = null;
                return "EXPIRED";
            }
        }

        if (otpClient == otpServer)
        {
            // Xóa OTP sau khi verify thành công
            HttpContext.Current.Session["OTP"] = null;
            HttpContext.Current.Session["OTP_Time"] = null;
            HttpContext.Current.Session["OTP_Email"] = null;
            return "OK";
        }

        return "INVALID";
    }

}