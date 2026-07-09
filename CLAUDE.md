# WHAPS (White Horse Application System)

## Tentang Project

Project ini merupakan aplikasi operasional White Horse.

Mohon pahami source code terlebih dahulu sebelum memberikan solusi.

Jangan mengubah business process tanpa persetujuan.

---

# Teknologi

Bahasa Pemrograman

- Delphi 7
- PHP Native
- SQL Server (Microsoft SQL Server)

Komponen Delphi yang digunakan

- ADO
- RBuilder (ReportBuilder)
- FastReport
- TStringGrid
- ZeXMLSS
- PNGImage

Database

- Microsoft SQL Server

---

# Standar Coding

Project ini masih menggunakan Delphi 7.

Jangan menggunakan fitur Delphi versi baru seperti:

- Generics
- Anonymous Method
- Inline Variable
- Unicode String
- Helper
- Fitur Delphi XE ke atas

Gunakan sintaks Delphi 7.

---

# Cara Memberikan Solusi

Sebelum membuat perubahan kode:

1. Analisa source code.
2. Jelaskan penyebab masalah.
3. Berikan solusi.
4. Tunggu persetujuan.
5. Baru lakukan perubahan.

Jangan langsung mengubah kode.

---

# SQL Server

Utamakan menggunakan Stored Procedure.

Gunakan Transaction jika melakukan update lebih dari satu tabel.

Jangan mengubah struktur tabel tanpa persetujuan.

---

# Coding Style

Ikuti style coding yang sudah ada.

Jangan:

- Mengganti nama komponen.
- Mengganti nama field database.
- Mengganti nama Stored Procedure.
- Melakukan refactor besar tanpa diminta.

Usahakan perubahan seminimal mungkin.

---

# Tujuan

Prioritas utama:

1. Stabilitas aplikasi.
2. Tidak merusak business process.
3. Mudah dipahami programmer lain.
4. Mudah di-maintenance.

---

# Saat Menjawab

Jika menemukan bug:

- Jelaskan akar penyebabnya.
- Sebutkan risiko jika tidak diperbaiki.
- Berikan lebih dari satu alternatif solusi bila memungkinkan.

Jangan langsung memperbaiki tanpa persetujuan.

---

# Catatan

Jika informasi belum cukup, tanyakan terlebih dahulu.

Jangan membuat asumsi terhadap business process.

## Library / Component

Komponen utama yang digunakan pada project:

- ADO (Database SQL Server)
- TStringGrid
- RBuilder
- FastReport
- ZeXMLSS (Export Excel)
- PNGImage
- Indy
- JVCL (jika digunakan)
- RxLib (jika digunakan)

Gunakan library yang sudah ada di project.
Jangan menyarankan library baru kecuali diminta.


# Modul Troubleshooting

## Tujuan

Modul Troubleshooting digunakan untuk mencatat, memonitor, dan menyelesaikan permintaan perbaikan yang berasal dari armada maupun operasional.

Setiap permintaan memiliki status, waktu respon, waktu penyelesaian, jenis permintaan, serta PIC yang menangani.

---

## Menu

Modul terdiri dari beberapa form, diantaranya:

- Input Troubleshooting
- Daftar Troubleshooting
- Dashboard Troubleshooting

---

## Dashboard

Dashboard digunakan untuk menampilkan informasi secara visual.

Informasi yang ditampilkan antara lain:

- Total Kasus
- Total Open
- Total Selesai
- Achievement (%)
- Respon <= 15 Menit
- Respon > 15 Menit
- Grafik Kasus vs Selesai per Jenis Permintaan

Dashboard dapat difilter berdasarkan:

- Per Hari
- Periode Tanggal

---

## SLA

Standar respon adalah:

<= 15 Menit

Dashboard akan menghitung:

- Jumlah respon <= 15 menit
- Jumlah respon > 15 menit

Achievement dihitung berdasarkan persentase kasus yang selesai terhadap total kasus.

---

## Jenis Permintaan

Contoh kategori:

- Bug Sistem
- Hardware
- Infrastruktur dan Jaringan
- Perubahan Data
- Software

Kategori dapat bertambah sesuai data master.

Dashboard harus menampilkan seluruh kategori yang memiliki data.

---

## Warna Grafik

Grafik menggunakan warna:

- Biru = Total
- Merah = Open
- Kuning = Selesai

Sumbu X menampilkan nama jenis permintaan.

Nama kategori dibuat horizontal apabila ruang mencukupi.

---

## Query

Utamakan menggunakan Stored Procedure.

Jangan membuat query panjang langsung di Delphi apabila sudah tersedia Stored Procedure.

---

## Performance

Dashboard harus tetap cepat walaupun data sudah banyak.

Usahakan seluruh proses agregasi dilakukan di SQL Server.

Delphi hanya bertugas menampilkan hasil.

---

## Aturan Coding

Jangan menghitung data satu per satu di Delphi apabila dapat dihitung melalui SQL.

Gunakan parameter tanggal pada Stored Procedure.

Hindari query berulang (loop query).

---

## Jika Menemukan Bug

Sebelum mengubah kode:

1. Analisa penyebab.
2. Jelaskan dampaknya.
3. Jelaskan solusi yang diusulkan.
4. Tunggu persetujuan.

Jangan langsung mengubah kode.

---

## Catatan

Project menggunakan:

- Delphi 7
- TeeChart
- ADO
- SQL Server

Utamakan kompatibilitas dengan Delphi 7.

## Riwayat Pengembangan

Dashboard saat ini memiliki fitur:

- Chart Kasus vs Selesai
- Total Kasus
- Total Open
- Total Selesai
- Achievement
- Respon <= 15 Menit
- Respon > 15 Menit
- Filter Per Hari
- Filter Periode

Chart menggunakan TeeChart dengan tipe Bar.