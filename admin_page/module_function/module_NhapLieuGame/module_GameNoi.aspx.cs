using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class admin_page_module_function_module_NhapLieuGame_module_GameNoi : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{
        var getSach = from s in db.tbSaches
                      select s;
        ddlSach.DataSource = getSach;
        ddlSach.DataBind();
        //}
        Load();
    }
    public void Load()
    {
        var getThongTin = from c in db.tbGameTiengNhat_Nois
                          join s in db.tbSaches on c.sach_id equals s.sach_id
                          join bh in db.tbBaiHocs on c.baihoc_id equals bh.baihoc_id

                          orderby c.noi_id descending
                          select new
                          {
                              c.noi_id,
                              s.sach_title,
                              bh.baihoc_title,
                              c.noi_noidung,
                              //noi_noidung_mp3 = c.noi_noidung_mp3 == null ? "" : c.noi_noidung_mp3,
                          };
        grvNoi.DataSource = getThongTin;
        grvNoi.DataBind();
    }

    protected void btnThem_Click(object sender, EventArgs e)
    {
        Session["noi_id"] = 0;
        txtTieuDe.Text = "";
        txtNoiDung1.Text = "";
        txtNoiDung2.Text = "";
        HiddenFieldaudioAmThanh1.Value = "";
        HiddenFieldaudioAmThanh2.Value = "";
        HiddenFieldHinhAnh1.Value = "";
        HiddenFieldHinhAnh2.Value = "";
        ddlSach.SelectedIndex = -1;
        ddlBaiHoc.SelectedIndex = -1;
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "popupNoi.Show(); HiddenLoadingIcon();", true);
    }

    protected void btnChiTiet_Click(object sender, EventArgs e)
    {
        int idcauhoi = Convert.ToInt32(grvNoi.GetRowValues(grvNoi.FocusedRowIndex, new string[] { "noi_id" }));
        Session["noi_id"] = idcauhoi;
        var getdulieu = (from c in db.tbGameTiengNhat_Nois where c.noi_id == idcauhoi select c).FirstOrDefault();
        var listsach = from s in db.tbSaches where s.sach_id == getdulieu.sach_id select s;
        ddlSach.DataSource = listsach;
        ddlSach.DataBind();
        ddlSach.Items.FindByText(listsach.First().sach_title).Selected = true;
        var listbaihoc = from bh in db.tbBaiHocs where bh.baihoc_id == getdulieu.baihoc_id select bh;
        ddlBaiHoc.DataSource = listbaihoc;
        ddlBaiHoc.DataBind();
        ddlBaiHoc.Items.FindByText(listbaihoc.First().baihoc_title).Selected = true;
        txtTieuDe.Text = getdulieu.noi_noidung;
        txtNoiDung1.Text = getdulieu.noi_img1;
        txtNoiDung2.Text = getdulieu.noi_img2;
        HiddenFieldaudioAmThanh1.Value = getdulieu.noi_mp3_1;
        HiddenFieldaudioAmThanh2.Value = getdulieu.noi_mp3_2;
        HiddenFieldHinhAnh1.Value = getdulieu.noi_img1;
        HiddenFieldHinhAnh2.Value = getdulieu.noi_img2;
        ddlSach.Attributes.Add("readonly", "readonly");
        ddlBaiHoc.Attributes.Add("readonly", "readonly");
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "text", "showImg1_1('" + getdulieu.noi_mp3_1 + "','" + getdulieu.noi_mp3_2 + "','" + getdulieu.noi_img1 + "','" + getdulieu.noi_img2 + "')", true);
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "popupNoi.Show();HiddenLoadingIcon();", true);
    }

    protected void btnXoa_Click(object sender, EventArgs e)
    {
        int idcauhoi = Convert.ToInt32(grvNoi.GetRowValues(grvNoi.FocusedRowIndex, new string[] { "noi_id" }));
        var getDuLieu = db.tbGameTiengNhat_Nois.Where(ctl => ctl.noi_id == idcauhoi).ToList();
        if (getDuLieu.Any())
        {
            db.tbGameTiengNhat_Nois.DeleteAllOnSubmit(getDuLieu);
        }
        db.SubmitChanges();
        ScriptManager.RegisterStartupScript(Page, this.GetType(), "Alert", @"  swal({title: 'Xóa thành công!', icon: 'success' }).then(function() {grvNoi.UnselectRows(); HiddenLoadingIcon();});", true);
    }

    protected void ddlSach_SelectedIndexChanged(object sender, EventArgs e)
    {
        var getBaiHoc = from bh in db.tbBaiHocs where bh.sach_id == Convert.ToInt32(ddlSach.SelectedItem.Value) select bh;
        ddlBaiHoc.DataSource = getBaiHoc;
        ddlBaiHoc.DataBind();
    }

    protected void btnLuuNoi_Click(object sender, EventArgs e)
    {
        if (ddlSach.SelectedIndex == -1 || ddlBaiHoc.SelectedIndex == -1)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "text", "showError('" + ddlSach.SelectedIndex + "','" + ddlBaiHoc.SelectedIndex + "')", true);
            return;
        }
        else
        {
            var getthongtinsach = from s in db.tbSaches where s.sach_id == Convert.ToInt32(ddlSach.SelectedItem.Value) select s;
            string sachid = Convert.ToString(getthongtinsach.First().lop_id);
            string tensach = Convert.ToString(getthongtinsach.First().sach_title);
            string folderName = "";
            if (tensach.Contains("tập 1"))
                folderName = "TiengViet_1";
            else if (tensach.Contains("tập 2"))
                folderName = "TiengViet_2";
            string relativeFolder = string.Format("/mp3Game/SachKhoi_{0}/{1}/", sachid, folderName);
            string folderPath = Server.MapPath(relativeFolder);
            if (!Directory.Exists(folderPath))
            {
                Directory.CreateDirectory(folderPath);
            }
            string relativeFolderImage = string.Format("/imageGame/SachKhoi_{0}/{1}/", sachid, folderName);
            string folderPathImage = Server.MapPath(relativeFolderImage);
            if (!Directory.Exists(folderPathImage))
            {
                Directory.CreateDirectory(folderPathImage);
            }
            string amthanh1 = FileUploadAmThanh1.HasFile ? SaveAudioFile(FileUploadAmThanh1, folderPath, relativeFolder) : string.IsNullOrWhiteSpace(HiddenFieldaudioAmThanh1.Value) ? null
                    : HiddenFieldaudioAmThanh1.Value;
            string amthanh2 = FileUploadAmThanh2.HasFile ? SaveAudioFile(FileUploadAmThanh2, folderPath, relativeFolder) : string.IsNullOrWhiteSpace(HiddenFieldaudioAmThanh2.Value) ? null
                    : HiddenFieldaudioAmThanh2.Value;
            string hinhAnh1 = FileUploadHinhAnh1.HasFile ? SaveImageFile(FileUploadHinhAnh1, folderPathImage, relativeFolderImage) : string.IsNullOrWhiteSpace(HiddenFieldHinhAnh1.Value) ? null
            : HiddenFieldHinhAnh1.Value;
            string hinhAnh2 = FileUploadHinhAnh2.HasFile ? SaveImageFile(FileUploadHinhAnh2, folderPathImage, relativeFolderImage) : string.IsNullOrWhiteSpace(HiddenFieldHinhAnh2.Value) ? null
            : HiddenFieldHinhAnh2.Value;
            var getthongtinchude = (from bh in db.tbBaiHocs where bh.baihoc_id == Convert.ToInt32(ddlBaiHoc.SelectedItem.Value) select bh.chudebaihoc_id).FirstOrDefault();
            if (Session["noi_id"].ToString() == "0")
            {
                tbGameTiengNhat_Noi ins = new tbGameTiengNhat_Noi();
                ins.sach_id = Convert.ToInt32(ddlSach.SelectedItem.Value);
                ins.chude_id = getthongtinchude;
                ins.baihoc_id = Convert.ToInt32(ddlBaiHoc.SelectedItem.Value);
                ins.noi_noidung = string.IsNullOrWhiteSpace(txtTieuDe.Text) ? null : txtTieuDe.Text;
                ins.noi_img1 = hinhAnh1;
                ins.noi_mp3_1 = amthanh1;
                ins.noi_img1 = string.IsNullOrWhiteSpace(txtNoiDung1.Text) ? null : txtNoiDung1.Text;
                ins.noi_img2 = hinhAnh2;
                ins.noi_mp3_2 = amthanh2;
                ins.noi_img2 = string.IsNullOrWhiteSpace(txtNoiDung2.Text) ? null : txtNoiDung2.Text;
                db.tbGameTiengNhat_Nois.InsertOnSubmit(ins);
                db.SubmitChanges();
                var getdulieu = from c in db.tbGameTiengNhat_Nois where c.sach_id == Convert.ToInt32(ddlSach.SelectedItem.Value) && c.baihoc_id == Convert.ToInt32(ddlBaiHoc.SelectedItem.Value) orderby c.noi_id descending select c;
                var getdulieumoiluu = from c in db.tbGameTiengNhat_Nois where c.sach_id == Convert.ToInt32(ddlSach.SelectedItem.Value) && c.baihoc_id == Convert.ToInt32(ddlBaiHoc.SelectedItem.Value) orderby c.noi_id descending select c;
                getdulieu.First().noi_dapan = Convert.ToString(getdulieumoiluu.First().noi_id);
                db.SubmitChanges();
                amthanh1 = null;
                amthanh2 = null;
                hinhAnh1 = null;
                hinhAnh2 = null;
                txtTieuDe.Text = "";
                txtNoiDung1.Text = "";
                txtNoiDung2.Text = "";
                HiddenFieldaudioAmThanh1.Value = "";
                HiddenFieldaudioAmThanh2.Value = "";
                HiddenFieldHinhAnh1.Value = "";
                HiddenFieldHinhAnh2.Value = "";
                Load();
                ScriptManager.RegisterStartupScript(Page, this.GetType(), "Alert", @" swal({  title: 'Thêm thành công!', icon: 'success' }).then(function() { popupNoi.Hide(); });", true);
            }
            else
            {
                var checkdata = from c in db.tbGameTiengNhat_Nois where c.sach_id == Convert.ToInt32(ddlSach.SelectedItem.Value) && c.baihoc_id == Convert.ToInt32(ddlBaiHoc.SelectedItem.Value) && c.noi_id == Convert.ToInt32(Session["noi_id"].ToString()) select c;
                checkdata.First().noi_noidung = string.IsNullOrWhiteSpace(txtTieuDe.Text) ? null : txtTieuDe.Text;
                checkdata.First().noi_img1 = hinhAnh1;
                checkdata.First().noi_mp3_1 = amthanh1;
                checkdata.First().noi_img1 = string.IsNullOrWhiteSpace(txtNoiDung1.Text) ? null : txtNoiDung1.Text;
                checkdata.First().noi_img2 = hinhAnh2;
                checkdata.First().noi_mp3_2 = amthanh2;
                checkdata.First().noi_img2 = string.IsNullOrWhiteSpace(txtNoiDung2.Text) ? null : txtNoiDung2.Text;
                db.SubmitChanges();
                amthanh1 = null;
                amthanh2 = null;
                hinhAnh1 = null;
                hinhAnh2 = null;
                txtTieuDe.Text = "";
                txtNoiDung1.Text = "";
                txtNoiDung2.Text = "";
                HiddenFieldaudioAmThanh1.Value = "";
                HiddenFieldaudioAmThanh2.Value = "";
                HiddenFieldHinhAnh1.Value = "";
                HiddenFieldHinhAnh2.Value = "";
                Load();
                ScriptManager.RegisterStartupScript(Page, this.GetType(), "Alert", @" swal({  title: 'Cập nhật thành công!', icon: 'success' }).then(function() { popupNoi.Hide(); });", true);
            }
        }
    }
    private string SaveAudioFile(FileUpload uploader, string folderPath, string relativeFolder)
    {
        if (uploader.HasFile)
        {
            string fileName = Path.GetFileName(uploader.PostedFile.FileName); // Giữ nguyên tên gốc
            string fullPath = Path.Combine(folderPath, fileName);
            uploader.SaveAs(fullPath);

            // Trả về đường dẫn tương đối để hiển thị sau này
            return relativeFolder + fileName;
        }
        return "";
    }
    private string SaveImageFile(FileUpload uploader, string folderPath, string relativeFolder)
    {
        if (uploader.HasFile)
        {
            string fileExtension = Path.GetExtension(uploader.FileName).ToLower();
            string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".gif", ".webp" };

            if (!allowedExtensions.Contains(fileExtension))
                return ""; // Không lưu nếu không đúng định dạng ảnh

            string fileName = Path.GetFileName(uploader.FileName);
            string fullPath = Path.Combine(folderPath, fileName);
            uploader.SaveAs(fullPath);

            return relativeFolder + fileName;
        }
        return "";
    }
}