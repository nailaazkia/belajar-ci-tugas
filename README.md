# 🛒 Toko Online - CodeIgniter 4

Proyek ini adalah aplikasi toko online sederhana berbasis [CodeIgniter 4](https://codeigniter.com/) yang mendukung manajemen produk, keranjang belanja, diskon harian, checkout transaksi, ongkos kirim, dan histori pembelian pengguna. Dilengkapi sistem autentikasi dan antarmuka admin menggunakan template NiceAdmin.

---

## 📚 Daftar Isi
- [Fitur](#fitur)
- [Persyaratan Sistem](#persyaratan-sistem)
- [Instalasi](#instalasi)
- [Struktur Proyek](#struktur-proyek)

---

## ✅ Fitur

### 👤 Autentikasi
- Login pengguna berdasarkan username dan password
- Session login berdasarkan role (admin/user)

### 📦 Produk
- Lihat daftar produk (gambar, harga, stok)
- Admin dapat menambah, mengedit, menghapus produk
- Upload gambar produk
- Export data produk ke PDF

### 🗂️ Kategori Produk
- Admin dapat mengelola kategori produk

### 🛍️ Keranjang Belanja
- Tambah/hapus/update produk ke keranjang
- Hitung total harga otomatis
- Diskon harian otomatis diterapkan ke harga

### 🎁 Diskon Harian
- Diskon disimpan dalam tabel `diskon` berdasarkan tanggal
- Saat user belanja, diskon hari ini otomatis dipotong
- Diskon juga dicatat dalam detail transaksi

### 🚚 Ongkos Kirim (RajaOngkir API)
- Menampilkan lokasi tujuan dan menghitung ongkir otomatis
- Menggunakan GuzzleHttp client
- API Key disimpan di file `.env`

### 🧾 Transaksi
- Proses checkout belanja
- Menyimpan data pembelian dan detail transaksi
- Menyimpan ongkir dan alamat pengiriman
- Menampilkan histori transaksi user

### 📊 Dashboard
- Tampilkan total jumlah transaksi
- Tampilkan jumlah item per transaksi

---

## 🖥️ Persyaratan Sistem

- PHP >= 8.2
- Composer
- XAMPP / Apache + MySQL
- GuzzleHttp (via composer)
- CodeIgniter 4

---

## ⚙️ Instalasi

1. **Clone repository ini**
   ```bash
   git clone [URL repository]
   cd toko-ci4
   ```

2. **Install dependency**
   ```bash
   composer install
   ```

3. **Konfigurasi database**
   - Jalankan XAMPP (Apache & MySQL)
   - Buat database `db_ci4` di phpMyAdmin
   - Copy file `.env.example` menjadi `.env` dan isi:
     ```env
     app.baseURL = 'http://localhost:8080/'
     database.default.hostname = localhost
     database.default.database = db_ci4
     database.default.username = root
     database.default.password =
     COST_KEY = [API_KEY_RAJAONGKIR]
     ```

4. **Migrasi database**
   ```bash
   php spark migrate
   ```

5. **Seeder data awal**
   ```bash
   php spark db:seed UserSeeder
   php spark db:seed ProductSeeder
   php spark db:seed DiskonSeeder
   ```

6. **Jalankan server**
   ```bash
   php spark serve
   ```

7. **Akses aplikasi**
   Buka browser: [http://localhost:8080](http://localhost:8080)

---

## 🗂️ Struktur Proyek

```
belajar-ci/
├── app/
│   ├── Config/                → Konfigurasi dasar: routing, database, dll
│   ├── Controllers/           → Logika utama aplikasi (controller)
│   │   ├── ApiController.php              → Menyediakan endpoint untuk API
│   │   ├── AuthController.php             → Autentikasi pengguna (login/logout)
│   │   ├── BaseController.php             → Kelas dasar untuk semua controller
│   │   ├── ContactController.php          → Menampilkan halaman kontak
│   │   ├── DiskonController.php           → Kelola diskon per tanggal
│   │   ├── FaqController.php              → Menampilkan halaman FAQ
│   │   ├── Home.php                       → Halaman utama dan profil pengguna
│   │   ├── ProdukCategoryController.php   → Kelola kategori produk
│   │   ├── ProdukController.php           → CRUD data produk dan PDF export
│   │   └── TransaksiController.php        → Keranjang, checkout, transaksi
│   ├── Models/                → Model untuk mengakses database
│   │   ├── ProductModel.php
│   │   ├── DiskonModel.php
│   │   ├── UserModel.php
│   │   ├── CategoryModel.php
│   │   ├── TransactionModel.php
│   │   └── TransactionDetailModel.php
│   ├── Views/                 → File tampilan UI (HTML + PHP)
│   │   ├── v_produk.php           → Halaman produk
│   │   ├── v_diskon.php           → Halaman diskon
│   │   ├── v_keranjang.php        → Halaman keranjang
│   │   ├── v_checkout.php         → Halaman checkout
│   │   ├── v_profile.php          → Halaman riwayat transaksi user
│   │   ├── v_login.php            → Halaman login
│   │   ├── v_produkPDF.php        → Tampilan PDF produk
│   │   ├── v_produkCategory.php   → Kategori produk
│   │   ├── layout.php             → Layout utama
│   │   └── components/            → Header, Sidebar, Footer
│   │       ├── header.php
│   │       ├── sidebar.php
│   │       └── footer.php
│   ├── Database/
│   │   ├── Migrations/        → Struktur tabel database (Product, User, Transaksi, dst)
│   │   │   ├── 2025-05-22-061658_User.php
│   │   │   ├── 2025-05-22-061710_Product.php
│   │   │   ├── 2025-05-22-061719_Transaction.php
│   │   │   ├── 2025-05-22-061726_TransactionDetail.php
│   │   │   ├── 2025-05-29-124220_ProductCategory.php
│   │   │   └── 2025-07-01-032242_Diskon.php
│   │   └── Seeds/             → Seeder untuk data awal
│   │       ├── ProductSeeder.php
│   │       ├── UserSeeder.php
│   │       ├── DiskonSeeder.php
│   │       └── ProductCategorySeeder.php
│   ├── Filters/              → Filter akses seperti login (Auth.php, Redirect.php)
│   ├── Helpers/, Language/, Libraries/ → Folder bawaan CI4
│   └── ThirdParty/           → Bisa diisi library tambahan
├── public/
│   ├── index.php             → Entry point aplikasi
│   ├── img/                  → Folder upload gambar produk
│   ├── NiceAdmin/            → Asset UI dari template NiceAdmin (css, js, plugins)
│   └── dashboard-toko/       → File tambahan dashboard admin
├── writable/                 → Cache, logs, dan upload lainnya
├── vendor/                   → Dependency dari composer
├── .env                      → Konfigurasi lingkungan (API key, DB, dll)
├── composer.json             → Konfigurasi package PHP
├── spark                     → CLI bawaan CodeIgniter
└── README.md                 → Dokumentasi proyek ini
```

## 🚀 Deploy ke GitHub

1. **Inisialisasi Git di folder proyek** (jika belum)
   ```bash
   git init
   ```

2. **Tambahkan semua file ke staging**
   ```bash
   git add .
   ```

3. **Commit perubahan awal**
   ```bash
   git commit -m "Inisialisasi proyek toko online CI4"
   ```

4. **Hubungkan ke repository GitHub**  
   Buat repository di GitHub terlebih dahulu (misal: `https://github.com/username/toko-ci4`)
   ```bash
   git remote add origin https://github.com/username/toko-ci4.git
   ```

5. **Push ke GitHub**
   ```bash
   git branch -M main
   git push -u origin main
   ```

---

## ✨ Catatan

- Diskon harian diambil dari tanggal hari ini
- Semua transaksi disimpan lengkap dengan ongkir & alamat
- UI menggunakan template [NiceAdmin](https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/)
- Folder `img/` digunakan untuk menyimpan gambar produk

---

