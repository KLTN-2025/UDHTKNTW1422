<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageLandingPage.master" AutoEventWireup="true" CodeFile="UI_Hieu.aspx.cs" Inherits="web_module_UI_Hieu_UI_Hieu" %>

<%@ Register Src="~/web_usercontrol/global_LandingPage_Menu.ascx" TagPrefix="uc1" TagName="global_LandingPage_Menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="Server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" xintegrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        .step-contact .step-content .section-contact .form-contact__title {
            margin-top: 1rem;
        }

        :root {
            --bs-blue: #0d6efd;
            --primary-blue: #2299ff; /* Màu xanh chủ đạo */
        }
        k
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f9fc; /* Nền nhẹ */
        }

        /* Thanh điều hướng cấp trên cùng (Chỉ còn Lớp) */
        .top-nav {
            background-color: #fff;
            padding: 10px 0;
            border-bottom: 1px solid #eee;
        }

        /* Tab số (lớp) */
        .grade-tab-number {
            display: inline-block;
            width: 30px;
            height: 30px;
            line-height: 30px;
            text-align: center;
            font-size: 14px;
            color: #6c757d;
            text-decoration: none;
            border-radius: 50%;
            margin: 0 5px;
            transition: all 0.2s;
        }

            .grade-tab-number:hover {
                color: var(--primary-blue);
            }

            .grade-tab-number.active {
                color: var(--primary-blue);
                font-weight: 700;
                border: 2px solid var(--primary-blue);
                background-color: #fff;
            }

        /* Phần tiêu đề nội dung */
        .content-header {
            padding: 30px 0 15px 0;
        }

            .content-header h2 {
                font-weight: 700;
                color: #333;
                margin-bottom: 5px;
                font-size: 1.8rem;
            }

            .content-header .info-icon {
                color: #6c757d;
                font-size: 16px;
                margin-left: 5px;
                cursor: pointer;
            }

            .content-header .subtitle {
                font-size: 1rem;
                color: #6c757d;
                margin-top: 10px;
            }

        /* Card sách: Bây giờ là Bìa Sách */
        .book-container {
            /* Giữ container cho hiệu ứng hover và title */
            display: block;
            cursor: pointer;
            text-decoration: none;
            color: inherit;
        }

        .book-card {
            background-color: #fff;
            border-radius: 10px; /* Góc bo tròn */
            overflow: hidden;
            transition: all 0.2s;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24); /* Thêm box shadow nhẹ */
            border: 1px solid #eee; /* Viền nhẹ */
        }

        /* Hiệu ứng 3D như xếp chồng */
        .book-cover-effect {
            position: relative;
            transform: translateZ(0); /* Kích hoạt 3D context */
            /* Tạo hiệu ứng sách xếp chồng bằng multiple box-shadow */
            box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.05), /* Đường viền nhẹ */
            2px 2px 0 0 #f0f0f0, /* Lớp 1 (trang) */
            4px 4px 0 0 #e0e0e0, /* Lớp 2 (trang) */
            6px 6px 15px rgba(0, 0, 0, 0.2); /* Bóng đổ chính */
        }

            .book-cover-effect:hover {
                transform: translate(-2px, -2px); /* Dịch chuyển nhẹ khi hover */
                box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.05), 2px 2px 0 0 #f0f0f0, 4px 4px 0 0 #e0e0e0, 8px 8px 25px rgba(0, 0, 0, 0.3); /* Bóng đổ lớn hơn khi hover */
            }

        .book-card-img-container {
            position: relative;
            /* Tỷ lệ cho bìa sách (cao hơn) - khoảng 1:1.45 (400x580) */
            padding-bottom: 145%;
            overflow: hidden;
        }

            .book-card-img-container img {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                object-fit: cover;
                border-radius: 10px;
            }

        /* Tiêu đề bên ngoài (màu xanh lá đậm) */
        .book-title-external {
            font-size: 1.1rem;
            font-weight: 700;
            color: #1e8449; /* Màu xanh lá đậm như trong hình */
            text-align: center;
            margin-top: 1rem;
            line-height: 1.3;
        }
    </style>

    <script src="admin_js/sweetalert.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Menu" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TopWrapper" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Wrapper" runat="Server">
    <uc1:global_LandingPage_Menu runat="server" ID="global_LandingPage_Menu" />
    <asp:ScriptManager runat="server" />
    <div id="" class="step-contact" style="flex-wrap:wrap">
        <div class="container-fluid top-nav">
            <div class="container">
                <div class="d-flex align-items-center">
                    <!-- Dãy số từ 6 đến 10 -->
                    <div class="d-none d-sm-block" id="grade-numbers">
                        <a href="#" class="grade-tab-number" data-grade="6">6</a>
                        <a href="#" class="grade-tab-number" data-grade="7">7</a>
                        <a href="#" class="grade-tab-number" data-grade="8">8</a>
                        <a href="#" class="grade-tab-number" data-grade="9">9</a>
                        <a href="#" class="grade-tab-number" data-grade="10">10</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <!-- Phần Tiêu đề Nội dung -->
            <div class="content-header">
                <h2 class="d-flex align-items-center" id="content-title">
                    <!-- Nội dung sẽ được cập nhật bởi JS -->
                    HỌC LIỆU SGK TIẾNG ANH - LỚP 6
                <span class="info-icon" title="Thông tin thêm">&#9432;</span>
                </h2>
                <p class="subtitle" id="content-subtitle">Sách Mềm 2.0</p>
            </div>

            <!-- Phần Danh sách Card Sách (Container) -->
            <div class="row" id="book-list-container">
                <!-- Card sách sẽ được render tại đây bằng JavaScript -->
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="BottomWrapper" runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="Server">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" xintegrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eE7N6jIeHz" crossorigin="anonymous"></script>

    <script>
        // Dữ liệu sách mẫu (Mock Data) cho các lớp 6-10
        const mockBookData = {
            '6': [
                { title: "Tiếng Anh 6 - Global Success", placeholderText: "T.Anh 6", bgColor: "f0f8ff", textColor: "4a8cff" },
                { title: "Toán 6 - Chân trời sáng tạo", placeholderText: "Toán 6", bgColor: "e6f7ff", textColor: "4a8cff" },
            ],
            '7': [
                { title: "Tiếng Anh 7 - Global Success", placeholderText: "T.Anh 7", bgColor: "f0f8ff", textColor: "4a8cff" },
                { title: "Toán 7 - Cánh Diều", placeholderText: "Toán 7", bgColor: "fff0f5", textColor: "ff1493" },
            ],
            '8': [
                { title: "Tiếng Anh 8 - Global Success", placeholderText: "T.Anh 8", bgColor: "f0f8ff", textColor: "4a8cff" },
                { title: "Tin học 8", placeholderText: "Tin học 8", bgColor: "e6ffe6", textColor: "3cb371" },
            ],
            '9': [
                { title: "Tiếng Anh 9 - Global Success", placeholderText: "T.Anh 9", bgColor: "f0f8ff", textColor: "4a8cff" },
                { title: "Ngữ Văn 9 - Tập 2", placeholderText: "Ngữ Văn 9", bgColor: "e6f7ff", textColor: "4a8cff" },
            ],
            '10': [
                { title: "Tiếng Anh 10 - Global Success", placeholderText: "T.Anh 10", bgColor: "f0f8ff", textColor: "4a8cff" },
                { title: "Toán 10 - Chuyên đề", placeholderText: "Toán 10", bgColor: "fff0f5", textColor: "ff1493" },
            ],
            // Dữ liệu mặc định cho các lớp không có dữ liệu cụ thể
            'default': [
                { title: "Nội dung lớp [X] đang cập nhật", placeholderText: "Coming Soon", bgColor: "f7f7f7", textColor: "6c757d" },
            ]
        };

        // Hàm tạo một thẻ (card) sách với giao diện bìa sách 3D
        const createBookCard = (book) => {
            const cardHtml = `
                <div class="col-6 col-md-3 col-lg-2 mb-4">
                    <a href="#" class="book-container">
                        <div class="book-card book-cover-effect">
                            <div class="book-card-img-container">
                                <img src="https://placehold.co/400x580/${book.bgColor}/${book.textColor}?text=${book.placeholderText.replace(/\s/g, '+')}" 
                                     alt="${book.title}" class="img-fluid book-image-style">
                            </div>
                        </div>
                        <p class="book-title-external mt-3">${book.title}</p>
                    </a>
                </div>
            `;
            return cardHtml;
        };

        // Hàm chính để render sách dựa trên lớp được chọn
        const renderBooks = (grade) => {
            const container = document.getElementById('book-list-container');
            const titleElement = document.getElementById('content-title');

            // 1. Cập nhật tiêu đề
            const gradeTitle = `LỚP ${grade}`;
            titleElement.innerHTML = `
                HỌC LIỆU SGK TIẾNG ANH - ${gradeTitle}
                <span class="info-icon" title="Thông tin thêm">&#9432;</span>
            `;
            
            // 2. Lấy dữ liệu
            let books = mockBookData[grade];

            if (!books) {
                // Nếu không có dữ liệu cụ thể, sử dụng dữ liệu mặc định
                books = mockBookData['default'].map(book => ({
                    ...book,
                    title: book.title.replace('[X]', grade),
                    placeholderText: book.placeholderText + ' ' + grade 
                }));
            }

            // 3. Xóa nội dung cũ
            container.innerHTML = '';
            
            // 4. Tạo và thêm HTML mới
            books.forEach(book => {
                container.innerHTML += createBookCard(book);
            });
        };

        // Hàm quản lý trạng thái active của các tab
        const setActiveGrade = (clickedElement) => {
            // Xóa active của tất cả các tab (số)
            document.querySelectorAll('.grade-tab-number').forEach(tab => {
                tab.classList.remove('active');
            });

            // Đặt active cho phần tử được click
            clickedElement.classList.add('active');
        };


        // Lắng nghe sự kiện click trên các nút chọn lớp
        document.addEventListener('DOMContentLoaded', () => {
            const gradeTabs = document.querySelectorAll('.grade-tab-number');

            gradeTabs.forEach(tab => {
                tab.addEventListener('click', (e) => {
                    e.preventDefault(); // Ngăn chặn hành vi mặc định của thẻ <a>
                    const grade = tab.getAttribute('data-grade');
                    
                    setActiveGrade(tab);
                    renderBooks(grade);
                });
            });

            // Tải nội dung mặc định khi trang load (Lớp 6)
            const defaultGrade = '6';
            const defaultTab = document.querySelector(`.grade-tab-number[data-grade="${defaultGrade}"]`);
            if (defaultTab) {
                // Đảm bảo tab 6 có class active ngay từ đầu
                defaultTab.classList.add('active'); 
                renderBooks(defaultGrade);
            }
        });
    </script>

</asp:Content>

