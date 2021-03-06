drop database if exists furama_quan_ly;
create database furama_quan_ly;
use furama_quan_ly;

-- task 1:Thêm mới thông tin cho tất cả các bảng có trong CSDL để có thể thõa mãn các yêu cầu bên dưới.
create table vi_tri(
	id_vi_tri int primary key,
	ten_vi_tri varchar(45)
    check(ten_vi_tri="Lễ Tân" 
    or ten_vi_tri="Phục Vụ"
    or ten_vi_tri="Chuyên Viên"
    or ten_vi_tri="Giám Sát"
    or ten_vi_tri="Quản Lý"
    or ten_vi_tri="Giám Đốc"
	)
);
create table trinh_do(
	id_trinh_do int primary key,
	ten_trinh_do varchar(45)
    check(ten_trinh_do="Trung Cấp" 
    or ten_trinh_do="Cao Đẳng"
    or ten_trinh_do="Đai Học"
    or ten_trinh_do="sau Đai Học"
	)
);
create table bo_phan(
	id_bo_phan int primary key,
	ten_bo_phan varchar(45)
    check(ten_bo_phan="Sale_Marketing" 
    or ten_bo_phan="Hành Chính"
    or ten_bo_phan="Phục Vụ"
    or ten_bo_phan="Quản Lý"
	)
);
create table nhan_vien( 
	id_nhan_vien int primary key,
	ho_ten varchar(50),
	id_vi_tri int,
	id_trinh_do int,
	id_bo_phan int,
	ngay_sinh date,
	so_cmtnd varchar(45),
	luong double,
	sdt varchar(45),
	email varchar(45),
	dia_chi varchar(45),
    foreign key (id_vi_tri) references vi_tri(id_vi_tri) on delete cascade on update cascade,
    foreign key (id_trinh_do) references trinh_do(id_trinh_do)on delete cascade on update cascade,
    foreign key (id_bo_phan) references bo_phan(id_bo_phan)on delete cascade on update cascade
);
create table loai_khach(
	id_loai_khach int primary key,
	ten_loai_khach varchar(45)
);
create table khach_hang(
	id_khach_hang int primary key,
	id_loai_khach int,
	ho_ten varchar(50),
    ngay_sinh date,
	so_cmtnd varchar(45),
	sdt varchar(45),
	email varchar(45),
	dia_chi varchar(45),
    foreign key (id_loai_khach) references loai_khach(id_loai_khach) on delete cascade on update cascade
);
create table kieu_thue(
	id_kieu_thue int primary key ,
	ten_kieu_thue varchar(45),
	gia double
);
create table loai_dich_vu(
	id_loai_dich_vu int primary key,
    ten_loai_dich_vu varchar(45)
);
create table dich_vu( 
	id_dich_vu int primary key,
	ten_dich_vu varchar(45),
    dien_tich double,
    so_nguoi_toi_da int,
    chi_phi_thue double,
    id_kieu_thue int,
    id_loai_dich_vu int,
    trang_thai varchar(45),
    foreign key (id_kieu_thue) references kieu_thue(id_kieu_thue) on delete cascade on update cascade,
    foreign key (id_loai_dich_vu) references loai_dich_vu(id_loai_dich_vu)on delete cascade on update cascade
);
create table hop_dong( 
	id_hop_dong int primary key,
	id_nhan_vien int,
	id_khach_hang int,
	id_dich_vu int,
	ngay_lam_hop_dong date,
	ngay_ket_thuc_hop_dong date,
	tien_dat_coc double,
	tong_tien double,
    foreign key (id_khach_hang) references khach_hang(id_khach_hang)on delete cascade on update cascade,
    foreign key (id_dich_vu) references dich_vu(id_dich_vu)on delete cascade on update cascade,
    foreign key (id_nhan_vien) references nhan_vien(id_nhan_vien) on delete cascade on update cascade
);
create table dich_vu_di_kem(
	id_dich_vu_di_kem int primary key,
    ten_dich_vu_di_kem varchar(45),
    gia double,
    don_vi varchar(45),
    trang_thai_kha_dung varchar(45)
);
create table hop_dong_chi_tiet(
	id_hop_dong_chi_tiet int primary key,
	id_hop_dong int,
	id_dich_vu_di_kem int,
	so_luong int,
    foreign key(id_dich_vu_di_kem) references dich_vu_di_kem(id_dich_vu_di_kem) on delete cascade on update cascade,
    foreign key(id_hop_dong) references hop_dong(id_hop_dong) on delete cascade on update cascade
);
-- task 1.Thêm mới thông tin cho tất cả các bảng có trong CSDL để có thể thõa mãn các yêu cầu bên dưới.

