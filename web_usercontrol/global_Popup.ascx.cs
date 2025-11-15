using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_usercontrol_global_Popup : System.Web.UI.UserControl
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public string lesson_name, link_prev, link_next, hocsinh_name;
    public int sach_id, chude_id, baihoc_id;
    public DateTime startTime;
    public DateTime endTime;
    public TimeSpan elapsedtime;
    public int idGame;
    public int sao;
    public int hocsinh_id, namhoc_id;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSatrt_ServerClick(object sender, EventArgs e)
    {
        string url = HttpContext.Current.Request.Url.AbsolutePath;
        string[] arr = url.Split('-');
        //if (arr.Length == 5)
        //{
        //    sach_id = Convert.ToInt32(arr[arr.Length - 3]);
        //    baihoc_id = Convert.ToInt32(arr[arr.Length - 1]);
        //}
        //else
        //{
        //    sach_id = Convert.ToInt32(arr[arr.Length - 2]);
        //    baihoc_id = Convert.ToInt32(arr[arr.Length - 1]);
        //}
        //if (baihoc_id == 96 || baihoc_id == 104 || baihoc_id == 120 || baihoc_id == 129 || baihoc_id == 135)
        //{
        //    sach_id = 2;
        //}
        //else if (baihoc_id == 199 || baihoc_id == 207 || baihoc_id == 219 || baihoc_id == 229 || baihoc_id == 239)
        //{
        //    sach_id = 4;
        //}
        sach_id = Convert.ToInt32(arr[arr.Length - 3]);
        chude_id = Convert.ToInt32(arr[arr.Length - 2]);
        baihoc_id = Convert.ToInt32(arr[arr.Length - 1]);
        idGame = Convert.ToInt32(txtOrderGamePopup.Value);
        sao = Convert.ToInt32(txtSao.Value);
        startTime = Convert.ToDateTime(txtTimeStartPopup.Value);

        var selectData = from ls in db.tbSoLLDT_LichSuLamBaiHocSinhs
                         where ls.baihoc_id == baihoc_id && ls.lichsulambai_vitribaitap == idGame && ls.hocsinh_id == hocsinh_id
                         select ls;


        if (selectData.Count() == 0)
        {
            insertData();
        }
        else
        {
            updateData();
        }
    }
    protected void insertData()
    {
        //startTime = DateTime.Now;
        endTime = DateTime.Now;
        //var getHSTL = (from hstl in db.tbHocSinhTrongLops where hstl.hocsinh_id == hocsinh_id orderby hstl.hocsinh_id descending select hstl).First();
        //var getNamHoc = (from nh in db.tbHoctap_NamHocs orderby nh.namhoc_id descending select nh).First();
        tbSoLLDT_LichSuLamBaiHocSinh insertls = new tbSoLLDT_LichSuLamBaiHocSinh();
        insertls.hocsinh_id = hocsinh_id;
        //insertls.hstl_id = getHSTL.hstl_id;
        //insertls.namhoc_id = getNamHoc.namhoc_id;
        insertls.lichsulambai_thoigianbatdau = startTime;
        insertls.lichsulambai_thoigianhetthuc = endTime;
        insertls.sach_id = sach_id;
        insertls.baihoc_id = baihoc_id;
        insertls.lichsulambai_vitribaitap = idGame;
        insertls.lichsulambai_sao = sao;
        insertls.lichsulambai_diem = txtDiem.Value;
        if (sao == 0)
        {
            //màu xanh dương
            insertls.lichsulambai_status = "select";
        }
        else
        {
            //màu vàng gold
            insertls.lichsulambai_status = "active";
        }
        insertls.lichsulambai_solanlambai = 1;
        db.tbSoLLDT_LichSuLamBaiHocSinhs.InsertOnSubmit(insertls);
        //insert chi tiết từng lần chơi game
        tbSoLLDT_LichSuLamBaiHocSinh_ChiTiet insertlsct = new tbSoLLDT_LichSuLamBaiHocSinh_ChiTiet();
        insertlsct.hocsinh_id = hocsinh_id;
        //insertlsct.hstl_id = getHSTL.hstl_id;
        //insertlsct.namhoc_id = getNamHoc.namhoc_id;
        insertlsct.lichsulambai_chitiet_thoigianbatdau = startTime;
        insertlsct.lichsulambai_chitiet_thoigianhetthuc = endTime;
        insertlsct.sach_id = sach_id;
        insertlsct.baihoc_id = baihoc_id;
        insertlsct.lichsulambai_chitiet_vitribaitap = idGame;
        insertlsct.lichsulambai_chitiet_sao = sao;
        insertlsct.lichsulambai_chitiet_diem = txtDiem.Value;
        if (sao == 0)
        {
            //màu xanh dương
            insertlsct.lichsulambai_chitiet_status = "select";
        }
        else
        {
            //màu vàng gold
            insertlsct.lichsulambai_chitiet_status = "active";
        }
        insertlsct.lichsulambai_chitiet_solanlambai = 1;
        db.tbSoLLDT_LichSuLamBaiHocSinh_ChiTiets.InsertOnSubmit(insertlsct);
        db.SubmitChanges();
        //ScriptManager.RegisterStartupScript(upPopup, upPopup.GetType(), "popupScript", "funcHienPopup();", true);
    }
    protected void updateData()
    {
        endTime = DateTime.Now;
        tbSoLLDT_LichSuLamBaiHocSinh update = (from ls in db.tbSoLLDT_LichSuLamBaiHocSinhs
                                               where ls.baihoc_id == baihoc_id && ls.lichsulambai_vitribaitap == idGame && ls.hocsinh_id == hocsinh_id
                                               select ls).FirstOrDefault();
        //orderby ls.lichsulambai_thoigianbatdau descending
        //select ls).FirstOrDefault();
        update.lichsulambai_thoigianbatdau = startTime;
        update.lichsulambai_thoigianhetthuc = endTime;
        update.lichsulambai_solanlambai = update.lichsulambai_solanlambai + 1;
        var selectStart = from ls in db.tbSoLLDT_LichSuLamBaiHocSinhs
                          where ls.baihoc_id == baihoc_id && ls.lichsulambai_vitribaitap == idGame && ls.lichsulambai_sao < sao && ls.hocsinh_id == hocsinh_id
                          select ls;
        //nếu mà lần làm bài sau điểm tốt hơn phần làm bài trước thì update lại điểm
        double diemOld = Convert.ToDouble(update.lichsulambai_diem);
        double diemNew = Convert.ToDouble(txtDiem.Value);
        if (diemOld < diemNew)
            update.lichsulambai_diem = txtDiem.Value;
        if (selectStart.Count() == 1)
        {
            update.lichsulambai_sao = sao;
            update.lichsulambai_status = "active";
        }
        var getsolan = from lsct in db.tbSoLLDT_LichSuLamBaiHocSinh_ChiTiets
                       where lsct.baihoc_id == baihoc_id && lsct.lichsulambai_chitiet_vitribaitap == idGame && lsct.hocsinh_id == hocsinh_id
                       orderby lsct.lichsulambai_chitiet_id descending
                       select lsct;
        //insert chi tiết từng lần chơi game
        tbSoLLDT_LichSuLamBaiHocSinh_ChiTiet insertlsct = new tbSoLLDT_LichSuLamBaiHocSinh_ChiTiet();
        insertlsct.hocsinh_id = hocsinh_id;
        //insertlsct.hstl_id = getHSTL.hstl_id;
        //insertlsct.namhoc_id = getNamHoc.namhoc_id;
        insertlsct.lichsulambai_chitiet_thoigianbatdau = startTime;
        insertlsct.lichsulambai_chitiet_thoigianhetthuc = endTime;
        insertlsct.sach_id = sach_id;
        insertlsct.baihoc_id = baihoc_id;
        insertlsct.lichsulambai_chitiet_vitribaitap = idGame;
        insertlsct.lichsulambai_chitiet_sao = sao;
        insertlsct.lichsulambai_chitiet_diem = txtDiem.Value;
        if (sao == 0)
        {
            //màu xanh dương
            insertlsct.lichsulambai_chitiet_status = "select";
        }
        else
        {
            //màu vàng gold
            insertlsct.lichsulambai_chitiet_status = "active";
        }
        insertlsct.lichsulambai_chitiet_solanlambai = getsolan.First().lichsulambai_chitiet_solanlambai + 1;
        db.tbSoLLDT_LichSuLamBaiHocSinh_ChiTiets.InsertOnSubmit(insertlsct);
        db.SubmitChanges();
    }

    protected void btnHome_ServerClick(object sender, EventArgs e)
    {
        tbSoLLDT_LichSuHocSinhXemBaiHoc insert = new tbSoLLDT_LichSuHocSinhXemBaiHoc();
        //var getHSTL = (from hstl in db.tbHocSinhTrongLops where hstl.hocsinh_id == hocsinh_id orderby hstl.hocsinh_id descending select hstl).First();
        var checkHocSinh = from ls in db.tbSoLLDT_LichSuHocSinhXemBaiHocs where ls.hocsinh_id == hocsinh_id/* && ls.hstl_id == getHSTL.hstl_id */select ls;
        if (checkHocSinh.Any())
        {
            checkHocSinh.First().lichsuxembai_thoigianhetthuc = DateTime.Now;
        }
        db.SubmitChanges();
    }

}