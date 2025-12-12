<%@ WebHandler Language="C#" Class="AIChat" %>

using System;
using System.Web;
using System.Text;

public class AIChat : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        try
        {
            // Set response headers
            context.Response.ContentType = "text/plain; charset=utf-8";
            context.Response.Charset = "UTF-8";
            context.Response.ContentEncoding = System.Text.Encoding.UTF8;
            context.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            context.Response.Cache.SetNoStore();

            // Try to get message from Form (POST) first, then QueryString (GET)
            string userMessage = "";
            
            if (context.Request.HttpMethod == "POST")
            {
                // Read from request body for POST
                using (System.IO.StreamReader reader = new System.IO.StreamReader(context.Request.InputStream))
                {
                    string body = reader.ReadToEnd();
                    if (!string.IsNullOrEmpty(body))
                    {
                        // Parse form data
                        var pairs = body.Split('&');
                        foreach (var pair in pairs)
                        {
                            var keyValue = pair.Split('=');
                            if (keyValue.Length == 2 && keyValue[0] == "message")
                            {
                                userMessage = System.Web.HttpUtility.UrlDecode(keyValue[1]);
                                break;
                            }
                        }
                    }
                }
                
                // Fallback to Form collection
                if (string.IsNullOrEmpty(userMessage))
                {
                    userMessage = context.Request.Form["message"] ?? "";
                }
            }
            else
            {
                userMessage = context.Request.QueryString["message"] ?? "";
            }
            
            if (string.IsNullOrWhiteSpace(userMessage))
            {
                context.Response.Write("Xin lỗi, tôi không hiểu câu hỏi của bạn. Vui lòng thử lại.");
                return;
            }

            // Simple AI response logic
            string response = GenerateAIResponse(userMessage);
            context.Response.Write(response);
        }
        catch (Exception ex)
        {
            context.Response.Write("Xin lỗi, có lỗi xảy ra: " + ex.Message);
        }
    }

    private string GenerateAIResponse(string userMessage)
    {
        string message = userMessage.ToLower().Trim();
        
        // Greetings
        if (message.Contains("xin chào") || message.Contains("hello") || message.Contains("chào"))
        {
            return "Xin chào! Tôi là AI Assistant của KoiGo. Tôi có thể giúp bạn:\n\n" +
                   "• Trả lời câu hỏi về tiếng Nhật\n" +
                   "• Hướng dẫn sử dụng ứng dụng\n" +
                   "• Giải đáp thắc mắc về bài học\n\n" +
                   "Bạn cần hỗ trợ gì không? 😊";
        }

        // Help
        if (message.Contains("giúp") || message.Contains("help") || message.Contains("hướng dẫn"))
        {
            return "Tôi có thể giúp bạn:\n\n" +
                   "1. **Học tiếng Nhật**: Hỏi về từ vựng, ngữ pháp, cách phát âm\n" +
                   "2. **Sử dụng ứng dụng**: Hướng dẫn cách học, làm bài tập, xem thống kê\n" +
                   "3. **Bài học**: Giải thích nội dung bài học, cách làm bài tập\n\n" +
                   "Hãy đặt câu hỏi cụ thể để tôi hỗ trợ tốt hơn nhé!";
        }

        // About KoiGo
        if (message.Contains("koigo") || message.Contains("ứng dụng") || message.Contains("app"))
        {
            return "**KoiGo** là ứng dụng học tiếng Nhật hiệu quả với:\n\n" +
                   "✓ Nội dung phong phú cho các lớp 6, 7, 8, 9\n" +
                   "✓ Bài học tương tác với game\n" +
                   "✓ Theo dõi tiến độ học tập\n" +
                   "✓ Thống kê kết quả chi tiết\n\n" +
                   "Bạn có thể bắt đầu học từ trang chủ bằng cách chọn lớp của mình!";
        }

        // Japanese learning
        if (message.Contains("tiếng nhật") || message.Contains("hiragana") || message.Contains("katakana") || 
            message.Contains("từ vựng") || message.Contains("ngữ pháp"))
        {
            return "Tuyệt vời! Bạn muốn học về:\n\n" +
                   "• **Bảng chữ cái**: Hiragana, Katakana\n" +
                   "• **Từ vựng**: Từ mới theo chủ đề\n" +
                   "• **Ngữ pháp**: Cấu trúc câu, cách sử dụng\n" +
                   "• **Luyện tập**: Bài tập thực hành\n\n" +
                   "Hãy chọn lớp của bạn và bắt đầu học ngay nhé! Bạn đang học lớp mấy?";
        }

        // Classes
        if (message.Contains("lớp 6") || message.Contains("lớp 7") || message.Contains("lớp 8") || message.Contains("lớp 9"))
        {
            return "Bạn có thể học tiếng Nhật ở lớp của mình với:\n\n" +
                   "📚 **Sách học**: Bảng chữ cái, từ vựng, ngữ pháp\n" +
                   "🎮 **Game học tập**: Trắc nghiệm, nối từ, lật hình\n" +
                   "📊 **Thống kê**: Theo dõi tiến độ và kết quả\n\n" +
                   "Hãy vào trang chủ và chọn lớp của bạn để bắt đầu học!";
        }

        // Study tips
        if (message.Contains("cách học") || message.Contains("bí quyết") || message.Contains("tips"))
        {
            return "**Bí quyết học tiếng Nhật hiệu quả**:\n\n" +
                   "1. **Học đều đặn**: Dành 15-30 phút mỗi ngày\n" +
                   "2. **Luyện tập thường xuyên**: Làm bài tập và game\n" +
                   "3. **Ôn tập lại**: Xem lại bài đã học\n" +
                   "4. **Theo dõi tiến độ**: Kiểm tra thống kê thường xuyên\n\n" +
                   "Chúc bạn học tốt! 💪";
        }

        // Default response
        return "Cảm ơn bạn đã hỏi! Tôi hiểu bạn đang quan tâm đến: \"" + userMessage + "\"\n\n" +
               "Tôi có thể giúp bạn:\n" +
               "• Học tiếng Nhật (Hiragana, Katakana, từ vựng, ngữ pháp)\n" +
               "• Hướng dẫn sử dụng ứng dụng KoiGo\n" +
               "• Giải đáp về bài học và bài tập\n\n" +
               "Hãy đặt câu hỏi cụ thể hơn để tôi hỗ trợ tốt nhất nhé! 😊";
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}

