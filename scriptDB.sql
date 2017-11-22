drop database si_perpus;
create database si_perpus;
use si_perpus;

create table konfigurasi(
    nama_sistem char(200) not null,
    alamat_perpus char(200),
    logo_sekolah varchar(200),
    pimpinan_perpus varchar(200),
    profil_perpus longtext,
    kontak_perpus longtext,
    harga_denda int(9),
    lama_pinjam int(2),
    max_buku int(2)
);

insert into konfigurasi(nama_sistem,alamat_perpus,logo_sekolah,pimpinan_perpus,profil_perpus,kontak_perpus,harga_denda,lama_pinjam,max_buku) values 
    ('Perpus','Medan','jjj.jpg','Sio','profil','08888',2000,7,2);

create table user(
    id int not null primary key auto_increment,
    nama char(50) not null,
    jk enum('L','P') not null default 'L',
    alamat char(50) not null,
    tgl_lahir date not null,
    telp char(20),
    username char(100) not null, 
    password char(100) not null,
    role enum('superadmin','admin') not null default 'admin',
    foto varchar(200)
);

insert into user(nama,jk,alamat,tgl_lahir,telp,username,password,role,foto) values 
    ('admin','L','Jogja','1992-10-19','0866775565','admin',md5('admin'),'superadmin','admin.jpg');


create table anggota(
    id char(10) not null primary key,
    nama char(200) not null,
    jk enum('L','P') not null default 'L',
    alamat char(50) not null,
    agama enum('Islam','Kristen','Katolik','Hindu','Budha','Conghucu'),
    tgl_lahir date not null,
    jenis enum('mahasiswa','dosen') default 'mahasiswa',
    status enum('0','1') default '1',
    foto varchar(200)
);


create table lokasi(
    id int not null primary key auto_increment,
    nama_lokasi char(50) not null
);

create table pengarang(
    id int not null primary key auto_increment,
    nama_pengarang char(50) not null
);

create table penerbit(
    id int not null primary key auto_increment,
    nama_penerbit char(50) not null
);

create table kategori(
    id int not null primary key auto_increment,
    nama_kategori char(50) not null
);


create table buku(
    kd_buku char(50) not null primary key,
    judul char(100) not null,
    tahun_terbit char(10) not null,
    stok int,
    asal_perolehan char(200),
    deskripsi char(200),
    penerbit_id int,    
    kategori_id int,    
    lokasi_id int,    
    gambar_buku varchar(200),
    foreign key(penerbit_id) references penerbit(id),
    foreign key(kategori_id) references kategori(id),
    foreign key(lokasi_id) references lokasi(id)
);


create table transaksi(
    id int not null primary key auto_increment,
    tgl_pinjam date,
    tgl_hrs_kembali date,
    anggota_id char(10) not null,
    status enum('Pinjam','Kembali'),
    foreign key(anggota_id) references anggota(id)
);

create table transaksiPeminjamanBuku(
    id int not null primary key auto_increment,
    transaksi_id int,
    kd_buku char(50) not null,
    foreign key(transaksi_id) references transaksi(id),
    foreign key(kd_buku) references buku(kd_buku)
);

create table pengembalian(
    id int not null primary key auto_increment,
    transaksiPeminjamanBuku_id int,
    tgl_kembali date,
    totaldenda int default 0,
    foreign key(transaksiPeminjamanBuku_id) references transaksiPeminjamanBuku(id)
);



create table pengarang_buku(
    id int not null primary key auto_increment,
    kd_buku char(50) not null,
    id_pengarang int,
    foreign key(kd_buku) references buku(kd_buku),
    foreign key(id_pengarang) references pengarang(id)
);

create table kategori_foto(
    id int not null primary key auto_increment,
    nama_kategori_foto char(50)
);

create table foto(
    id int not null primary key auto_increment,
    keterangan longtext,
    kategori int,
    foto varchar(200),
    foreign key(kategori) references kategori_foto(id)
);

create table kategori_posting(
    id int not null primary key auto_increment,
    nama_kategori_posting char(50)
);

create table post(
    id int not null primary key auto_increment,
    judul char(50) not null,
    isi longtext,
    foto varchar(200),
    kategori int,
    foreign key(kategori) references kategori_posting(id)
);