-- thêm vị trí
insert into vi_tri 
values (1,"Lễ Tân"),
(2,"Phục Vụ"),
(3,"Chuyên Viên"),
(4,"Giám Sát"),
(5,"Quản Lý"),
(6,"Giám Đốc");

-- thêm trình độ
insert into trinh_do 
values (1,"Trung Cấp"),
(2,"Cao Đẳng"),
(3,"Đại Học"),
(4,"Sau Đại Học");

-- thêm bộ phận
insert into bo_phan 
values (1,"Sale_Marketing"),
(2,"Hành Chính"),
(3,"Phục Vụ"),
(4,"Quản Lý");
    
-- thêm nhân viên
insert into nhan_vien 
values (1,"Hoa",1,1,1,'1997/12/12',"14124134",5500000,"091234556","hoa1997@gmail.com","Da Nang"),
(2,"Khanh",1,1,1,'1997/12/12',"14124134",5500000,"091234556","hoa1997@gmail.com","Da Nang"),
(3,"Tùng",1,1,1,'1997/12/12',"14124134",5500000,"091234556","hoa1997@gmail.com","Da Nang"),
(4,"Thu",1,1,1,'1997/12/12',"14124134",5500000,"091234556","hoa1997@gmail.com","Da Nang"),
(5,"Hoang",1,1,1,'1997/12/12',"14124134",5500000,"091234556","hoa1997@gmail.com","Da Nang");

-- thêm loại khách 
insert into loai_khach 
values (1,"Diamond"),
(2,"Platinium"),
(3,"Gold"),
(4,"Silver"),
(5,"Member");

-- thêm Khách hàng
insert into khach_hang 
values (1,2,"Hoang Thi A",'1999/12/07',"312314124","0123452432","athihoang11@gmail.com","Quảng Nam"),
(2,3,"Tu Hong B",'2003/12/13',"312314124","0123452432","btuhong11@gmail.com","Quảng Trị"),
(3,1,"Khanh Thi C",'1980/12/07',"312314124","0123452432","cthihoang11@gmail.com","Đà Nẵng"),
(4,4,"Nguyen Thi D",'1999/12/07',"312314124","0123452432","dthihoang11@gmail.com","Quảng Trị");

-- thêm kiểu thuê

insert into kieu_thue 
values (1,"Đêm",100),
(2,"Ngày",300),
(3,"Tháng",2000);

-- thêm loại dịch vụ 
insert into loai_dich_vu 
values (1,"Villa"),
(2,"House"),
(3,"Room");

-- thêm dịch vụ 
insert into dich_vu
values (1,"Villa1",70,4,2000,1,1,"Tốt"),
(2,"Villa1",65,4,2000,2,1,"Tốt"),
(3,"Villa1",80,4,2000,1,2,"Tốt");

-- thêm hợp đồng
insert into hop_dong
values (1,1,1,1,'2019/12/04','2020/07/05',100,2000),
(2,2,3,1,'2020/12/04','2020/07/05',100,2000),
(3,3,2,3,'2020/12/04','2020/07/05',100,2000),
(4,3,2,2,'2019/12/04','2020/07/05',100,2000);

-- thêm loại dịch vụ di kèm
insert into dich_vu_di_kem
values (1,"massage","50","USD","Tốt"),
(2,"karaoke","45","USD","Tốt"),
(3,"thức ăn","10","USD","Tốt"),
(4,"nước uống","5","USD","Tốt"),
(5,"xe di chuyển tham quan quanh resort","30","USD","Tốt");

-- thêm hợp đồng chi tiết
insert into hop_dong_chi_tiet
values (1,1,1,5),
(2,3,3,2),
(3,4,2,2),
(4,2,1,6),
(5,2,2,6),
(6,2,1,6);

/* task 2 .Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”,
 “T” hoặc “K” và có tối đa 15 ký tự.*/
select*from nhan_vien where ho_ten like "H%" or ho_ten like "T%"or ho_ten like "K%" and length(ho_ten)<15;

