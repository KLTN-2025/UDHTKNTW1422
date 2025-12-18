using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    cls_WebsiteLienHe cls = new cls_WebsiteLienHe();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private void setNull()
    {
        txtHoTenLienHe.Value = "";
        txtSoDienThoaiLienHe.Value = "";
        txtNoiDungLienHe.Value = "";

    }

    protected void btnSubmitLienHe_ServerClick(object sender, EventArgs e)
    {
        try
        {
            if (cls.insert_Data(txtHoTenLienHe.Value, txtSoDienThoaiLienHe.Value, txtNoiDungLienHe.Value))
            {
                alert.alert_Success(Page, "Cảm ơn bạn đã gửi thông tin liên hệ tới chúng tôi!", "");
                setNull();
            }
        }
        catch { setNull(); }
    }
}