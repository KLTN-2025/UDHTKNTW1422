using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class admin_page_module_function_module_NhapLieuGame_module_GameTracNghiem : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    protected void Page_Load(object sender, EventArgs e)
    {
        var getSach = from s in db.tbSaches
                      select s;
        ddlSach.DataSource = getSach;
        ddlSach.DataBind();
        Load();
    }
    public void Load()
    {
        var getThongTin = from ctd in db.tbGameTiengNhat_CauHois
                          join s in db.tbSaches on ctd.sach_id equals s.sach_id
                          join bh in db.tbBaiHocs on ctd.baihoc_id equals bh.baihoc_id
                          where ctd.cauhoi_group == "TracNghiem" && ctd.cauhoi_image1 == null
                          orderby ctd.cauhoi_id descending
                          select new
                          {
                              ctd.cauhoi_id,
                              s.sach_title,
                              bh.baihoc_title,
                              ctd.cauhoi_image,
                              ctd.cauhoi_titlecauhoi,
                              cauhoi_content = System.Text.RegularExpressions.Regex.Replace(ctd.cauhoi_content ?? "", "<.*?>", ""),
                              cauhoi_mp3 = ctd.cauhoi_mp3 == null ? "" : ctd.cauhoi_mp3,
                          };
        grvTracNghiem.DataSource = getThongTin;
        grvTracNghiem.DataBind();
    }
    protected void ddlSach_SelectedIndexChanged(object sender, EventArgs e)
    {
        var getBaiHoc = from bh in db.tbBaiHocs where bh.sach_id == Convert.ToInt32(ddlSach.SelectedItem.Value) select bh;
        ddlBaiHoc.DataSource = getBaiHoc;
        ddlBaiHoc.DataBind();
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

    protected void btnThem_Click(object sender, EventArgs e)
    {
        Session["cauhoi_id"] = 0;
        ddlSach.SelectedIndex = -1;
        ddlBaiHoc.SelectedIndex = -1;
        ddlBaiHoc.Items.Clear();
        txtTieuDe.Text = "";
        txtCauHoi.Text = "";
        HiddenFieldCauHoi.Value = "";
        HiddenFieldHinhAnh.Value = "";
        HiddenFieldHinhAnhDapAn1.Value = "";
        txtDapAn1.Text = "";
        HiddenFieldHinhAnhDapAn2.Value = "";
        txtDapAn2.Text = "";
        HiddenFieldHinhAnhDapAn3.Value = "";
        txtDapAn3.Text = "";
        HiddenFieldDapAn1.Value = "";
        HiddenFieldDapAn2.Value = "";
        HiddenFieldDapAn3.Value = "";
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "popupTracNghiem.Show(); HiddenLoadingIcon();", true);
    }
    protected void btnChiTiet_Click(object sender, EventArgs e)
    {
        int idcauhoi = Convert.ToInt32(grvTracNghiem.GetRowValues(grvTracNghiem.FocusedRowIndex, new string[] { "cauhoi_id" }));
        Session["cauhoi_id"] = idcauhoi;
        var getdulieucauhoi = (from ch in db.tbGameTiengNhat_CauHois where ch.cauhoi_id == idcauhoi select ch).FirstOrDefault();
        var getdulieucautraloi = (from ctl in db.tbGameTiengNhat_CauTraLois where ctl.cauhoi_id == getdulieucauhoi.cauhoi_id select ctl).ToList();
        var listsach = from s in db.tbSaches where s.sach_id == getdulieucauhoi.sach_id select s;
        ddlSach.DataSource = listsach;
        ddlSach.DataBind();
        ddlSach.Items.FindByText(listsach.First().sach_title).Selected = true;
        var listbaihoc = from bh in db.tbBaiHocs where bh.baihoc_id == getdulieucauhoi.baihoc_id select bh;
        ddlBaiHoc.DataSource = listbaihoc;
        ddlBaiHoc.DataBind();
        ddlBaiHoc.Items.FindByText(listbaihoc.First().baihoc_title).Selected = true;
        txtTieuDe.Text = System.Text.RegularExpressions.Regex.Replace(getdulieucauhoi.cauhoi_content ?? "", "<.*?>", "");
        txtCauHoi.Text = getdulieucauhoi.cauhoi_titlecauhoi;
        txtDapAn1.Text = getdulieucautraloi[0].cautraloi_text;
        txtDapAn2.Text = getdulieucautraloi[1].cautraloi_text;
        txtDapAn3.Text = getdulieucautraloi[2].cautraloi_text;
        HiddenFieldHinhAnh.Value = getdulieucauhoi.cauhoi_image;
        HiddenFieldCauHoi.Value = getdulieucauhoi.cauhoi_mp3;
        HiddenFieldHinhAnhDapAn1.Value = getdulieucautraloi[0].cautraloi_image;
        HiddenFieldHinhAnhDapAn2.Value = getdulieucautraloi[1].cautraloi_image;
        HiddenFieldHinhAnhDapAn3.Value = getdulieucautraloi[2].cautraloi_image;
        HiddenFieldDapAn1.Value = getdulieucautraloi[0].cautraloi_mp3;
        HiddenFieldDapAn2.Value = getdulieucautraloi[1].cautraloi_mp3;
        HiddenFieldDapAn3.Value = getdulieucautraloi[2].cautraloi_mp3;
        ddlSach.Attributes.Add("readonly", "readonly");
        ddlBaiHoc.Attributes.Add("readonly", "readonly");
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "text", "showImg1_1('" + getdulieucauhoi.cauhoi_image + "','" + getdulieucautraloi[0].cautraloi_image + "','" + getdulieucautraloi[1].cautraloi_image + "','" + getdulieucautraloi[2].cautraloi_image + "','" + getdulieucauhoi.cauhoi_mp3 + "','" + getdulieucautraloi[0].cautraloi_mp3 + "','" + getdulieucautraloi[1].cautraloi_mp3 + "','" + getdulieucautraloi[2].cautraloi_mp3 + "')", true);
        //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "text", "showImg1_1('" + getdulieucauhoi.cauhoi_content_mp3 + "','" + getdulieucauhoi.cauhoi_image + "','" + getdulieucauhoi.cauhoi_mp3 + "','" + getdulieucautraloi[0].cautraloi_image + "','" + getdulieucautraloi[1].cautraloi_image + "','" + getdulieucautraloi[2].cautraloi_image + "','" + getdulieucautraloi[0].cautraloi_mp3 + "','" + getdulieucautraloi[1].cautraloi_mp3 + "','" + getdulieucautraloi[2].cautraloi_mp3 + "')", true);
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "popupTracNghiem.Show();HiddenLoadingIcon();", true);
    }

    protected void btnLuuTracNghiem_Click(object sender, EventArgs e)
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
            string amthanhtieude = FileUploadTieuDe.HasFile ? SaveAudioFile(FileUploadTieuDe, folderPath, relativeFolder) : string.IsNullOrWhiteSpace(hdTieuDeAudioTieuDe.Value) ? null
                : hdTieuDeAudioTieuDe.Value;
            string amthanhcauhoi = FileUploadCauHoi.HasFile ? SaveAudioFile(FileUploadCauHoi, folderPath, relativeFolder) : string.IsNullOrWhiteSpace(HiddenFieldCauHoi.Value) ? null
                : HiddenFieldCauHoi.Value;
            string hinhanhcauhoi = FileUploadHinhAnh.HasFile ? SaveImageFile(FileUploadHinhAnh, folderPathImage, relativeFolderImage) : string.IsNullOrWhiteSpace(HiddenFieldHinhAnh.Value) ? null
                : HiddenFieldHinhAnh.Value;
            string hinhanhdapan1 = FileUploadHinhAnhDapAn1.HasFile ? SaveImageFile(FileUploadHinhAnhDapAn1, folderPathImage, relativeFolderImage) : string.IsNullOrWhiteSpace(HiddenFieldHinhAnhDapAn1.Value) ? null
                : HiddenFieldHinhAnhDapAn1.Value;
            string hinhanhdapan2 = FileUploadHinhAnhDapAn2.HasFile ? SaveImageFile(FileUploadHinhAnhDapAn2, folderPathImage, relativeFolderImage) : string.IsNullOrWhiteSpace(HiddenFieldHinhAnhDapAn2.Value) ? null
                : HiddenFieldHinhAnhDapAn2.Value;
            string hinhanhdapan3 = FileUploadHinhAnhDapAn3.HasFile ? SaveImageFile(FileUploadHinhAnhDapAn3, folderPathImage, relativeFolderImage) : string.IsNullOrWhiteSpace(HiddenFieldHinhAnhDapAn3.Value) ? null
                : HiddenFieldHinhAnhDapAn3.Value;
            string amthanhdapan1 = FileUploadDapAn1.HasFile ? SaveAudioFile(FileUploadDapAn1, folderPath, relativeFolder) : string.IsNullOrWhiteSpace(HiddenFieldDapAn1.Value) ? null
                : HiddenFieldDapAn1.Value;
            string amthanhdapan2 = FileUploadDapAn2.HasFile ? SaveAudioFile(FileUploadDapAn2, folderPath, relativeFolder) : string.IsNullOrWhiteSpace(HiddenFieldDapAn2.Value) ? null
                : HiddenFieldDapAn2.Value;
            string amthanhdapan3 = FileUploadDapAn3.HasFile ? SaveAudioFile(FileUploadDapAn3, folderPath, relativeFolder) : string.IsNullOrWhiteSpace(HiddenFieldDapAn3.Value) ? null
                : HiddenFieldDapAn3.Value;
            var getthongtinchude = (from bh in db.tbBaiHocs where bh.baihoc_id == Convert.ToInt32(ddlBaiHoc.SelectedItem.Value) select bh.chudebaihoc_id).FirstOrDefault();
            if (Session["cauhoi_id"].ToString() == "0")
            {
                tbGameTiengNhat_CauHoi ins = new tbGameTiengNhat_CauHoi();
                ins.sach_id = Convert.ToInt32(ddlSach.SelectedItem.Value);
                ins.chudebaihoc_id = getthongtinchude;
                ins.baihoc_id = Convert.ToInt32(ddlBaiHoc.SelectedItem.Value);
                ins.cauhoi_group = "TracNghiem";
                ins.cauhoi_content = string.IsNullOrWhiteSpace(txtTieuDe.Text) ? null : "<span class=\"title-page__text\">" + txtTieuDe.Text + "</span>";
                ins.cauhoi_image = hinhanhcauhoi;
                ins.cauhoi_titlecauhoi = string.IsNullOrWhiteSpace(txtCauHoi.Text) ? null : txtCauHoi.Text;
                ins.cauhoi_mp3 = amthanhcauhoi;
                db.tbGameTiengNhat_CauHois.InsertOnSubmit(ins);
                db.SubmitChanges();

                //var getthongtinmoiluu = from ch in db.tbTiengNhat_CauHois
                //                        where ch.sach_id == ins.sach_id && ch.chudebaihoc_id == getthongtinchude
                //                           && ch.baihoc_id == ins.baihoc_id
                //                        orderby ch.cauhoi_id descending
                //                        select ch;
                int newCauHoiId = ins.cauhoi_id;
                for (int i = 0; i < 3; i++)
                {
                    tbGameTiengNhat_CauTraLoi insctl = new tbGameTiengNhat_CauTraLoi();
                    insctl.sach_id = Convert.ToInt32(ddlSach.SelectedItem.Value);
                    insctl.chudebaihoc_id = getthongtinchude;
                    insctl.baihoc_id = Convert.ToInt32(ddlBaiHoc.SelectedItem.Value);
                    //insctl.cauhoi_id = getthongtinmoiluu.First().cauhoi_id;
                    insctl.cautraloi_group = "TracNghiem";
                    insctl.cauhoi_id = newCauHoiId;
                    if (i == 0)
                    {
                        insctl.cautraloi_dapandung = true;
                        insctl.cautraloi_mp3 = amthanhdapan1;
                        if (string.IsNullOrWhiteSpace(txtDapAn1.Text) && FileUploadHinhAnhDapAn1.HasFile)
                        {
                            insctl.cautraloi_text = null;
                            insctl.cautraloi_image = hinhanhdapan1;
                        }
                        else
                        {
                            insctl.cautraloi_text = string.IsNullOrWhiteSpace(txtDapAn1.Text) ? null : txtDapAn1.Text;
                            insctl.cautraloi_image = null;
                        }
                    }
                    else if (i == 1)
                    {
                        insctl.cautraloi_dapandung = false;
                        insctl.cautraloi_mp3 = amthanhdapan2;
                        if (string.IsNullOrWhiteSpace(txtDapAn2.Text) && FileUploadHinhAnhDapAn2.HasFile)
                        {
                            insctl.cautraloi_text = null;
                            insctl.cautraloi_image = hinhanhdapan2;
                        }
                        else
                        {
                            insctl.cautraloi_text = string.IsNullOrWhiteSpace(txtDapAn2.Text) ? null : txtDapAn2.Text;
                            insctl.cautraloi_image = null;
                        }
                    }
                    else
                    {
                        insctl.cautraloi_dapandung = false;
                        insctl.cautraloi_mp3 = amthanhdapan3;
                        if (string.IsNullOrWhiteSpace(txtDapAn3.Text) && FileUploadHinhAnhDapAn3.HasFile)
                        {
                            insctl.cautraloi_text = null;
                            insctl.cautraloi_image = hinhanhdapan3;
                        }
                        else
                        {
                            insctl.cautraloi_text = string.IsNullOrWhiteSpace(txtDapAn3.Text) ? null : txtDapAn3.Text;
                            insctl.cautraloi_image = null;
                        }
                    }
                    db.tbGameTiengNhat_CauTraLois.InsertOnSubmit(insctl);
                    db.SubmitChanges();
                }
                amthanhtieude = null;
                amthanhcauhoi = null;
                hinhanhcauhoi = null;
                hinhanhdapan1 = null;
                hinhanhdapan2 = null;
                hinhanhdapan3 = null;
                amthanhdapan1 = null;
                amthanhdapan2 = null;
                amthanhdapan3 = null;
                txtTieuDe.Text = "";
                txtCauHoi.Text = "";
                txtDapAn1.Text = "";
                txtDapAn2.Text = "";
                txtDapAn3.Text = "";
                hdTieuDeAudioTieuDe.Value = "";
                HiddenFieldCauHoi.Value = "";
                HiddenFieldHinhAnh.Value = "";
                HiddenFieldHinhAnhDapAn1.Value = "";
                HiddenFieldHinhAnhDapAn2.Value = "";
                HiddenFieldHinhAnhDapAn3.Value = "";
                HiddenFieldDapAn1.Value = "";
                HiddenFieldDapAn2.Value = "";
                HiddenFieldDapAn3.Value = "";
                Load();
                ScriptManager.RegisterStartupScript(Page, this.GetType(), "Alert", @" swal({  title: 'Thêm thành công!', icon: 'success' }).then(function() { popupTracNghiem.Hide(); });", true);
            }
            else
            {
                var checkdata = from ch in db.tbGameTiengNhat_CauHois where ch.sach_id == Convert.ToInt32(ddlSach.SelectedItem.Value) && ch.baihoc_id == Convert.ToInt32(ddlBaiHoc.SelectedItem.Value) && ch.cauhoi_id == Convert.ToInt32(Session["cauhoi_id"].ToString()) select ch;
                checkdata.First().cauhoi_content = string.IsNullOrWhiteSpace(txtTieuDe.Text) ? null : "<span class=\"title-page__text\">" + txtTieuDe.Text + "</span>";
                checkdata.First().cauhoi_titlecauhoi = string.IsNullOrWhiteSpace(txtCauHoi.Text) ? null : txtCauHoi.Text;
                checkdata.First().cauhoi_image = hinhanhcauhoi;
                checkdata.First().cauhoi_mp3 = amthanhcauhoi;
                db.SubmitChanges();
                var getthongtindaco = (from ctl in db.tbGameTiengNhat_CauTraLois
                                       where ctl.sach_id == Convert.ToInt32(ddlSach.SelectedItem.Value) && ctl.chudebaihoc_id == getthongtinchude
                                          && ctl.baihoc_id == Convert.ToInt32(ddlBaiHoc.SelectedItem.Value) && ctl.cauhoi_id == Convert.ToInt32(Session["cauhoi_id"].ToString())
                                       select ctl).ToList();
                for (int i = 0; i < 3; i++)
                {
                    if (i == 0)
                    {
                        getthongtindaco[0].cautraloi_mp3 = amthanhdapan1;
                        if (string.IsNullOrWhiteSpace(txtDapAn1.Text) && FileUploadHinhAnhDapAn1.HasFile)
                        {
                            getthongtindaco[0].cautraloi_text = null;
                            getthongtindaco[0].cautraloi_image = hinhanhdapan1;
                        }
                        else
                        {
                            getthongtindaco[0].cautraloi_text = string.IsNullOrWhiteSpace(txtDapAn1.Text) ? null : txtDapAn1.Text;
                            getthongtindaco[0].cautraloi_image = null;
                        }
                    }
                    else if (i == 1)
                    {
                        getthongtindaco[1].cautraloi_mp3 = amthanhdapan2;
                        if (string.IsNullOrWhiteSpace(txtDapAn2.Text) && FileUploadHinhAnhDapAn2.HasFile)
                        {
                            getthongtindaco[1].cautraloi_text = null;
                            getthongtindaco[1].cautraloi_image = hinhanhdapan2;
                        }
                        else
                        {
                            getthongtindaco[1].cautraloi_text = string.IsNullOrWhiteSpace(txtDapAn2.Text) ? null : txtDapAn2.Text;
                            getthongtindaco[1].cautraloi_image = null;
                        }
                    }
                    else
                    {
                        getthongtindaco[2].cautraloi_mp3 = amthanhdapan3;
                        if (string.IsNullOrWhiteSpace(txtDapAn3.Text) && FileUploadHinhAnhDapAn3.HasFile)
                        {
                            getthongtindaco[2].cautraloi_text = null;
                            getthongtindaco[2].cautraloi_image = hinhanhdapan3;
                        }
                        else
                        {
                            getthongtindaco[2].cautraloi_text = string.IsNullOrWhiteSpace(txtDapAn3.Text) ? null : txtDapAn3.Text;
                            getthongtindaco[2].cautraloi_image = null;
                        }
                    }
                    db.SubmitChanges();
                }
                amthanhtieude = null;
                amthanhcauhoi = null;
                hinhanhcauhoi = null;
                hinhanhdapan1 = null;
                hinhanhdapan2 = null;
                hinhanhdapan3 = null;
                amthanhdapan1 = null;
                amthanhdapan2 = null;
                amthanhdapan3 = null;
                txtTieuDe.Text = "";
                txtCauHoi.Text = "";
                txtDapAn1.Text = "";
                txtDapAn2.Text = "";
                txtDapAn3.Text = "";
                hdTieuDeAudioTieuDe.Value = "";
                HiddenFieldCauHoi.Value = "";
                HiddenFieldHinhAnh.Value = "";
                HiddenFieldHinhAnhDapAn1.Value = "";
                HiddenFieldHinhAnhDapAn2.Value = "";
                HiddenFieldHinhAnhDapAn3.Value = "";
                HiddenFieldDapAn1.Value = "";
                HiddenFieldDapAn2.Value = "";
                HiddenFieldDapAn3.Value = "";
                Load();
                ScriptManager.RegisterStartupScript(Page, this.GetType(), "Alert", @" swal({  title: 'Cập nhật thành công!', icon: 'success' }).then(function() { popupTracNghiem.Hide(); });", true);
            }
        }
    }
    protected void btnXoa_Click(object sender, EventArgs e)
    {
        List<object> selectedKey = grvTracNghiem.GetSelectedFieldValues(new string[] { "cauhoi_id" });
        if (selectedKey.Count > 0)
        {
            foreach (var item in selectedKey)
            {
                int id = Convert.ToInt32(item);

                var cauhoi = db.tbGameTiengNhat_CauHois.FirstOrDefault(x => x.cauhoi_id == id);
                if (cauhoi != null)
                {
                    db.tbGameTiengNhat_CauHois.DeleteOnSubmit(cauhoi);
                }

                var cautraloi = db.tbGameTiengNhat_CauTraLois.Where(ctl => ctl.cauhoi_id == id).ToList();
                if (cautraloi.Any())
                {
                    db.tbGameTiengNhat_CauTraLois.DeleteAllOnSubmit(cautraloi);
                }
            }
            db.SubmitChanges();
            ScriptManager.RegisterStartupScript(Page, this.GetType(), "Alert", @"  swal({title: 'Xóa thành công!', icon: 'success' }).then(function() {grvTracNghiem.UnselectRows(); HiddenLoadingIcon();});", true);
        }
        else
            alert.alert_Warning(Page, "Bạn chưa chọn dữ liệu", "");
    }
}