/* task 3.Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng”
 hoặc “Quảng Trị”.*/
select*
 from khach_hang 
 where datediff(curdate(),ngay_sinh)/365 
 between 18 and 50 
 and dia_chi in("Đà Nẵng","Quảng Trị");
 
select *
from khach_hang
where dia_chi in("Đà Nẵng" , "Quảng Trị")
having year(now()) - year(ngay_sinh) between 18 and 50;

/*task 4.Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
 Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
 Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.*/
 
select khach_hang.ho_ten , count(hop_dong.id_hop_dong) as 'tổng lần đặt phòng'
from  khach_hang
right join hop_dong on khach_hang.id_khach_hang = hop_dong.id_khach_hang
where khach_hang.id_loai_khach = 1
group by khach_hang.id_khach_hang;

/* task 5.Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, 
TongTien (Với TongTien được tính theo công thức như sau: ChiPhiThue + SoLuong*Gia, với SoLuong và Giá là
 từ bảng DichVuDiKem) cho tất cả các Khách hàng đã từng đặt phỏng. (Những Khách hàng nào chưa từng đặt 
 phòng cũng phải hiển thị ra).*/
 
select khach_hang.id_khach_hang,khach_hang.ho_ten,loai_khach.ten_loai_khach,
	hop_dong.id_hop_dong,dich_vu.ten_dich_vu,hop_dong.ngay_lam_hop_dong,hop_dong.ngay_ket_thuc_hop_dong,
    dich_vu.chi_phi_thue+(dich_vu_di_kem.don_vi*dich_vu_di_kem.gia) as "Tổng Tiền"
from khach_hang
left join hop_dong on khach_hang.id_khach_hang=hop_dong.id_khach_hang
left join loai_khach on loai_khach.id_loai_khach=khach_hang.id_loai_khach
left join dich_vu on dich_vu.id_dich_vu=hop_dong.id_dich_vu
left join hop_dong_chi_tiet on hop_dong_chi_tiet.id_hop_dong=hop_dong.id_hop_dong
left join dich_vu_di_kem on dich_vu_di_kem.id_dich_vu_di_kem=hop_dong_chi_tiet.id_dich_vu_di_kem;

/*6.Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu của tất cả các loại Dịch vụ chưa 
từng được Khách hàng thực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3).*/

select dich_vu.id_dich_vu,dich_vu.ten_dich_vu,dich_vu.dien_tich,dich_vu.chi_phi_thue,
loai_dich_vu.ten_loai_dich_vu
from dich_vu 
left join loai_dich_vu on loai_dich_vu.id_loai_dich_vu=dich_vu.id_loai_dich_vu
left join hop_dong on hop_dong.id_dich_vu=dich_vu.id_dich_vu
where ((datediff(hop_dong.ngay_lam_hop_dong,'2019/01/01')>0)) or ((datediff(hop_dong.ngay_lam_hop_dong,'2019/31/03')<0));

/*task 7.Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu của
 tất cả các loại dịch vụ đã từng được Khách hàng đặt phòng trong năm 2018 nhưng chưa từng được Khách hàng
 đặt phòng  trong năm 2019.*/
 
select dich_vu.id_dich_vu,dich_vu.ten_dich_vu,dich_vu.dien_tich,dich_vu.so_nguoi_toi_da,dich_vu.chi_phi_thue,
loai_dich_vu.ten_loai_dich_vu
from dich_vu 
left join loai_dich_vu on loai_dich_vu.id_loai_dich_vu=dich_vu.id_loai_dich_vu
left join hop_dong on hop_dong.id_dich_vu=dich_vu.id_dich_vu
where (year(hop_dong.ngay_lam_hop_dong))=2018
and not (year(hop_dong.ngay_lam_hop_dong) =2019);

/* task 8.Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoThenKhachHang không trùng nhau.
Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên*/

-- cáchh 1:
select distinct khach_hang.ho_ten 
from khach_hang;

-- cách 2:
select khach_hang.ho_ten 
from khach_hang
union
select khach_hang.ho_ten 
from khach_hang;

-- cách 3: 
select khach_hang.ho_ten 
from khach_hang
group by khach_hang.ho_ten
having count(ho_ten)>=1;

/* task 9.Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2019 thì
 sẽ có bao nhiêu khách hàng thực hiện đặt phòng.*/

