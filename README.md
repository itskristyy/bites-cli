<div align="center">
  
# ✦ Aplikasi Kasir Restoran Sederhana ✦

**Sistem Point of Sales (POS) Berbasis Desktop**

[![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)](#)
[![MySQL](https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white)](#)
[![NetBeans](https://img.shields.io/badge/NetBeans-1B6AC6?style=for-the-badge&logo=apache-netbeans&logoColor=white)](#)

*Aplikasi kasir yang dirancang untuk mempermudah operasional harian restoran—mulai dari pencatatan pesanan, pengelolaan menu, manajemen hak akses pengguna, hingga cetak laporan transaksi, semuanya dalam satu antarmuka desktop yang terpadu.*

</div>

---

## ❖ Daftar Isi
- [Mengenai Aplikasi](#mengenai-aplikasi)
- [Fitur Utama](#fitur-utama)
- [Alur Penggunaan Aplikasi](#alur-penggunaan-aplikasi)
- [Teknologi yang Digunakan](#teknologi-yang-digunakan)
- [Struktur Database](#struktur-database)
- [Struktur Direktori](#struktur-direktori)
- [Panduan Instalasi & Penggunaan](#panduan-instalasi--penggunaan)
- [Konfigurasi Database](#konfigurasi-database)
- [Roadmap Pengembangan](#roadmap-pengembangan)
- [Kontributor](#kontributor)

---

## ❖ Mengenai Aplikasi

Aplikasi Kasir Restoran Sederhana ini merupakan solusi perangkat lunak *Point of Sales (POS)* yang dibangun menggunakan ekosistem **Java (Swing)** dan **MySQL**. Proyek ini ditujukan untuk memfasilitasi administrasi dan transaksi pada bisnis kuliner skala kecil menengah seperti kafe, warung makan, atau restoran. 

Fokus utama pengembangan aplikasi ini adalah kesederhanaan penggunaan (User-Friendly), akurasi pencatatan keuangan, dan keamanan akses berbasis peran (Role-based access).

---

## ❖ Fitur Utama

Aplikasi ini tidak hanya mencatat transaksi, namun dirancang memiliki fitur esensial untuk manajemen sebuah restoran:

- **Autentikasi Multi-Peran (Role-based Login):** 
  Sistem keamanan dengan hak akses (privileges) yang berbeda untuk setiap role:
  - `Admin`: Memiliki kontrol penuh atas seluruh modul sistem (Master Menu, Master User, Transaksi, Laporan).
  - `Owner`: Hak akses eksklusif untuk melihat laporan dan mengevaluasi pergerakan transaksi harian/bulanan.
  - `Kasir`: Fokus pada layar Point of Sales (POS) untuk pencatatan transaksi harian dan interaksi pesanan pelanggan.
  - `Pelanggan`: Dapat dialokasikan untuk penggunaan antarmuka pemesanan mandiri (self-service).
- **Manajemen Menu Dinamis (CRUD Masakan):** 
  Fitur master data bagi admin untuk menambahkan menu baru, memperbarui harga jual, hingga mengatur status ketersediaan (*Habis* atau *Tersedia*) secara *real-time*.
- **Manajemen Data Pengguna (CRUD User):** 
  Fasilitas bagi Admin untuk menambahkan, mengubah detail profil, atau mengatur kata sandi untuk akun kasir, owner, maupun staf lain.
- **Pencatatan Transaksi Cepat & Akurat:** 
  Proses perhitungan transaksi di mana sistem otomatis mengkalkulasi Harga × Jumlah Beli, menghasilkan *Total Bayar* secara instan saat pesanan dimasukkan. Data pesanan terekam utuh bersama nama pelanggan.
- **Cetak Laporan Otomatis (JasperReports):** 
  Generasi laporan riwayat transaksi yang disusun rapi dan siap cetak (Hardcopy atau PDF). Sangat berguna bagi manajer atau owner untuk melakukan pembukuan.

---

## ❖ Alur Penggunaan Aplikasi

1. **Login:** Pengguna memasukkan `Username` dan `Password`. Sistem memverifikasi kredensial dan hak akses (`id_level`).
2. **Master Data (Oleh Admin):** Admin masuk ke modul registrasi untuk menambah pekerja, dan masuk ke modul masakan untuk memperbarui stok atau harga menu.
3. **Transaksi (Oleh Kasir):** Kasir melayani pelanggan di modul Transaksi, memasukkan data *Nama Pelanggan*, memilih *Menu Masakan* yang tersedia, memasukkan *Jumlah Beli*, lalu menyimpan bukti transaksi.
4. **Laporan (Oleh Admin / Owner):** Owner atau Admin dapat menarik data transaksi dan mencetaknya menjadi laporan rekapan penjualan.

---

## ❖ Teknologi yang Digunakan

| Kategori | Teknologi/Alat | Keterangan Tambahan |
| :--- | :--- | :--- |
| **Bahasa Pemrograman** | Java | Memerlukan Java Development Kit (JDK) versi 8 ke atas. |
| **Antarmuka (GUI)** | Java Swing / AWT | Framework bawaan Java untuk antarmuka desktop. |
| **Database System** | MySQL / MariaDB | Penyimpanan relational, dikelola via XAMPP. |
| **Database Driver** | MySQL Connector/J | Library (JAR) penghubung antara kode Java dan MySQL. |
| **Report Engine** | JasperReports | Engine untuk men-generate layout laporan `.jrxml` dan `.jasper`. |
| **IDE** | NetBeans IDE | Lingkungan pengembangan dengan fitur *Visual GUI Builder* (Matisse). |
| **Build Tools** | Apache Ant | Mengatur kompilasi via file `build.xml`. |

---

## ❖ Struktur Database

Database `db_restoran` memiliki desain relasional sederhana dengan 3 tabel utama:

1. **`masakan`** 
   Menyimpan katalog makanan/minuman.
   *Kolom:* `id_masakan` (PK), `nama_masakan`, `harga`, `status`
2. **`user`** 
   Menyimpan kredensial sistem dan perannya.
   *Kolom:* `id_user` (PK), `username`, `password`, `nama_user`, `id_level`
3. **`transaksi`** 
   Tabel historis dari setiap pembelian pelanggan. Berelasi dengan tabel `masakan`.
   *Kolom:* `id_transaksi` (PK), `nama_pelanggan`, `id_masakan` (FK), `tanggal`, `nama_masakan`, `harga`, `jumlah_beli`, `total_bayar`

---

## ❖ Struktur Direktori

Berikut adalah gambaran arsitektur file *source code* dalam repository ini:

```text
📦 apk-kasir-kristy
 ┣ 📂 Aplikasi_Restoran_Sederhana
 ┃ ┣ 📂 src
 ┃ ┃ ┣ 📂 aplikasi_restoran_sederhana  
 ┃ ┃ ┃ ┣ 📜 Aplikasi_Restoran_Sederhana.java ➔ Entry Point utama
 ┃ ┃ ┃ ┣ 📜 koneksi.java                     ➔ Singleton / Modul Koneksi JDBC
 ┃ ┃ ┃ ┣ 📜 Login.java & Login.form          ➔ UI dan Logika Form Autentikasi
 ┃ ┃ ┃ ┣ 📜 menu_masakan.java & .form        ➔ UI Modul Master Menu
 ┃ ┃ ┃ ┣ 📜 menu_registrasi.java & .form     ➔ UI Modul Master User
 ┃ ┃ ┃ ┗ 📜 menu_transaksi.java & .form      ➔ UI Modul Point of Sales
 ┃ ┃ ┗ 📂 laporan                            
 ┃ ┃   ┣ 📜 laporan_transaksi.jrxml          ➔ Source code desain layout Jasper
 ┃ ┃   ┗ 📜 laporan_transaksi.jasper         ➔ File compiled laporan siap cetak
 ┃ ┣ 📂 build                                ➔ Compiled bytecode (.class)
 ┃ ┣ 📂 nbproject                            ➔ Konfigurasi IDE NetBeans
 ┃ ┗ 📜 build.xml                            ➔ Script Ant Build
 ┣ 📜 db_restoran.sql                        ➔ Dump/Backup File Database MySQL
 ┗ 📜 README.md                              ➔ Dokumentasi
```

> **Catatan Teknis:** File `.form` adalah metadata XML internal yang dibuat otomatis oleh fitur drag-and-drop NetBeans GUI Builder. Jangan mengedit file `.form` secara manual melalui text editor.

---

## ❖ Panduan Instalasi & Penggunaan

Ikuti instruksi komprehensif berikut untuk melakukan _setup local environment_ di komputer Anda.

### Persyaratan Sistem
- Java Development Kit (JDK) 8 atau lebih baru.
- NetBeans IDE (versi 8.2 atau versi Apache NetBeans terbaru).
- XAMPP / WAMP / Laragon.

### 1. Menyiapkan Database Server
1. Jalankan panel kontrol server lokal Anda (misal: **XAMPP Control Panel**).
2. Start modul **Apache** (untuk server web phpMyAdmin) dan **MySQL** (Database engine).
3. Buka browser dan ketik alamat: `http://localhost/phpmyadmin`.
4. Klik **Baru (New)**, buat database dengan nama persis: **`db_restoran`**.
5. Klik pada database `db_restoran` yang baru dibuat, pilih tab **Import**.
6. Klik *Choose File*, arahkan ke file `db_restoran.sql` yang ada di root repository ini.
7. Klik **Kirim (Go)** dan tunggu hingga import selesai (muncul notifikasi sukses).

### 2. Membuka Project di NetBeans IDE
1. Buka aplikasi **NetBeans IDE**.
2. Pilih menu `File > Open Project...` dan arahkan ke dalam direktori clone: `Aplikasi_Restoran_Sederhana`.
3. Verifikasi ketersediaan library pendukung. Klik kanan pada project > `Properties` > `Libraries`. Pastikan dependensi berikut terpasang (Tambahkan Add JAR/Folder atau Add Library jika ditandai merah/hilang):
   - **MySQL JDBC Driver**
   - **JasperReports** (membutuhkan library kolektif Jasper seperti Commons Collections, Commons Digester, dll.)

### 3. Uji Coba Aplikasi (Kompilasi & Run)
1. Cari file utama: `Aplikasi_Restoran_Sederhana.java` pada panel *Projects*.
2. Klik kanan pada file tersebut lalu pilih **Run File**, atau cukup tekan tombol `Run Project` di toolbar atas.
3. Tunggu proses kompilasi (*Ant Build*). Jendela login akan muncul.
4. Gunakan kredensial bawaan berikut untuk masuk (sebagai Admin):
   - **Username:** `Admin`
   - **Password:** `admin123`

---

## ❖ Konfigurasi Database (Konektivitas)

Proyek ini telah dikonfigurasi untuk terhubung dengan server MySQL lokal default (XAMPP). Apabila Anda menggunakan _custom port_, atau _password_ pada user `root` MySQL Anda, pastikan untuk memodifikasinya di dalam kelas `koneksi.java`.

**Lokasi File:** `src/aplikasi_restoran_sederhana/koneksi.java`

```java
private String url ="jdbc:mysql://localhost:3306/db_restoran"; // Sesuaikan port jika bukan 3306
private String username_xampp ="root";
private String password_xampp = "masukkan_password_disini"; // Kosongkan jika tidak ada password (default XAMPP)
```

---

## ❖ Roadmap Pengembangan

Aplikasi ini dapat terus dikembangkan menjadi skala yang lebih *Enterprise*. Beberapa target ide pembaruan meliputi:

- [ ] **Ekspor Multi-Format:** Mengonfigurasi JasperReports untuk mendukung unduhan Excel (.xls), CSV, atau PDF langsung dari aplikasi.
- [ ] **Integrasi Perangkat Keras:** Dukungan driver _Thermal Printer_ (protokol ESC/POS) dan Cash Drawer.
- [ ] **Pembaruan Antarmuka UI:** Mengimplementasikan Look-and-Feel yang lebih segar, bersih, dan modern seperti *FlatLaf* (Flat Look and Feel).
- [ ] **Dashboard & Analitik:** Menyediakan halaman metrik/grafik pendapatan (menggunakan JFreeChart) khusus untuk *role* Owner.
- [ ] **Migrasi ke Cloud Database:** Membuat support parameter koneksi via `.env` untuk kemudahan menghubungkan ke database online.

---

## ❖ Kontributor

- **Adinda Kristy** - *Developer* - [https://github.com/itskristyy/bites-cli](https://github.com/itskristyy/bites-cli)

<br/>
<div align="center">
  <i>Dibuat untuk kemudahan operasional bisnis. Silakan fork atau beri star jika repository ini membantu Anda!</i>
</div>
