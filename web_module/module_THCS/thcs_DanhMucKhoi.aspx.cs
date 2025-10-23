using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_THCS_thcs_DanhMucKhoi : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public int hocsinh_id;
    public string image, video;
    public string tiengnhat6, tiengnhat7, tiengnhat8, tiengnhat9, hiragana, katakana;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["taikhoan"] != null)
        {
            var checkHocSinh = (from hs in db.tbAccounts where hs.account_sodienthoai == Request.Cookies["taikhoan"].Value select hs);
            if (checkHocSinh.Count() > 0)
            {
                var checkHocSinhTrongLop = from hstl in db.tbAccount_Childrens
                                           where hstl.account_id == checkHocSinh.First().account_id && hstl.account_children_active == true
                                           select hstl;
                hocsinh_id = checkHocSinhTrongLop.First().account_children_id;

            }
            else
                hocsinh_id = 1;
        }

        div_DanhMucKhoi6.Visible = false;
        div_DanhMucKhoi7.Visible = false;
        div_DanhMucKhoi8.Visible = false;
        div_DanhMucKhoi9.Visible = false;
        int khoi_id = Convert.ToInt32(RouteData.Values["khoi-id"]);
        var getkhoi = from l in db.tbKhoiLops where l.khoilop_id == khoi_id select l;
        //image = getkhoi.First().khoilop_image;
        //video = getkhoi.First().khoilop_video;
        if (khoi_id == 6)
        {
            div_DanhMucKhoi6.Visible = true;
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
            var getkatakana = db.tbSoLLDT_LichSuHocSinhXemBaiHocs
                .Where(xbh => xbh.sach_id == 2 && xbh.hocsinh_id == hocsinh_id)
                .OrderByDescending(xbh => xbh.baihoc_id)
                .FirstOrDefault();
            if (getkatakana != null && getkatakana.baihoc_id > 0)
            {
                katakana = "danh-muc-sach-2?khoi=6#id_" + (int)getkatakana.baihoc_id;
            }
            else
            {
                katakana = "danh-muc-sach-2?khoi=6";
            }
        }
        if (khoi_id == 7)
        {
            div_DanhMucKhoi7.Visible = true;
            var baihochientaitn7 = db.tbSoLLDT_LichSuHocSinhXemBaiHocs
             .Where(xbh => xbh.sach_id == 3 && xbh.hocsinh_id == hocsinh_id)
             .OrderByDescending(xbh => xbh.baihoc_id)
             .FirstOrDefault();
            if (baihochientaitn7 != null && baihochientaitn7.baihoc_id > 0)
            {
                tiengnhat7 = "danh-muc-sach-3?khoi=7#id_" + (int)baihochientaitn7.baihoc_id;
            }
            else
            {
                tiengnhat7 = "danh-muc-sach-3?khoi=7";
            }
        }
        if (khoi_id == 8)
        {
            div_DanhMucKhoi8.Visible = true;
            tiengnhat7 = "~/web_module/module_THCS/thcs_DanhMucKhoi.aspx";
            var baihochientaitn8 = db.tbSoLLDT_LichSuHocSinhXemBaiHocs
             .Where(xbh => xbh.sach_id == 4 && xbh.hocsinh_id == hocsinh_id)
             .OrderByDescending(xbh => xbh.baihoc_id)
             .FirstOrDefault();
            if (baihochientaitn8 != null && baihochientaitn8.baihoc_id > 0)
            {
                tiengnhat8 = "danh-muc-sach-4?khoi=8#id_" + (int)baihochientaitn8.baihoc_id;
            }
            else
            {
                tiengnhat8 = "danh-muc-sach-4?khoi=8";
            }
        }
        if (khoi_id == 9)
        {
            div_DanhMucKhoi9.Visible = true;
            var baihochientaitn9 = db.tbSoLLDT_LichSuHocSinhXemBaiHocs
             .Where(xbh => xbh.sach_id == 5 && xbh.hocsinh_id == hocsinh_id)
             .OrderByDescending(xbh => xbh.baihoc_id)
             .FirstOrDefault();
            if (baihochientaitn9 != null && baihochientaitn9.baihoc_id > 0)
            {
                tiengnhat7 = "danh-muc-sach-5?khoi=9#id_" + (int)baihochientaitn9.baihoc_id;
            }
            else
            {
                tiengnhat7 = "danh-muc-sach-5?khoi=9";
            }
        }
    }
}