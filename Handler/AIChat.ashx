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
            return "Xin chào! Tôi là trợ lý ảo của KoiGo. Tôi có thể giúp bạn:\n\n" +
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

        // Japanese learning - More specific
        if (message.Contains("tiếng nhật") || message.Contains("hiragana") || message.Contains("katakana") || 
            message.Contains("từ vựng") || message.Contains("ngữ pháp") || message.Contains("học tiếng nhật"))
        {
            if (message.Contains("học") && (message.Contains("chữ") || message.Contains("ký tự") || message.Contains("từng chữ")))
            {
                return "**Học từng chữ cái tiếng Nhật**:\n\n" +
                       "🔤 **Hiragana - 5 nguyên âm đầu tiên**:\n" +
                       "• あ (a) - \"a\" như \"a\" trong \"ba\"\n" +
                       "• い (i) - \"i\" như \"i\" trong \"bi\"\n" +
                       "• う (u) - \"u\" như \"u\" trong \"bu\"\n" +
                       "• え (e) - \"e\" như \"e\" trong \"be\"\n" +
                       "• お (o) - \"o\" như \"ô\" trong \"bô\"\n\n" +
                       "🔤 **Hiragana - Nhóm K (かきくけこ)**:\n" +
                       "• か (ka) - \"ka\" như \"ca\" trong \"cá\"\n" +
                       "• き (ki) - \"ki\" như \"ki\" trong \"kính\"\n" +
                       "• く (ku) - \"ku\" như \"cu\" trong \"cú\"\n" +
                       "• け (ke) - \"ke\" như \"ke\" trong \"kẻ\"\n" +
                       "• こ (ko) - \"ko\" như \"co\" trong \"có\"\n\n" +
                       "💡 **Cách học hiệu quả**:\n" +
                       "1. Học từng nhóm 5 chữ một\n" +
                       "2. Viết đi viết lại nhiều lần\n" +
                       "3. Học qua từ vựng có chữ đó\n" +
                       "4. Luyện tập với game trong KoiGo\n\n" +
                       "Hãy hỏi cụ thể chữ nào bạn muốn học, ví dụ: \"Học chữ あ\" hoặc \"Chữ ka là gì\"!";
            }
            return "Tuyệt vời! Bạn muốn học về:\n\n" +
                   "🔤 **Bảng chữ cái**:\n" +
                   "• Hiragana (ひらがな) - 46 chữ, viết mềm mại\n" +
                   "• Katakana (カタカナ) - 46 chữ, viết góc cạnh\n" +
                   "• Kanji (漢字) - chữ Hán, học sau\n\n" +
                   "📚 **Từ vựng**:\n" +
                   "• Chào hỏi: こんにちは (konnichiwa), ありがとう (arigatou)\n" +
                   "• Số đếm: 一 (ichi), 二 (ni), 三 (san)...\n" +
                   "• Màu sắc, gia đình, đồ vật...\n\n" +
                   "📖 **Ngữ pháp**:\n" +
                   "• Cấu trúc です (desu) - \"là\"\n" +
                   "• Trợ từ は (wa), を (wo), に (ni)...\n" +
                   "• Câu nghi vấn, câu phủ định...\n\n" +
                   "🎮 **Luyện tập**:\n" +
                   "• Game trắc nghiệm\n" +
                   "• Nối từ, lật hình\n" +
                   "• Bài tập viết\n\n" +
                   "Hãy hỏi cụ thể hơn, ví dụ: \"Học chữ あ\", \"Từ vựng chào hỏi\", \"Ngữ pháp desu\"!";
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

        // Questions about lessons and how to take tests
        if (message.Contains("câu hỏi về bài học") || message.Contains("cách làm bài kiểm tra") || 
            message.Contains("cách vào làm bài kiểm tra") || message.Contains("làm bài kiểm tra") || 
            message.Contains("làm bài thi") || message.Contains("cách làm bài") || 
            message.Contains("hướng dẫn làm bài") || message.Contains("vào làm bài"))
        {
            return "**Cách vào làm bài kiểm tra trong KoiGo**:\n\n" +
                   "📋 **Bước 1: Vào trang bài kiểm tra**\n" +
                   "• Bấm vào menu \"Bài kiểm tra\" ở trên cùng\n" +
                   "• Chọn lớp của bạn (Lớp 6, 7, 8, 9)\n\n" +
                   "⏱️ **Bước 2: Xem thông tin bài kiểm tra**\n" +
                   "• Số câu hỏi: Thường là 30 câu\n" +
                   "• Thời gian: 15 phút (đồng hồ đếm ngược)\n" +
                   "• Hình thức: Trắc nghiệm (chọn 1 đáp án đúng)\n\n" +
                   "✍️ **Bước 3: Làm bài**\n" +
                   "• Click \"Bắt đầu làm bài\" để bắt đầu\n" +
                   "• Đọc kỹ từng câu hỏi\n" +
                   "• Chọn đáp án bạn cho là đúng\n" +
                   "• Có thể xem lại và sửa đáp án trước khi nộp\n" +
                   "• Theo dõi thời gian còn lại ở góc trên\n\n" +
                   "✅ **Bước 4: Nộp bài**\n" +
                   "• Click nút \"Nộp bài\" khi hoàn thành\n" +
                   "• Xác nhận nộp bài trong hộp thoại\n" +
                   "• Hệ thống sẽ tự động nộp khi hết thời gian\n\n" +
                   "📊 **Bước 5: Xem kết quả**\n" +
                   "• Xem số câu đúng, số câu sai\n" +
                   "• Xem điểm số (thang điểm 10)\n" +
                   "• Xem thời gian làm bài\n" +
                   "• Điểm sẽ được lưu tự động\n\n" +
                   "💡 **Lưu ý**:\n" +
                   "• Làm bài nghiêm túc, không tra cứu tài liệu\n" +
                   "• Quản lý thời gian tốt, không dành quá nhiều thời gian cho 1 câu\n" +
                   "• Có thể làm lại bài để cải thiện điểm\n\n" +
                   "Chúc bạn làm bài tốt! 💪";
        }

        if (message.Contains("chứng chỉ"))
        {
            return "Chứng chỉ sẽ được cấp khi bạn:\n\n" +
                   "• Hoàn thành các bài học\n" +
                   "• Đạt điểm số tốt trong các bài kiểm tra\n" +
                   "• Vào menu \"Chứng chỉ\" để xem\n\n" +
                   "Chứng chỉ là bằng chứng cho sự cố gắng của bạn!";
        }

        // Questions - Enhanced pattern matching with specific character details
        if (message.Contains("gì") || message.Contains("là gì") || message.Contains("thế nào") || 
            message.Contains("là ai") || message.Contains("làm gì") || message.Contains("ở đâu"))
        {
            if (message.Contains("hiragana") || cleanMessage.Contains("hiragana"))
            {
                return "**Hiragana (ひらがな)** là bảng chữ cái cơ bản của tiếng Nhật:\n\n" +
                       "📝 **Đặc điểm**:\n" +
                       "• Gồm 46 ký tự cơ bản (あいうえお, かきくけこ...)\n" +
                       "• Viết mềm mại, tròn trịa\n" +
                       "• Dùng để viết từ thuần Nhật, trợ từ, đuôi động từ\n\n" +
                       "🔤 **5 nguyên âm đầu tiên**:\n" +
                       "• あ (a) - như \"a\" trong \"ba\"\n" +
                       "• い (i) - như \"i\" trong \"bi\"\n" +
                       "• う (u) - như \"u\" trong \"bu\"\n" +
                       "• え (e) - như \"e\" trong \"be\"\n" +
                       "• お (o) - như \"ô\" trong \"bô\"\n\n" +
                       "📚 **Ví dụ từ vựng**:\n" +
                       "• あめ (ame) - mưa\n" +
                       "• いえ (ie) - nhà\n" +
                       "• うま (uma) - ngựa\n" +
                       "• えんぴつ (enpitsu) - bút chì\n" +
                       "• おかね (okane) - tiền\n\n" +
                       "Bạn có thể học từng chữ Hiragana trong phần \"Lý thuyết\" của lớp 6!";
            }
            if (message.Contains("katakana") || cleanMessage.Contains("katakana"))
            {
                return "**Katakana (カタカナ)** là bảng chữ cái thứ hai của tiếng Nhật:\n\n" +
                       "📝 **Đặc điểm**:\n" +
                       "• Gồm 46 ký tự (tương ứng với Hiragana)\n" +
                       "• Viết cứng, góc cạnh\n" +
                       "• Dùng để viết từ mượn từ nước ngoài, tên riêng nước ngoài\n\n" +
                       "🔤 **5 nguyên âm đầu tiên**:\n" +
                       "• ア (a) - tương ứng với あ\n" +
                       "• イ (i) - tương ứng với い\n" +
                       "• ウ (u) - tương ứng với う\n" +
                       "• エ (e) - tương ứng với え\n" +
                       "• オ (o) - tương ứng với お\n\n" +
                       "📚 **Ví dụ từ mượn**:\n" +
                       "• コーヒー (koohii) - cà phê (coffee)\n" +
                       "• テレビ (terebi) - TV (television)\n" +
                       "• パン (pan) - bánh mì (pan - từ Bồ Đào Nha)\n" +
                       "• カメラ (kamera) - máy ảnh (camera)\n" +
                       "• コンピューター (konpyuutaa) - máy tính (computer)\n\n" +
                       "Bạn có thể học Katakana sau khi đã học Hiragana!";
            }
            if (message.Contains("kanji") || cleanMessage.Contains("kanji"))
            {
                return "**Kanji (漢字)** là chữ Hán được sử dụng trong tiếng Nhật:\n\n" +
                       "📝 **Đặc điểm**:\n" +
                       "• Có hàng nghìn ký tự (thường dùng khoảng 2000-3000)\n" +
                       "• Mỗi ký tự có ý nghĩa riêng và cách đọc\n" +
                       "• Một chữ có thể có nhiều cách đọc (On-yomi và Kun-yomi)\n\n" +
                       "📚 **Ví dụ chữ cơ bản**:\n" +
                       "• 日 (nichi/hi) - mặt trời, ngày\n" +
                       "• 本 (hon) - sách, gốc\n" +
                       "• 語 (go) - ngôn ngữ\n" +
                       "• 人 (hito/jin) - người\n" +
                       "• 水 (mizu) - nước\n\n" +
                       "Kanji thường được học ở trình độ cao hơn, sau khi đã nắm vững Hiragana và Katakana!";
            }
            if (message.Contains("romaji") || cleanMessage.Contains("romaji"))
            {
                return "**Romaji (ローマ字)** là cách viết tiếng Nhật bằng chữ Latin:\n\n" +
                       "📝 **Mục đích**:\n" +
                       "• Giúp người mới học đọc được tiếng Nhật\n" +
                       "• Chuyển đổi chữ Nhật sang chữ Latin\n" +
                       "• Hỗ trợ gõ tiếng Nhật trên máy tính\n\n" +
                       "📚 **Ví dụ**:\n" +
                       "• \"konnichiwa\" = こんにちは (xin chào)\n" +
                       "• \"arigatou\" = ありがとう (cảm ơn)\n" +
                       "• \"ohayou\" = おはよう (chào buổi sáng)\n\n" +
                       "⚠️ **Lưu ý**: Romaji chỉ là công cụ hỗ trợ, nên học Hiragana và Katakana để đọc được tiếng Nhật thực sự!";
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

        // Account and registration
        if (message.Contains("đăng ký") || message.Contains("đăng nhập") || message.Contains("tài khoản") || message.Contains("tạo tài khoản"))
        {
            return "Để đăng ký tài khoản KoiGo:\n\n" +
                   "1. Vào trang \"Đăng ký\"\n" +
                   "2. Nhập thông tin: Email, số điện thoại, mật khẩu\n" +
                   "3. Xác nhận email để kích hoạt tài khoản\n" +
                   "4. Đăng nhập và bắt đầu học\n\n" +
                   "Nếu quên mật khẩu, bạn có thể dùng chức năng \"Quên mật khẩu\" để lấy lại!";
        }

        if (message.Contains("quên mật khẩu") || message.Contains("mất mật khẩu") || message.Contains("lấy lại mật khẩu"))
        {
            return "Để lấy lại mật khẩu:\n\n" +
                   "1. Vào trang \"Đăng nhập\"\n" +
                   "2. Click \"Quên mật khẩu\"\n" +
                   "3. Nhập email đã đăng ký\n" +
                   "4. Kiểm tra email để nhận mã OTP\n" +
                   "5. Nhập mã OTP và đặt mật khẩu mới\n\n" +
                   "Lưu ý: Chỉ có thể lấy lại mật khẩu bằng email Gmail đã đăng ký!";
        }

        // Vocabulary questions
        if (message.Contains("từ vựng") || message.Contains("từ mới") || message.Contains("vocabulary"))
        {
            if (message.Contains("chào hỏi") || message.Contains("greeting"))
            {
                return "**Từ vựng chào hỏi cơ bản**:\n\n" +
                       "• こんにちは (konnichiwa) - Xin chào (ban ngày)\n" +
                       "• おはよう (ohayou) - Chào buổi sáng\n" +
                       "• こんばんは (konbanwa) - Chào buổi tối\n" +
                       "• さようなら (sayounara) - Tạm biệt\n" +
                       "• ありがとう (arigatou) - Cảm ơn\n" +
                       "• すみません (sumimasen) - Xin lỗi\n\n" +
                       "Bạn có thể học thêm từ vựng trong phần \"Lý thuyết\" của lớp!";
            }
            if (message.Contains("số đếm") || message.Contains("số") || message.Contains("counting"))
            {
                return "**Số đếm tiếng Nhật cơ bản**:\n\n" +
                       "• 一 (ichi) - 1\n" +
                       "• 二 (ni) - 2\n" +
                       "• 三 (san) - 3\n" +
                       "• 四 (yon/shi) - 4\n" +
                       "• 五 (go) - 5\n" +
                       "• 六 (roku) - 6\n" +
                       "• 七 (nana/shichi) - 7\n" +
                       "• 八 (hachi) - 8\n" +
                       "• 九 (kyuu) - 9\n" +
                       "• 十 (juu) - 10\n\n" +
                       "Hãy luyện tập đếm số trong phần \"Luyện tập\" nhé!";
            }
            return "Bạn muốn học từ vựng về chủ đề nào?\n\n" +
                   "• Chào hỏi\n" +
                   "• Số đếm\n" +
                   "• Màu sắc\n" +
                   "• Gia đình\n" +
                   "• Đồ vật\n\n" +
                   "Hãy hỏi cụ thể hơn, ví dụ: \"Từ vựng chào hỏi\"!";
        }

        // Grammar questions
        if (message.Contains("ngữ pháp") || message.Contains("cấu trúc") || message.Contains("grammar"))
        {
            if (message.Contains("desu") || message.Contains("です") || message.Contains("là"))
            {
                return "**Cấu trúc \"です\" (desu)**:\n\n" +
                       "• Dùng để nói \"là\" trong tiếng Nhật\n" +
                       "• Cấu trúc: Danh từ + です\n" +
                       "• Ví dụ:\n" +
                       "  - 私は学生です (Watashi wa gakusei desu) - Tôi là học sinh\n" +
                       "  - これは本です (Kore wa hon desu) - Đây là sách\n\n" +
                       "です là cách nói lịch sự, dùng trong giao tiếp hàng ngày!";
            }
            if (message.Contains("wa") || message.Contains("は") || message.Contains("trợ từ"))
            {
                return "**Trợ từ \"は\" (wa)**:\n\n" +
                       "• Đọc là \"wa\" nhưng viết là は (ha)\n" +
                       "• Dùng để đánh dấu chủ đề của câu\n" +
                       "• Ví dụ: 私は学生です (Watashi wa gakusei desu)\n" +
                       "  - 私 (watashi) = tôi\n" +
                       "  - は (wa) = trợ từ đánh dấu chủ đề\n" +
                       "  - 学生 (gakusei) = học sinh\n\n" +
                       "Trợ từ は rất quan trọng trong ngữ pháp tiếng Nhật!";
            }
            return "Bạn muốn học ngữ pháp về:\n\n" +
                   "• Cấu trúc です (desu)\n" +
                   "• Trợ từ は (wa)\n" +
                   "• Trợ từ を (wo)\n" +
                   "• Câu nghi vấn\n\n" +
                   "Hãy hỏi cụ thể, ví dụ: \"Ngữ pháp desu\"!";
        }

        // Pronunciation
        if (message.Contains("phát âm") || message.Contains("đọc") || message.Contains("pronunciation"))
        {
            return "**Cách phát âm tiếng Nhật**:\n\n" +
                   "• **Nguyên âm**: あ(a), い(i), う(u), え(e), お(o)\n" +
                   "  - Phát âm rõ ràng, không lướt\n\n" +
                   "• **Phụ âm**: Kết hợp với nguyên âm\n" +
                   "  - か (ka), き (ki), く (ku), け (ke), こ (ko)\n\n" +
                   "• **Trường âm**: Kéo dài nguyên âm\n" +
                   "  - おかあさん (okaasan) - mẹ\n\n" +
                   "• **Âm đục**: Thêm dấu \"\n" +
                   "  - か→が (ka→ga)\n\n" +
                   "Luyện tập phát âm bằng cách nghe và nhắc lại trong bài học!";
        }

        // Specific Hiragana characters - Detailed explanations
        if (message.Contains("あ") || message.Contains("a hiragana") || message.Contains("chữ a") || 
            (message.Contains("học") && message.Contains("a") && message.Contains("hiragana")))
        {
            return "**Chữ あ (a) trong Hiragana**:\n\n" +
                   "✍️ **Cách viết** (3 nét):\n" +
                   "1. Nét ngang trên\n" +
                   "2. Nét cong xuống trái\n" +
                   "3. Nét ngang dưới\n\n" +
                   "🔊 **Cách đọc**: \"a\" như \"a\" trong tiếng Việt (ví dụ: \"ba\", \"ma\")\n\n" +
                   "📚 **Từ vựng có chữ あ**:\n" +
                   "• あお (ao) - màu xanh\n" +
                   "• あめ (ame) - mưa\n" +
                   "• あさ (asa) - buổi sáng\n" +
                   "• あし (ashi) - chân\n" +
                   "• あたま (atama) - đầu\n\n" +
                   "💡 **Mẹo nhớ**: Chữ あ giống hình một người đang ngồi với cái mũ trên đầu!\n\n" +
                   "Đây là chữ đầu tiên trong bảng Hiragana, học kỹ chữ này nhé!";
        }

        if (message.Contains("い") || message.Contains("i hiragana") || message.Contains("chữ i") ||
            (message.Contains("học") && message.Contains("i") && message.Contains("hiragana")))
        {
            return "**Chữ い (i) trong Hiragana**:\n\n" +
                   "✍️ **Cách viết** (2 nét):\n" +
                   "1. Nét thẳng đứng bên trái (ngắn hơn)\n" +
                   "2. Nét thẳng đứng bên phải (dài hơn, có móc nhỏ ở đầu)\n\n" +
                   "🔊 **Cách đọc**: \"i\" như \"i\" trong tiếng Việt (ví dụ: \"bi\", \"mi\")\n\n" +
                   "📚 **Từ vựng có chữ い**:\n" +
                   "• いえ (ie) - nhà\n" +
                   "• いす (isu) - ghế\n" +
                   "• いぬ (inu) - chó\n" +
                   "• いち (ichi) - số 1\n" +
                   "• いし (ishi) - đá\n\n" +
                   "💡 **Mẹo nhớ**: Chữ い giống hai cây cột đứng cạnh nhau!\n\n" +
                   "Chữ い rất dễ nhận biết với hai nét thẳng đứng!";
        }

        if (message.Contains("う") || message.Contains("u hiragana") || message.Contains("chữ u") ||
            (message.Contains("học") && message.Contains("u") && message.Contains("hiragana")))
        {
            return "**Chữ う (u) trong Hiragana**:\n\n" +
                   "✍️ **Cách viết** (2 nét):\n" +
                   "1. Nét thẳng đứng bên trái\n" +
                   "2. Nét cong từ trên xuống, tạo hình chữ U\n\n" +
                   "🔊 **Cách đọc**: \"u\" như \"u\" trong tiếng Việt (ví dụ: \"bu\", \"mu\")\n\n" +
                   "📚 **Từ vựng có chữ う**:\n" +
                   "• うま (uma) - ngựa\n" +
                   "• うみ (umi) - biển\n" +
                   "• うた (uta) - bài hát\n" +
                   "• うし (ushi) - bò\n" +
                   "• うで (ude) - cánh tay\n\n" +
                   "💡 **Mẹo nhớ**: Chữ う giống hình một cái móc câu!\n\n" +
                   "Chữ う là nguyên âm thứ ba trong bảng Hiragana!";
        }

        if (message.Contains("え") || message.Contains("e hiragana") || message.Contains("chữ e") ||
            (message.Contains("học") && message.Contains("e") && message.Contains("hiragana")))
        {
            return "**Chữ え (e) trong Hiragana**:\n\n" +
                   "✍️ **Cách viết** (2 nét):\n" +
                   "1. Nét ngang trên\n" +
                   "2. Nét cong từ trên xuống, có móc ở cuối\n\n" +
                   "🔊 **Cách đọc**: \"e\" như \"e\" trong tiếng Việt (ví dụ: \"be\", \"me\")\n\n" +
                   "📚 **Từ vựng có chữ え**:\n" +
                   "• えんぴつ (enpitsu) - bút chì\n" +
                   "• えき (eki) - ga tàu\n" +
                   "• えいが (eiga) - phim\n" +
                   "• え (e) - bức tranh\n" +
                   "• えいご (eigo) - tiếng Anh\n\n" +
                   "💡 **Mẹo nhớ**: Chữ え giống hình một người đang cúi chào!\n\n" +
                   "Chữ え là nguyên âm thứ tư trong bảng Hiragana!";
        }

        if (message.Contains("お") || message.Contains("o hiragana") || message.Contains("chữ o") ||
            (message.Contains("học") && message.Contains("o") && message.Contains("hiragana")))
        {
            return "**Chữ お (o) trong Hiragana**:\n\n" +
                   "✍️ **Cách viết** (3 nét):\n" +
                   "1. Nét ngang trên\n" +
                   "2. Nét cong xuống trái\n" +
                   "3. Nét cong nhỏ ở giữa (giống chữ あ nhưng có thêm nét)\n\n" +
                   "🔊 **Cách đọc**: \"o\" như \"ô\" trong tiếng Việt (ví dụ: \"bô\", \"mô\")\n\n" +
                   "📚 **Từ vựng có chữ お**:\n" +
                   "• おかね (okane) - tiền\n" +
                   "• おおきい (ookii) - to, lớn\n" +
                   "• おちゃ (ocha) - trà\n" +
                   "• おとこ (otoko) - đàn ông\n" +
                   "• おんな (onna) - phụ nữ\n\n" +
                   "💡 **Mẹo nhớ**: Chữ お giống chữ あ nhưng có thêm một nét cong nhỏ ở giữa!\n\n" +
                   "Chữ お là nguyên âm cuối cùng trong nhóm 5 nguyên âm đầu tiên!";
        }

        // Katakana characters
        if (message.Contains("ア") || message.Contains("a katakana") || (message.Contains("học") && message.Contains("a") && message.Contains("katakana")))
        {
            return "**Chữ ア (a) trong Katakana**:\n\n" +
                   "✍️ **Cách viết** (2 nét):\n" +
                   "1. Nét ngang trên\n" +
                   "2. Nét chéo từ trên xuống trái\n\n" +
                   "🔊 **Cách đọc**: \"a\" như \"a\" trong tiếng Việt\n\n" +
                   "📚 **Từ vựng có chữ ア**:\n" +
                   "• アパート (apaato) - căn hộ (apartment)\n" +
                   "• アメリカ (amerika) - nước Mỹ (America)\n" +
                   "• アニメ (anime) - phim hoạt hình\n\n" +
                   "💡 **So sánh**: ア (Katakana) tương ứng với あ (Hiragana)\n\n" +
                   "Chữ ア là chữ đầu tiên trong bảng Katakana!";
        }

        if (message.Contains("イ") || message.Contains("i katakana") || (message.Contains("học") && message.Contains("i") && message.Contains("katakana")))
        {
            return "**Chữ イ (i) trong Katakana**:\n\n" +
                   "✍️ **Cách viết** (2 nét):\n" +
                   "1. Nét thẳng đứng bên trái (ngắn)\n" +
                   "2. Nét chéo từ trên xuống phải\n\n" +
                   "🔊 **Cách đọc**: \"i\" như \"i\" trong tiếng Việt\n\n" +
                   "📚 **Từ vựng có chữ イ**:\n" +
                   "• イギリス (igirisu) - nước Anh (England)\n" +
                   "• イタリア (itaria) - nước Ý (Italy)\n" +
                   "• インク (inku) - mực (ink)\n\n" +
                   "💡 **So sánh**: イ (Katakana) tương ứng với い (Hiragana)\n\n" +
                   "Chữ イ rất dễ nhận biết với hai nét chéo!";
        }

        // More Hiragana characters - Group K
        if (message.Contains("か") || message.Contains("ka hiragana") || message.Contains("chữ ka") ||
            (message.Contains("học") && (message.Contains("ka") || message.Contains("k")) && message.Contains("hiragana")))
        {
            return "**Chữ か (ka) trong Hiragana**:\n\n" +
                   "✍️ **Cách viết** (3 nét):\n" +
                   "1. Nét ngang trên\n" +
                   "2. Nét thẳng đứng từ trên xuống\n" +
                   "3. Nét cong nhỏ ở dưới (giống chữ あ nhưng có nét thẳng)\n\n" +
                   "🔊 **Cách đọc**: \"ka\" như \"ca\" trong tiếng Việt (ví dụ: \"cá\", \"ca\")\n\n" +
                   "📚 **Từ vựng có chữ か**:\n" +
                   "• かばん (kaban) - cặp sách\n" +
                   "• かみ (kami) - giấy, tóc\n" +
                   "• かわ (kawa) - sông, da\n" +
                   "• かぞく (kazoku) - gia đình\n" +
                   "• かえる (kaeru) - ếch, về nhà\n\n" +
                   "💡 **Mẹo nhớ**: Chữ か giống chữ あ nhưng có thêm nét thẳng đứng!\n\n" +
                   "Chữ か là chữ đầu tiên trong nhóm K (かきくけこ)!";
        }

        if (message.Contains("き") || message.Contains("ki hiragana") || message.Contains("chữ ki"))
        {
            return "**Chữ き (ki) trong Hiragana**:\n\n" +
                   "✍️ **Cách viết** (4 nét):\n" +
                   "1. Nét ngang trên\n" +
                   "2. Nét thẳng đứng\n" +
                   "3. Nét cong ngang ở giữa\n" +
                   "4. Nét cong nhỏ ở dưới\n\n" +
                   "🔊 **Cách đọc**: \"ki\" như \"ki\" trong tiếng Việt (ví dụ: \"kính\", \"ki\")\n\n" +
                   "📚 **Từ vựng có chữ き**:\n" +
                   "• き (ki) - cây\n" +
                   "• きいろ (kiiro) - màu vàng\n" +
                   "• きつね (kitsune) - cáo\n" +
                   "• きって (kitte) - tem\n" +
                   "• きもの (kimono) - áo kimono\n\n" +
                   "💡 **Mẹo nhớ**: Chữ き giống hình một cây với cành lá!\n\n" +
                   "Chữ き là chữ thứ hai trong nhóm K!";
        }

        if (message.Contains("く") || message.Contains("ku hiragana") || message.Contains("chữ ku"))
        {
            return "**Chữ く (ku) trong Hiragana**:\n\n" +
                   "✍️ **Cách viết** (1 nét):\n" +
                   "1. Nét cong từ trên xuống, tạo hình chữ V ngược\n\n" +
                   "🔊 **Cách đọc**: \"ku\" như \"cu\" trong tiếng Việt (ví dụ: \"cú\", \"cu\")\n\n" +
                   "📚 **Từ vựng có chữ く**:\n" +
                   "• くつ (kutsu) - giày\n" +
                   "• くも (kumo) - mây, nhện\n" +
                   "• くち (kuchi) - miệng\n" +
                   "• くるま (kuruma) - xe ô tô\n" +
                   "• くま (kuma) - gấu\n\n" +
                   "💡 **Mẹo nhớ**: Chữ く giống hình một cái móc câu nhỏ!\n\n" +
                   "Chữ く rất đơn giản, chỉ có 1 nét!";
        }

        if (message.Contains("け") || message.Contains("ke hiragana") || message.Contains("chữ ke"))
        {
            return "**Chữ け (ke) trong Hiragana**:\n\n" +
                   "✍️ **Cách viết** (3 nét):\n" +
                   "1. Nét thẳng đứng\n" +
                   "2. Nét ngang ở giữa\n" +
                   "3. Nét cong nhỏ ở dưới\n\n" +
                   "🔊 **Cách đọc**: \"ke\" như \"ke\" trong tiếng Việt (ví dụ: \"kẻ\", \"ke\")\n\n" +
                   "📚 **Từ vựng có chữ け**:\n" +
                   "• け (ke) - lông\n" +
                   "• けしゴム (keshigomu) - cục tẩy\n" +
                   "• けいたい (keitai) - điện thoại di động\n" +
                   "• けいさつ (keisatsu) - cảnh sát\n\n" +
                   "💡 **Mẹo nhớ**: Chữ け giống chữ は nhưng có nét cong ở dưới!\n\n" +
                   "Chữ け là chữ thứ tư trong nhóm K!";
        }

        if (message.Contains("こ") || message.Contains("ko hiragana") || message.Contains("chữ ko"))
        {
            return "**Chữ こ (ko) trong Hiragana**:\n\n" +
                   "✍️ **Cách viết** (2 nét):\n" +
                   "1. Nét ngang trên\n" +
                   "2. Nét ngang dưới (song song với nét trên)\n\n" +
                   "🔊 **Cách đọc**: \"ko\" như \"co\" trong tiếng Việt (ví dụ: \"có\", \"co\")\n\n" +
                   "📚 **Từ vựng có chữ こ**:\n" +
                   "• こども (kodomo) - trẻ em\n" +
                   "• こんにちは (konnichiwa) - xin chào\n" +
                   "• ことば (kotoba) - từ ngữ\n" +
                   "• こころ (kokoro) - trái tim\n" +
                   "• こねこ (koneko) - mèo con\n\n" +
                   "💡 **Mẹo nhớ**: Chữ こ giống hai đường ray song song!\n\n" +
                   "Chữ こ là chữ cuối cùng trong nhóm K (かきくけこ)!";
        }

        // More specific vocabulary
        if (message.Contains("chào") || message.Contains("greeting") || message.Contains("xin chào"))
        {
            return "**Các cách chào hỏi trong tiếng Nhật**:\n\n" +
                   "🌅 **Buổi sáng**:\n" +
                   "• おはよう (ohayou) - Chào buổi sáng (thân mật)\n" +
                   "• おはようございます (ohayou gozaimasu) - Chào buổi sáng (lịch sự)\n\n" +
                   "🌞 **Ban ngày**:\n" +
                   "• こんにちは (konnichiwa) - Xin chào (dùng từ 10h sáng đến 6h chiều)\n" +
                   "• Nghĩa đen: \"Hôm nay\"\n\n" +
                   "🌙 **Buổi tối**:\n" +
                   "• こんばんは (konbanwa) - Chào buổi tối (dùng sau 6h chiều)\n" +
                   "• Nghĩa đen: \"Tối nay\"\n\n" +
                   "👋 **Tạm biệt**:\n" +
                   "• さようなら (sayounara) - Tạm biệt (trang trọng)\n" +
                   "• じゃね (jane) - Tạm biệt (thân mật)\n" +
                   "• またね (matane) - Hẹn gặp lại\n\n" +
                   "💡 **Lưu ý**: は trong こんにちは và こんばんは đọc là \"wa\", không phải \"ha\"!";
        }

        // Study methods
        if (message.Contains("nhớ") || message.Contains("học thuộc") || message.Contains("ghi nhớ"))
        {
            return "**Cách nhớ bảng chữ cái tiếng Nhật**:\n\n" +
                   "1. **Học từng nhóm**: Học 5 chữ một lần (あいうえお, かきくけこ...)\n" +
                   "2. **Viết nhiều lần**: Viết đi viết lại để nhớ cách viết\n" +
                   "3. **Luyện tập với game**: Chơi game trong KoiGo để nhớ nhanh hơn\n" +
                   "4. **Ôn tập hàng ngày**: Xem lại chữ đã học mỗi ngày\n" +
                   "5. **Học từ vựng**: Học chữ qua từ vựng sẽ nhớ lâu hơn\n\n" +
                   "Kiên trì luyện tập 15-30 phút mỗi ngày sẽ giúp bạn nhớ tốt! 💪";
        }

        // Test and score
        if (message.Contains("điểm") || message.Contains("kết quả") || message.Contains("bài kiểm tra") || message.Contains("test"))
        {
            return "**Về điểm số và kết quả**:\n\n" +
                   "• **Làm bài tập**: Mỗi câu đúng được tính điểm\n" +
                   "• **Bài kiểm tra**: Điểm được tính trên thang 10\n" +
                   "• **Xem kết quả**: Vào \"Thống kê\" để xem điểm của mình\n" +
                   "• **Cải thiện**: Làm lại bài để cải thiện điểm\n\n" +
                   "Điểm số giúp bạn biết mình đã học tốt đến đâu!";
        }

        // Features
        if (message.Contains("tính năng") || message.Contains("chức năng") || message.Contains("features"))
        {
            return "**Các tính năng của KoiGo**:\n\n" +
                   "📚 **Học lý thuyết**: Bài học với hình ảnh và âm thanh\n" +
                   "🎮 **Luyện tập**: Game trắc nghiệm, nối từ, lật hình\n" +
                   "✍️ **Thực hành**: Bài tập viết và làm bài\n" +
                   "📊 **Thống kê**: Theo dõi tiến độ và điểm số\n" +
                   "🏆 **Chứng chỉ**: Nhận chứng chỉ khi hoàn thành\n" +
                   "💬 **Trợ lý AI**: Hỏi đáp với KoiGo (chính là tôi!)\n\n" +
                   "Tất cả tính năng đều miễn phí và dễ sử dụng!";
        }

        // Errors and problems
        if (message.Contains("lỗi") || message.Contains("không hoạt động") || message.Contains("bug") || message.Contains("sự cố"))
        {
            return "Nếu gặp lỗi hoặc sự cố:\n\n" +
                   "1. **Làm mới trang**: Nhấn F5 hoặc Ctrl+R\n" +
                   "2. **Xóa cache**: Xóa dữ liệu trình duyệt\n" +
                   "3. **Thử trình duyệt khác**: Chrome, Firefox, Edge\n" +
                   "4. **Kiểm tra kết nối**: Đảm bảo có internet\n" +
                   "5. **Liên hệ hỗ trợ**: Gửi email đến koigolang@gmail.com\n\n" +
                   "Nếu vẫn không được, hãy mô tả chi tiết lỗi để tôi giúp bạn!";
        }

        // Culture
        if (message.Contains("văn hóa") || message.Contains("văn hóa nhật") || message.Contains("culture"))
        {
            return "**Văn hóa Nhật Bản thú vị**:\n\n" +
                   "• **Lễ nghi**: Người Nhật rất coi trọng lễ nghi và sự lịch sự\n" +
                   "• **Trà đạo**: Nghệ thuật uống trà truyền thống\n" +
                   "• **Lễ hội**: Nhiều lễ hội đặc sắc như Hanami (ngắm hoa anh đào)\n" +
                   "• **Ẩm thực**: Sushi, ramen, tempura... rất nổi tiếng\n" +
                   "• **Anime và Manga**: Văn hóa giải trí độc đáo\n\n" +
                   "Học tiếng Nhật sẽ giúp bạn hiểu thêm về văn hóa Nhật Bản!";
        }

        // Motivation
        if (message.Contains("động lực") || message.Contains("tại sao học") || message.Contains("lợi ích"))
        {
            return "**Tại sao nên học tiếng Nhật?**:\n\n" +
                   "🎓 **Học tập**: Du học, học bổng tại Nhật\n" +
                   "💼 **Công việc**: Nhiều cơ hội việc làm với tiếng Nhật\n" +
                   "🎌 **Văn hóa**: Hiểu thêm về văn hóa, anime, manga\n" +
                   "✈️ **Du lịch**: Tự tin đi du lịch Nhật Bản\n" +
                   "🧠 **Rèn luyện**: Cải thiện trí nhớ và tư duy\n\n" +
                   "Bắt đầu học ngay hôm nay với KoiGo! 💪";
        }

        // Time and schedule
        if (message.Contains("thời gian") || message.Contains("lịch học") || message.Contains("khi nào"))
        {
            return "**Lịch học tiếng Nhật hiệu quả**:\n\n" +
                   "⏰ **Thời gian tốt nhất**:\n" +
                   "• Buổi sáng: 6-8h (tỉnh táo, dễ nhớ)\n" +
                   "• Buổi tối: 19-21h (yên tĩnh, tập trung)\n\n" +
                   "📅 **Lịch học đề xuất**:\n" +
                   "• 15-30 phút/ngày\n" +
                   "• 5-6 ngày/tuần\n" +
                   "• Ôn tập cuối tuần\n\n" +
                   "Quan trọng là học đều đặn, không cần học quá nhiều một lúc!";
        }

        // Comparison
        if (message.Contains("khác nhau") || message.Contains("so sánh") || message.Contains("khác gì"))
        {
            if (message.Contains("hiragana") && message.Contains("katakana"))
            {
                return "**Sự khác biệt giữa Hiragana và Katakana**:\n\n" +
                       "**Hiragana (ひらがな)**:\n" +
                       "• Viết mềm mại, tròn trịa\n" +
                       "• Dùng cho từ thuần Nhật\n" +
                       "• Ví dụ: あめ (ame) - mưa\n\n" +
                       "**Katakana (カタカナ)**:\n" +
                       "• Viết cứng, góc cạnh\n" +
                       "• Dùng cho từ mượn nước ngoài\n" +
                       "• Ví dụ: コーヒー (koohii) - cà phê\n\n" +
                       "Cả hai đều có 46 ký tự cơ bản!";
            }
        }

        // Goodbye
        if (message.Contains("tạm biệt") || message.Contains("bye") || message.Contains("goodbye") || message.Contains("hẹn gặp lại"))
        {
            return "Tạm biệt bạn! Chúc bạn học tốt tiếng Nhật! 😊\n\n" +
                   "Nếu có thắc mắc gì, cứ quay lại hỏi tôi nhé!\n" +
                   "がんばってください (Ganbatte kudasai - Cố gắng nhé)! 💪";
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

