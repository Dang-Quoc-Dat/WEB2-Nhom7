create database bugs;
create table mat_hang(
    id int AUTO_INCREMENT not null unique,
    ma_hang varchar(20) primary key,
    ten_hang varchar(40) not null,
    gia_nhap int not null,
    gia_ban int not null,
	loai varchar(20) not null,
    so_luong int not null DEFAULT(0)
);
create table nhap_hang(
    id int AUTO_INCREMENT not null unique,
    ma_hang varchar(20) not null,
    ngay_nhap date not null,
    so_luong int not null,
    don_gia int not null,
    foreign key (ma_hang) references mat_hang(ma_hang),
	primary key (id,ma_hang)
);
create table xuat_hang(
    id int AUTO_INCREMENT not null unique,
    ma_hang varchar(20) not null,
    ngay_xuat date not null,
    so_luong int not null,
    don_gia int not null,
    trang_thai varchar(20) not null,
    foreign key (ma_hang) references mat_hang(ma_hang),
	primary key (id,ma_hang)
);
create table tai_khoan(
	id int AUTO_INCREMENT not null unique,
    ten_tai_khoan varchar(30) not null,
    mat_khau varchar(30) not null,
    loai_tai_khoan varchar(20) not null,
	check_key bit not null default 0,
    primary key(ten_tai_khoan)
)