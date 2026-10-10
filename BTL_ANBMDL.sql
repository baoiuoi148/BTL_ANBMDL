-- TẠO DATABASE
CREATE DATABASE BTL_ANBMDL;
GO

USE BTL_ANBMDL;
GO

-- BẢNG TÀI KHOẢN
CREATE TABLE TaiKhoan (
    ID       INT IDENTITY(1,1) PRIMARY KEY,
    Username NVARCHAR(100) NOT NULL UNIQUE,
    Password NVARCHAR(255) NOT NULL,
    HoTen    NVARCHAR(200),
    Email    NVARCHAR(200),
    Role     NVARCHAR(50) DEFAULT 'User'
);
GO

-- BẢNG BÀI VIẾT
CREATE TABLE BaiViet (
    ID       INT IDENTITY(1,1) PRIMARY KEY,
    TieuDe   NVARCHAR(500),
    NoiDung  NVARCHAR(MAX),
    Anh      NVARCHAR(500),
    LinkBai  NVARCHAR(500),
    LoaiTin  NVARCHAR(100),
    TacGia   NVARCHAR(100),
    NgayDang DATETIME DEFAULT GETDATE(),
    LuotXem  INT DEFAULT 0
);
GO

-- DỮ LIỆU MẪU — TÀI KHOẢN
INSERT INTO TaiKhoan (Username, Password, HoTen, Email, Role) VALUES
('admin', 'Admin@123', N'Quản trị viên', 'admin@hou.edu.vn', 'Admin'),
('user1', '123456', N'Nguyễn Văn A', 'nguyenvana@gmail.com', 'User');
GO

-- DỮ LIỆU MẪU — BÀI VIẾT 
INSERT INTO BaiViet (TieuDe, NoiDung, Anh, LinkBai, LoaiTin, TacGia, NgayDang, LuotXem) VALUES
(N'Hướng tới Đại hội Đại biểu Đảng Cộng sản Việt Nam lần thứ XIV',
 N'Trong không khí thi đua sôi nổi chào mừng Đại hội Đại biểu Đảng Cộng sản Việt Nam lần thứ XIV...',
 '../assest/images/TinHoatDong_Anh1.jpg', 'chi-tiet-ban-tin.aspx?id=1',
 N'Tin hoạt động', 'admin', '2026-03-01', 150),

(N'[TỔNG KẾT] ĐỐI THOẠI CẤP KHOA CÔNG NGHỆ THÔNG TIN',
 N'Vừa qua chiều ngày 20/3/2026 tại Giảng đường Khoa Công Nghệ Thông Tin...',
 '../assest/images/TinHoatDong_Anh2.jpg', 'chi-tiet-ban-tin.aspx?id=2',
 N'Tin hoạt động', 'admin', '2026-03-20', 90),

(N'KHOA CÔNG NGHỆ THÔNG TIN CHÀO MỪNG KHAI GIẢNG NĂM HỌC 2025 – 2026',
 N'Sáng ngày 05/09/2025 thầy và trò Khoa CNTT đã tham gia Lễ Khai giảng...',
 '../assest/images/TinHoatDong_Anh3.jpg', 'chi-tiet-ban-tin.aspx?id=3',
 N'Tin hoạt động', 'admin', '2025-09-05', 200),

(N'CUỘC THI MÃ NGUỒN MỞ – OLYMPIC TIN HỌC 2025',
 N'Sáng nay (04/10/2025) vòng sơ loại cấp Khoa Olympic Tin học đã được tổ chức...',
 '../assest/images/TinHoatDong_Anh4.jpg', 'chi-tiet-ban-tin.aspx?id=4',
 N'Tin hoạt động', 'admin', '2025-10-04', 180),

(N'Thông báo v/v Nộp hồ sơ xét tốt nghiệp tháng 6 - 2026',
 N'Thông báo quy trình nộp hồ sơ xét công nhận tốt nghiệp...',
 '../assest/images/TinHoatDong_Anh5.jpg', 'chi-tiet-ban-tin.aspx?id=5',
 N'Tin đào tạo', 'admin', '2026-04-01', 300),

(N'Thông báo đăng ký xét chuyên ngành khóa nhập học năm 2024',
 N'Khoa CNTT thông báo đăng ký xét chuyên ngành Khóa nhập học 2024...',
 '../assest/images/TinHoatDong_Anh6.jpg', 'chi-tiet-ban-tin.aspx?id=6',
 N'Tin đào tạo', 'admin', '2026-05-01', 120),

(N'Thông báo họp lớp xét Kết quả Rèn luyện HK2 năm học 2025-2026',
 N'Căn cứ Kế hoạch học kỳ/năm học của Nhà trường...',
 '../assest/images/TinHoatDong_Anh7.jpg', 'chi-tiet-ban-tin.aspx?id=7',
 N'Tin đào tạo', 'admin', '2026-04-15', 80),

(N'THÔNG BÁO V/V Duyệt và huỷ các lớp tín chỉ học kỳ II (2025-2026)',
 N'Căn cứ vào số lượng đăng ký và nguyện vọng sau thông báo số 02...',
 '../assest/images/TinHoatDong_Anh8.jpg', 'chi-tiet-ban-tin.aspx?id=8',
 N'Tin đào tạo', 'admin', '2026-01-10', 95),

(N'SIÊU PHẨM CUỘC THI "AI 4 LIFE" – FITHOU 2025',
 N'Cảm ơn các bạn sinh viên FITHOU đã bùng cháy đam mê...',
 '../assest/images/TinHoatDong_Anh9.jpg', 'chi-tiet-ban-tin.aspx?id=9',
 N'Kế hoạch', 'admin', '2025-11-01', 210);
GO