
DROP TABLE IF EXISTS Mien;
DROP TABLE IF EXISTS ThongTin_Truong;

CREATE TABLE ThongTin_Truong (
  ma_truong varchar(10) PRIMARY KEY not null,
  ten_truong TEXT not null,
  ten_t_a TEXT not null,
  thanh_lap int not null,
  loai_hinh text not null,
  vi_tri text not null,
  website TEXT not null
);

CREATE TABLE Mien(
	ma_truong varchar(10) PRIMARY KEY not null,
	mien text not null,
    FOREIGN KEY (ma_truong) REFERENCES ThongTin_Truong (ma_truong) 
);

-- Insert data into ThongTin_Truong
INSERT INTO ThongTin_Truong (ma_truong, ten_truong, ten_t_a, thanh_lap, loai_hinh, vi_tri, website) VALUES
('BKA', N'Đại học Bách khoa Hà Nội', N'Hanoi University of Science and Technology (HUST)', 1956, N'Trường đại học công lập trọng điểm quốc gia', N'Số 1 Đại Cồ Việt, Hai Bà Trưng, Hà Nội', N'https://www.hust.edu.vn/'),
('QHI', N'Trường Đại học Công nghệ – Đại học Quốc gia Hà Nội', N'VNU University of Engineering and Technology (VNU-UET)', 2004, N'Trường đại học công lập, thành viên của Đại học Quốc gia Hà Nội', N'144 Xuân Thủy, Cầu Giấy, Hà Nội', N'https://uet.vnu.edu.vn/'),
('KCN', N'Trường Đại học Khoa học và Công nghệ Hà Nội', N'University of Science and Technology of Hanoi (USTH)', 2009, N'Trường đại học công lập quốc tế theo mô hình Pháp – Việt', N'Tòa nhà Dự án USTH, 18 Hoàng Quốc Việt, Cầu Giấy, Hà Nội', N'https://usth.edu.vn/'),
('GHA', N'Trường Đại học Giao thông Vận tải Hà Nội', N'University of Transport and Communications (UTC)', 1945, N'Trường đại học công lập', N'Số 3 Cầu Giấy, phường Láng Thượng, quận Đống Đa, Hà Nội', N'https://www.utc.edu.vn/'),
('KHA', N'Trường Đại học Kinh tế Quốc dân', N'National Economics University (NEU)', 1956, N'Trường đại học công lập trọng điểm về kinh tế', N'207 Giải Phóng, phường Đồng Tâm, quận Hai Bà Trưng, Hà Nội', N'https://www.neu.edu.vn/'),
('SPH', N'Trường Đại học Sư phạm Hà Nội', N'Hanoi National University of Education (HNUE)', 1951, N'Trường đại học công lập trọng điểm về đào tạo giáo viên và nghiên cứu khoa học giáo dục tại Việt Nam', N'136 Xuân Thủy, phường Dịch Vọng Hậu, quận Cầu Giấy, Hà Nội', N'https://hnue.edu.vn/'),
('TLA', N'Trường Đại học Thủy lợi', N'Thuyloi University (TLU)', 1959, N'Trường đại học công lập trọng điểm về kỹ thuật, đặc biệt trong lĩnh vực thủy lợi, tài nguyên nước và xây dựng', N'175 Tây Sơn, phường Trung Liệt, quận Đống Đa, Hà Nội', N'https://www.tlu.edu.vn/'),
('DCN', N'Trường Đại học Công nghiệp Hà Nội', N'Hanoi University of Industry (HAUI)', 1898, N'Trường đại học công lập đa ngành, đào tạo kỹ thuật - công nghệ và kinh tế', N'Số 298, Đường Cầu Diễn, Quận Bắc Từ Liêm, Hà Nội', N'https://www.haui.edu.vn/vn'),
('MDA', N'Trường Đại học Mỏ – Địa chất', N'Hanoi University of Mining and Geology (HUMG)', 1966, N'Trường đại học công lập chuyên đào tạo về kỹ thuật mỏ, địa chất, dầu khí, công trình, công nghệ thông tin, kinh tế và môi trường', N'Số 18 Phố Viên, Phường Đức Thắng, Quận Bắc Từ Liêm, Hà Nội', N'https://www.humg.edu.vn/'),
('KTA', N'Trường Đại học Kiến trúc Hà Nội', N'Hanoi Architectural University (HAU)', 1969, N'Trường đại học công lập chuyên đào tạo về kiến trúc, xây dựng, quy hoạch, mỹ thuật công nghiệp và công nghệ', N'Km10, Đường Nguyễn Trãi, Quận Hà Đông, Hà Nội', N'https://www.hau.edu.vn/'),
('GTA', N'Trường Đại học Công nghệ Giao thông Vận tải', N'University of Transport Technology (UTT)', 1945, N'Trường đại học công lập chuyên đào tạo về công nghệ, kỹ thuật và quản lý trong lĩnh vực giao thông vận tải. Trực thuộc: Bộ Giao thông Vận tải', N'Số 54 Triều Khúc, Quận Thanh Xuân, Hà Nội', N'https://utt.edu.vn/'),
('BVH', N'Học viện Công nghệ Bưu chính Viễn thông', N'Posts and Telecommunications Institute of Technology (PTIT)', 1997, N'Trường đại học công lập trực thuộc Bộ Thông tin và Truyền thông', N'Km10 Nguyễn Trãi, Hà Đông, Hà Nội', N'https://ptit.edu.vn/'),
('KQH', N'Học viện Kỹ thuật Quân sự', N'Military Technical Academy (MTA)', 1966, N'Trường đại học công lập trọng điểm quốc gia, trực thuộc Bộ Quốc phòng Việt Nam', N'236 Hoàng Quốc Việt, Cầu Giấy, Hà Nội', N'https://mta.edu.vn/'),
('KMA', N'Học viện Kỹ thuật Mật mã', N'Academy of Cryptography Techniques (ACT)', 1976, N'Trường đại học công lập trực thuộc Ban Cơ yếu Chính phủ', N'141 Chiến Thắng, Tân Triều, Thanh Trì, Hà Nội', N'https://acti.gov.vn/'),
('QHS', N'Trường Đại học Khoa học Tự nhiên - ĐHQG TP.HCM', N'VNUHCM - University of Science', 1996, N'Trường đại học công lập, thành viên của Đại học Quốc gia TP.HCM', N'227 Nguyễn Văn Cừ, Phường 4, Quận 5, TP. Hồ Chí Minh', N'https://www.hcmus.edu.vn/'),
('BKS', N'Trường Đại học Bách khoa - ĐHQG TP.HCM', N'VNUHCM - University of Technology (HCMUT)', 1957, N'Trường đại học công lập trọng điểm quốc gia, thành viên của Đại học Quốc gia TP.HCM', N'268 Lý Thường Kiệt, Phường 14, Quận 10, TP. Hồ Chí Minh', N'https://hcmut.edu.vn/'),
('ITS', N'Trường Đại học Công nghệ Thông tin - ĐHQG TP.HCM', N'VNUHCM - University of Information Technology (UIT)', 2006, N'Trường đại học công lập, thành viên của Đại học Quốc gia TP.HCM', N'Khu phố 6, Phường Linh Trung, Thành phố Thủ Đức, TP. Hồ Chí Minh', N'https://www.uit.edu.vn/'),
('SPS', N'Trường Đại học Sư phạm TP.HCM', N'Ho Chi Minh City University of Education (HCMUE)', 1976, N'Trường đại học công lập trọng điểm về đào tạo giáo viên khu vực phía Nam', N'280 An Dương Vương, Phường 4, Quận 5, TP. Hồ Chí Minh', N'https://hcmue.edu.vn/'),
('SGK', N'Trường Đại học Sài Gòn', N'Saigon University (SGU)', 2007, N'Trường đại học công lập trực thuộc UBND TP.HCM', N'273 An Dương Vương, Phường 3, Quận 5, TP. Hồ Chí Minh', N'https://www.sgu.edu.vn/'),
('HCS', N'Trường Đại học Công nghiệp TP.HCM', N'Industrial University of Ho Chi Minh City (IUH)', 1956, N'Trường đại học công lập trực thuộc Bộ Công Thương', N'12 Nguyễn Văn Bảo, Phường 4, Quận Gò Vấp, TP. Hồ Chí Minh', N'https://iuh.edu.vn/'),
('GTS', N'Trường Đại học Giao thông vận tải TP.HCM', N'Ho Chi Minh City University of Transport (UT-HCMC)', 1988, N'Trường đại học công lập trực thuộc Bộ Giao thông Vận tải', N'Số 2, Đường Võ Oanh, Phường 25, Quận Bình Thạnh, TP. Hồ Chí Minh', N'https://ut.edu.vn/'),
('NLS', N'Trường Đại học Nông Lâm TP.HCM', N'Nong Lam University - Ho Chi Minh City (NLU)', 1955, N'Trường đại học công lập đa ngành', N'Khu phố 6, Phường Linh Trung, Thành phố Thủ Đức, TP. Hồ Chí Minh', N'https://www.hcmuaf.edu.vn/'),
('KTS', N'Trường Đại học Kiến trúc TP.HCM', N'University of Architecture Ho Chi Minh City (UAH)', 1951, N'Trường đại học công lập trực thuộc Bộ Xây dựng', N'196 Pasteur, Phường Võ Thị Sáu, Quận 3, TP. Hồ Chí Minh', N'http://www.uah.edu.vn/'),
('TCT', N'Trường Đại học Tài chính - Marketing', N'University of Finance - Marketing (UFM)', 1976, N'Trường đại học công lập tự chủ tài chính, trực thuộc Bộ Tài chính', N'Số 778 Nguyễn Kiệm, Phường 4, Quận Phú Nhuận, TP. Hồ Chí Minh', N'https://ufm.edu.vn/'),
('DTT', N'Trường Đại học Tôn Đức Thắng', N'Ton Duc Thang University (TDTU)', 1997, N'Trường đại học công lập tự chủ trực thuộc Tổng Liên đoàn Lao động Việt Nam', N'19 Nguyễn Hữu Thọ, Phường Tân Phong, Quận 7, TP. Hồ Chí Minh', N'https://www.tdtu.edu.vn/'),
('MTU', N'Trường Đại học Quốc tế Miền Đông', N'Eastern International University (EIU)', 2010, N'Trường đại học tư thục do Tổng Công ty Becamex IDC đầu tư', N'Đường Nam Kỳ Khởi Nghĩa, Phường Định Hòa, Thành phố Thủ Dầu Một, Tỉnh Bình Dương', N'https://eiu.edu.vn/'),
('TTU', N'Trường Đại học Tân Tạo', N'Tan Tao University (TTU)', 2008, N'Trường đại học tư thục phi lợi nhuận theo mô hình Hoa Kỳ', N'Đại lộ Đại học Tân Tạo, Thành phố E.City Tân Đức, Huyện Đức Hòa, Tỉnh Long An', N'https://ttu.edu.vn/'),
('VGU', N'Trường Đại học Việt Đức', N'Vietnamese-German University (VGU)', 2008, N'Trường đại học công lập tự chủ theo mô hình đại học nghiên cứu của Đức', N'Đường Vành đai 4, Phường Thới Hòa, Thị xã Bến Cát, Tỉnh Bình Dương', N'https://vgu.edu.vn/'),
('FPT', N'Đại học FPT', N'FPT University', 2006, N'Trường đại học tư thục do Tập đoàn FPT đầu tư', N'Khu Công nghệ cao Hòa Lạc, Km29 Đại lộ Thăng Long, Huyện Thạch Thất, Hà Nội (Và nhiều cơ sở khác)', N'https://daihoc.fpt.edu.vn/'),
('RMIB', N'Đại học RMIT Việt Nam', N'RMIT University Vietnam', 2000, N'Trường đại học quốc tế, chi nhánh của Đại học RMIT (Úc)', N'702 Nguyễn Văn Linh, Phường Tân Hưng, Quận 7, TP. Hồ Chí Minh (Cơ sở Nam Sài Gòn) & Handi Resco Building, 521 Kim Mã, Quận Ba Đình, Hà Nội (Cơ sở Hà Nội)', N'https://www.rmit.edu.vn/'),
('BUVB', N'Đại học Anh Quốc Việt Nam', N'British University Vietnam (BUV)', 2009, N'Trường đại học quốc tế 100% vốn nước ngoài, cấp bằng bởi Đại học London và Đại học Staffordshire (Anh)', N'Khu đô thị Ecopark, Huyện Văn Giang, Tỉnh Hưng Yên', N'https://www.buv.edu.vn/'),
('HBT', N'Đại học Quốc tế Hồng Bàng', N'Hong Bang International University (HIU)', 1997, N'Trường đại học tư thục thuộc Tập đoàn Nguyễn Hoàng (NHG)', N'215 Điện Biên Phủ, Phường 15, Quận Bình Thạnh, TP. Hồ Chí Minh', N'https://hiu.vn/'),
('VLU', N'Đại học Văn Lang', N'Van Lang University (VLU)', 1995, N'Trường đại học tư thục', N'Cơ sở chính: 69/68 Đặng Thuỳ Trâm, Phường 13, Quận Bình Thạnh, TP. Hồ Chí Minh', N'https://www.vlu.edu.vn/'),
('NTT', N'Đại học Nguyễn Tất Thành', N'Nguyen Tat Thanh University (NTTU)', 1999, N'Trường đại học tư thục trực thuộc Tập đoàn Dệt May Việt Nam (Vinatex)', N'300A Nguyễn Tất Thành, Phường 13, Quận 4, TP. Hồ Chí Minh', N'https://ntt.edu.vn/'),
('HHT', N'Đại học Hoa Sen', N'Hoa Sen University (HSU)', 1991, N'Trường đại học tư thục thuộc Tập đoàn Nguyễn Hoàng (NHG)', N'Số 8 Nguyễn Văn Tráng, Phường Bến Thành, Quận 1, TP. Hồ Chí Minh', N'https://www.hoasen.edu.vn/'),
('TDV', N'Đại học Duy Tân', N'Duy Tan University (DTU)', 1994, N'Trường đại học tư thục lớn nhất miền Trung Việt Nam', N'254 Nguyễn Văn Linh, Phường Thạc Gián, Quận Thanh Khê, TP. Đà Nẵng', N'https://duytan.edu.vn/'),
('DKT', N'Đại học Kiến trúc Đà Nẵng', N'Danang Architecture University', 2006, N'Trường đại học tư thục', N'566 Núi Thành, Phường Hòa Cường Nam, Quận Hải Châu, TP. Đà Nẵng', N'https://dau.edu.vn/'),
('DDA', N'Đại học Đông Á', N'Dong A University', 2009, N'Trường đại học tư thục', N'33 Xô Viết Nghệ Tĩnh, Phường Hòa Cường Nam, Quận Hải Châu, TP. Đà Nẵng', N'https://donga.edu.vn/'),
('DDT', N'Trường Đại học Công nghệ – Đại học Đà Nẵng', N'University of Technology and Education - The University of Danang', 1994, N'Trường đại học công lập, thành viên của Đại học Đà Nẵng', N'Số 54 Nguyễn Lương Bằng, Phường Hòa Khánh Nam, Quận Liên Chiểu, TP. Đà Nẵng', N'http://dut.udn.vn/'),
('DSQ', N'Trường Đại học Kinh tế – Đại học Đà Nẵng', N'University of Economics - The University of Danang', 1994, N'Trường đại học công lập, thành viên của Đại học Đà Nẵng', N'71 Ngũ Hành Sơn, Phường Mỹ An, Quận Ngũ Hành Sơn, TP. Đà Nẵng', N'http://due.udn.vn/'),
('DSF', N'Trường Đại học Sư phạm – Đại học Đà Nẵng', N'University of Science and Education - The University of Danang', 1994, N'Trường đại học công lập, thành viên của Đại học Đà Nẵng', N'459 Tôn Đức Thắng, Phường Hòa Khánh Nam, Quận Liên Chiểu, TP. Đà Nẵng', N'http://ued.udn.vn/'),
('VKU', N'Trường Đại học Công nghệ Thông tin và Truyền thông Việt – Hàn', N'Vietnam - Korea University of Information and Communication Technology', 2020, N'Trường đại học công lập, thành viên của Đại học Đà Nẵng', N'Khu Đô thị Đại học Đà Nẵng, Đường Nam Kỳ Khởi Nghĩa, Phường Hòa Quý, Quận Ngũ Hành Sơn, TP. Đà Nẵng', N'https://vku.udn.vn/'),
('DSD', N'Trường Đại học Bách khoa – Đại học Đà Nẵng', N'University of Science and Technology - The University of Danang', 1994, N'Trường đại học công lập trọng điểm, thành viên của Đại học Đà Nẵng', N'54 Nguyễn Lương Bằng, Phường Hòa Khánh Bắc, Quận Liên Chiểu, TP. Đà Nẵng', N'https://dut.udn.vn/');


