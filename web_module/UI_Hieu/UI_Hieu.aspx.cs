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
    public string book1_title, book2_title, book1_image, book2_image;
    public int khoi_id;

    protected void Page_Load(object sender, EventArgs e)
    {
        // Get khoi_id from URL path (app-danh-muc-khoi-thcs-6, app-danh-muc-khoi-thcs-7, etc.)
        khoi_id = 6; // Default to 6
        string urlPath = Request.Path.ToLower();
        if (urlPath.Contains("app-danh-muc-khoi-thcs-"))
        {
            string[] parts = urlPath.Split('-');
            if (parts.Length > 0)
            {
                string lastPart = parts[parts.Length - 1];
                int.TryParse(lastPart, out khoi_id);
            }
        }
        
        // Get hocsinh_id if user is logged in
        if (Request.Cookies["taikhoan"] != null)
        {
            var checkHocSinh = (from hs in db.tbAccounts where hs.account_sodienthoai == Request.Cookies["taikhoan"].Value select hs);
            if (checkHocSinh.Count() > 0)
            {
                var checkHocSinhTrongLop = from hstl in db.tbAccount_Childrens
                                           where hstl.account_id == checkHocSinh.First().account_id && hstl.account_children_active == true
                                           select hstl;
                if (checkHocSinhTrongLop.Count() > 0)
                {
                    hocsinh_id = checkHocSinhTrongLop.First().account_children_id;
                }
            }
        }
        
        // Determine sach_id based on khoi_id
        // Lớp 6: sach_id 1 (Hiragana), 2 (Katakana)
        // Lớp 7: sach_id 3
        // Lớp 8: sach_id 4
        // Lớp 9: sach_id 5
        int sach_id_1 = 1; // First book
        int sach_id_2 = 2; // Second book
        
        if (khoi_id == 7)
        {
            sach_id_1 = 3;
            sach_id_2 = 3; // Can be adjusted based on actual data
        }
        else if (khoi_id == 8)
        {
            sach_id_1 = 4;
            sach_id_2 = 4; // Can be adjusted based on actual data
        }
        else if (khoi_id == 9)
        {
            sach_id_1 = 5;
            sach_id_2 = 5; // Can be adjusted based on actual data
        }
        
        // For classes 7, 8, 9, we'll use the same book for both links or adjust as needed
        // Get book titles and images from database
        var getSach1Info = (from s in db.tbSaches where s.sach_id == sach_id_1 select s).FirstOrDefault();
        var getSach2Info = (from s in db.tbSaches where s.sach_id == sach_id_2 select s).FirstOrDefault();
        
        if (getSach1Info != null)
        {
            book1_title = getSach1Info.sach_title ?? "Sách " + sach_id_1;
            book1_image = "/images/Bang_chu_cai_Hiragana/Hiragana.jpg"; // Default, can be updated
        }
        else
        {
            book1_title = "Sách " + sach_id_1;
            book1_image = "/images/Bang_chu_cai_Hiragana/Hiragana.jpg";
        }
        
        if (getSach2Info != null)
        {
            book2_title = getSach2Info.sach_title ?? "Sách " + sach_id_2;
            book2_image = "/images/Bang_chu_cai_Katakana/Katakana.jpg"; // Default, can be updated
        }
        else
        {
            book2_title = "Sách " + sach_id_2;
            book2_image = "/images/Bang_chu_cai_Katakana/Katakana.jpg";
        }
        
        if (khoi_id == 6)
        {
            // Lớp 6: Hiragana and Katakana
            book1_title = "Bảng chữ cái Hiragana";
            book2_title = "Bảng chữ cái Katakana";
            book1_image = "/images/Bang_chu_cai_Hiragana/Hiragana.jpg";
            book2_image = "/images/Bang_chu_cai_Katakana/Katakana.jpg";
            
            var gethiragana = db.tbSoLLDT_LichSuHocSinhXemBaiHocs
             .Where(xbh => xbh.sach_id == 1 && xbh.hocsinh_id == hocsinh_id)
             .OrderByDescending(xbh => xbh.baihoc_id)
             .FirstOrDefault();
            if (gethiragana != null && gethiragana.baihoc_id > 0)
            {
                hiragana = "danh-muc-sach-1";
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
                katakana = "danh-muc-sach-2";
            }
            else
            {
                katakana = "danh-muc-sach-2?khoi=6";
            }
        }
        else
        {
            // Lớp 7, 8, 9: Use sach_id corresponding to khoi
            var getSach1 = db.tbSoLLDT_LichSuHocSinhXemBaiHocs
             .Where(xbh => xbh.sach_id == sach_id_1 && xbh.hocsinh_id == hocsinh_id)
             .OrderByDescending(xbh => xbh.baihoc_id)
             .FirstOrDefault();
            if (getSach1 != null && getSach1.baihoc_id > 0)
            {
                hiragana = "danh-muc-sach-" + sach_id_1;
            }
            else
            {
                hiragana = "danh-muc-sach-" + sach_id_1 + "?khoi=" + khoi_id;
            }
            
            // For classes 7, 8, 9, if there's a second book, use it; otherwise use the same
            var getSach2 = db.tbSoLLDT_LichSuHocSinhXemBaiHocs
                .Where(xbh => xbh.sach_id == sach_id_2 && xbh.hocsinh_id == hocsinh_id)
                .OrderByDescending(xbh => xbh.baihoc_id)
                .FirstOrDefault();
            if (getSach2 != null && getSach2.baihoc_id > 0)
            {
                katakana = "danh-muc-sach-" + sach_id_2;
            }
            else
            {
                katakana = "danh-muc-sach-" + sach_id_2 + "?khoi=" + khoi_id;
            }
        }
    }
}
