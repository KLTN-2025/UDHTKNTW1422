using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_GameCacKhoi_Khoi_6_Luyen_Tap : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public string lesson_name, link_prev, link_next, baihoc;
    public int sach_id, chude_id, baihoc_id;
    public string _id_lesson, hocsinh_name, tinhtrangnext;
    public int noi, socap;
    Random rnd = new Random();
    private DataTable tableMultiple;
    private string col;
    public string[] arrLoaiGame;
    public int hocsinh_id;
    public DateTime startTime;
    public DateTime endTime;
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = HttpContext.Current.Request.Url.AbsolutePath;
        //string url = "/sach-tieng-viet-1-bai1";
        string[] arr = url.Split('-');
        sach_id = Convert.ToInt32(arr[arr.Length - 3]);
        chude_id = Convert.ToInt32(arr[arr.Length - 2]);
        baihoc_id = Convert.ToInt32(arr[arr.Length - 1]);
        _id_lesson = "id_" + baihoc_id;
        txtTimeStart.Value = Convert.ToString(DateTime.Now);
        var getBaiHoc = (from bn in db.tbBaiHocs
                         join s in db.tbSaches on bn.sach_id equals s.sach_id
                         join cd in db.tbChuDeBaiHocs on bn.chudebaihoc_id equals cd.chudebaihoc_id
                         where bn.sach_id == sach_id && bn.baihoc_id == baihoc_id
                         select new
                         {
                             s.sach_id,
                             s.sach_title,
                             bn.baihoc_title,
                             bn.baihoc_loaigame,
                             link_prev = bn.baihoc_back,
                             link_next = bn.baihoc_next,
                         }).FirstOrDefault();
        lesson_name = getBaiHoc.baihoc_title;
        link_next = getBaiHoc.link_next;
        link_prev = getBaiHoc.link_prev;
        baihoc = getBaiHoc.baihoc_title;
        txtID_LoaiGame.Value = getBaiHoc.baihoc_loaigame;
        if (!string.IsNullOrEmpty(getBaiHoc.baihoc_loaigame))
        {
            arrLoaiGame = getBaiHoc.baihoc_loaigame.Split(',');
        }
        Load();
    }
    public void Load()
    {
        var getXemBaiHoc = (from xbh in db.tbSoLLDT_LichSuHocSinhXemBaiHocs
                            where xbh.baihoc_id == baihoc_id && xbh.hocsinh_id == hocsinh_id
                            orderby xbh.lichsuxembai_solan descending
                            select xbh.lichsuxembai_solan).FirstOrDefault() ?? 0;
        var getDiemBaiHoc = (from dbh in db.tbSoLLDT_LichSuLamBaiHocSinh_ChiTiets
                             where dbh.baihoc_id == baihoc_id && dbh.hocsinh_id == hocsinh_id
                             select dbh.lichsulambai_chitiet_diem).FirstOrDefault();
        var solanlam = (from dbh in db.tbSoLLDT_LichSuLamBaiHocSinh_ChiTiets
                        where dbh.baihoc_id == baihoc_id && dbh.hocsinh_id == hocsinh_id
                        select dbh);
        var sodiemlonnhat = (from dbh in db.tbSoLLDT_LichSuLamBaiHocSinh_ChiTiets
                             where dbh.baihoc_id == baihoc_id && dbh.hocsinh_id == hocsinh_id
                             select dbh.lichsulambai_chitiet_diem);
        var diemCaoNhat = sodiemlonnhat
                 .Select(d => Convert.ToInt32(d))  // Chuyển về số nguyên
                 .OrderByDescending(d => d)
                 .FirstOrDefault();

        int diemBaiHoc = 0;
        int.TryParse(getDiemBaiHoc, out diemBaiHoc);
        // Kiểm tra điều kiện
        if (getXemBaiHoc == 2 && diemCaoNhat >= 8)
        {
            tinhtrangnext = "";
            txtKQ.Value = getXemBaiHoc + "";
            txtSoDiemLonNhatDaCo.Value = Convert.ToString(diemCaoNhat);
        }
        else if (getXemBaiHoc >= 4 && diemCaoNhat >= 8)
        {
            tinhtrangnext = "";
            txtKQ.Value = getXemBaiHoc + "";
            txtSoDiemLonNhatDaCo.Value = Convert.ToString(diemCaoNhat);
        }
        else
        {
            tinhtrangnext = "opacity: 0.5;pointer-events: none;";
            txtKQ.Value = getXemBaiHoc + "";
            txtSoDiemLonNhatDaCo.Value = Convert.ToString(diemCaoNhat);
        }
        //Nối
        int indexNoi = Array.IndexOf(arrLoaiGame, "1");
        if (indexNoi != -1)
        {
            var imgleft = (from c in db.tbGameTiengNhat_Nois
                           where c.sach_id == sach_id
                           && c.baihoc_id == baihoc_id && c.noi_ghichu == null
                           select c).ToList();
            txtTongNoi.Value = Convert.ToString(imgleft.Count());
            imgleft = imgleft.OrderBy(x => Guid.NewGuid()).ToList();
            rpTop.DataSource = imgleft;
            rpTop.DataBind();
            noi = imgleft.Count();
            rpBottom.DataSource = imgleft;
            rpBottom.DataBind();

            var amthanhgamenoi = imgleft.Where(ch => ch.noi_noidung != null);
            if (amthanhgamenoi.Any())
            {
                rpnoidunggamenoi.DataSource = amthanhgamenoi;
                rpnoidunggamenoi.DataBind();
            }
            else
            {
                rpnoidunggamenoi.Visible = false;
            }
        }
        else
        {
            dv_Noi.Visible = false;
        }
        //Trắc nghiệm
        int indexTracNghiem = Array.IndexOf(arrLoaiGame, "2");
        if (indexTracNghiem != -1)
        {
            var listID = (from ch in db.tbGameTiengNhat_CauHois
                          where ch.sach_id == sach_id && ch.baihoc_id == baihoc_id && ch.cauhoi_group == "TracNghiem" && ch.cauhoi_image1 == null
                          select new
                          {
                              ch.cauhoi_id,
                              ch.cauhoi_mp3,
                              ch.cauhoi_image,
                              ch.cauhoi_content,
                              ch.cauhoi_titlecauhoi,
                              ch.cauhoi_amthanhtrung,
                          });
            txtTongTracNghiem.Value = Convert.ToString(listID.Count());
            rpnoidungtracnghiem.DataSource = listID;
            rpnoidungtracnghiem.DataBind();
            int max = listID.Count();
            List<int> termsList = new List<int>();
            for (int i = 0; i < max; i++)
            {
                int see = rnd.Next();
                int index = rnd.Next(0, listID.Count());
                int _id = listID.OrderByDescending(x => (~(x.cauhoi_id & see)) & (x.cauhoi_id | see)).Select(x => x.cauhoi_id).Skip(index).Take(1).First();
                listID = listID.Where(x => x.cauhoi_id != _id);
                termsList.Add(_id);
            }
            var listResult = (from ch in db.tbGameTiengNhat_CauHois
                              where termsList.Contains(ch.cauhoi_id)
                              select new
                              {
                                  ch.cauhoi_id,
                                  ch.cauhoi_mp3,
                                  ch.cauhoi_image,
                                  ch.cauhoi_content,
                                  ch.cauhoi_titlecauhoi,
                                  ch.cauhoi_amthanhtrung,
                                  tracnghiem = ch.cauhoi_mp3 == null ? "display:none" : "display:inline"
                              });

            if (listResult.Count() > 0)
            {
                int seed = rnd.Next();
                List<DapAn> Dapan = new List<DapAn>();
                listResult = listResult.OrderBy(x => (~(x.cauhoi_id & seed)) & (x.cauhoi_id | seed)).Take(5);
                tableMultiple = new DataTable();
                tableMultiple.Columns.Add("cauhoi_id", typeof(int));
                tableMultiple.Columns.Add("cauhoi_mp3", typeof(string));
                tableMultiple.Columns.Add("cauhoi_image", typeof(string));
                tableMultiple.Columns.Add("cauhoi_titlecauhoi", typeof(string));
                tableMultiple.Columns.Add("cauhoi_amthanhtrung", typeof(string));
                tableMultiple.Columns.Add("tracnghiem", typeof(string));
                foreach (var p in listResult)
                {
                    tableMultiple.Rows.Add(p.cauhoi_id, p.cauhoi_mp3, p.cauhoi_image, p.cauhoi_titlecauhoi, p.cauhoi_amthanhtrung, p.tracnghiem);
                    Dapan.Add(new DapAn()
                    {
                        cauhoi_titlecauhoi = p.cauhoi_titlecauhoi,
                        cauhoi_image = p.cauhoi_image,
                        cauhoi_mp3 = p.cauhoi_mp3,
                        cauhoi_id = p.cauhoi_id,
                        tracnghiem = p.tracnghiem,
                    });
                }
                rpCauTraLoi.DataSource = Dapan.Take(5).ToList().OrderBy(x => x.position);
                rpCauTraLoi.DataBind();
                Session["socauMultiple"] = 1;
                Session["tableMultiple"] = tableMultiple;
            }
        }
        else
        {
            dv_TracNghiem.Visible = false;
        }
        //Lật hình
        int indexLatHinh = Array.IndexOf(arrLoaiGame, "3");
        if (indexLatHinh != -1)
        {
            var getnoidunglathhinh = (from l in db.tbGameTiengNhat_LatHinhs
                                      where l.sach_id == sach_id && l.baihoc_id == baihoc_id
                                      select l);
            rpnoidunglathinh.DataSource = getnoidunglathhinh.Take(1);
            rpnoidunglathinh.DataBind();
            var uniqueCodes = db.tbGameTiengNhat_LatHinhs
                               .Where(l => l.sach_id == sach_id && l.baihoc_id == baihoc_id)
                               .Select(l => l.lathinh_code)
                               .Distinct()
                               .ToList();
            int countUniqueCodes = uniqueCodes.Count();
            if (countUniqueCodes > 4)
            {
                socap = 12;
                txtTongLatHinh.Value = Convert.ToString(4);
                for (int i = countUniqueCodes - 1; i > 0; i--)
                {
                    int j = rnd.Next(0, i + 1);
                    string temp = uniqueCodes[i];
                    uniqueCodes[i] = uniqueCodes[j];
                    uniqueCodes[j] = temp;
                }
                var randomUniqueCodes = uniqueCodes.Take(4).ToArray();
                var getList = db.tbGameTiengNhat_LatHinhs
                                .Where(l => l.sach_id == sach_id && l.baihoc_id == baihoc_id
                                         && randomUniqueCodes.Contains(l.lathinh_code))
                                .GroupBy(l => l.lathinh_code)
                                .Select(g => new
                                {
                                    lathinh_code = g.Key,
                                    lathinh_id = g.First().lathinh_id
                                })
                                .ToList();
                int seedd = rnd.Next();
                var randomCode = getList.OrderBy(x => (~(x.lathinh_id & seedd)) & (x.lathinh_id | seedd)).ToList();
                var listData = db.tbGameTiengNhat_LatHinhs
                                 .Where(l => l.sach_id == sach_id && l.baihoc_id == baihoc_id
                                          && randomUniqueCodes.Contains(l.lathinh_code))
                                 .ToList()
                                 .Join(randomCode, l => l.lathinh_code, a => a.lathinh_code,
                                       (l, a) => new
                                       {
                                           l.lathinh_id,
                                           l.lathinh_code,
                                           l.lathinh_image,
                                           l.lathinh_mp3,
                                           col = col,
                                       })
                                 .ToList();
                var result2 = listData.OrderBy(s => (~(s.lathinh_id & seedd)) & (s.lathinh_id | seedd)).ToList();
                var result3 = result2.OrderBy(s => (~(s.lathinh_id & seedd)) & (s.lathinh_id | seedd)).ToList();
                rpListHinhAnh.DataSource = result3.OrderBy(x => rnd.Next());
                rpListHinhAnh.DataBind();
            }
            else if (countUniqueCodes > 3)
            {
                socap = 6;
                txtTongLatHinh.Value = Convert.ToString(3);
                for (int i = countUniqueCodes - 1; i > 0; i--)
                {
                    int j = rnd.Next(0, i + 1);
                    string temp = uniqueCodes[i];
                    uniqueCodes[i] = uniqueCodes[j];
                    uniqueCodes[j] = temp;
                }
                var randomUniqueCodes = uniqueCodes.Take(3).ToArray();
                var getList = db.tbGameTiengNhat_LatHinhs
                                .Where(l => l.sach_id == sach_id && l.baihoc_id == baihoc_id
                                         && randomUniqueCodes.Contains(l.lathinh_code)) // Dùng Contains để lọc dữ liệu
                                .GroupBy(l => l.lathinh_code)
                                .Select(g => new
                                {
                                    lathinh_code = g.Key,
                                    lathinh_id = g.First().lathinh_id
                                })
                                .ToList();
                int seedd = rnd.Next();
                var randomCode = getList.OrderBy(x => (~(x.lathinh_id & seedd)) & (x.lathinh_id | seedd)).ToList();
                var listData = db.tbGameTiengNhat_LatHinhs
                                 .Where(l => l.sach_id == sach_id && l.baihoc_id == baihoc_id
                                          && randomUniqueCodes.Contains(l.lathinh_code))
                                 .ToList()
                                 .Join(randomCode, l => l.lathinh_code, a => a.lathinh_code,
                                       (l, a) => new
                                       {
                                           l.lathinh_id,
                                           l.lathinh_code,
                                           l.lathinh_image,
                                           l.lathinh_mp3,
                                           col = col,
                                       })
                                 .ToList();
                var result2 = listData.OrderBy(s => (~(s.lathinh_id & seedd)) & (s.lathinh_id | seedd)).ToList();
                var result3 = result2.OrderBy(s => (~(s.lathinh_id & seedd)) & (s.lathinh_id | seedd)).ToList();
                rpListHinhAnh.DataSource = result3.OrderBy(x => rnd.Next());
                rpListHinhAnh.DataBind();
            }
            else
            {
                socap = 4;
                txtTongLatHinh.Value = Convert.ToString(2);
                for (int i = countUniqueCodes - 1; i > 0; i--)
                {
                    int j = rnd.Next(0, i + 1);
                    string temp = uniqueCodes[i];
                    uniqueCodes[i] = uniqueCodes[j];
                    uniqueCodes[j] = temp;
                }
                var randomUniqueCodes = uniqueCodes.Take(2).ToArray();
                var getList = db.tbGameTiengNhat_LatHinhs
                                .Where(l => l.sach_id == sach_id && l.baihoc_id == baihoc_id
                                         && randomUniqueCodes.Contains(l.lathinh_code)) // Dùng Contains để lọc dữ liệu
                                .GroupBy(l => l.lathinh_code)
                                .Select(g => new
                                {
                                    lathinh_code = g.Key,
                                    lathinh_id = g.First().lathinh_id
                                })
                                .ToList();
                int seedd = rnd.Next();
                var randomCode = getList.OrderBy(x => (~(x.lathinh_id & seedd)) & (x.lathinh_id | seedd)).ToList();
                var listData = db.tbGameTiengNhat_LatHinhs
                                 .Where(l => l.sach_id == sach_id && l.baihoc_id == baihoc_id
                                          && randomUniqueCodes.Contains(l.lathinh_code))
                                 .ToList()
                                 .Join(randomCode, l => l.lathinh_code, a => a.lathinh_code,
                                       (l, a) => new
                                       {
                                           l.lathinh_id,
                                           l.lathinh_code,
                                           l.lathinh_image,
                                           l.lathinh_mp3,
                                           col = col,
                                       })
                                 .ToList();
                var result2 = listData.OrderBy(s => (~(s.lathinh_id & seedd)) & (s.lathinh_id | seedd)).ToList();
                var result3 = result2.OrderBy(s => (~(s.lathinh_id & seedd)) & (s.lathinh_id | seedd)).ToList();
                rpListHinhAnh.DataSource = result3.OrderBy(x => rnd.Next());
                rpListHinhAnh.DataBind();
            }
            //var uniqueCodes = (from l in db.tbGameTiengNhat_LatHinhs
            //                   where l.sach_id == sach_id && l.baihoc_id == baihoc_id
            //                   select l.lathinh_code).Distinct();
            //Đếm số lượng các giá trị duy nhất
            //txtTongLatHinh.Value = Convert.ToString(uniqueCodes.Count());
            //int seedd = rnd.Next();
            //var getList = (from l in db.tbGameTiengNhat_LatHinhs
            //               where l.sach_id == sach_id && l.baihoc_id == baihoc_id
            //               group l by l.lathinh_code into g
            //               select new
            //               {
            //                   lathinh_code = g.Key,
            //                   lathinh_id = g.First().lathinh_id
            //               });
            //var randomCode = (getList.OrderBy(s => (~(s.lathinh_id & seedd)) & (s.lathinh_id | seedd)));
            //var listData = from l in db.tbGameTiengNhat_LatHinhs
            //               where l.sach_id == sach_id && l.baihoc_id == baihoc_id
            //               join a in randomCode on l.lathinh_code equals a.lathinh_code
            //               select new
            //               {
            //                   l.lathinh_id,
            //                   l.lathinh_code,
            //                   l.lathinh_image,
            //                   l.lathinh_mp3,
            //                   col = col,
            //               };
            //var result2 = (listData.OrderBy(s => (~(s.lathinh_id & seedd)) & (s.lathinh_id | seedd)));
            //var result3 = (result2.OrderBy(s => (~(s.lathinh_id & seedd)) & (s.lathinh_id | seedd)));
            //rpListHinhAnh.DataSource = result3.OrderBy(x => rnd.Next());
            //rpListHinhAnh.DataBind();
        }
        else
        {
            dv_LapHinh.Visible = false;
        }
    }
    public class DapAn
    {
        public int cautraloi_id { get; set; }
        public string cautraloi_image { get; set; }
        public string cautraloi_mp3 { get; set; }
        public string style { get; set; }
        public string cautraloi_dapandung { get; set; }
        public int position { get; set; }
        public string tracnghiem_traloi_name { get; set; }
        public string style_class { get; set; }
        public string cauhoi_titlecauhoi { get; set; }
        public string cauhoi_mp3 { get; set; }
        public string cauhoi_image { get; set; }
        public int cauhoi_id { get; set; }
        public string tracnghiem { get; set; }
    }
    protected void rpCauTraLoi_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Repeater rpDapAn = e.Item.FindControl("rpDapAn") as Repeater;
        string cauhoi_id = DataBinder.Eval(e.Item.DataItem, "cauhoi_id").ToString();
        Random rnd = new Random();
        int seed = rnd.Next();
        var get_id_CauTraLoisai = (from l in db.tbGameTiengNhat_CauTraLois
                                   where l.cauhoi_id == Convert.ToInt16(cauhoi_id) && l.cautraloi_dapandung == false
                                   select l);
        var cautraloidung = (from l in db.tbGameTiengNhat_CauTraLois
                             where l.cauhoi_id == Convert.ToInt16(cauhoi_id) && l.cautraloi_dapandung != false
                             select l);
        Random random = new Random();
        int seed1 = random.Next();
        var result1 = (get_id_CauTraLoisai.OrderBy(s => (~(s.cauhoi_id & seed1)) & (s.cauhoi_id | seed1))).Take(2);
        var result = result1.Union(cautraloidung); /*//Union : cộng 2 bảng lại với nhau.*/
        int[] _arr = new int[100];
        string a = "";
        List<DapAn> Dapan = new List<DapAn>();
        for (int i = 0; i < _arr.Length; i++)
        {
            int vitri = rnd.Next(1, 4);
            if (!a.Contains(vitri + ""))
            {
                var rs = (from r in result
                          select new
                          {
                              r.cauhoi_id,
                              r.cautraloi_id,
                              cautraloi_image = r.cautraloi_text == null ? "<img class='answer-item__gather--img' src='" + r.cautraloi_image + "' />" : r.cautraloi_text,
                              //cautraloi_image = r.cautraloi_image.Contains(".png") ? "<img class='answer-item__gather--img' src='" + r.cautraloi_image + "'/>" : r.cautraloi_image,
                              style = (r.cautraloi_mp3 != null) ? "display: block" : "display: none",
                              cautraloi_mp3 = r.cautraloi_mp3,
                              r.cautraloi_dapandung,
                              //r.tracnghiem_traloi_name,
                              position = vitri,
                              style_class = r.cautraloi_text == null ? "--img" : "--txt"
                          }).First();
                Dapan.Add(new DapAn()
                {
                    cautraloi_id = rs.cautraloi_id,
                    cautraloi_image = rs.cautraloi_image,
                    cautraloi_mp3 = rs.cautraloi_mp3,
                    style = rs.style,
                    cautraloi_dapandung = rs.cautraloi_dapandung + "",
                    //cautraloi_dapandung = rs.cautraloi_dapandung,
                    //tracnghiem_traloi_name = rs.tracnghiem_traloi_name,
                    position = rs.position,
                    style_class = rs.style_class,
                    cauhoi_id = (int)rs.cauhoi_id,
                });
                //result2.Union(rs);
                result = result.Where(x => x.cautraloi_id != rs.cautraloi_id);
                a += vitri + ",";
            }
        }
        rpDapAn.DataSource = Dapan.ToList().OrderBy(x => x.position);
        rpDapAn.DataBind();
        //txtDapAnTruoc.Value = a.Split(',')[0];

    }

    protected void btnLamLaiBaiTap_ServerClick(object sender, EventArgs e)
    {
        startTime = DateTime.Now;
        tbSoLLDT_LichSuHocSinhXemBaiHoc insert = new tbSoLLDT_LichSuHocSinhXemBaiHoc();
        var checkHocSinh = from ls in db.tbSoLLDT_LichSuHocSinhXemBaiHocs where ls.hocsinh_id == hocsinh_id && ls.baihoc_id == baihoc_id && ls.sach_id == sach_id orderby ls.lichsuxembai_id descending select ls;
        if (checkHocSinh.Any())
        {
            insert.lichsuxembai_solan = checkHocSinh.First().lichsuxembai_solan + 1;
        }
        else
        {
            insert.lichsuxembai_solan = 1;
        }
        insert.hocsinh_id = hocsinh_id;
        insert.sach_id = sach_id;
        insert.baihoc_id = baihoc_id;
        insert.lichsuxembai_thoigianbatdau = startTime;
        db.tbSoLLDT_LichSuHocSinhXemBaiHocs.InsertOnSubmit(insert);
        db.SubmitChanges();
        Load();
    }
    protected void btnNext_ServerClick(object sender, EventArgs e)
    {
        string[] parts = link_next.Split('-');
        string number = parts[parts.Length - 1];
        startTime = DateTime.Now;
        tbSoLLDT_LichSuHocSinhXemBaiHoc insert = new tbSoLLDT_LichSuHocSinhXemBaiHoc();
        var checkHocSinh = from ls in db.tbSoLLDT_LichSuHocSinhXemBaiHocs where ls.hocsinh_id == hocsinh_id && ls.baihoc_id == Convert.ToInt32(number) && ls.sach_id == sach_id orderby ls.lichsuxembai_id descending select ls;
        if (checkHocSinh.Any())
        {
            insert.lichsuxembai_solan = checkHocSinh.First().lichsuxembai_solan + 1;
        }
        else
        {
            insert.lichsuxembai_solan = 1;
        }
        insert.hocsinh_id = hocsinh_id;
        insert.sach_id = sach_id;
        insert.baihoc_id = Convert.ToInt32(number);
        insert.lichsuxembai_thoigianbatdau = startTime;
        db.tbSoLLDT_LichSuHocSinhXemBaiHocs.InsertOnSubmit(insert);
        db.SubmitChanges();
        Response.Redirect(link_next);
    }

    protected void btnBack_ServerClick(object sender, EventArgs e)
    {
        string[] parts = link_prev.Split('-');
        string number = parts[parts.Length - 1];
        startTime = DateTime.Now;
        tbSoLLDT_LichSuHocSinhXemBaiHoc insert = new tbSoLLDT_LichSuHocSinhXemBaiHoc();
        var checkHocSinh = from ls in db.tbSoLLDT_LichSuHocSinhXemBaiHocs where ls.hocsinh_id == hocsinh_id && ls.baihoc_id == Convert.ToInt32(number) && ls.sach_id == sach_id orderby ls.lichsuxembai_id descending select ls;
        if (checkHocSinh.Any())
        {
            insert.lichsuxembai_solan = checkHocSinh.First().lichsuxembai_solan + 1;
        }
        else
        {
            insert.lichsuxembai_solan = 1;
        }
        insert.hocsinh_id = hocsinh_id;
        insert.sach_id = sach_id;
        insert.baihoc_id = Convert.ToInt32(number);
        insert.lichsuxembai_thoigianbatdau = startTime;
        db.tbSoLLDT_LichSuHocSinhXemBaiHocs.InsertOnSubmit(insert);
        db.SubmitChanges();
        Response.Redirect(link_prev);
    }
}