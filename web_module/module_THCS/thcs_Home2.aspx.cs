using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_THCS_thcs_Home2 : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        // Check Học sinh đang học lớp mấy
        var checkHocSinh = db.tbAccounts
    .Where(hs => hs.account_sodienthoai == Request.Cookies["taikhoan"].Value);

        if (checkHocSinh.Any())
        {
            var checkHocSinhTrongLop = db.tbAccount_Childrens
                .Where(hstl => hstl.account_id == checkHocSinh.First().account_id
                            && hstl.account_children_active == true)
                .FirstOrDefault();

            if (checkHocSinhTrongLop != null)
            {
                int currentClass = Convert.ToInt32(checkHocSinhTrongLop.lop_id);
                // list ID control và icon tương ứng theo index
                var classControls = new[] { id_Lop6, id_Lop7, id_Lop8, id_Lop9 };
                var lockIcons = new[] { iconLock1, iconLock2, iconLock3, iconLock4 };

                for (int i = 0; i < classControls.Length; i++)
                {
                    int classNumber = 6 + i; // Lớp 6,7,8,9

                    if (classNumber == currentClass)
                    {
                        // mở lớp hiện tại
                        classControls[i].Attributes["class"] = "class-item color";
                        lockIcons[i].Visible = false;
                    }
                    else
                    {
                        // khóa các lớp khác
                        classControls[i].Attributes["class"] = "class-item color locked";
                        lockIcons[i].Visible = true;
                        classControls[i].Attributes["href"] = "javascript:void(0)";
                    }
                }
            }
        }
    }
}