select substr(hop_dong.ngay_lam_hop_dong,6,2) as thang_2019 ,count(hop_dong.id_khach_hang) as so_lan_dat 
from hop_dong
where hop_dong.ngay_lam_hop_dong like '2019%'
group by month(hop_dong.ngay_lam_hop_dong);

/*task 10. Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm. Kết quả 
 hiển thị bao gồm IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem 
 (được tính dựa trên việc count các IDHopDongChiTiet)*/
 select hop_dong.id_hop_dong,hop_dong.ngay_lam_hop_dong,hop_dong.ngay_ket_thuc_hop_dong,
 hop_dong.tien_dat_coc,hop_dong_chi_tiet.so_luong
 from hop_dong
 left join hop_dong_chi_tiet on hop_dong_chi_tiet.id_hop_dong = hop_dong.id_hop_dong;
 
 /*task 11.	Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng
 bởi những Khách hàng có TenLoaiKhachHang là “Diamond” và có địa chỉ là
 “Vinh” hoặc “Quảng Ngãi”.*/
 
select dich_vu_di_kem.id_dich_vu_di_kem,dich_vu_di_kem.ten_dich_vu_di_kem,dich_vu_di_kem.gia,dich_vu_di_kem.don_vi,
dich_vu_di_kem.trang_thai_kha_dung,loai_khach.id_loai_khach,khach_hang.id_khach_hang,khach_hang.ho_ten
from dich_vu_di_kem
left join hop_dong_chi_tiet on dich_vu_di_kem.id_dich_vu_di_kem=hop_dong_chi_tiet.id_dich_vu_di_kem
left join hop_dong on hop_dong_chi_tiet.id_hop_dong=hop_dong.id_hop_dong
left join khach_hang on khach_hang.id_loai_khach = hop_dong.id_khach_hang
left join loai_khach on loai_khach.id_loai_khach=khach_hang.id_loai_khach
where loai_khach.id_loai_khach="Diamond" and khach_hang.dia_chi = "Vinh" or khach_hang.dia_chi ="Quảng Ngãi";

/*12.	Hiển thị thông tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang, TenDichVu, 
SoLuongDichVuDikem (được tính dựa trên tổng Hợp đồng chi tiết), TienDatCoc của tất cả các dịch vụ
 đã từng được khách hàng đặt vào 3 tháng cuối năm 2019 nhưng chưa từng được khách hàng đặt vào 6
 tháng đầu năm 2019.
*/
select hop_dong.id_hop_dong, nhan_vien.ho_ten, khach_hang.ho_ten, khach_hang.sdt, dich_vu.ten_dich_vu, hop_dong.ngay_lam_hop_dong, count(hop_dong_chi_tiet.id_dich_vu_di_kem) as SoLuongDichVuDikem
from hop_dong
left join nhan_vien on nhan_vien.id_nhan_vien = hop_dong.id_nhan_vien
left join khach_hang on khach_hang.id_khach_hang = hop_dong.id_khach_hang
left join dich_vu on dich_vu.id_dich_vu = hop_dong.id_dich_vu
left join hop_dong_chi_tiet on hop_dong_chi_tiet.id_hop_dong = hop_dong.id_hop_dong
where (month(hop_dong.ngay_lam_hop_dong)) in (10,11,12) and year(hop_dong.ngay_lam_hop_dong)=2019
group by hop_dong.id_hop_dong;

/* task 13. Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
      (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).*/

select ten_dich_vu_di_kem ,gia, sum(so_luong) as "Số lượng đặt"
from hop_dong_chi_tiet
	inner join dich_vu_di_kem on hop_dong_chi_tiet.id_dich_vu_di_kem = dich_vu_di_kem.id_dich_vu_di_kem
group by ten_dich_vu_di_kem
order by "Số lượng đặt" desc;

/* task 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.
 Thông tin hiển thị bao gồm IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung.*/
 
 select ten_dich_vu_di_kem ,gia, sum(so_luong) as "Số lượng đặt"
from hop_dong_chi_tiet
	inner join dich_vu_di_kem on hop_dong_chi_tiet.id_dich_vu_di_kem = dich_vu_di_kem.id_dich_vu_di_kem
group by ten_dich_vu_di_kem
having "Số lượng đặt"=1;

