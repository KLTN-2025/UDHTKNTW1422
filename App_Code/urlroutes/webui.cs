using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for webui
/// </summary>
public class webui
{
    public webui()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public List<string> UrlRoutes()
    {
        List<string> list = new List<string>();
        list.Add("webTrangChu|home-4-cap|~/HomeNew.aspx");
        // Mầm non
        list.Add("moduleloginmamnon|app-login-mam-non|~/web_module/module_MamNon/mamnon_Login.aspx");
        list.Add("webmamnontrangchu|mam-non-trang-chu|~/landingpage/MamNon/mamnon_Default.aspx");
        list.Add("webmamnonbanggia|mam-non-bang-gia|~/landingpage/MamNon/mamnon_Price.aspx");
        list.Add("webmamnonlienhe|mam-non-lien-he|~/landingpage/MamNon/mamnon_Contact.aspx");
        list.Add("webmamnonhuongdanbaitap|mam-non-huong-dan-bai-tap|~/landingpage/MamNon/mamnon_HuongDanBaiTap.aspx");
        //Tiểu học landingpage
        list.Add("webtieuhoclandingpagetrangchu|tieu-hoc-trang-chu|~/landingpage/TieuHoc/tieuhoc_Default.aspx");
        list.Add("webtieuhoclandingpagebanggia|tieu-hoc-bang-gia|~/landingpage/TieuHoc/tieuhoc_Price.aspx");
        list.Add("webtieuhoclandingpagehuongdanbaitap|tieu-hoc-huong-dan-bai-tap|~/landingpage/TieuHoc/tieuhoc_HuongDanBaiTap.aspx");
        list.Add("webtieuhoclandingpagelienhe|tieu-hoc-lien-he|~/landingpage/TieuHoc/tieuhoc_Contact.aspx");
        list.Add("webtieuhoclandingpagelogin|app-login-tieu-hoc|~/landingpage/TieuHoc/tieuhoc_Login.aspx");
        //Tiểu học app
        //list.Add("webapptieuhoclogin|app-login-tieu-hoc|~/web_module/module_TieuHoc/tieuhoc_Login.aspx");
        list.Add("webapptieuhoctrangchu|app-tieu-hoc-trang-chu|~/web_module/module_TieuHoc/tieuhoc_HomeTieuHoc.aspx");
        list.Add("webapptieuhoctaikhoan|app-tieu-hoc-tai-khoan|~/web_module/module_TieuHoc/tieuhoc_AccountManagerOnline.aspx");
        list.Add("webapptieuhoccaidattieuhoc|app-tieu-hoc-cai-dat|~/web_module/module_TieuHoc/tieuhoc_GeneralConfig.aspx");
        list.Add("webttieuhoclambaikiemtra|tieu-hoc-lam-bai-kiem-tra|~/landingpage/TieuHoc/tieuhoc_Test.aspx");
        //Đổi vật phẩm tiểu học
        list.Add("webapptieuhocdoivatphamonline|app-tieu-hoc-doi-vat-pham-online|~/web_module/module_TieuHoc/tieuhoc_ExchangeGiftsOnline.aspx");
        list.Add("webapptieuhocdoivatpham|app-tieu-hoc-doi-vat-pham|~/web_module/module_TieuHoc/tieuhoc_ExchangeGifts.aspx");
        list.Add("webapptieuhocgiohang|app-tieu-hoc-gio-hang|~/web_module/module_TieuHoc/tieuhoc_CartOnline.aspx");
        list.Add("webapptieuhocthanhtoan|app-tieu-hoc-thanh-toan|~/web_module/module_TieuHoc/tieuhoc_ThanhToan.aspx");
        list.Add("webapptieuhocdiachithanhtoan|app-tieu-hoc-dia-chi-thanh-toan|~/web_module/module_TieuHoc/tieuhoc_DiaChiGiaoHang.aspx");
        list.Add("webapptieuhocdathangthanhcong|app-tieu-hoc-dat-hang-thanh-cong|~/web_module/module_TieuHoc/tieuhoc_PageSuccess.aspx");
        list.Add("webapptieuhoclichsuthanhtoan|app-tieu-hoc-lich-su-thanh-toan|~/web_module/module_TieuHoc/tieuhoc_StatusOrder.aspx");

        //THCS          
        list.Add("webTHCSgioithieu|thcs-trang-chu|~/landingpage/THCS/thcs_Default.aspx");
        list.Add("webTHCSlienhe|thcs-lien-he|~/landingpage/THCS/thcs_Contact.aspx");
        list.Add("webTHCSbanggia|thcs-bang-gia|~/landingpage/THCS/thcs_Price.aspx");
        list.Add("webTHCShuongdanbaitap|thcs-huong-dan-bai-tap-{id}|~/landingpage/THCS/thcs_HuongDanBaiTap.aspx");
        list.Add("webTHCSloginthcs|app-login-thcs|~/landingpage/THCS/thcs_Login.aspx");
        // THPT
        list.Add("webTHPTgioithieu|thpt-trang-chu|~/landingpage/THPT/thpt_Default.aspx");
        list.Add("webTHPTbanggia|thpt-bang-gia|~/landingpage/THPT/thpt_Price.aspx");
        list.Add("webTHPTlienhe|thpt-lien-he|~/landingpage/THPT/thpt_Contact.aspx");
        list.Add("webTHPThuongdanbaitap|thpt-huong-dan-bai-tap-{id}|~/landingpage/THPT/thpt_HuongDanBaiTap.aspx");
        list.Add("webTHPTloginthpt|app-login-thpt|~/landingpage/THPT/thpt_Login.aspx");
        // module Thanh toan
        list.Add("moduledanhmucvatpham|danh-muc-vat-pham|~/web_module/module_TieuHoc/module_ThanhToan/tieuhoc_DanhMucVatPham.aspx");
        list.Add("moduledoiqua|doi-qua|~/web_module/module_TieuHoc/module_ThanhToan/tieuhoc_DoiQua.aspx");

        //APP THCS - THPT

        list.Add("moduledanhmucthcs|app-thcs|~/web_module/module_THCS/thcs_Home.aspx");
        list.Add("moduledanhmucthpt|app-thpt|~/web_module/module_THPT/thpt_Home.aspx");
        list.Add("moduledanhmuckhoithcs|app-danh-muc-khoi-thcs-{khoi-id}|~/web_module/module_THCS/thcs_DanhMucKhoi.aspx");
        list.Add("moduledanhmuckhoithpt|app-danh-muc-khoi-thpt-{khoi-id}|~/web_module/module_THPT/thpt_DanhMucKhoi.aspx");
        list.Add("modulebaikiemtrathcs|app-bai-kiem-tra-thcs-{khoi-id}|~/web_module/module_THCS/thcs_BaiKiemTra.aspx");
        list.Add("moduledoimatkhauthcs|app-doi-mat-khau-thcs|~/web_module/module_THCS/thcs_DoiMatKhau.aspx");
        list.Add("moduledoimatkhauthpt|app-doi-mat-khau-thpt|~/web_module/module_THPT/thpt_DoiMatKhau.aspx");
        list.Add("modulelienhethcs|app-lien-he-thcs|~/web_module/module_THCS/thcs_LienHe.aspx");
        list.Add("moduleluyentapthcs|app-luyen-tap-thcs-{khoi}-{mon}|~/web_module/module_THCS/thcs_LuyenTap.aspx");
        list.Add("moduleluyentapthpt|app-luyen-tap-thpt-{khoi}-{mon}|~/web_module/module_THPT/thpt_LuyenTap.aspx");
        //list.Add("moduleluyentapthcs|app-luyen-tap-thcs|~/web_module/module_THCS/vietnhatliencap_DanhSachBaiLuyenTap.aspx");
        list.Add("modulelamkiemtrathcs|app-lam-kiem-tra-thcs|~/web_module/module_THCS/thcs_LamKiemTra.aspx");
        list.Add("modulelamluyentapthcs|app-lam-luyen-tap-thcs|~/web_module/module_THCS/thcs_LamLuyenTap.aspx");
        list.Add("modulequanlitaikhoanthcs|app-quan-li-tai-khoan-thcs|~/web_module/module_THCS/thcs_AccountManager.aspx");
        list.Add("modulequanlitaikhoanthpt|app-quan-li-tai-khoan-thpt|~/web_module/module_THPT/thpt_AccountManager.aspx");
        list.Add("moduletongtincanhanthcs|app-thong-tin-ca-nhan-thcs|~/web_module/module_THCS/thcs_ThongTinCaNhan.aspx");
        list.Add("moduletongtincanhanthpt|app-thong-tin-ca-nhan-thpt|~/web_module/module_THPT/thpt_ThongTinCaNhan.aspx");
        list.Add("moduletaikhoanyeuthichthcs|app-tai-khoan-yeu-thich-thcs|~/web_module/module_THCS/thcs_Favorite.aspx");
        list.Add("moduletaikhoanyeuthichthpt|app-tai-khoan-yeu-thich-thpt|~/web_module/module_THPT/thpt_Favorite.aspx");
        list.Add("moduletaikhoanlichsuthcs|app-tai-khoan-lich-su-thcs|~/web_module/module_THCS/thcs_History.aspx");
        list.Add("moduletaikhoanlichsuthpt|app-tai-khoan-lich-su-thpt|~/web_module/module_THPT/thpt_History.aspx");
        list.Add("modulevideohoctapthcs|app-video-hoc-tap-thcs-{khoi}-{mon}-{video}|~/web_module/module_THCS/thcs_VideoHocTap.aspx");
        list.Add("modulevideohoctapthpt|app-video-hoc-tap-thpt-{khoi}-{mon}-{video}|~/web_module/module_THPT/thpt_VideoHocTap.aspx");
        list.Add("modulelichsubaikiemtrathcs|app-lich-su-bai-kiem-tra-thcs|~/web_module/module_THCS/thcs_LichSuBaiKiemTra.aspx");
        list.Add("modulelichsubailuyentapthcs|app-lich-su-bai-luyen-tap-thcs-{khoi-id}-{mon-id}-{luyentap-id}|~/web_module/module_THCS/thcs_LichSuBaiLuyenTap.aspx");
        list.Add("modulegiahangoithcs|app-gia-han-goi-thcs|~/web_module/module_THCS/thcs_RenewPackage.aspx");
        list.Add("modulegiahangoithpt|app-gia-han-goi-thpt|~/web_module/module_THPT/thpt_RenewPackage.aspx");


        //Game Toán+Tiếng_Anh+Tiếng_Việt
        list.Add("moduleTracNghiemHinh|game-trac-nghiem-hinh-{sach-id}-{baihoc-id}-{baihocchitiet_id}|~/web_module/module_GameTieuHoc/Game_Lop_1/Toan/game_Trac_Nghiem_Hinh.aspx");
        list.Add("moduleTracNghiem|game-trac-nghiem-{sach-id}-{baihoc-id}-{baihocchitiet_id}|~/web_module/module_GameTieuHoc/Game_Lop_1/Toan/game_Trac_Nghiem.aspx");
        list.Add("moduleLatHinh|game-lat-hinh-{sach-id}-{baihoc-id}-{baihocchitiet_id}|~/web_module/module_GameTieuHoc/Game_Lop_1/Toan/game_Lat_Hinh.aspx");
        list.Add("moduleGameChonSoHinh|game-chon-so-hinh-{lop-id}-{sach-id}-{baihoc-id}-{baihocchitiet_id}|~/web_module/module_GameTieuHoc/Game_Lop_1/Toan/game_Chon_So_Hinh.aspx");
        list.Add("moduleChonSo|game-chon-so-{lop-id}-{sach-id}-{baihoc-id}-{baihocchitiet_id}|~/web_module/module_GameTieuHoc/Game_Lop_1/Toan/game_Chon_So.aspx");
        list.Add("moduleNoi|game-noi-{sach-id}-{baihoc-id}-{baihocchitiet_id}|~/web_module/module_GameTieuHoc/Game_Lop_1/Toan/game_Noi.aspx");
        list.Add("moduleGameKeoTha|game-keo-tha-{lop-id}-{sach-id}-{baihoc-id}-{baihocchitiet_id}|~/web_module/module_GameTieuHoc/Game_Lop_1/Toan/game_Keo_Tha.aspx");
        list.Add("moduleGameSucXac|game-suc-xac-{lop-id}-{sach-id}-{baihoc-id}-{baihocchitiet_id}|~/web_module/module_GameTieuHoc/Game_Lop_1/Toan/game_Suc_Xac.aspx");
        list.Add("moduleGameChonMot|game-chon-mot-{lop-id}-{sach-id}-{baihoc-id}-{baihocchitiet_id}|~/web_module/module_GameTieuHoc/Game_Lop_1/Toan/game_Chon_Mot.aspx");
        list.Add("moduleGameChonDau|game-chon-dau-{lop-id}-{sach-id}-{baihoc-id}-{baihocchitiet_id}|~/web_module/module_GameTieuHoc/Game_Lop_1/Toan/game_Chon_Dau.aspx");
        list.Add("moduleGameTrueFalse|game-true-false-{lop-id}-{sach-id}-{baihoc-id}-{baihocchitiet_id}|~/web_module/module_GameTieuHoc/Game_Lop_1/Toan/game_True_False.aspx");
        list.Add("moduleGameChonNhieu|game-chon-nhieu-{lop-id}-{sach-id}-{baihoc-id}-{baihocchitiet_id}|~/web_module/module_GameTieuHoc/Game_Lop_1/Toan/game_Chon_Nhieu.aspx");
        list.Add("moduleGameChonCap|game-chon-cap-{lop-id}-{sach-id}-{baihoc-id}-{baihocchitiet_id}|~/web_module/module_GameTieuHoc/Game_Lop_1/Toan/game_Chon_Cap.aspx");
        list.Add("moduleGameDienSoLienTiep|game-dien-so-lien-tiep-{lop-id}-{sach-id}-{baihoc-id}-{baihocchitiet_id}|~/web_module/module_GameTieuHoc/Game_Lop_1/Toan/game_dien_so_lien_tiep.aspx");
        //list.Add("moduleGameDoca|game-doc-a-{lop-id}-{sach-id}-{baihoc-id}-{baihocchitiet_id}|~/web_module/game/game_Doc_a.aspx");
        //list.Add("moduleGameDoc|game-doc-{lop-id}-{sach-id}-{baihoc-id}-{baihocchitiet_id}|~/web_module/game/game_Doc.aspx");
        //list.Add("moduleGameVideo|game-video-{lop-id}-{sach-id}-{baihoc-id}-{baihocchitiet_id}|~/web_module/game/game_Video.aspx");
        list.Add("moduleTiengVietGameKeoTha|game-tieng-viet-keo-tha-{lop-id}-{sach-id}-{baihoc-id}-{baihocchitiet_id}|~/web_module/module_GameTieuHoc/Game_Lop_1/TiengViet/game_Keo_Tha.aspx");

        //Thi
        list.Add("moduledethi|ma-de-MD0001|~/web_module/module_TieuHoc/module_KiemTra/tieuhoc_BaiThi.aspx");
        list.Add("modulediemkiemtra|diem-kiem-tra|~/web_module/module_TieuHoc/module_KiemTra/tieuhoc_Diem.aspx");
        list.Add("modulechudekiemtra|chu-de-kiem-tra|~/web_module/module_TieuHoc/module_KiemTra/tieuhoc_DanhSachDeThi.aspx");
        list.Add("moduledanhmucbaithi|app-lich-su-bai-thi|~/web_module/module_TieuHoc/module_KiemTra/tieuhoc_DanhMucKiemTra.aspx");
        list.Add("modulelichsukiemtra|app-lich-su-kiem-tra|~/web_module/module_TieuHoc/module_KiemTra/tieuhoc_LichSuKiemTraBaiThi.aspx");

        //Json Bài tổng hợp
        list.Add("webbaibaitonghopphanmot|bai-tong-hop-phan-mot-{id_test}|~/web_module/module_Api/Api_BaiTongHop_Part1.aspx");
        list.Add("webbaibaitonghopphanhai|bai-tong-hop-phan-hai-{id_test}|~/web_module/module_Api/Api_BaiTongHop_Part2.aspx");
        list.Add("webbaibaitonghopphanba|bai-tong-hop-phan-ba-{id_test}|~/web_module/module_Api/Api_BaiTongHop_Part3.aspx");
        // Bài tổng hợp

        //trắc nghiệm
        list.Add("weblogintracnghiem|login-account|~/web_module/web_tracnghiem/Login.aspx");
        list.Add("webtrangchutracnghiem|trac-nghiem|~/Default_MutipleChoice.aspx");
        //list.Add("webdanhsachbailuyentap|danh-sach-bai-luyen-tap-{id_khoi}/{id_mon}|~/web_module/web_tracnghiem/web_DanhSachBaiLuyenTap.aspx");
        //list.Add("webdanhsachbailuyentap|danh-sach-bai-luyen-tap-{id_khoi}/{id_mon}|~/web_module/web_tracnghiem/vietnhatliencap_DanhSachBaiLuyenTap.aspx");
        //list.Add("weblambailuyentapchitiet|bai-luyen-tap-chi-tiet-{id_khoi}/{name}-{id_test}|~/web_module/web_tracnghiem/web_LamBaiLuyenTap.aspx");
        //list.Add("weblambailuyentapchitiet|bai-luyen-tap-chi-tiet-{id_khoi}/{name}-{id_test}|~/web_module/web_tracnghiem/vietnhatliencap_LamBaiLuyenTap.aspx");
        list.Add("weblambailuyentaptuluan|bai-luyen-tap-chi-tiet-tu-luan-{id_khoi}/{name}-{id_test}|~/web_module/web_tracnghiem/vietnhatliencap_LamBaiLuyenTap_TuLuan.aspx");
        list.Add("weblambailuyentapchitiet|bai-luyen-tap-chi-tiet-{id_khoi}/{name}-{id_test}|~/web_module/web_tracnghiem/vietnhatliencap_LamBaiLuyenTap_Ver2Copy.aspx");
        list.Add("weblambaikiemtrachitiet|bai-kiem-tra-chi-tiet/{name}-{id_test}|~/web_module/web_tracnghiem/web_LamBaiKiemTra.aspx");
        list.Add("webresultexercices|result-exercises|~/web_module/web_tracnghiem/web_KetQuaLuyenTap.aspx");
        list.Add("webclasssubject|subject-of-grade/{id}|~/web_module/web_tracnghiem/web_MonHocCuaKhoi.aspx");
        list.Add("soLLDT_baikiemtrakieutracnghiemchitiet|slldt-bai-kiem-tra-trac-nghiem-chi-tiet-{id}|~/web_module/web_tracnghiem/vietnhatliencap_BaiKiemTra_TracNghiem.aspx");

        //bài kiểm tra
        list.Add("modulebaikiemtratieuhoc|bai-kiem-tra-tieu-hoc-{dekiemtra-id}-{lop-id}-{sach-id}|~/web_module/module_TieuHoc/tieuhoc_BaiKiemTra.aspx");
        return list;
    }
}