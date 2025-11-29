using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_usercontrol_global_LandingPage_Menu : System.Web.UI.UserControl
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public int id_video;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //CheckLoginState();
        }
        // get video mới nhất
        //var getVideoMoiNhat = (from v in db.tbLandingPage_VideoHuongDans
        //                       where v.videohuongdan_cap == "THCS"
        //                       orderby v.videohuongdan_id descending
        //                       select v).Take(1);
        //id_video = getVideoMoiNhat.First().videohuongdan_id;
    }

    //private void CheckLoginState()
    //{
    //    HttpCookie ck = Request.Cookies["taikhoan"];

    //    if (ck != null)
    //    {
    //        // đã đăng nhập ✔️
    //        guestMenu.Visible = false;
    //        userMenu.Visible = true;

    //        string phone = ck.Value;

    //        var tkInfo = (from tk in db.tbAccounts
    //                      join tkc in db.tbAccount_Childrens on tk.account_id equals tkc.account_id
    //                      where tk.account_sodienthoai == phone
    //                      select new
    //                      {
    //                          tkc.account_children_fullname,
    //                          tk.account_id,
    //                          tkc.account_children_image
    //                      }).FirstOrDefault();

    //        if (tkInfo != null)
    //        {
    //            // Gán avatar nếu có
    //            avatarImg.Src = string.IsNullOrEmpty(tkInfo.account_children_image)
    //                ? "/images/user_noimage.jpg"
    //                : tkInfo.account_children_image;
    //            userName.InnerText = tkInfo.account_children_fullname;
    //        }
    //        else
    //        {
    //            // Trường hợp cookie tồn tại nhưng DB không tìm thấy
    //            guestMenu.Visible = true;
    //            userMenu.Visible = false;
    //        }
    //    }
    //    else
    //    {
    //        // chưa đăng nhập ❌
    //        guestMenu.Visible = true;
    //        userMenu.Visible = false;
    //    }
    //}

    //protected void btnLogout_ServerClick(object sender, EventArgs e)
    //{
    //    HttpCookie ck = new HttpCookie("taikhoan");
    //    string s = ck.Value;
    //    ck.Value = "";  //set a blank value to the cookie 
    //    ck.Expires = DateTime.Now.AddDays(-1);
    //    Response.Cookies.Add(ck);
    //    Response.Redirect("/");
    //}
}