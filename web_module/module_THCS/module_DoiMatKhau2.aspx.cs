using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_THCS_module_DoiMatKhau2 : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public string matkhau;
    cls_Alert alert = new cls_Alert();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnDoiMK_ServerClick(object sender, EventArgs e)
    {
        // Kiểm tra các trường có rỗng không
        if (string.IsNullOrEmpty(txtMatKhauCu.Value.Trim()))
        {
            alert.alert_Warning(Page, "Vui lòng nhập mật khẩu cũ", "");
            return;
        }

        if (string.IsNullOrEmpty(txtMatKhauMoi.Value.Trim()))
        {
            alert.alert_Warning(Page, "Vui lòng nhập mật khẩu mới", "");
            return;
        }

        if (string.IsNullOrEmpty(txtNhapLaiMatKhauMoi.Value.Trim()))
        {
            alert.alert_Warning(Page, "Vui lòng nhập lại mật khẩu mới", "");
            return;
        }

        // Kiểm tra độ dài mật khẩu mới
        if (txtMatKhauMoi.Value.Trim().Length < 5)
        {
            alert.alert_Warning(Page, "Mật khẩu mới phải có ít nhất 5 ký tự", "");
            return;
        }

        // Kiểm tra mật khẩu mới và nhập lại có khớp không
        if (txtMatKhauMoi.Value.Trim() != txtNhapLaiMatKhauMoi.Value.Trim())
        {
            alert.alert_Error(Page, "Mật khẩu mới và nhập lại không khớp!", "");
            return;
        }

        // Kiểm tra mật khẩu mới có giống mật khẩu cũ không
        if (txtMatKhauCu.Value.Trim() == txtMatKhauMoi.Value.Trim())
        {
            alert.alert_Warning(Page, "Mật khẩu mới phải khác mật khẩu cũ", "");
            return;
        }

        // Kiểm tra cookie có tồn tại không
        if (Request.Cookies["taikhoan"] == null || string.IsNullOrEmpty(Request.Cookies["taikhoan"].Value))
        {
            alert.alert_Error(Page, "Phiên đăng nhập đã hết hạn. Vui lòng đăng nhập lại", "");
            return;
        }

        try
        {
            cls_security md5 = new cls_security();
            string passmd5 = md5.HashCode(txtMatKhauCu.Value.Trim());
            
            tbAccount getThongTinTaiKhoan = (from ac in db.tbAccounts
                                             where ac.account_sodienthoai == Request.Cookies["taikhoan"].Value 
                                             && ac.account_matkhau == passmd5
                                             && ac.account_active == true
                                             select ac).FirstOrDefault();
            
            if (getThongTinTaiKhoan != null)
            {
                string passmoimahoa = md5.HashCode(txtMatKhauMoi.Value.Trim());
                getThongTinTaiKhoan.account_matkhau = passmoimahoa;
                db.SubmitChanges();

                // Clear các trường input sau khi đổi thành công
                txtMatKhauCu.Value = "";
                txtMatKhauMoi.Value = "";
                txtNhapLaiMatKhauMoi.Value = "";

                // Hiển thị thông báo thành công với thông tin chi tiết
                alert.alert_Success(Page, "Đổi mật khẩu thành công!", "Mật khẩu của bạn đã được cập nhật. Vui lòng sử dụng mật khẩu mới cho lần đăng nhập tiếp theo.");
            }
            else
            {
                alert.alert_Error(Page, "Mật khẩu cũ không đúng", "Vui lòng kiểm tra lại mật khẩu cũ của bạn");
            }
        }
        catch (Exception ex)
        {
            alert.alert_Error(Page, "Lỗi hệ thống", "Đã xảy ra lỗi khi đổi mật khẩu. Vui lòng thử lại sau.");
            System.Diagnostics.Debug.WriteLine("Error changing password: " + ex.ToString());
        }
    }
}