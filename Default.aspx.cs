using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmitLienHe_ServerClick(object sender, EventArgs e)
    {
        // Validate input
        if (string.IsNullOrEmpty(txtSoDienThoaiLienHe.Value.Trim()))
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "AlertBox", "swal('Số điện thoại không được để trống!', '', 'warning')", true);
            return;
        }

        if (string.IsNullOrEmpty(txtHoTenLienHe.Value.Trim()))
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "AlertBox", "swal('Họ tên không được để trống!', '', 'warning')", true);
            return;
        }

        if (string.IsNullOrEmpty(txtNoiDungLienHe.Value.Trim()))
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "AlertBox", "swal('Vui lòng nhập nội dung cần liên hệ!', '', 'warning')", true);
            return;
        }

        // TODO: Save to database if needed
        // Example: Save to a contact/consultation table
        // tbContact contact = new tbContact();
        // contact.contact_phone = txtSoDienThoaiLienHe.Value.Trim();
        // contact.contact_name = txtHoTenLienHe.Value.Trim();
        // contact.contact_content = txtNoiDungLienHe.Value.Trim();
        // contact.contact_date = DateTime.Now;
        // db.tbContacts.InsertOnSubmit(contact);
        // db.SubmitChanges();

        // Clear form
        txtSoDienThoaiLienHe.Value = "";
        txtHoTenLienHe.Value = "";
        txtNoiDungLienHe.Value = "";

        // Show success message
        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "AlertBox", "swal('Đăng kí thành công, chúng tôi sẽ liên hệ với bạn!', '', 'success')", true);
    }
}