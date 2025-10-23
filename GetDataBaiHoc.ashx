<%@ WebHandler Language="C#" Class="GetDataBaiHoc" %>

using System;
using System.Web;
using System.Web.Script.Serialization;
using System.Linq;

public class GetDataBaiHoc : IHttpHandler
{

    dbcsdlDataContext db = new dbcsdlDataContext();
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "application/json";
        string action = context.Request["action"];

        if (action == "lessons")
        {
            getLesson(context);
        }
        else if (action == "lessonskhoihai")
        {
            getLessonKhoiHai(context);
        }
        //else
        //{

        //}
        //{
        //    context.Response.Write("{\"error\": \"Invalid action\"}");
        //}
    }
    private void getLesson(HttpContext context)
    {
        int studentId = int.Parse(context.Request["studentId"] ?? "0");
        int sachId = int.Parse(context.Request["sachId"] ?? "0");
        //lichSuLamBai =
        //(from ls in db.tbSoLLDT_LichSuLamBaiHocSinhs
        // where ls.baihoc_id == bh.baihoc_id && ls.hocsinh_id == studentId
        // orderby ls.lichsulambai_vitribaitap ascending
        // select new
        // {
        //     lichsulambai_vitribaitap = ls.sach_id == 1 ? "" : "Bài tập " + ls.lichsulambai_vitribaitap,
        //     ls.lichsulambai_diem,
        //     sao = ls.lichsulambai_sao == 1 ? "/images/anhgif/1sao.png"
        //          : ls.lichsulambai_sao == 2 ? "/images/anhgif/2sao.png"
        //          : "/images/anhgif/3sao.png",
        //     mystyle = ls.lichsulambai_diem != null ? "" : "display:none",
        //     mystyle2 = ls.lichsulambai_diem != null ? "display:none" : "",
        // }).ToList()
        var result = (from s in db.tbSaches
                      join bh in db.tbBaiHocs on s.sach_id equals bh.sach_id
                      where bh.sach_id == sachId
                      orderby bh.baihoc_position ascending
                      select new
                      {
                          s.sach_id,
                          s.sach_title,
                          bh.baihoc_id,
                          baihoc_title = bh.baihoc_id == 6 ? "Bài 6: O o <img class=\"icon-text\" src=\"/imageGame/Sach/TiengViet_1/dau_hoi-den.png\" />" : bh.baihoc_title,
                          bh.baihoc_avatar,
                          bh.baihoc_link,
                          link_in = bh.baihoc_title.Contains("Bài kiểm tra")
                                    ? "/in-bai-kiem-tra-" + bh.baihoc_link.Substring(1)
                                    : "/in-bai-tap-" + bh.sach_id + "-" + bh.chudebaihoc_id + "-" + bh.baihoc_id,
                          anhien = bh.sach_id == 1 ? "display:none" : "display:block",
                          solan = (db.tbSoLLDT_LichSuHocSinhXemBaiHocs
                                      .Where(ls => ls.sach_id == sachId && ls.baihoc_id == bh.baihoc_id && ls.hocsinh_id == studentId)
                                      .OrderByDescending(ls => ls.lichsuxembai_id)
                                      .Select(ls => (int?)ls.lichsuxembai_solan)
                                      .FirstOrDefault()) ?? 0,
                          //lichSuLamBai = bh.baihoc_sogame ?? 0,
                      }).ToList();
        var finalResult = result.Select(item => new
        {
            item.sach_id,
            item.sach_title,
            item.baihoc_id,
            item.baihoc_title,
            item.baihoc_avatar,
            item.baihoc_link,
            item.link_in,
            item.anhien,
            item.solan,
            //item.lichSuLamBai,
            //listBaiTap = item.lichSuLamBai != 0 ? Enumerable.Range(1, item.lichSuLamBai)
            //           .Select(i => new
            //           {
            //               stt = i,
            //               name = "Bài tập " + i,
            //               sao = (from ls in db.tbSoLLDT_LichSuLamBaiHocSinhs
            //                      where ls.baihoc_id == item.baihoc_id && ls.hocsinh_id == studentId && ls.lichsulambai_vitribaitap == i
            //                      select ls).Count() > 0 ? "/images/anhgif/" + (from ls in db.tbSoLLDT_LichSuLamBaiHocSinhs
            //                                                                    where ls.baihoc_id == item.baihoc_id && ls.hocsinh_id == studentId && ls.lichsulambai_vitribaitap == i
            //                                                                    orderby ls.lichsulambai_id descending
            //                                                                    select ls.lichsulambai_sao).First() + "sao.png" : "/images/anhgif/0sao.png",
            //           })
            //           .ToList() : (from ls in db.tbSoLLDT_LichSuLamBaiHocSinhs
            //                        where ls.baihoc_id == item.baihoc_id && ls.hocsinh_id == studentId
            //                        orderby ls.lichsulambai_id descending
            //                        select new
            //                        {
            //                            stt = 1,
            //                            name = "bài kiểm tra",
            //                            sao = ls.lichsulambai_diem
            //                        }).ToList(),
        }).ToList();

        //JavaScriptSerializer js = new JavaScriptSerializer();
        //string json = js.Serialize(result);
        //context.Response.Write(json);
        context.Response.ContentType = "application/json";
        context.Response.Write(new JavaScriptSerializer().Serialize(finalResult));
    }
    private void getLessonKhoiHai(HttpContext context)
    {
        int studentId = int.Parse(context.Request["studentId"] ?? "0");
        int sachId = int.Parse(context.Request["sachId"] ?? "0");
        var result = from s1 in db.tbSaches
                     join cd in db.tbChuDeBaiHocs on s1.sach_id equals cd.sach_id
                     where cd.sach_id == sachId
                     orderby cd.chudebaihoc_position ascending
                     select new
                     {
                         cd.chudebaihoc_id,
                         cd.chudebaihoc_name,
                         listLessons = (from s in db.tbSaches
                                        join bh in db.tbBaiHocs on s.sach_id equals bh.sach_id
                                        where bh.sach_id == sachId && bh.chudebaihoc_id == cd.chudebaihoc_id
                                        orderby bh.baihoc_position ascending
                                        select new
                                        {
                                            s.sach_id,
                                            s.sach_title,
                                            bh.baihoc_id,
                                            bh.baihoc_title,
                                            bh.baihoc_avatar,
                                            bh.baihoc_link,
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
                                            solan = (db.tbSoLLDT_LichSuHocSinhXemBaiHocs
                                                        .Where(ls => ls.sach_id == sachId && ls.baihoc_id == bh.baihoc_id && ls.hocsinh_id == studentId)
                                                        .OrderByDescending(ls => ls.lichsuxembai_id)
                                                        .Select(ls => (int?)ls.lichsuxembai_solan)
                                                        .FirstOrDefault()) ?? 0,
                                            // Kết hợp danh sách lịch sử vào bài học
                                            lichSuLamBai = (from ls in db.tbSoLLDT_LichSuLamBaiHocSinhs
                                                            where ls.baihoc_id == bh.baihoc_id && ls.hocsinh_id == studentId
                                                            orderby ls.lichsulambai_vitribaitap ascending
                                                            select new
                                                            {
                                                                lichsulambai_vitribaitap = ls.sach_id == 1 ? "" : "Bài tập " + ls.lichsulambai_vitribaitap,
                                                                ls.lichsulambai_diem,
                                                                sao = ls.lichsulambai_sao == 1 ? "/images/anhgif/1sao.png"
                                                                     : ls.lichsulambai_sao == 2 ? "/images/anhgif/2sao.png"
                                                                     : "/images/anhgif/3sao.png",
                                                                mystyle = ls.lichsulambai_diem != null ? "" : "display:none",
                                                                mystyle2 = ls.lichsulambai_diem != null ? "display:none" : "",
                                                            }).ToList()
                                        }).ToList(),
                     };
        context.Response.Write(new JavaScriptSerializer().Serialize(result));
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}