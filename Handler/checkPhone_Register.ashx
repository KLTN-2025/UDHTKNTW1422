<%@ WebHandler Language="C#" Class="checkPhone_Register" %>

using System;
using System.Web;
using System.Linq;

public class checkPhone_Register : IHttpHandler {
    
    dbcsdlDataContext db = new dbcsdlDataContext();
    public void ProcessRequest(HttpContext context)
    {
        string phone = context.Request["phone"];
        if (string.IsNullOrEmpty(phone))
        {
            context.Response.Write("invalid");
            return;
        }
        bool exists = db.tbAccounts.Any(u => u.account_sodienthoai == phone);
        context.Response.Write(exists ? "exists" : "ok");
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}