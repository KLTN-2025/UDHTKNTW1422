<%@ WebHandler Language="C#" Class="checkEmail_Register" %>

using System;
using System.Web;
using System.Linq;

public class checkEmail_Register : IHttpHandler {
    
    dbcsdlDataContext db = new dbcsdlDataContext();
    public void ProcessRequest(HttpContext context)
    {
        string email = context.Request["email"];
        if (string.IsNullOrEmpty(email))
        {
            context.Response.Write("invalid");
            return;
        }
        bool exists = db.tbAccounts.Any(u => u.account_email != null && u.account_email.ToLower() == email.ToLower());
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

