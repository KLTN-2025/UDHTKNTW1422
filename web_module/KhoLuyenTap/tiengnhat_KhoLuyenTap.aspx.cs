using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class web_module_KhoLuyenTap_tiengnhat_KhoLuyenTap : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public int khoi_id, mon_id;
    private int hocsinh_id, namhoc_id, lop_id;
    private string hocsinh_code;
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Request.Cookies["PhuHuynhVietNhat"] != null)
        //{
        //    namhoc_id = (from nh in db.tbHoctap_NamHocs orderby nh.namhoc_id descending select nh.namhoc_id).First();
        //    khoi_id = Convert.ToInt32(RouteData.Values["khoi"]);
        //    string[] arrListStr = Request.Cookies["PhuHuynhVietNhat"].Value.Split(',');
        //    if (arrListStr[0] == "hocsinh")// nếu là học sinh đăng nhập
        //    {
        //        var checkHS = (from hs in db.tbHocSinhs
        //                       where hs.hocsinh_taikhoan == arrListStr[1]
        //                       select hs).Single();
        //        hocsinh_id = checkHS.hocsinh_id;
        //        hocsinh_code = checkHS.hocsinh_mahocphi;
        //        if (!IsPostBack)
        //        {
                    loadData();
        //        }
        //    }
        //    else
        //    {
        //        Response.Redirect("/login-slldt-viet-nhat");
        //    }


        //}
        //else Response.Redirect("/login-slldt-viet-nhat");
    }
    protected void loadData()
    {
        //khối 6
        var getBaiTap = from bt in db.tbTracNghiem_BaiLuyenTaps
                        join t in db.tbTracNghiem_Tests on bt.luyentap_id equals t.luyentap_id
                        where bt.luyentap_status == 2 && t.monhoc_id == 12 && t.khoi_id == 6
                        && t.hidden == true
                        select new
                        {
                            t.test_id,
                            bt.luyentap_id,
                            imgBaiTap = bt.luyentap_path,
                            bt.luyentap_name,
                            t.test_link,
                            khoi_id = khoi_id,
                            mon_id = mon_id,
                            count_view = (from rt in db.tbTracNghiem_ResultTests
                                          join t1 in db.tbTracNghiem_Tests on rt.test_id equals t1.test_id
                                          where t1.luyentap_id == bt.luyentap_id && rt.hocsinh_code == hocsinh_code
                                          select rt).Count(),
                            luyentap_heart_class = (from lth in db.tbTracNghiem_LuyenTap_Hearts
                                                    where lth.test_id == t.test_id && lth.hocsinh_id == hocsinh_id
                                                    select lth).Count() > 0 ?
                                                    (from lth in db.tbTracNghiem_LuyenTap_Hearts
                                                     where lth.test_id == t.test_id && lth.hocsinh_id == hocsinh_id
                                                     select lth).FirstOrDefault().luyentap_heart_class == "fa fa-heart" ? "fa fa-heart" : "fa fa-heart-o"
                                                     : "fa fa-heart-o",
                            luyentap_star_class = (from s in db.tbTracNghiem_LuyenTap_Stars
                                                   where s.test_id == t.test_id
                                                   select s).Count() > 0 ? "fa fa-star" : "fa fa-star-o"
                        };
        rpDanhSachLuyenTapKhoi6.DataSource = getBaiTap;
        rpDanhSachLuyenTapKhoi6.DataBind();
        ////khối 7
        //var getBaiTapKhoi7 = from bt in db.tbTracNghiem_BaiLuyenTaps
        //                     join t in db.tbTracNghiem_Tests on bt.luyentap_id equals t.luyentap_id
        //                     where bt.luyentap_status == 2 && t.monhoc_id == 12 && t.khoi_id == 7
        //                     && t.hidden == true
        //                     select new
        //                     {
        //                         t.test_id,
        //                         bt.luyentap_id,
        //                         imgBaiTap = bt.luyentap_path,
        //                         bt.luyentap_name,
        //                         t.test_link,
        //                         khoi_id = khoi_id,
        //                         mon_id = mon_id,
        //                         count_view = (from rt in db.tbTracNghiem_ResultTests
        //                                       join t1 in db.tbTracNghiem_Tests on rt.test_id equals t1.test_id
        //                                       where t1.luyentap_id == bt.luyentap_id && rt.hocsinh_code == hocsinh_code
        //                                       select rt).Count(),
        //                         luyentap_heart_class = (from lth in db.tbTracNghiem_LuyenTap_Hearts
        //                                                 where lth.test_id == t.test_id && lth.hocsinh_id == hocsinh_id
        //                                                 select lth).Count() > 0 ?
        //                                                 (from lth in db.tbTracNghiem_LuyenTap_Hearts
        //                                                  where lth.test_id == t.test_id && lth.hocsinh_id == hocsinh_id
        //                                                  select lth).FirstOrDefault().luyentap_heart_class == "fa fa-heart" ? "fa fa-heart" : "fa fa-heart-o"
        //                                                  : "fa fa-heart-o",
        //                         luyentap_star_class = (from s in db.tbTracNghiem_LuyenTap_Stars
        //                                                where s.test_id == t.test_id
        //                                                select s).Count() > 0 ? "fa fa-star" : "fa fa-star-o"
        //                     };
        //rpDanhSachLuyenTapKhoi7.DataSource = getBaiTapKhoi7;
        //rpDanhSachLuyenTapKhoi7.DataBind();
        ////khối 8
        //var getBaiTapKhoi8 = from bt in db.tbTracNghiem_BaiLuyenTaps
        //                     join t in db.tbTracNghiem_Tests on bt.luyentap_id equals t.luyentap_id
        //                     where bt.luyentap_status == 2 && t.monhoc_id == 12 && t.khoi_id == 8
        //                     && t.hidden == true
        //                     select new
        //                     {
        //                         t.test_id,
        //                         bt.luyentap_id,
        //                         imgBaiTap = bt.luyentap_path,
        //                         bt.luyentap_name,
        //                         t.test_link,
        //                         khoi_id = khoi_id,
        //                         mon_id = mon_id,
        //                         count_view = (from rt in db.tbTracNghiem_ResultTests
        //                                       join t1 in db.tbTracNghiem_Tests on rt.test_id equals t1.test_id
        //                                       where t1.luyentap_id == bt.luyentap_id && rt.hocsinh_code == hocsinh_code
        //                                       select rt).Count(),
        //                         luyentap_heart_class = (from lth in db.tbTracNghiem_LuyenTap_Hearts
        //                                                 where lth.test_id == t.test_id && lth.hocsinh_id == hocsinh_id
        //                                                 select lth).Count() > 0 ?
        //                                                 (from lth in db.tbTracNghiem_LuyenTap_Hearts
        //                                                  where lth.test_id == t.test_id && lth.hocsinh_id == hocsinh_id
        //                                                  select lth).FirstOrDefault().luyentap_heart_class == "fa fa-heart" ? "fa fa-heart" : "fa fa-heart-o"
        //                                                  : "fa fa-heart-o",
        //                         luyentap_star_class = (from s in db.tbTracNghiem_LuyenTap_Stars
        //                                                where s.test_id == t.test_id
        //                                                select s).Count() > 0 ? "fa fa-star" : "fa fa-star-o"
        //                     };
        //rpDanhSachLuyenTapKhoi8.DataSource = getBaiTapKhoi8;
        //rpDanhSachLuyenTapKhoi8.DataSource = getBaiTapKhoi8;
        //rpDanhSachLuyenTapKhoi8.DataBind();
        ////khối 9
        //var getBaiTapKhoi9 = from bt in db.tbTracNghiem_BaiLuyenTaps
        //                     join t in db.tbTracNghiem_Tests on bt.luyentap_id equals t.luyentap_id
        //                     where bt.luyentap_status == 2 && t.monhoc_id == 12 && t.khoi_id == 9
        //                     && t.hidden == true
        //                     select new
        //                     {
        //                         t.test_id,
        //                         bt.luyentap_id,
        //                         imgBaiTap = bt.luyentap_path,
        //                         bt.luyentap_name,
        //                         t.test_link,
        //                         khoi_id = khoi_id,
        //                         mon_id = mon_id,
        //                         count_view = (from rt in db.tbTracNghiem_ResultTests
        //                                       join t1 in db.tbTracNghiem_Tests on rt.test_id equals t1.test_id
        //                                       where t1.luyentap_id == bt.luyentap_id && rt.hocsinh_code == hocsinh_code
        //                                       select rt).Count(),
        //                         luyentap_heart_class = (from lth in db.tbTracNghiem_LuyenTap_Hearts
        //                                                 where lth.test_id == t.test_id && lth.hocsinh_id == hocsinh_id
        //                                                 select lth).Count() > 0 ?
        //                                                 (from lth in db.tbTracNghiem_LuyenTap_Hearts
        //                                                  where lth.test_id == t.test_id && lth.hocsinh_id == hocsinh_id
        //                                                  select lth).FirstOrDefault().luyentap_heart_class == "fa fa-heart" ? "fa fa-heart" : "fa fa-heart-o"
        //                                                  : "fa fa-heart-o",
        //                         luyentap_star_class = (from s in db.tbTracNghiem_LuyenTap_Stars
        //                                                where s.test_id == t.test_id
        //                                                select s).Count() > 0 ? "fa fa-star" : "fa fa-star-o"
        //                     };
        //rpDanhSachLuyenTapKhoi9.DataSource = getBaiTapKhoi9;
        //rpDanhSachLuyenTapKhoi9.DataBind();

    }
    protected void btnMyHeart_ServerClick(object sender, EventArgs e)
    {
        tbTracNghiem_LuyenTap_Heart checkHeart = (from h in db.tbTracNghiem_LuyenTap_Hearts
                                                  where h.test_id == Convert.ToInt32(txtLuyenTap_id.Value) && h.hocsinh_id == hocsinh_id
                                                  select h).FirstOrDefault();
        if (checkHeart == null)
        {
            tbTracNghiem_LuyenTap_Heart insert = new tbTracNghiem_LuyenTap_Heart();
            insert.hocsinh_id = hocsinh_id;
            insert.test_id = Convert.ToInt32(txtLuyenTap_id.Value);
            insert.luyentap_heart_class = "fa fa-heart";
            db.tbTracNghiem_LuyenTap_Hearts.InsertOnSubmit(insert);
            db.SubmitChanges();
        }
        else
        {
            if (checkHeart.luyentap_heart_class == "fa fa-heart-o")
            {
                checkHeart.luyentap_heart_class = "fa fa-heart";
                db.SubmitChanges();
            }
            else
            {
                checkHeart.luyentap_heart_class = "fa fa-heart-o";
                db.SubmitChanges();
            }
        }
        loadData();
    }

}