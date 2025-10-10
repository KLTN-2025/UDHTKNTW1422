using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        // var check tài khoản
        if (Request.Cookies["taikhoan"] != null)
        {
            var checktaikhoan = from tb in db.tbAccounts where tb.account_sodienthoai == Request.Cookies["taikhoan"].Value select tb;
            if (checktaikhoan.Count() > 0)
            {
                var getData = (from tb in db.tbAccounts
                               join tbc in db.tbAccount_Childrens on tb.account_id equals tbc.account_id
                               where tb.account_sodienthoai == Request.Cookies["taikhoan"].Value && tbc.children_active == true
                               select tbc.lop_id).FirstOrDefault();

                if (getData > 5 && getData < 10)
                    Response.Redirect("/app-thcs");
                else
                {
                    if (getData >= 10)
                        Response.Redirect("/app-thpt");
                    else
                        Response.Redirect("/tieu-hoc-trang-chu");
                }
            }
        }
    }
}