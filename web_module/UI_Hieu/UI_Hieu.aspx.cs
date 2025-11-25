using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_UI_Hieu_UI_Hieu : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public int hocsinh_id;
    public string image, video;
    public string tiengnhat6, tiengnhat7, tiengnhat8, tiengnhat9, hiragana, katakana;

    protected void Page_Load(object sender, EventArgs e)
    {
        int khoi_id = Convert.ToInt32(RouteData.Values["khoi-id"]);
        var getkhoi = from l in db.tbKhoiLops where l.khoilop_id == khoi_id select l;
        var gethiragana = db.tbSoLLDT_LichSuHocSinhXemBaiHocs
                     .Where(xbh => xbh.sach_id == 1 && xbh.hocsinh_id == hocsinh_id)
                     .OrderByDescending(xbh => xbh.baihoc_id)
                     .FirstOrDefault();
        if (gethiragana != null && gethiragana.baihoc_id > 0)
        {
            hiragana = "danh-muc-sach-1?khoi=6#id_" + (int)gethiragana.baihoc_id;
        }
        else
        {
            hiragana = "danh-muc-sach-1?khoi=6";
        }
    }
}