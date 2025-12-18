using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_function_module_DangKyTuVan : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    private int _id;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["_id"] = 0;
        }
        loadData();
    }

    private void loadData()
    {
        // load data đổ vào var danh sách
        var getData = from lh in db.tbWebsiteLienHes
                      where lh.hidden == false
                      orderby lh.lienhe_id descending
                      select new
                      {
                          lh.lienhe_id,
                          lh.lienhe_noidung,
                          lh.lienhe_ngaytao,
                          lh.lienhe_tinhtrangxem,
                          lh.lienhe_hoten,
                          lh.lienhe_sodienthoai,
                      };
        // đẩy dữ liệu vào gridivew
        grvList.DataSource = getData;
        grvList.DataBind();

    }
    private void setNULL()
    {
        txtSoDienThoai.Text = "";
        txtHoTenHocSinh.Text = "";
    }

    protected void btnThem_Click(object sender, EventArgs e)
    {
        // Khi nhấn nút thêm thì mật định session id = 0 để thêm mới
        Session["_id"] = 0;
        // gọi hàm setNull để trả toàn bộ các control về rỗng
        setNULL();
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Insert", "popupControl.Show();", true);
        //loadData();
    }

    protected void btnChiTiet_Click(object sender, EventArgs e)
    {
        // get value từ việc click vào gridview
        _id = Convert.ToInt32(grvList.GetRowValues(grvList.FocusedRowIndex, new string[] { "lienhe_id" }));
        // đẩy id vào session
        Session["_id"] = _id;
        var getData = (from lh in db.tbWebsiteLienHes
                       where lh.lienhe_id == _id
                       select new
                       {
                           lh.lienhe_id,
                           lh.lienhe_noidung,
                           lh.lienhe_ngaytao,
                           lh.lienhe_tinhtrangxem,
                           lh.lienhe_hoten,
                           lh.lienhe_sodienthoai,
                       }).Single();
        txtSoDienThoai.Text = getData.lienhe_sodienthoai;
        txtHoTenHocSinh.Text = getData.lienhe_hoten;
        txtNoiDung.Text = getData.lienhe_noidung;
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "popupControl.Show(); ", true);
        loadData();
    }
    public bool checknull()
    {
        if (txtSoDienThoai.Text != "")
            return true;
        else return false;
    }
    protected void btnLuu_Click(object sender, EventArgs e)
    {
        tbWebsiteLienHe update = db.tbWebsiteLienHes.Where(x => x.lienhe_id == Convert.ToInt32(Session["_id"])).FirstOrDefault();
        update.lienhe_tinhtrangxem = "Đã xem";
        db.SubmitChanges();
        popupControl.ShowOnPageLoad = false;
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Alert", "swal('Xem thành công','','success').then(function(){grvList.Refresh();})", true);
    }
    protected void btnXoa_Click(object sender, EventArgs e)
    {
        List<object> selectedKey = grvList.GetSelectedFieldValues(new string[] { "lienhe_id" });
        if (selectedKey.Count > 0)
        {
            foreach (var item in selectedKey)
            {
                int id = Convert.ToInt32(item);
                var lienhe = db.tbWebsiteLienHes.FirstOrDefault(x => x.lienhe_id == id);
                if (lienhe != null)
                {
                    lienhe.hidden = true;
                }
            }
            db.SubmitChanges();
            ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Alert", "swal('Xóa thành công','','success').then(function(){grvList.Refresh();})", true);
        }
        else
            alert.alert_Warning(Page, "Bạn chưa chọn dữ liệu", "");
    }
}