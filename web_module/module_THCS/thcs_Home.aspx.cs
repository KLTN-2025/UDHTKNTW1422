using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_THCS_thcs_Home : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        // Check Học sinh đang học lớp mấy
        var checkHocSinh = (from hs in db.tbAccounts where hs.account_sodienthoai == Request.Cookies["taikhoan"].Value select hs);
        //if (checkHocSinh.Count() > 0)
        //{
        //    // Kiểm tra học sinh hiện tại đã học lớp mấy
        //    var checkHocSinhTrongLop = from hstl in db.tbAccount_Childrens
        //                               where hstl.account_id == checkHocSinh.First().account_id && hstl.account_children_active == true
        //                               select hstl;
            
        //    if (checkHocSinhTrongLop.First().lop_id == 6)
        //    {
        //        id_Lop6.Attributes["class"] = "class-item color";
        //        iconLock1.Visible = false;
        //        id_Lop7.Attributes["class"] = "class-item color";
        //        iconLock2.Visible = false;
        //    }
        //    if (checkHocSinhTrongLop.First().lop_id == 7)
        //    {
        //        id_Lop0.Attributes["class"] = "class-item color";
        //        iconLock0.Visible = false;
        //        id_Lop1.Attributes["class"] = "class-item color";
        //        iconLock1.Visible = false;
        //        id_Lop2.Attributes["class"] = "class-item color";
        //        iconLock2.Visible = false;
        //    }
        //    if (checkHocSinhTrongLop.First().lop_id == 8)
        //    {
        //        id_Lop0.Attributes["class"] = "class-item color";
        //        iconLock0.Visible = false;
        //        id_Lop1.Attributes["class"] = "class-item color";
        //        iconLock1.Visible = false;
        //        id_Lop2.Attributes["class"] = "class-item color";
        //        iconLock2.Visible = false;
        //        id_Lop3.Attributes["class"] = "class-item color";
        //        iconLock3.Visible = false;
        //    }
        //    if (checkHocSinhTrongLop.First().lop_id == 9)
        //    {
        //        id_Lop0.Attributes["class"] = "class-item color";
        //        iconLock0.Visible = false;
        //        id_Lop1.Attributes["class"] = "class-item color";
        //        iconLock1.Visible = false;
        //        id_Lop2.Attributes["class"] = "class-item color";
        //        iconLock2.Visible = false;
        //        id_Lop3.Attributes["class"] = "class-item color";
        //        iconLock3.Visible = false;
        //        id_Lop4.Attributes["class"] = "class-item color";
        //        iconLock4.Visible = false;
        //    }
        //}
    }
}