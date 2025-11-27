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

        .back_ui {
            background-color: #f3cd8b;
            padding: 40px;
            border-radius: 9%;
            position: relative;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 50px;
            -webkit-box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
            box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
        }
    </style>

    <link href="../../css/listBooks.css" rel="stylesheet" />
    <script src="admin_js/sweetalert.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Menu" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TopWrapper" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Wrapper" runat="Server">
    <uc1:global_LandingPage_Menu runat="server" ID="global_LandingPage_Menu" />
    <asp:ScriptManager runat="server" />
    <div id="" class="step-contact" style="justify-content: center;">
        <div class="back_ui">
            <div class="book-item">
                <a href="danh-muc-sach-1?khoi=6#id_255" class="book-card" onclick="DisplayLoadingIcon()" style="text-decoration: none;">
                    <div class="book-card__cover">
                        <div class="book-card__book">
                            <div class="book-card__book-front">
                                <img class="book-card__img" src="/images/Bang_chu_cai_Hiragana/Hiragana.jpg">
                            </div>
                            <div class="book-card__book-back"></div>
                            <div class="book-card__book-side"></div>
                        </div>
                    </div>
                    <div>
                        <div class="book-card__title">
                            Bảng chữ cái Hiragana
                               
                        </div>
                    </div>
                </a>
            </div>
            <div class="book-item">
                <a href="danh-muc-sach-1?khoi=6#id_255" class="book-card" onclick="DisplayLoadingIcon()" style="text-decoration: none;">
                    <div class="book-card__cover">
                        <div class="book-card__book">
                            <div class="book-card__book-front">
                                <img class="book-card__img" src="/images/Bang_chu_cai_Hiragana/Hiragana.jpg">
                            </div>
                            <div class="book-card__book-back"></div>
                            <div class="book-card__book-side"></div>
                        </div>
                    </div>
                    <div>
                        <div class="book-card__title">
                            Bảng chữ cái Hiragana
                               
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="BottomWrapper" runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="Server">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" xintegrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eE7N6jIeHz" crossorigin="anonymous"></script>

    <script>
<%--        // Dữ liệu sách mẫu (Mock Data) cho các lớp 6-10
        const mockBookData = {
            '6': [
                { title: "Bảng chữ cái Hiragana"/*, placeholderText: "T.Anh 6", bgColor: "f0f8ff", textColor: "4a8cff"*/,ime:"Bang_chu_cai_Hiragana/Hiragana.jpg"},
                { title: "Toán 6 - Chân trời sáng tạo"/*, placeholderText: "Toán 6", bgColor: "e6f7ff", textColor: "4a8cff"*/ },
            ],
            '7': [
                { title: "Tiếng Anh 7 - Global Success"/*, placeholderText: "T.Anh 7", bgColor: "f0f8ff", textColor: "4a8cff"*/ },
                { title: "Toán 7 - Cánh Diều"/*, placeholderText: "Toán 7", bgColor: "fff0f5", textColor: "ff1493"*/ },
            ],
            '8': [
                { title: "Tiếng Anh 8 - Global Success"/*, placeholderText: "T.Anh 8", bgColor: "f0f8ff", textColor: "4a8cff" */},
                { title: "Tin học 8"/*, placeholderText: "Tin học 8", bgColor: "e6ffe6", textColor: "3cb371" */},
            ],
            '9': [
                { title: "Tiếng Anh 9 - Global Success"/*, placeholderText: "T.Anh 9", bgColor: "f0f8ff", textColor: "4a8cff"*/ },
                { title: "Ngữ Văn 9 - Tập 2"/*, placeholderText: "Ngữ Văn 9", bgColor: "e6f7ff", textColor: "4a8cff"*/ },
            ],
        };

        // Hàm tạo một thẻ (card) sách với giao diện bìa sách 3D
        const createBookCard = (book) => {
            const cardHtml = `
                <div class="col-6 col-md-3 col-lg-2 mb-4">
                    <a href="#" class="book-container">
                        <div class="book-card book-cover-effect">
                            <div class="book-card-img-container">
                                <img src="/images/${book.ime}" 
                                     alt="${book.title}" class="img-fluid book-image-style">
                            </div>
                        </div>
                        <p class="book-title-external mt-3">${book.title}</p>
                    </a>
                </div>
            `;
            return cardHtml;
        };
        <link href="../../css/listBooks.css" rel="stylesheet" />
        const createBookCard = (book) => {
            const cardHtml = `
                <div class="col-6 col-md-3 col-lg-2 mb-4">
                   <div class="book-item">
                        <a href="<%= hiragana %>" class="book-card" onclick="DisplayLoadingIcon()" style="text-decoration: none;">
                            <div class="book-card__cover">
                                <div class="book-card__book">
                                    <div class="book-card__book-front">
                                        <img class="book-card__img" src="/images/Bang_chu_cai_Hiragana/Hiragana.jpg">
                                    </div>
                                    <div class="book-card__book-back"></div>
                                    <div class="book-card__book-side"></div>
                                </div>
                            </div>
                            <div>
                                <div class="book-card__title">
                                    Bảng chữ cái Hiragana
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            `;
            return cardHtml;
        //};

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
        });--%>
</script>

</asp:Content>

