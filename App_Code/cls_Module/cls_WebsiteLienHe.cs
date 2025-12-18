using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for cls_WebsiteLienHe
/// </summary>
public class cls_WebsiteLienHe
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public cls_WebsiteLienHe()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public bool insert_Data(string hoten, string sodienthoai, string noidung)
    {
        tbWebsiteLienHe insert = new tbWebsiteLienHe();
        insert.lienhe_hoten = hoten;
        insert.lienhe_sodienthoai = sodienthoai;
        insert.lienhe_noidung = noidung;
        insert.lienhe_tinhtrangxem = "Chưa xem";
        insert.lienhe_ngaytao = DateTime.Now;
        insert.hidden = false;
        db.tbWebsiteLienHes.InsertOnSubmit(insert);
        try
        {
            db.SubmitChanges();
            return true;
        }
        catch
        {
            return false;
        }
    }
}