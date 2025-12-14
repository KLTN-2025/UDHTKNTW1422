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

            // Generate smart AI response (no API needed)
            string response = GenerateSmartAIResponse(userMessage);
            context.Response.Write(response);
        }
        catch (Exception ex)
        {
            // Log error but return user-friendly message
            try
            {
                // Try to generate a simple response even on error
                string userMessage = context.Request.Form["message"] ?? context.Request.QueryString["message"] ?? "";
                if (!string.IsNullOrWhiteSpace(userMessage))
                {
                    string response = GenerateAIResponse(userMessage);
                    context.Response.Write(response);
                }
                else
                {
                    context.Response.Write("Xin lỗi, có lỗi xảy ra. Vui lòng thử lại sau.");
                }
            }
            catch
            {
                context.Response.Write("Xin lỗi, có lỗi xảy ra. Vui lòng thử lại sau.");
            }
        }
    }
    
    private string GenerateSmartAIResponse(string userMessage)
    {
        // Enhanced AI with better pattern matching and context awareness
        string message = userMessage.ToLower().Trim();
        
        // Remove common Vietnamese question words for better matching
        string cleanMessage = message
            .Replace("bạn", "")
            .Replace("có thể", "")
            .Replace("cho tôi", "")
            .Replace("giúp tôi", "")
            .Replace("làm ơn", "")
            .Trim();
        
        // Use both original and cleaned message for matching
        return GenerateAIResponse(userMessage, cleanMessage);
    }
    
    private string GenerateAIResponse(string userMessage, string cleanMessage = null)
    {
        string message = userMessage.ToLower().Trim();
        if (string.IsNullOrEmpty(cleanMessage))
            cleanMessage = message;
        
        // Greetings
        if (message.Contains("xin chào") || message.Contains("hello") || message.Contains("chào") || message.Contains("hi"))
        {
            return "Xin chào! Tôi là AI Assistant của KoiGo. Tôi có thể giúp bạn:\n\n" +
                   "• Trả lời câu hỏi về tiếng Nhật\n" +
                   "• Hướng dẫn sử dụng ứng dụng\n" +
                   "• Giải đáp thắc mắc về bài học\n\n" +
                   "Bạn cần hỗ trợ gì không? 😊";
        }

        // Help
        if (message.Contains("giúp") || message.Contains("help") || message.Contains("hướng dẫn") || message.Contains("làm sao"))
        {
            return "Tôi có thể giúp bạn:\n\n" +
                   "1. **Học tiếng Nhật**: Hỏi về từ vựng, ngữ pháp, cách phát âm\n" +
                   "2. **Sử dụng ứng dụng**: Hướng dẫn cách học, làm bài tập, xem thống kê\n" +
                   "3. **Bài học**: Giải thích nội dung bài học, cách làm bài tập\n\n" +
                   "Hãy đặt câu hỏi cụ thể để tôi hỗ trợ tốt hơn nhé!";
        }

        // About KoiGo
        if (message.Contains("koigo") || message.Contains("ứng dụng") || message.Contains("app") || message.Contains("phần mềm"))
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
            message.Contains("từ vựng") || message.Contains("ngữ pháp") || message.Contains("học tiếng nhật"))
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
        if (message.Contains("cách học") || message.Contains("bí quyết") || message.Contains("tips") || message.Contains("học như thế nào"))
        {
            return "**Bí quyết học tiếng Nhật hiệu quả**:\n\n" +
                   "1. **Học đều đặn**: Dành 15-30 phút mỗi ngày\n" +
                   "2. **Luyện tập thường xuyên**: Làm bài tập và game\n" +
                   "3. **Ôn tập lại**: Xem lại bài đã học\n" +
                   "4. **Theo dõi tiến độ**: Kiểm tra thống kê thường xuyên\n\n" +
                   "Chúc bạn học tốt! 💪";
        }

        // Questions about features
        if (message.Contains("thống kê") || message.Contains("tiến độ"))
        {
            return "Bạn có thể xem thống kê học tập bằng cách:\n\n" +
                   "1. Vào menu \"Tiến độ học tập\"\n" +
                   "2. Xem số bài đã học, điểm số\n" +
                   "3. Theo dõi tiến độ theo từng bài\n\n" +
                   "Thống kê giúp bạn biết mình đã học được những gì!";
        }

        if (message.Contains("bài tập") || message.Contains("luyện tập") || message.Contains("game"))
        {
            return "Bạn có thể luyện tập bằng cách:\n\n" +
                   "• Chọn lớp của bạn\n" +
                   "• Vào \"Luyện tập\" để làm bài\n" +
                   "• Chơi các game học tập: trắc nghiệm, nối từ, lật hình\n" +
                   "• Làm \"Thực hành\" để củng cố kiến thức\n\n" +
                   "Luyện tập thường xuyên sẽ giúp bạn nhớ lâu hơn!";
        }

        if (message.Contains("chứng chỉ"))
        {
            return "Chứng chỉ sẽ được cấp khi bạn:\n\n" +
                   "• Hoàn thành các bài học\n" +
                   "• Đạt điểm số tốt trong các bài kiểm tra\n" +
                   "• Vào menu \"Chứng chỉ\" để xem\n\n" +
                   "Chứng chỉ là bằng chứng cho sự cố gắng của bạn!";
        }

        // Questions - Enhanced pattern matching
        if (message.Contains("gì") || message.Contains("là gì") || message.Contains("thế nào") || 
            message.Contains("là ai") || message.Contains("làm gì") || message.Contains("ở đâu"))
        {
            if (message.Contains("hiragana") || cleanMessage.Contains("hiragana"))
            {
                return "**Hiragana** là bảng chữ cái cơ bản của tiếng Nhật:\n\n" +
                       "• Gồm 46 ký tự cơ bản\n" +
                       "• Dùng để viết từ thuần Nhật\n" +
                       "• Là bước đầu tiên khi học tiếng Nhật\n" +
                       "• Ví dụ: あ (a), い (i), う (u), え (e), お (o)\n\n" +
                       "Bạn có thể học Hiragana trong phần \"Lý thuyết\" của lớp 6!";
            }
            if (message.Contains("katakana") || cleanMessage.Contains("katakana"))
            {
                return "**Katakana** là bảng chữ cái thứ hai của tiếng Nhật:\n\n" +
                       "• Gồm 46 ký tự\n" +
                       "• Dùng để viết từ mượn từ nước ngoài\n" +
                       "• Ví dụ: コーヒー (koohii - cà phê), テレビ (terebi - TV), パン (pan - bánh mì)\n\n" +
                       "Bạn có thể học Katakana sau khi đã học Hiragana!";
            }
            if (message.Contains("kanji") || cleanMessage.Contains("kanji"))
            {
                return "**Kanji** là chữ Hán được sử dụng trong tiếng Nhật:\n\n" +
                       "• Có hàng nghìn ký tự\n" +
                       "• Mỗi ký tự có ý nghĩa riêng\n" +
                       "• Ví dụ: 日 (nhật - mặt trời), 本 (bản - gốc), 語 (ngữ - ngôn ngữ)\n\n" +
                       "Kanji thường được học ở trình độ cao hơn!";
            }
            if (message.Contains("romaji") || cleanMessage.Contains("romaji"))
            {
                return "**Romaji** là cách viết tiếng Nhật bằng chữ Latin:\n\n" +
                       "• Giúp người mới học đọc được tiếng Nhật\n" +
                       "• Ví dụ: \"konnichiwa\" (こんにちは - xin chào)\n\n" +
                       "Romaji chỉ là công cụ hỗ trợ, nên học Hiragana và Katakana!";
            }
        }
        
        // More specific questions
        if (message.Contains("bắt đầu") || message.Contains("bắt đầu học") || message.Contains("học từ đâu"))
        {
            return "Để bắt đầu học tiếng Nhật:\n\n" +
                   "1. **Học bảng chữ cái Hiragana** trước (lớp 6)\n" +
                   "2. Sau đó học **Katakana**\n" +
                   "3. Học **từ vựng** cơ bản\n" +
                   "4. Làm **bài tập** và **game** để luyện tập\n\n" +
                   "Hãy vào trang chủ, chọn lớp của bạn và bắt đầu với \"Lý thuyết\" nhé!";
        }
        
        if (message.Contains("khó") || message.Contains("khó không") || message.Contains("có khó"))
        {
            return "Học tiếng Nhật có thể khó lúc đầu, nhưng:\n\n" +
                   "✓ **Hiragana và Katakana** khá đơn giản (46 ký tự mỗi loại)\n" +
                   "✓ **Có hệ thống** - học từng bước một\n" +
                   "✓ **Luyện tập thường xuyên** sẽ giúp bạn nhớ lâu\n" +
                   "✓ **Game và bài tập** giúp học vui hơn\n\n" +
                   "Quan trọng là kiên trì và luyện tập đều đặn! 💪";
        }
        
        if (message.Contains("bao lâu") || message.Contains("mất bao lâu") || message.Contains("học trong"))
        {
            return "Thời gian học tiếng Nhật tùy thuộc vào:\n\n" +
                   "• **Mục tiêu của bạn**: Học cơ bản hay nâng cao\n" +
                   "• **Thời gian dành ra**: 15-30 phút/ngày là tốt\n" +
                   "• **Luyện tập đều đặn**: Quan trọng hơn học nhiều một lúc\n\n" +
                   "Với KoiGo, bạn có thể học Hiragana cơ bản trong vài tuần nếu luyện tập đều!";
        }

        // Thank you
        if (message.Contains("cảm ơn") || message.Contains("thanks") || message.Contains("thank"))
        {
            return "Không có gì! Tôi rất vui được giúp bạn. Chúc bạn học tốt tiếng Nhật! 😊\n\n" +
                   "Nếu có thắc mắc gì khác, cứ hỏi tôi nhé!";
        }

        // Default response - more helpful
        return "Cảm ơn bạn đã hỏi! Tôi hiểu bạn đang quan tâm đến: \"" + userMessage + "\"\n\n" +
               "Tôi có thể giúp bạn:\n" +
               "• Học tiếng Nhật (Hiragana, Katakana, từ vựng, ngữ pháp)\n" +
               "• Hướng dẫn sử dụng ứng dụng KoiGo\n" +
               "• Giải đáp về bài học và bài tập\n" +
               "• Xem thống kê và tiến độ học tập\n\n" +
               "Hãy đặt câu hỏi cụ thể hơn để tôi hỗ trợ tốt nhất nhé! 😊\n\n" +
               "Ví dụ: \"Hiragana là gì?\", \"Cách học tiếng Nhật\", \"Xem thống kê\"";
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}

