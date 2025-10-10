using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public int namhoc_id, khoi_id;
    private int hocsinh_id;
    public string hocsinh_name, hiragana, katakana, khoi7, khoi8, khoi9;

    protected void Page_Load(object sender, EventArgs e)
    {
        namhoc_id = (from nh in db.tbHoctap_NamHocs orderby nh.namhoc_id descending select nh.namhoc_id).First();
        //string[] arrListStr = Request.Cookies["PhuHuynhVietNhat"].Value.Split(',');

        //if (arrListStr[0] == "hocsinh")// nếu là học sinh đăng nhập
        //{
        //    var checkHS = (from hs in db.tbHocSinhs
        //                   where hs.hocsinh_taikhoan == arrListStr[1]
        //                   select hs).Single();
        //    hocsinh_id = checkHS.hocsinh_id;
        //    hocsinh_name = checkHS.hocsinh_hohocsinh + checkHS.hocsinh_name;
        //}
        //else
        //{
        //    var checkHS = (from hs in db.tbHocSinhs
        //                   where hs.hocsinh_taikhoanphuhuynh.Replace("\r\n", string.Empty) == arrListStr[1]
        //                   select hs).FirstOrDefault();
        //    hocsinh_id = checkHS.hocsinh_id;
        //    hocsinh_name = checkHS.hocsinh_hohocsinh + checkHS.hocsinh_name;
        //}
        var gethiragana = db.tbSoLLDT_LichSuHocSinhXemBaiHocs
        .Where(xbh => xbh.sach_id == 1 && xbh.hocsinh_id == hocsinh_id)
        .OrderByDescending(xbh => xbh.baihoc_id)
        .FirstOrDefault();
        if (gethiragana != null && gethiragana.baihoc_id > 0)
        {
            hiragana = "danh-muc-sach-1#id_" + (int)gethiragana.baihoc_id;
        }
        else
        {
            hiragana = "danh-muc-sach-1";
        }
        var getkatakana = db.tbSoLLDT_LichSuHocSinhXemBaiHocs
            .Where(xbh => xbh.sach_id == 2 && xbh.hocsinh_id == hocsinh_id)
            .OrderByDescending(xbh => xbh.baihoc_id)
            .FirstOrDefault();
        if (getkatakana != null && getkatakana.baihoc_id > 0)
        {
            katakana = "danh-muc-sach-2#id_" + (int)getkatakana.baihoc_id;
        }
        else
        {
            katakana = "danh-muc-sach-2";
        }
    }
}
