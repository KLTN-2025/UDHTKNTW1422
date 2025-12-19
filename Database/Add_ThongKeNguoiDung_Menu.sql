-- Script để thêm menu "Thống kê người dùng" vào hệ thống admin
-- Chạy script này trong SQL Server Management Studio

-- Bước 1: Kiểm tra xem module "Quản lý nhập liệu" đã tồn tại chưa
-- (Giả sử module này có module_id = 1, bạn cần kiểm tra lại trong bảng admin_Module)

-- Bước 2: Thêm Form "Thống kê người dùng" vào bảng admin_Form
-- Lưu ý: Điều chỉnh module_id và form_position theo thực tế của bạn

DECLARE @module_id INT;
DECLARE @form_position INT;

-- Lấy module_id của module "Quản lý nhập liệu" (hoặc module bạn muốn thêm vào)
SELECT @module_id = module_id FROM admin_Module WHERE module_name LIKE '%Quản lý%' OR module_name LIKE '%nhập liệu%';
IF @module_id IS NULL SET @module_id = 1; -- Mặc định nếu không tìm thấy

-- Lấy form_position tiếp theo
SELECT @form_position = ISNULL(MAX(form_position), 0) + 1 FROM admin_Form WHERE module_id = @module_id;

-- Thêm form mới vào module "Quản lý người dùng"
-- Tìm module "Quản lý người dùng" hoặc module có chứa "người dùng"
SELECT @module_id = module_id FROM admin_Module WHERE module_name LIKE N'%người dùng%' OR module_name LIKE N'%Quản lý người dùng%';
IF @module_id IS NULL 
BEGIN
    -- Nếu không tìm thấy, tìm module "Quản lý nhập liệu" hoặc module đầu tiên
    SELECT @module_id = module_id FROM admin_Module WHERE module_name LIKE N'%Quản lý%' OR module_name LIKE N'%nhập liệu%';
    IF @module_id IS NULL SET @module_id = 1; -- Mặc định
END

-- Lấy form_position tiếp theo trong module đó
SELECT @form_position = ISNULL(MAX(form_position), 0) + 1 FROM admin_Form WHERE module_id = @module_id;

-- Thêm form mới
INSERT INTO admin_Form (module_id, form_name, form_link, form_position, form_active)
VALUES (@module_id, N'Thống kê người dùng', N'admin_page/module_function/module_ThongKeNguoiDung.aspx', @form_position, 1);

-- Bước 3: Cấp quyền cho tất cả các nhóm người dùng (hoặc nhóm cụ thể)
-- Lấy form_id vừa tạo
DECLARE @form_id INT;
SELECT @form_id = form_id FROM admin_Form WHERE form_link = N'admin_page/module_function/module_ThongKeNguoiDung.aspx';

-- Cấp quyền cho tất cả nhóm người dùng (groupuser_id = 1 thường là admin)
-- Bạn có thể điều chỉnh groupuser_id theo nhu cầu
INSERT INTO admin_AccessGroupUserForm (groupuser_id, form_id, guf_active)
SELECT groupuser_id, @form_id, 1
FROM admin_GroupUser
WHERE NOT EXISTS (
    SELECT 1 FROM admin_AccessGroupUserForm 
    WHERE groupuser_id = admin_GroupUser.groupuser_id AND form_id = @form_id
);

-- Cấp quyền cho từng user (nếu cần)
-- INSERT INTO admin_AccessUserForm (username_id, form_id, uf_active)
-- SELECT username_id, @form_id, 1
-- FROM admin_User
-- WHERE NOT EXISTS (
--     SELECT 1 FROM admin_AccessUserForm 
--     WHERE username_id = admin_User.username_id AND form_id = @form_id
-- );

PRINT 'Đã thêm menu "Thống kê người dùng" thành công!';
PRINT 'Form ID: ' + CAST(@form_id AS VARCHAR(10));

