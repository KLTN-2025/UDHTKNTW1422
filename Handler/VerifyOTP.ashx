<%@ WebHandler Language="C#" Class="VerifyOTP" %>

using System;
using System.Web;

public class VerifyOTP : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        string userOTP = context.Request["otp"];
        string sessionOTP = context.Session["CurrentOTP"] as string;
        DateTime? expiry = context.Session["OTP_Expiry"] as DateTime?;

        // Check rỗng, check khớp, check hết hạn
        if (!string.IsNullOrEmpty(sessionOTP) && sessionOTP == userOTP)
        {
            if (expiry != null && DateTime.Now < expiry)
            {
                context.Response.Write("ok");
                return;
            }
        }

        context.Response.Write("fail");
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}