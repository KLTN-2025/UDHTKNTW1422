using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_usercontrol_global_header_avatar : System.Web.UI.UserControl
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public string fullname, link_image;
    public int conlai_songay, sosao;
    protected void Page_Load(object sender, EventArgs e)
    {
        fullname = (from tkcr in db.tbAccount_Childrens
                    join tk in db.tbAccounts on tkcr.account_id equals tk.account_id
                    where tk.account_sodienthoai == Request.Cookies["taikhoan"].Value
                    select tkcr).FirstOrDefault().account_children_fullname;
        tbAccount account = (from tk in db.tbAccounts
                             where tk.account_sodienthoai == Request.Cookies["taikhoan"].Value
                             select tk).FirstOrDefault();
        //TimeSpan hieu = Convert.ToDateTime(account.account_ngayketthuc) - DateTime.Now;
        //conlai_songay = hieu.Days;
        link_image = (from tkcr in db.tbAccount_Childrens
                      join tk in db.tbAccounts on tkcr.account_id equals tk.account_id
                      where tk.account_sodienthoai == Request.Cookies["taikhoan"].Value
                      select tkcr).FirstOrDefault().account_children_image;

        //đếm sao làm được của toàn bộ 5 khối của HS
        var dataHocSinh = (from hs in db.tbAccounts
                           join cr in db.tbAccount_Childrens on hs.account_id equals cr.account_id
                           where hs.account_sodienthoai == (Request.Cookies["taikhoan"].Value) && cr.account_children_active == true
                           select cr).FirstOrDefault();
        var chitietBaitap = (from ct in db.tbSoLLDT_LichSuLamBaiHocSinhs
                             join cd in db.tbAccount_Childrens on ct.hocsinh_id equals cd.account_children_id
                             where ct.hocsinh_id == dataHocSinh.account_children_id
                             select ct.lichsulambai_sao).Sum() ?? 0;
        sosao = chitietBaitap;
    }

    protected void btnLogout_ServerClick(object sender, EventArgs e)
    {
        HttpCookie ck = new HttpCookie("taikhoan");
        string s = ck.Value;
        ck.Value = "";  //set a blank value to the cookie 
        ck.Expires = DateTime.Now.AddDays(-1);
        Response.Cookies.Add(ck);
        Response.Redirect("/");
    }
}
