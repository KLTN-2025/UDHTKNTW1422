using System;
using System.Collections.Generic;
using System.Linq;
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
        string userName = txtUser.Value.Trim();
        tbAccount checkTaiKhoan = (from tb in db.tbAccounts
                                   where tb.account_sodienthoai == userName.ToLower()
                                   && tb.account_matkhau == passmd5
                                   && tb.account_active == true
                                   select tb).FirstOrDefault();
        if (checkTaiKhoan != null)
        {
            // tạo cookie tài khoản
            HttpCookie ck = new HttpCookie("taikhoan");
            string s = ck.Value;
            ck.Value = userName;
            ck.Expires = DateTime.Now.AddDays(365);
            Response.Cookies.Add(ck);
            Response.Redirect("/app-thcs");
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "AlertBox", "swal('Sai tên đăng nhập / mật khẩu!', '','warning')", true);
        }
    }
}