using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_ThongTinCaNhan : System.Web.UI.Page
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
            getThongTinHocSinh.account_sodienthoai = txtSoDienThoai.Value;
            // Mục đích lưu lại cookie
            HttpCookie ck = new HttpCookie("taikhoan");
            string s = ck.Value;
            ck.Value = getThongTinHocSinh.account_sodienthoai;
            ck.Expires = DateTime.Now.AddDays(365);
            Response.Cookies.Add(ck);
            getThongTinHocSinh.account_email = txtEmail.Value;
            db.SubmitChanges();
        }
        tbAccount_Children update = (from cr in db.tbAccount_Childrens
                                        where cr.account_id == getThongTinHocSinh.account_id
                                        select cr).FirstOrDefault();
        update.account_children_fullname = txtHoTen.Value;
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
}