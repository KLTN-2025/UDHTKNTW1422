using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_QuanLyTaiKhoan : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public int conlai_songay;
    public string canhbao_hethan, goi_sudung;
    protected void Page_Load(object sender, EventArgs e)
    {
        tbAccount account = (from tk in db.tbAccounts
                             where tk.account_sodienthoai == Request.Cookies["taikhoan"].Value
                             select tk).FirstOrDefault();
        //TimeSpan hieu = Convert.ToDateTime(account.account_ngayketthuc) - DateTime.Now;
        //goi_sudung = account.account_goi;
        //conlai_songay = hieu.Days;
        //if (conlai_songay <= 3)
        //    canhbao_hethan = "Sắp hết hạn";
    }
}