-- Insert data into Mien
INSERT INTO Mien (ma_truong, mien) VALUES
('BKA', N'Miền Bắc'),
('QHI', N'Miền Bắc'),
('KCN', N'Miền Bắc'),
('GHA', N'Miền Bắc'),
('KHA', N'Miền Bắc'),
('SPH', N'Miền Bắc'),
('TLA', N'Miền Bắc'),
('DCN', N'Miền Bắc'),
('MDA', N'Miền Bắc'),
('KTA', N'Miền Bắc'),
('GTA', N'Miền Bắc'),
('BVH', N'Miền Bắc'),
('KQH', N'Miền Bắc'),
('KMA', N'Miền Bắc'),
('QHS', N'Miền Nam'),
('BKS', N'Miền Nam'),
('ITS', N'Miền Nam'),
('SPS', N'Miền Nam'),
('SGK', N'Miền Nam'),
('HCS', N'Miền Nam'),
('GTS', N'Miền Nam'),
('NLS', N'Miền Nam'),
('KTS', N'Miền Nam'),
('TCT', N'Miền Nam'),
('DTT', N'Miền Nam'),
('MTU', N'Miền Nam'),
('TTU', N'Miền Nam'),
('VGU', N'Miền Nam'),
('FPT', N'Miền Bắc'),
('RMIB', N'Miền Nam'),
('BUVB', N'Miền Bắc'),
('HBT', N'Miền Nam'),
('VLU', N'Miền Nam'),
('NTT', N'Miền Nam'),
('HHT', N'Miền Nam'),
('TDV', N'Miền Trung'),
('DKT', N'Miền Trung'),
('DDA', N'Miền Trung'),
('DDT', N'Miền Trung'),
('DSQ', N'Miền Trung'),
('DSF', N'Miền Trung'),
('VKU', N'Miền Trung'),
('DSD', N'Miền Trung');


-- SELECT * FROM ThongTin_Truong;
-- SELECT * FROM Mien;
