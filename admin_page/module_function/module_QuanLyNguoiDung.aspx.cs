using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_function_module_QuanLyNguoiDung : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();

    protected void Page_Load(object sender, EventArgs e)
    {
        Load();
    }
    public void Load()
    {
        var getUserData = from ac in db.tbAccounts
                          join acc in db.tbAccount_Childrens on ac.account_id equals acc.account_id
                          select new
                          {
                              ac.account_id,
                              ac.account_sodienthoai,
                              ac.account_email,
                              ac.account_active,
                              acc.account_children_id,
                              acc.account_children_fullname,
                              acc.account_children_ngaysinh,
                              acc.lop_id,
                              acc.account_children_image
                          };
        grvUser.DataSource = getUserData;
        grvUser.DataBind();
    }

    protected void btnXoa_Click(object sender, EventArgs e)
    {
        var selectedKey = grvUser.GetSelectedFieldValues(new[] { "account_id" });
        if (selectedKey.Count == 0)
        {
            alert.alert_Warning(Page, "Bạn chưa chọn dữ liệu", "");
            return;
        }

        var ids = selectedKey.Select(x => Convert.ToInt32(x)).ToList();

        var users = db.tbAccounts
                      .Where(x => ids.Contains(x.account_id) && x.account_active == true)
                      .ToList();

        foreach (var user in users)
        {
            user.account_active = false;

            foreach (var c in user.tbAccount_Childrens)
                c.account_children_active = false;
        }
        db.SubmitChanges();
        ScriptManager.RegisterStartupScript(Page, GetType(), "Alert", @"swal({ title: 'Chặn người dùng thành công!', icon: 'success' }).then(() => { grvUser.UnselectRows(); HiddenLoadingIcon(); });", true);
    }


    protected void btnBoChan_Click(object sender, EventArgs e)
    {
        var selectedKey = grvUser.GetSelectedFieldValues(new[] { "account_id" });
        if (selectedKey.Count == 0)
        {
            alert.alert_Warning(Page, "Bạn chưa chọn dữ liệu", "");
            return;
        }

        var ids = selectedKey.Select(x => Convert.ToInt32(x)).ToList();

        var users = db.tbAccounts
                      .Where(x => ids.Contains(x.account_id) && x.account_active == false)
                      .ToList();

        if (users.Count == 0)
        {
            alert.alert_Warning(Page, "Không có người dùng nào đang bị chặn", "");
            return;
        }

        foreach (var user in users)
        {
            user.account_active = true;

            foreach (var c in user.tbAccount_Childrens)
                c.account_children_active = true;
        }
        db.SubmitChanges();
        ScriptManager.RegisterStartupScript(Page, GetType(), "Alert", @"swal({ title: 'Bỏ chặn người dùng thành công!', icon: 'success' }).then(() => { grvUser.UnselectRows(); HiddenLoadingIcon(); });", true);
    }
}