CREATE TABLE ThongTin_Truong (
  ma_truong varchar(10) PRIMARY KEY not null,
  ten_truong TEXT not null,
  ten_t_a TEXT not null,
  thanh_lap int not null,
  loai_hinh text not null,
  vi_tri text not null,
  website TEXT not null
);

create table Mien(
	ma_truong varchar(10) primary key not null,
	mien text not null
);


INSERT INTO ThongTin_Truong VALUES
('BKA', 'Đại học Bách khoa Hà Nội', 'Hanoi University of Science and Technology (HUST)', 1956, 'Trường đại học công lập trọng điểm quốc gia', 'Số 1 Đại Cồ Việt, Hai Bà Trưng, Hà Nội', 'https://www.hust.edu.vn/'),
('QHI', 'Trường Đại học Công nghệ – Đại học Quốc gia Hà Nội', 'VNU University of Engineering and Technology (VNU-UET)', 2004, 'Trường đại học công lập, thành viên của Đại học Quốc gia Hà Nội', '144 Xuân Thủy, Cầu Giấy, Hà Nội', 'https://uet.vnu.edu.vn/'),
('KCN', 'Trường Đại học Khoa học và Công nghệ Hà Nội', 'HUniversity of Science and Technology of Hanoi (USTH)', 2009, 'Trường đại học công lập quốc tế theo mô hình Pháp – Việt', 'Tòa nhà Dự án USTH, 18 Hoàng Quốc Việt, Cầu Giấy, Hà Nội', 'https://usth.edu.vn/'),
('GHA', 'Trường Đại học Giao thông Vận tải Hà Nội', 'University of Transport and Communications (UTC)', 1945, 'Trường đại học công lập', 'Số 3 Cầu Giấy, phường Láng Thượng, quận Đống Đa, Hà Nội', 'https://www.utc.edu.vn/'),
('KHA', 'Trường Đại học Kinh tế Quốc dân', 'National Economics University (NEU)', 1956, 'Trường đại học công lập trọng điểm về kinh tế', '207 Giải Phóng, phường Đồng Tâm, quận Hai Bà Trưng, Hà Nội', 'https://www.neu.edu.vn/'),
('SPH', 'Trường Đại học Sư phạm Hà Nội', 'Hanoi National University of Education (HNUE)', 1951, 'Trường đại học công lập trọng điểm về đào tạo giáo viên và nghiên cứu khoa học giáo dục tại Việt Nam', '136 Xuân Thủy, phường Dịch Vọng Hậu, quận Cầu Giấy, Hà Nội', 'https://hnue.edu.vn/'),
('TLA', 'Trường Đại học Thủy lợi', 'Thuyloi University (TLU)', 1959, 'Trường đại học công lập trọng điểm về kỹ thuật, đặc biệt trong lĩnh vực thủy lợi, tài nguyên nước và xây dựng', '175 Tây Sơn, phường Trung Liệt, quận Đống Đa, Hà Nội', 'https://www.tlu.edu.vn/'),
('DCN', 'Trường Đại học Công nghiệp Hà Nội', 'Hanoi University of Industry (HAUI)', 1898, 'Trường đại học công lập đa ngành, đào tạo kỹ thuật - công nghệ và kinh tế', 'Số 298, Đường Cầu Diễn, Quận Bắc Từ Liêm, Hà Nội', 'https://www.haui.edu.vn/vn'),
('MDA', 'Trường Đại học Mỏ – Địa chất', 'Hanoi University of Mining and Geology (HUMG)', 1966, 'Trường đại học công lập chuyên đào tạo về kỹ thuật mỏ, địa chất, dầu khí, công trình, công nghệ thông tin, kinh tế và môi trường', 'Số 18 Phố Viên, Phường Đức Thắng, Quận Bắc Từ Liêm, Hà Nội', 'https://www.humg.edu.vn/'),
('KTA', 'Trường Đại học Kiến trúc Hà Nội', 'Hanoi Architectural University (HAU)', 1969, 'Trường đại học công lập chuyên đào tạo về kiến trúc, xây dựng, quy hoạch, mỹ thuật công nghiệp và công nghệ', 'Km10, Đường Nguyễn Trãi, Quận Hà Đông, Hà Nội', 'https://www.hau.edu.vn/'),
('GTA', 'Trường Đại học Công nghệ Giao thông Vận tải', 'University of Transport Technology (UTT)', 1945, 'Trường đại học công lập chuyên đào tạo về công nghệ, kỹ thuật và quản lý trong lĩnh vực giao thông vận tải. Trực thuộc: Bộ Giao thông Vận tải', 'Số 54 Triều Khúc, Quận Thanh Xuân, Hà Nội', 'https://utt.edu.vn/'),
('BVH', 'Học viện Công nghệ Bưu chính Viễn thông', 'Posts and Telecommunications Institute of Technology (PTIT)', 1997, 'Trường đại học công lập trực thuộc Bộ Thông tin và Truyền thông', '122 Hoàng Quốc Việt, Cầu Giấy, Hà Nội', 'https://ptit.edu.vn/'),
('KQH', 'Học viện Kỹ thuật Quân sự', 'Military Technical Academy (MTA)', 1966, 'Trường đại học công lập trọng điểm quốc gia, trực thuộc Bộ Quốc phòng Việt Nam', '236 Hoàng Quốc Việt, Cầu Giấy, Hà Nội', 'https://mta.edu.vn/'),
('KMA', 'Học viện Kỹ thuật Mật mã', 'Academy of Cryptography Techniques (ACTI)', 1976, 'Trường đại học công lập trực thuộc Ban Cơ yếu Chính phủ', '141 Chiến Thắng, Tân Triều, Thanh Trì, Hà Nội', 'https://acti.gov.vn/');


insert into Mien values
('BKA','Miền Bắc'),
('QHI','Miền Bắc'),
('KCN','Miền Bắc'),
('GHA', 'Miền Bắc'),
('KHA', 'Miền Bắc'),
('SPH', 'Miền Bắc'),
('TLA', 'Miền Bắc'),
('DCN', 'Miền Bắc'),
('MDA', 'Miền Bắc'),
('KTA', 'Miền Bắc'),
('GTA', 'Miền Bắc'),
('BVH', 'Miền Bắc'),
('KQH', 'Miền Bắc'),
('KMA', 'Miền Bắc');

select * from ThongTin_Truong;
select * from Mien;