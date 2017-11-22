drop database perpus_sd;
create database perpus_sd;
use perpus_sd;

create table konfig(
    nama_si char(200) not null,
    alamat char(200),
    logo varchar(200),
    pimpinan varchar(200),
    profile longtext,
    help longtext,
    denda int(9),
    lama_pinjam int(2),
    max_buku int(2)
);

insert into konfig(nama_si,alamat,logo,pimpinan,profile,help,denda,lama_pinjam,max_buku) values 
    ('Perpus SD Muhammadyah','Purwomartani Kalasan','jjj.jpg','Agus','profil','help',2000,7,2);

create table user(
    id int not null primary key auto_increment,
    nama char(50) not null,
    jk enum('L','P') not null default 'L',
    alamat char(50) not null,
    tmp_lahir char(200),
    tgl_lahir date not null,
    telp char(20),
    username char(100) not null, 
    password char(100) not null,
    role enum('admin','staf') not null default 'staf',
    foto varchar(200)
);

insert into user(nama,jk,alamat,tmp_lahir,tgl_lahir,telp,username,password,role,foto) values 
    ('admin','L','Jogja','Jogja','1992-10-19','0866775565','admin',md5('admin'),'admin','admin.jpg');


create table anggota(
    nis int(10) not null primary key,
    nama char(200) not null,
    jk enum('L','P') not null default 'L',
    alamat char(50) not null,
    agama enum('Islam','Kristen','Katolik','Hindu','Budha','Conghucu') default 'Kristen',
    tmp_lahir char(200) not null,
    tgl_lahir date not null,
    tgl_daftar date,
    jenis enum('Siswa','Guru') default 'Siswa',
    status enum('0','1') default '1',
    foto varchar(200)
);


create table lokasi(
    id int not null primary key auto_increment,
    nama char(50) not null
);

create table pengarang(
    id int not null primary key auto_increment,
    nama char(50) not null
);

create table penerbit(
    id int not null primary key auto_increment,
    nama char(50) not null
);

create table kategori(
    id int not null primary key auto_increment,
    nama char(50) not null
);


create table buku(
    kd_buku char(50) not null primary key,
    isbn char(100) not null,
    judul char(100) not null,
    tahun_terbit char(10) not null,
    stok int,
    jumlah_halaman int,
    asal_perolehan char(200),
    harga int,
    deskripsi char(200),
    penerbit_id int,    
    kategori_id int,    
    lokasi_id int,    
    foreign key(penerbit_id) references penerbit(id),
    foreign key(kategori_id) references kategori(id),
    foreign key(lokasi_id) references lokasi(id)
);


create table transaksi(
    id int not null primary key auto_increment,
    tgl_pinjam date,
    tgl_hrs_kembali date,
    tgl_kembali date,
    telat int,
    anggota_id int(10) not null,
    kd_buku char(50) not null,
    totaldenda int default 0,
    status enum('Pinjam','Kembali'),
    foreign key(anggota_id) references anggota(nis),
    foreign key(kd_buku) references buku(kd_buku)
);

create table pengarang_buku(
    id int not null primary key auto_increment,
    kd_buku char(50) not null,
    id_pengarang int,
    foreign key(kd_buku) references buku(kd_buku),
    foreign key(id_pengarang) references pengarang(id)
);

create table galery(
    id int not null primary key auto_increment,
    keterangaan longtext,
    foto varchar(200)
);

create table berita(
    id int not null primary key auto_increment,
    judul char(50) not null,
    isi longtext
);

