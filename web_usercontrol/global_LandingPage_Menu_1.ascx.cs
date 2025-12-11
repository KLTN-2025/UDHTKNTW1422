using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_usercontrol_global_LandingPage_Menu_1 : System.Web.UI.UserControl
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        // Kiểm tra cookie đăng nhập
        if (Request.Cookies["taikhoan"] != null && !string.IsNullOrEmpty(Request.Cookies["taikhoan"].Value))
        {
            // Đã đăng nhập - hiển thị menu user với avatar
            guestMenu.Visible = false;
            userMenu.Visible = true;
            
            // Lấy thông tin user từ database
            var tkInfo = (from tk in db.tbAccounts
                         join cr in db.tbAccount_Childrens on tk.account_id equals cr.account_id
                         where tk.account_sodienthoai == Request.Cookies["taikhoan"].Value 
                         && cr.account_children_active == true
                         select new
                         {
                             cr.account_children_fullname,
                             cr.account_children_image
                         }).FirstOrDefault();

            if (tkInfo != null)
            {
                // Gán avatar nếu có
                avatarImg.Src = string.IsNullOrEmpty(tkInfo.account_children_image)
                    ? "/images/user_noimage.jpg"
                    : tkInfo.account_children_image;
                userName.InnerText = tkInfo.account_children_fullname;
            }
            else
            {
                // Trường hợp cookie tồn tại nhưng DB không tìm thấy
                guestMenu.Visible = true;
                userMenu.Visible = false;
            }
        }
        else
        {
            // Chưa đăng nhập - hiển thị menu đăng ký/đăng nhập
            guestMenu.Visible = true;
            userMenu.Visible = false;
        }
    }

    protected void btnLogout_ServerClick(object sender, EventArgs e)
    {
        // Xóa cookie đăng nhập
        HttpCookie ck = new HttpCookie("taikhoan");
        ck.Value = "";  //set a blank value to the cookie 
        ck.Expires = DateTime.Now.AddDays(-1);
        Response.Cookies.Add(ck);
        
        // Redirect về trang chủ công khai
        Response.Redirect("/koigo-trang-chu");
    }
}