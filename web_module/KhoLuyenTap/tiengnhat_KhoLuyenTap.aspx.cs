using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
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
        // Initialize default values
        hocsinh_id = 0;
        hocsinh_code = "";
        khoi_id = 0;
        mon_id = 0;
        
        // Check if user is logged in via cookie
        if (Request.Cookies["taikhoan"] != null)
        {
            var account = (from ac in db.tbAccounts
                         where ac.account_sodienthoai == Request.Cookies["taikhoan"].Value && ac.account_active == true
                         select ac).FirstOrDefault();
            
            if (account != null)
            {
                var accountChild = (from acchil in db.tbAccount_Childrens
                                  where acchil.account_id == account.account_id && acchil.account_children_active == true
                                  select acchil).FirstOrDefault();
                
                if (accountChild != null)
                {
                    hocsinh_code = account.account_sodienthoai;
                    // You may need to map account_children to hocsinh_id if needed
                }
            }
        }
        
        if (!IsPostBack)
        {
            loadData();
        }
    }
    protected void loadData()
    {
        try
        {
            //khối 6
            var getBaiTap = from bt in db.tbTracNghiem_BaiLuyenTaps
                            join t in db.tbTracNghiem_Tests on bt.luyentap_id equals t.luyentap_id
                            where bt.luyentap_status == 2 && t.monhoc_id == 12 && t.khoi_id == 6
                            && (t.hidden != true || t.hidden == null)
                            select new
                            {
                                t.test_id,
                                bt.luyentap_id,
                                imgBaiTap = bt.luyentap_path,
                                bt.luyentap_name,
                                t.test_link,
                                khoi_id = t.khoi_id ?? 6,
                                mon_id = t.monhoc_id ?? 12,
                                count_view = !string.IsNullOrEmpty(hocsinh_code) ? 
                                    (from rt in db.tbTracNghiem_ResultTests
                                     join t1 in db.tbTracNghiem_Tests on rt.test_id equals t1.test_id
                                     where t1.luyentap_id == bt.luyentap_id && rt.hocsinh_code == hocsinh_code
                                     select rt).Count() : 0,
                                luyentap_heart_class = hocsinh_id > 0 ?
                                    (from lth in db.tbTracNghiem_LuyenTap_Hearts
                                     where lth.test_id == t.test_id && lth.hocsinh_id == hocsinh_id
                                     select lth).Count() > 0 ?
                                    (from lth in db.tbTracNghiem_LuyenTap_Hearts
                                     where lth.test_id == t.test_id && lth.hocsinh_id == hocsinh_id
                                     select lth).FirstOrDefault().luyentap_heart_class == "fa fa-heart" ? "fa fa-heart" : "fa fa-heart-o"
                                     : "fa fa-heart-o" : "fa fa-heart-o",
                                luyentap_star_class = (from s in db.tbTracNghiem_LuyenTap_Stars
                                                       where s.test_id == t.test_id
                                                       select s).Count() > 0 ? "fa fa-star" : "fa fa-star-o"
                            };
            var listBaiTap = getBaiTap.ToList();
            
            if (listBaiTap.Count > 0)
            {
                rpDanhSachLuyenTapKhoi6.DataSource = listBaiTap;
                rpDanhSachLuyenTapKhoi6.DataBind();
                divNoData.Visible = false;
            }
            else
            {
                rpDanhSachLuyenTapKhoi6.DataSource = null;
                rpDanhSachLuyenTapKhoi6.DataBind();
                divNoData.Visible = true;
            }
        }
        catch (Exception ex)
        {
            // Log error or show message
            System.Diagnostics.Debug.WriteLine("Error loading data: " + ex.Message);
            divNoData.Visible = true;
            rpDanhSachLuyenTapKhoi6.DataSource = null;
            rpDanhSachLuyenTapKhoi6.DataBind();
        }
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

    [System.Web.Services.WebMethod(EnableSession = true)]
    public static string SaveTestResult(int correctAnswers, int totalQuestions, string score, int timeSeconds, string timeStr, object answers)
    {
        try
        {
            dbcsdlDataContext db = new dbcsdlDataContext();
            
            // Get student code from cookie
            string hocsinh_code = "";
            if (HttpContext.Current.Request.Cookies["taikhoan"] != null)
            {
                var account = (from ac in db.tbAccounts
                             where ac.account_sodienthoai == HttpContext.Current.Request.Cookies["taikhoan"].Value 
                             && ac.account_active == true
                             select ac).FirstOrDefault();
                
                if (account != null)
                {
                    hocsinh_code = account.account_sodienthoai;
                }
            }
            
            if (string.IsNullOrEmpty(hocsinh_code))
            {
                return "NO_LOGIN";
            }
            
            // Create result record
            tbTracNghiem_ResultTest result = new tbTracNghiem_ResultTest();
            result.test_id = 0; // General practice test (kho luyện tập)
            result.hocsinh_code = hocsinh_code;
            result.resulttest_datetime = DateTime.Now;
            result.result_thoigianlambai = timeStr;
            result.result_type = "Luyện tập";
            
            // Store result summary (correct/total)
            result.resulttest_result = correctAnswers + "/" + totalQuestions;
            
            // Convert answers to JSON string and store in result_chuyendiemthuongxuyen
            System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            string answersJson = serializer.Serialize(answers);
            result.result_chuyendiemthuongxuyen = answersJson; // Store full answers JSON
            
            // Calculate and store score (10 point scale) in result_danhgia
            double scoreValue = 0;
            double.TryParse(score, out scoreValue);
            result.result_danhgia = scoreValue.ToString("F1");
            
            db.tbTracNghiem_ResultTests.InsertOnSubmit(result);
            db.SubmitChanges();
            
            return "OK";
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine("Error saving test result: " + ex.ToString());
            return "ERROR: " + ex.Message;
        }
    }

}