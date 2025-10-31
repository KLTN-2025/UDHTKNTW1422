using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class app_Register : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    public string hoten, sodienthoai, email, lop, goi, style1, style2;
    protected void Page_Load(object sender, EventArgs e)
    {
        style1 = "display: none;";
        style2 = "display: none;";
        if (!IsPostBack)
        {
            style1 = "";
            style2 = "display: none;";
            var getLop = from l in db.tbKhoiLops where l.khoilop_active == true && l.khoilop_name != null select l;
            ddlLop.Items.Clear();
            ddlLop.AppendDataBoundItems = true;
            ddlLop.Items.Add("Chọn lớp");
            ddlLop.DataSource = getLop;
            ddlLop.DataTextField = "khoilop_name";
            ddlLop.DataValueField = "khoilop_id";
            ddlLop.DataBind();
        }
    }

    protected void btnLuu_Click(object sender, EventArgs e)
    {
        cls_security md5 = new cls_security();
        string passmd5 = md5.HashCode(txtPassWord.Value);
        tbAccount account = new tbAccount();
        account.account_sodienthoai = txtSoDienThoai.Value;
        account.account_matkhau = passmd5;
        account.account_active = true;
        account.account_email = txtEmail.Value;
        db.tbAccounts.InsertOnSubmit(account);
        db.SubmitChanges();
        tbAccount_Children account_Children = new tbAccount_Children();
        account_Children.account_children_fullname = txtHoTen.Value;
        account_Children.account_children_active = true;
        account_Children.lop_id = Convert.ToInt32(ddlLop.SelectedValue);
        account_Children.account_id = account.account_id;
        db.tbAccount_Childrens.InsertOnSubmit(account_Children);
        db.SubmitChanges();
        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "AlertBox", "swal('Đăng kí tài khoản thành công!', '','success').then(function(){window.location = '/app-login';})", true);

    }
}