/*task 15. Hiển thi thông tin của tất cả nhân viên bao gồm IDNhanVien, HoTen, TrinhDo, TenBoPhan,
	SoDienThoai, DiaChi mới chỉ lập được tối đa 3 hợp đồng từ năm 2018 đến 2019. */

select nhan_vien.id_nhan_vien, nhan_vien.ho_ten, trinh_do.ten_trinh_do, bo_phan.ten_bo_phan,
 nhan_vien.sdt,nhan_vien.dia_chi ,count(hop_dong.id_hop_dong) as so_luong_hop_dong
from nhan_vien
	inner join trinh_do on trinh_do.id_trinh_do = nhan_vien.id_trinh_do
    inner join bo_phan on bo_phan.id_bo_phan = nhan_vien.id_bo_phan
    inner join hop_dong on hop_dong.id_nhan_vien = nhan_vien.id_nhan_vien
    where year(ngay_lam_hop_dong) in (2018,2019)
    group by nhan_vien.ho_ten
    having so_luong_hop_dong <= 3;

/*task 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2017 đến năm 2019.*/
select*
from nhan_vien;
select*
from hop_dong;

delete from nhan_vien 
where id_nhan_vien 
	not in (select	hop_dong.id_nhan_vien 
		from hop_dong 
        where year(hop_dong.ngay_lam_hop_dong) in (2017,2018,2019));
        
select*
from nhan_vien;
select*
from hop_dong;


/*task 17.	Cập nhật thông tin những khách hàng có TenLoaiKhachHang từ  Platinium lên Diamond,
 chỉ cập nhật những khách hàng đã từng đặt phòng với tổng Tiền thanh toán trong năm 2019 là lớn hơn
 10.000.000 VNĐ.*/
select*
from khach_hang;

update khach_hang
set id_loai_khach=1
where id_loai_khach in
(select id_loai_khach
from
(select khach_hang.id_khach_hang,sum(hop_dong.tong_tien) as tong
from khach_hang
inner join hop_dong on khach_hang.id_khach_hang=hop_dong.id_khach_hang
where khach_hang.id_loai_khach=2 and year(hop_dong.ngay_lam_hop_dong)=2019
group by khach_hang.id_khach_hang
having tong>10000000) as temp);

select*
from khach_hang;

/*task 18.	Xóa những khách hàng có hợp đồng trước năm 2016 (chú ý ràngbuộc giữa các bảng).*/

delete from khach_hang 
where khach_hang.id_khach_hang in (
select khach_hang.id_khach_hang
from 
	(select khach_hang.id_khach_hang 
	from khach_hang 
    inner join hop_dong on khach_hang.id_khach_hang = hop_dong.id_khach_hang
    where year(hop_dong.ngay_lam_hop_dong)<2016 
    and (hop_dong.id_khach_hang not in 
		(select id_khach_hang 
		from hop_dong 
        where year(hop_dong.ngay_lam_hop_dong)>=2016)))as temp 
);

/*task 19.	Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2019 lên gấp đôi.*/
select*from dich_vu_di_kem;
select*from hop_dong;
select*from hop_dong_chi_tiet;
update dich_vu_di_kem 
set gia = gia*2
where  dich_vu_di_kem.id_dich_vu_di_kem in (
select dich_vu_di_kem.id_dich_vu_di_kem
from
	(select hop_dong_chi_tiet.id_dich_vu_di_kem,sum(hop_dong_chi_tiet.so_luong)
	from hop_dong_chi_tiet 
    inner join hop_dong on hop_dong_chi_tiet.id_dich_vu_di_kem=hop_dong_chi_tiet.id_dich_vu_di_kem
    where year(hop_dong.ngay_lam_hop_dong)=2019
	group by hop_dong_chi_tiet.id_dich_vu_di_kem
    having sum(so_luong)>10) as temp);

/*task 20.	Hiển thị thông tin của tất cả các Nhân viên và Khách hàng có trong hệ thống, thông tin hiển
 thị bao gồm ID (IDNhanVien, IDKhachHang), HoTen, Email, SoDienThoai, NgaySinh, DiaChi.*/
 
select  id_nhan_vien, ho_ten, email, sdt, ngay_sinh, dia_chi
from nhan_vien
union
select id_khach_hang , ho_ten, email, sdt, ngay_sinh, dia_chi
from khach_hang;