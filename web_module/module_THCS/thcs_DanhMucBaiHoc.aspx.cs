using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_THCS_thcs_DanhMucBaiHoc : System.Web.UI.Page
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
            if (!string.IsNullOrEmpty(khoiValue))
                btnBack.HRef = "/app-danh-muc-khoi-thcs-" + khoiValue;
            else
                btnBack.HRef = "/app-danh-muc-khoi-thcs-6";
            var checkHocSinh = (from hs in db.tbAccounts where hs.account_sodienthoai == Request.Cookies["taikhoan"].Value select hs);

            if (checkHocSinh.Count() > 0)
            {
                var checkHocSinhTrongLop = from hstl in db.tbAccount_Childrens
                                           where hstl.account_id == checkHocSinh.First().account_id && hstl.account_children_active == true
                                           select hstl;
                hocsinh_id = checkHocSinhTrongLop.First().account_children_id;
                sach = Convert.ToInt32(RouteData.Values["id"]);
                hfStudentId.Value = hocsinh_id + "";
                hfSachId.Value = sach + "";
                //có chủ đề
                var getUnitChuDe = from s in db.tbSaches
                                   join cd in db.tbChuDeBaiHocs on s.sach_id equals cd.sach_id
                                   orderby cd.chudebaihoc_position ascending
                                   where sach == cd.sach_id
                                   select new
                                   {
                                       chudebaihoc = cd.chudebaihoc_name,
                                       cd.chudebaihoc_id,
                                       s.sach_title,
                                   };
                //rpUnit.DataSource = getUnitChuDe;
                //rpUnit.DataBind();
                tenSach = getUnitChuDe.First().sach_title;
            }
            else
            {
                Response.Redirect("/login.html");
                // Xử lý khi không tìm thấy phần tử trong truy vấn LINQ
            }
        }
    }

    protected void rpUnit_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Repeater rpLesson = e.Item.FindControl("rpLesson") as Repeater;
        int unit_id = int.Parse(DataBinder.Eval(e.Item.DataItem, "chudebaihoc_id").ToString());
        var getLesson = from bh in db.tbBaiHocs
                        join s in db.tbSaches on bh.sach_id equals s.sach_id
                        where unit_id == bh.chudebaihoc_id && bh.sach_id == sach
                        orderby bh.baihoc_position ascending
                        select new
                        {
                            bh.baihoc_id,
                            bh.baihoc_link,
                            bh.baihoc_avatar,
                            bh.baihoc_title,
                            s.sach_position,
                            link_in = bh.baihoc_title.Contains("Bài kiểm tra")
                        ? "/in-bai-kiem-tra-" + bh.baihoc_link.Substring(1)
                        : (s.sach_position == 1 || s.sach_position == 2 || s.sach_position == 3 || s.sach_position == 4)
                            ? "/in-bai-tap-" + bh.sach_id + "-" + bh.chudebaihoc_id + "-" + bh.baihoc_id
                            : (s.sach_position == 5 || s.sach_position == 6)
                                ? "/in-bai-tap-khoi-3-" + bh.sach_id + "-" + bh.chudebaihoc_id + "-" + bh.baihoc_id
                                : (s.sach_position == 7 || s.sach_position == 8)
                                    ? "/in-bai-tap-khoi-4-" + bh.sach_id + "-" + bh.chudebaihoc_id + "-" + bh.baihoc_id
                                    : (s.sach_position == 9 || s.sach_position == 10)
                                        ? "/in-bai-tap-khoi-5-" + bh.sach_id + "-" + bh.chudebaihoc_id + "-" + bh.baihoc_id : null,
                            solan = (from ls in db.tbSoLLDT_LichSuHocSinhXemBaiHocs
                                     where ls.sach_id == sach && ls.baihoc_id == bh.baihoc_id && ls.hocsinh_id == hocsinh_id
                                     orderby ls.lichsuxembai_id descending
                                     select ls).FirstOrDefault().lichsuxembai_solan ?? 0,
                        };
        rpLesson.DataSource = getLesson;
        rpLesson.DataBind();
    }

    protected void rpLesson_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Repeater rpStartGame = e.Item.FindControl("rpStartGame") as Repeater;
        //Repeater rpSoLan = e.Item.FindControl("rpSoLan") as Repeater;
        int lesson_id = int.Parse(DataBinder.Eval(e.Item.DataItem, "baihoc_id").ToString());
        var getLichSu = from ls in db.tbSoLLDT_LichSuLamBaiHocSinhs
                        where ls.baihoc_id == lesson_id && ls.hocsinh_id == hocsinh_id
                        orderby ls.lichsulambai_vitribaitap ascending
                        select new
                        {
                            ls.lichsulambai_vitribaitap,
                            ls.lichsulambai_diem,
                            sao = ls.lichsulambai_sao == 1 ? "/images/anhgif/1sao.png" : ls.lichsulambai_sao == 2 ? "/images/anhgif/2sao.png" : "/images/anhgif/3sao.png",
                            //check xem là bài kt hay bt, nếu là bkt thì hiện điểm, còn lại hiện sao
                            mystyle = ls.lichsulambai_dekiemtra != null ? "" : "display:none",
                            mystyle2 = ls.lichsulambai_dekiemtra != null ? "display:none" : "",
                        };
        //var getsolan = (from ls in db.tbSoLLDT_LichSuHocSinhXemBaiHocs
        //                where ls.sach_id == sach && ls.baihoc_id == lesson_id && ls.hocsinh_id == hocsinh_id
        //                orderby ls.lichsuxembai_id descending
        //                select ls).FirstOrDefault();
        //int solanValue = getsolan != null ? (getsolan.lichsuxembai_solan ?? 0) : 0;
        //var dataSource = new List<object> { new { solan = solanValue } };
        //rpSoLan.DataSource = dataSource;
        //rpSoLan.DataBind();
        rpStartGame.DataSource = getLichSu;
        rpStartGame.DataBind();
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