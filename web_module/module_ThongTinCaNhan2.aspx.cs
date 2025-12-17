using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_ThongTinCaNhan2 : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public string tendangnhap, lop, sdt, gioitinh, name, image1;
    public DateTime ngaysinh;
    cls_Alert alert = new cls_Alert();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var getThongTinHocSinh = (from ac in db.tbAccounts
                                      join acchil in db.tbAccount_Childrens on ac.account_id equals acchil.account_id
                                      join l in db.tbLops on acchil.lop_id equals l.lop_id
                                      where acchil.account_children_active == true && ac.account_sodienthoai == Request.Cookies["taikhoan"].Value && ac.account_active == true
                                      select new
                                      {
                                          name = acchil.account_children_fullname,
                                          sodienthoai = ac.account_sodienthoai,
                                          gioitinh = acchil.account_children_gioitinh,
                                          acchil.account_children_image,
                                          lop = acchil.lop_id,
                                          ngaysinh = acchil.account_children_ngaysinh,
                                          ac.account_email
                                      }).FirstOrDefault();
            tendangnhap = getThongTinHocSinh.sodienthoai;
            txtHoTen.Value = getThongTinHocSinh.name;
            image1 = getThongTinHocSinh.account_children_image;
            imgPreview1.Src = image1;
            //ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "showImg1('" + image1 + "'); ", true);
            txtLop.Value = getThongTinHocSinh.lop + "";
            dteNgaySinh.Value = getThongTinHocSinh.ngaysinh != null ? getThongTinHocSinh.ngaysinh.Value.ToString("yyyy-MM-dd").Replace(' ', 'T') : "dd/MM/yyyy";
            txtSoDienThoai.Value = getThongTinHocSinh.sodienthoai;
            txtEmail.Value = getThongTinHocSinh.account_email;
        }
    }

    protected void btnSave_ServerClick(object sender, EventArgs e)
    {
        if (Page.IsValid && FileUpload1.HasFile)
        {
            int maxFileSize = 2 * 1024 * 1024;
            if (FileUpload1.PostedFile.ContentLength > maxFileSize)
            {
                alert.alert_Error(Page, "Ảnh quá lớn! Vui lòng chọn ảnh dưới 2MB.", "");
                return; 
            }
            String folderUser = Server.MapPath("~/uploadimages/avatar-hoc-sinh/");
            if (!Directory.Exists(folderUser))
            {
                Directory.CreateDirectory(folderUser);
            }
            //string filename;
            string ulr = "/uploadimages/avatar-hoc-sinh/";
            HttpFileCollection hfc = Request.Files;
            string filename = Path.GetRandomFileName() + Path.GetExtension(FileUpload1.FileName);
            string fileName_save = Path.Combine(Server.MapPath("~/uploadimages/avatar-hoc-sinh"), filename);
            FileUpload1.SaveAs(fileName_save);
            image1 = ulr + filename;
        }
        tbAccount getThongTinHocSinh = (from ac in db.tbAccounts
                                        where ac.account_sodienthoai == Request.Cookies["taikhoan"].Value && ac.account_active == true
                                        select ac).FirstOrDefault();
        if (getThongTinHocSinh != null)
        {
            // Check if phone number is being changed
            string newPhoneNumber = txtSoDienThoai.Value.Trim();
            string currentPhoneNumber = getThongTinHocSinh.account_sodienthoai;
            
            // If phone number is different, check for duplicates
            if (newPhoneNumber != currentPhoneNumber)
            {
                // Check if phone number already exists (excluding current user)
                bool phoneExists = db.tbAccounts.Any(ac => ac.account_sodienthoai == newPhoneNumber 
                    && ac.account_id != getThongTinHocSinh.account_id 
                    && ac.account_active == true);
                
                if (phoneExists)
                {
                    alert.alert_Error(Page, "Số điện thoại đã tồn tại", "");
                    return;
                }
            }
            
            // Check if email is being changed
            string newEmail = txtEmail.Value.Trim();
            string currentEmail = getThongTinHocSinh.account_email ?? "";
            
            // If email is different, check for duplicates
            if (!string.IsNullOrEmpty(newEmail) && newEmail.ToLower() != currentEmail.ToLower())
            {
                // Check if email already exists (excluding current user)
                bool emailExists = db.tbAccounts.Any(ac => ac.account_email != null 
                    && ac.account_email.ToLower() == newEmail.ToLower()
                    && ac.account_id != getThongTinHocSinh.account_id 
                    && ac.account_active == true);
                
                if (emailExists)
                {
                    alert.alert_Error(Page, "Email đã tồn tại", "");
                    return;
                }
            }
            
            getThongTinHocSinh.account_sodienthoai = newPhoneNumber;
            // Mục đích lưu lại cookie
            HttpCookie ck = new HttpCookie("taikhoan");
            string s = ck.Value;
            ck.Value = getThongTinHocSinh.account_sodienthoai;
            ck.Expires = DateTime.Now.AddDays(365);
            Response.Cookies.Add(ck);
            getThongTinHocSinh.account_email = newEmail;
            db.SubmitChanges();
        }
        tbAccount_Children update = (from cr in db.tbAccount_Childrens
                                     where cr.account_id == getThongTinHocSinh.account_id
                                     select cr).FirstOrDefault();
        
        if (update != null)
        {
            // Check if full name is being changed
            string newFullName = txtHoTen.Value.Trim();
            string currentFullName = update.account_children_fullname ?? "";
            
            // If full name is different, check for duplicates
            if (newFullName != currentFullName)
            {
                // Check if full name already exists (excluding current user)
                bool fullNameExists = db.tbAccount_Childrens.Any(ac => ac.account_children_fullname != null 
                    && ac.account_children_fullname.Trim() == newFullName
                    && ac.account_children_id != update.account_children_id 
                    && ac.account_children_active == true);
                
                if (fullNameExists)
                {
                    alert.alert_Error(Page, "Họ và tên đã tồn tại", "");
                    return;
                }
            }
            
            update.account_children_fullname = newFullName;
            update.lop_id = Convert.ToInt32(txtLop.Value);
            if (image1 != null)
            {
                update.account_children_image = image1;
            }
            if (dteNgaySinh.Value != "")
            {
                update.account_children_ngaysinh = Convert.ToDateTime(dteNgaySinh.Value);
            }

            //        if (rdNam.Checked == true)
            //update.children_gioitinh = "Nam";
            //  else
            //      update.children_gioitinh = "Nữ";
            db.SubmitChanges();
            alert.alert_Success(Page, "Đã cập nhật thông tin cá nhân", "");

            imgPreview1.Src = update.account_children_image;
        }
        //ScriptManager.RegisterStartupScript(this, GetType(), "reloadPage", "setTimeout(function(){ location.reload(); }, 1200);", true);
    }
}