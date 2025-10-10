using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for adminmodule
/// </summary>
public class adminmodule
{
    public adminmodule()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public List<string> UrlRoutes()
    {
        List<string> list = new List<string>();
        //Module SEO
        list.Add("moduleseo|admin-seo|~/admin_page/module_function/module_SEO.aspx");
        //Module quản lí tài khoản
        list.Add("moduledangky|admin-dang-ki|~/admin_page/module_function/module_QuanLy_TaiKhoan/module_DangKy.aspx");
        list.Add("modulequanlitaikhoan|admin-quan-li-tai-khoan|~/admin_page/module_function/module_QuanLy_TaiKhoan/module_Account.aspx");
        list.Add("moduleagiahan|admin-gia-han|~/admin_page/module_function/module_QuanLy_TaiKhoan/module_GiaHan.aspx");

        //Module quản lý LandingPage và App Sổ LLĐT
        list.Add("moduleslldtslide|admin-landingpage-slide|~/admin_page/module_function/module_App_SLLDT/module_SLLDT_Slide.aspx");
        list.Add("moduleslldtslogan|admin-landingpage-slogan|~/admin_page/module_function/module_App_SLLDT/module_SLLDT_Slogan.aspx");
        list.Add("moduleslldtvideo|admin-landingpage-video|~/admin_page/module_function/module_App_SLLDT/module_SLLDT_Video.aspx");
        list.Add("moduleslldtquytrinh|admin-landingpage-quy-trinh|~/admin_page/module_function/module_App_SLLDT/module_SLLDT_QuyTrinh.aspx");
        list.Add("moduleslldtquangcao|admin-landingpage-quang-cao|~/admin_page/module_function/module_App_SLLDT/module_SLLDT_QuangCao.aspx");
        list.Add("moduleslldtthongbao|admin-slldt-thong-bao|~/admin_page/module_function/module_App_SLLDT/module_SLLDT_ThongBao.aspx");
        list.Add("moduleslldtluyentapstar|admin-slldt-luyen-tap-star|~/admin_page/module_function/module_App_SLLDT/module_SLLDT_LuyenTap_Star.aspx");
        list.Add("modulehuongdanbaitap|admin-menu-huong-dan|~/admin_page/module_function/module_App_SLLDT/module_SLLDT_Menu_HuongDan.aspx");
        list.Add("modulebanggia|admin-bang-gia|~/admin_page/module_function/module_GioiThieu4Cap/module_BangGia.aspx");
        //admin kho vật phẩm
        list.Add("modulenhapvatpham|admin-nhap-vat-pham|~/admin_page/module_function/module_KhoVatPham/admin_VatPham.aspx");
        list.Add("moduledinhluongquasticker|admin-dinh-luong-qua-sticker|~/admin_page/module_function/module_KhoVatPham/admin_QuaSticker.aspx");
        list.Add("modulekhohang|admin-kho-hang|~/admin_page/module_function/module_KhoVatPham/admin_KhoHang.aspx");
        list.Add("modulenhaphang|admin-nhap-hang|~/admin_page/module_function/module_KhoVatPham/admin_NhapHang.aspx");
        list.Add("modulethemnhaphang|admin-them-nhap-hang-{id}|~/admin_page/module_function/module_KhoVatPham/admin_ThemNhapHang.aspx");
        list.Add("modulexuathang|admin-xuat-hang|~/admin_page/module_function/module_KhoVatPham/admin_XuatHang.aspx");
        list.Add("moduledonhangcuaadmin|admin-don-hang-cua-admin|~/admin_page/module_function/module_KhoVatPham/admin_DonHangCuaAdmin.aspx");
        list.Add("moduledonhangcuakhachhang|admin-don-hang-cua-khach-hang-{id}|~/admin_page/module_function/module_KhoVatPham/admin_DonHangCuaKhachHang.aspx");
        //admin trắc nghiệm
        list.Add("modulequanlymoduletracnghiem|admin-quan-ly-module-trac-nghiem|~/admin_page/module_function/module_TracNghiem/module_QuanLyModuleTracNghiem.aspx");
        list.Add("modulethemcauhoitracnghiem|admin-quan-ly-cau-hoi-trac-nghiem-{khoi_id}-{mon_id}-{chuong_id}-{baihoc_id}|~/admin_page/module_function/module_TracNghiem/module_QuanLyCauHoiTracNghiem.aspx");
        list.Add("modulecauhoitracnghiemphan2|admin-quan-ly-trac-nghiem-phan-hai-{khoi_id}-{mon_id}-{chuong_id}-{baihoc_id}|~/admin_page/module_function/module_TracNghiem/module_QuanLyCauHoiTracNghiem_Part2.aspx");
        list.Add("modulecauhoiphan3|admin-quan-ly-trac-nghiem-phan-ba-{khoi_id}-{mon_id}-{chuong_id}-{baihoc_id}|~/admin_page/module_function/module_TracNghiem/module_QuanLyCauHoiTracNghiem_Part3.aspx");
        //admin Nhập liệu 
        list.Add("moduleNhapLieuGameTracNghiem|nhap-lieu-game-trac-nghiem|~/admin_page/module_function/module_NhapLieuGame/module_NhapLieuGameTracNghiem.aspx");
        list.Add("moduleDuLieuGameTracNghiem|du-lieu-game-trac-nghiem|~/admin_page/module_function/module_NhapLieuGame/module_LoaiGameTracNghiem.aspx");
        list.Add("moduleChiTietGameTracNghiem|chi-tiet-game-trac-nghiem|~/admin_page/module_function/module_NhapLieuGame/module_ChiTietGameTracNghiem.aspx");
        list.Add("moduleNhapLieuGameChonSo|nhap-lieu-game-chon-so|~/admin_page/module_function/module_NhapLieuGame/module_LoaiGameChonSo.aspx");
        //admin quan ly trò chơi
        list.Add("moduleQuanLySach|quan-ly-nhap-sach|~/admin_page/module_function/module_QuanLyTroChoi/module_QuanLySach.aspx");
        list.Add("moduleQuanLyBaiTap|quan-ly-nhap-bai-tap|~/admin_page/module_function/module_QuanLyTroChoi/module_QuanLyBaiTap.aspx");
        list.Add("moduleQuanLyNhapLieuGame|quan-ly-nhap-lieu-game|~/admin_page/module_function/module_QuanLyTroChoi/module_QuanLyGame.aspx");
        list.Add("moduleQuanLyMoBaiTap|quan-ly-mo-bai-tap|~/admin_page/module_function/module_QuanLyTroChoi/module_QuanLyMoBaiTap.aspx");
        //admin quản lý công việc
        list.Add("modulePhongBan|admin-phong-ban|~/admin_page/module_function/module_KPI/module_PhongBan.aspx");
        list.Add("moduleCaNhan|admin-ca-nhan|~/admin_page/module_function/module_KPI/module_CaNhan.aspx");
        list.Add("moduleChiTietCaNhanVanPhong|admin-chi-tiet-phong-ban-tuyen-sinh-{id}|~/admin_page/module_function/module_KPI/module_CongViecCaNhanChiTiet_TuyenSinh.aspx");
        list.Add("moduleChiTietCaNhan|admin-chi-tiet-phong-ban-{id}|~/admin_page/module_function/module_KPI/module_CongViecCaNhanChiTiet.aspx");
        list.Add("moduleThongKe|admin-thong-ke-cong-viec-phong-ban|~/admin_page/module_function/module_KPI/module_ThongKe_CongViecPhongBan.aspx");
        list.Add("moduleThongKeTuyenSinh|admin-thong-ke-cong-viec-tuyen-sinh|~/admin_page/module_function/module_KPI/module_ThongKe_CongViecPhongBan_TuyenSinh.aspx");
        //admin quản lý target
        list.Add("moduleTarget|admin-target|~/admin_page/module_function/module_KPI/module_Target.aspx");
        list.Add("moduleThongKeTargetTheoNgay|admin-target-theo-ngay|~/admin_page/module_function/module_KPI/module_ThongKe_Target.aspx");
        list.Add("moduleThongKeTargetTheoTuan|admin-target-theo-tuan|~/admin_page/module_function/module_KPI/module_ThongKe_Target_Theo_Tuan.aspx");
        list.Add("moduleThongKeTargetTheoThang|admin-target-theo-thang|~/admin_page/module_function/module_KPI/module_ThongKe_Target_Theo_Thang.aspx");
        //admin bài kiểm tra
        list.Add("moduleTaoBaiKiemTraTieuHoc|admin-tao-bai-kiem-tra-tieu-hoc|~/admin_page/module_function/module_BaiKiemTra/module_BaiKiemTra_TieuHoc_Ver2.aspx");
        list.Add("moduleDanhSachBaiKiemTraTieuHoc|admin-danh-sach-bai-kiem-tra-tieu-hoc|~/admin_page/module_function/module_BaiKiemTra/module_DanhSachBaiKiemTra.aspx");
        list.Add("moduleLichSuBaiKiemTraTieuHoc|admin-lich-su-bai-kiem-tra-tieu-hoc|~/admin_page/module_function/module_BaiKiemTra/module_LichSu_BaiKiemTra.aspx");
        return list;
    }
}