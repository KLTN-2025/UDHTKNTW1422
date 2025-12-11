using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_UI_Hieu_UI_dsbai : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    public string tenSach;
    public string chudebaihoc;
    public int hocsinh_id, sach;
    public DateTime startTime;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["taikhoan"] != null)
        {
            string khoiValue = Request.QueryString["khoi"];
            //int khoi_id = Convert.ToInt32(RouteData.Values["khoi-id"]);
            //string khoiValue = khoi_id.ToString();
            //if (!string.IsNullOrEmpty(khoiValue))
            //    btnBack.HRef = "/app-danh-muc-khoi-thcs-" + khoiValue;
            //else
            //    btnBack.HRef = "/app-danh-muc-khoi-thcs-6";
            var checkHocSinh = (from hs in db.tbAccounts where hs.account_sodienthoai == Request.Cookies["taikhoan"].Value select hs);

            if (checkHocSinh.Count() > 0)
            {
                var checkHocSinhTrongLop = from hstl in db.tbAccount_Childrens
                                           where hstl.account_id == checkHocSinh.First().account_id && hstl.account_children_active == true
                                           select hstl;
                hocsinh_id = checkHocSinh.First().account_id;
                sach = Convert.ToInt32(RouteData.Values["id"]);
                //hfStudentId.Value = hocsinh_id + "";
                //hfSachId.Value = sach + "";
                //có chủ đề
                //    var getUnitChuDe = from s in db.tbSaches
                //                       join cd in db.tbChuDeBaiHocs on s.sach_id equals cd.sach_id
                //                       orderby cd.chudebaihoc_position ascending
                //                       where sach == cd.sach_id
                //                       select new
                //                       {
                //                           chudebaihoc = cd.chudebaihoc_name,
                //                           cd.chudebaihoc_id,
                //                           s.sach_title,
                //                       };
                //    //rpUnit.DataSource = getUnitChuDe;
                //    //rpUnit.DataBind();
                //    tenSach = getUnitChuDe.First().sach_title;
            }
            else
            {
                Response.Redirect("/app-login");
                // Xử lý khi không tìm thấy phần tử trong truy vấn LINQ
            }
        }
    }
    protected void btnXemBai_ServerClick(object sender, EventArgs e)
    {
        startTime = DateTime.Now;
        // var getHSTL = (from hstl in db.tbHocSinhTrongLops where hstl.hocsinh_id == hocsinh_id orderby hstl.hocsinh_id descending select hstl).First();
        //var getNamHoc = (from nh in db.tbHoctap_NamHocs orderby nh.namhoc_id descending select nh).First();
        var getBaiHoc = from bh in db.tbBaiHocs where bh.baihoc_id == Convert.ToInt32(txtIDBaiHoc.Value) select bh.baihoc_link;
        tbSoLLDT_LichSuHocSinhXemBaiHoc insert = new tbSoLLDT_LichSuHocSinhXemBaiHoc();
        var checkHocSinh = from ls in db.tbSoLLDT_LichSuHocSinhXemBaiHocs where ls.hocsinh_id == hocsinh_id /*&& ls.hstl_id == getHSTL.hstl_id*/ && ls.baihoc_id == Convert.ToInt32(txtIDBaiHoc.Value) orderby ls.lichsuxembai_id descending select ls;
        if (checkHocSinh.Any())
        {
            insert.lichsuxembai_solan = checkHocSinh.First().lichsuxembai_solan + 1;
        }
        else
        {
            insert.lichsuxembai_solan = 1;
        }
        insert.hocsinh_id = hocsinh_id;
        //insert.hstl_id = getHSTL.hstl_id;
        //.namhoc_id = getNamHoc.namhoc_id;
        insert.sach_id = sach;
        insert.baihoc_id = Convert.ToInt32(txtIDBaiHoc.Value);
        insert.lichsuxembai_thoigianbatdau = startTime;
        db.tbSoLLDT_LichSuHocSinhXemBaiHocs.InsertOnSubmit(insert);
        db.SubmitChanges();
        string baihocLink = getBaiHoc.FirstOrDefault();
        if (!string.IsNullOrEmpty(baihocLink))
        {
            Response.Redirect(baihocLink);
        }
    }
}