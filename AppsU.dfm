object Apps: TApps
  Left = 320
  Top = 214
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Aplikasi'
  ClientHeight = 510
  ClientWidth = 692
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Tutup: TButton
    Left = 328
    Top = 480
    Width = 75
    Height = 25
    Caption = 'Tutup'
    TabOrder = 0
    OnClick = TutupClick
  end
  object Memo: TMemo
    Left = 8
    Top = 8
    Width = 185
    Height = 385
    Alignment = taCenter
    BevelInner = bvNone
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    Lines.Strings = (
      'Dibuat Oleh:'
      ''
      'Lead:'
      'Korynsan'
      ''
      'Coding:'
      'Korynsan'
      'Pramudyono Hadi'
      'Dwi Soegiantoro'
      'Nanang Andriani'
      'Irvan Ruswanto'
      ''
      'Advisor:'
      'Eddy Wijaya'
      'Agustono Haliman'
      'Sudarno'
      'Rachman'
      ''
      'Contributor :'
      'Wildatunnisa Fachriah'
      'Thomas Eko Destriawan'
      ''
      'Copyright (c)'
      'Des 2012 - Sep 2018')
    ParentFont = False
    TabOrder = 1
  end
  object Sets: TPanel
    Left = 656
    Top = 481
    Width = 25
    Height = 24
    BevelOuter = bvNone
    TabOrder = 2
    OnDblClick = SetsDblClick
  end
  object HotkeyList: TMemo
    Left = 8
    Top = 400
    Width = 185
    Height = 73
    BevelInner = bvNone
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Lines.Strings = (
      ' List HotKey :'
      ''
      ' F1          -> Bantuan'
      ' Alt+ Esc -> Keluar WHAps'
      ' Alt + L    -> LogIn / LogOut'
      ' Alt + U   -> Update '
      ''
      ' Alt + S   -> Setting'
      ' Alt + T   -> Loging Level'
      ' Alt + D   -> Set Database Manual'
      ' Alt + C   -> Setting Chat Server')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object Perubahan: TMemo
    Left = 192
    Top = 8
    Width = 489
    Height = 465
    BevelInner = bvNone
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    Lines.Strings = (
      '22/08/2025 (6.1.11.7) ForceUpdate 1'
      '-Penambahan sub menu Permintaan Troubleshooting dimenu admin.'
      ''
      '22/08/2025 (6.1.11.7)'
      
        '-Penambahan Kolom Tol dari Tamu, Parkir dari Tamu, Tips, Mengina' +
        'p, dan Biaya '
      
        'dari Tamu di Menu Tambah Uang Order dan Laporan Uang Harian Driv' +
        'er, Laporan '
      'Pengeluaran Perarmada.  '
      ''
      '12/08/2025 (6.1.11.6)'
      '-Penambahan Kolom Overtime di Menu Transfer Uang Harian Driver '
      ''
      '01/08/2025 (6.1.11.5)'
      '-Penambahan Laporan Odometer(Km) Unit Actual'
      ''
      '26/07/2025 (6.1.11.4)'
      '-Penambahan Data Type Armada di list Armada'
      
        '-Perubahan, Inputan KM Odo Prediksi diform Sevis Berkala ditutup' +
        '/dibuat otomtis '
      'terisi ketika tutup PKB'
      ''
      '11/07/2025 (6.1.11.3)'
      
        '-Penambahan Data No PKB dan No Service Request di Laporan Servis' +
        ' Berkala dan '
      'List Servis Berkala'
      ''
      '23/06/2025 (6.1.11.2)'
      
        '-Penambahan Validasi di Form Buat Pesananan, Jika Customernya ad' +
        'alah PT. '
      'Weha Maka Servis Akan Otomatis Terceklis.'
      ''
      '23/06/2025 (6.1.11.1)'
      
        '-Penambahan Filter Jenis Aktifitas dan All Armada di Laporan Akt' +
        'ifas Harian Armada'
      ''
      '17/06/2025 (6.1.11.0)'
      '-Perubahan Helper di Surat Jalan'
      ''
      '17/06/2025 (6.1.10.9)'
      '-Perbaikan Laporan Aktifas Harian Armada'
      ''
      '04/06/2025 (6.1.10.8)'
      '-Menambahkan Filter Customer di Laporan Uang Order Harian'
      ''
      '28/05/2025 (6.1.10.7)'
      '-Menambahkan Rekap Pergantian Part perArmada (V2)'
      
        '-Menambahkan Pembuatan User Operasional Apps saat pembuatan user' +
        ' WHAps'
      ''
      '19/05/2025 (6.1.10.6)'
      '-Menambahkan Catatan pada surat jalan '
      'Dan Surat Jalan Warna Putih Harus Dikembalikan'
      '-Membuat Form Update pada Service Berkala'
      ''
      '09/05/2025 (6.1.10.5)'
      '-Driver Komplain List dapat menolak keluhan Driver'
      '-Memberikan Warna pada Driver Komplain List'
      'untuk mengetahui status Driver Komplain'
      ''
      '02/05/2025 (6.1.10.4)'
      '-Penambahan Master Materi Training'
      '-Penambahan Filter Materi Training di Laporan Training'
      ''
      '25/04/2025 (6.1.10.3)'
      
        '-Penambahan catatan "Pastikan Surat Jalan di Tanda Tangani Custo' +
        'mer"'
      ' pada Surat Jalan'
      ''
      '23/04/2025 (6.1.10.2)'
      '-Penambahan Filter No Order di List Invoice'
      '-Penambahan Filter perCustomer di'
      'Laporan Kontinuitas dan Laporan Pengeluaran perArmada Jalan'
      ''
      '22/04/2025 (6.1.10.1)'
      
        '-Penambahan Form Histori Cetak Ulang Uang Order di Form Uang Ord' +
        'er'
      
        '-Penambahan 1 kolom Reprint Terakhi  di Laporan Uang Order Haria' +
        'n'
      
        '-Penambahan input text di form Reprint jika alasan Perubahan Dat' +
        'a'
      
        '-Penambahan kolom Keluhan dilaporan PKB dan memberikan warna bir' +
        'u'
      'jika keluhan diceklis saat tutup pkb'
      ''
      '16/04/2025 (6.1.10.0)'
      
        '-Penambahan Form Histori Cetak Ulang Uang Order di Form Uang Ord' +
        'er'
      
        '-Penambahan 1 kolom Reprint Terakhi  di Laporan Uang Order Haria' +
        'n'
      
        '-Penambahan input text di form Reprint jika alasan Perubahan Dat' +
        'a'
      
        '-Penambahan kolom Keluhan dilaporan PKB dan memberikan warna bir' +
        'u'
      'jika keluhan diceklis saat tutup pkb'
      ''
      '07/04/2025 (6.1.9.2)'
      
        '-Perbaikan Nilai Invoice yang tidak sesuai di Laporan Pengeluara' +
        'n Armada '
      ''
      '25/03/2025 (6.1.9.1)'
      '-Penambahan Laporan Pesanan Wehamart '
      ''
      '17/03/2025 (6.1.9.0)'
      '-Penambahan menu Estimasi Budget Armada'
      ''
      '06/03/2025 (6.1.8.0)'
      
        '-Penambahan inputan Helper di Penjadwalan, dan menghilangkan inp' +
        'utan Helper'
      'disurat jalan'
      
        '-Memberikan validasi disurat jalan, semua crew wajib Confirmasi ' +
        'untuk bisa'
      'cetak surat jalan'
      
        '-Memberikan validasi wajib melengkapi data ktp,sim,no rekening d' +
        'an no hp'
      'di penjadwalan dan surat jalan'
      ''
      '06/03/2025 (6.1.7.0)'
      
        '-Penambahan inputan Helper di Penjadwalan, dan menghilangkan inp' +
        'utan Helper'
      'disurat jalan'
      
        '-Memberikan validasi disurat jalan, semua crew wajib Confirmasi ' +
        'untuk bisa'
      'cetak surat jalan'
      
        '-Memberikan validasi wajib melengkapi data ktp,sim,no rekening d' +
        'an no hp'
      'di penjadwalan dan surat jalan'
      ''
      '14/02/2025 (6.1.6.3)'
      
        '-Penambahan Filter Sudah isi BBM SPBU dan Belum Isi BBM SPBU di ' +
        'Uang Order'
      ''
      '05/02/2025 (6.1.6.2)'
      '-Penambahan Modul Rekomendasi Teknis'
      ''
      '03/02/2025 (6.1.6.1)'
      '-Penambahan Clear pada saat panggil no Surat Jalan'
      'di form Penambahan/Pengembalian Uang Order'
      ''
      '22/01/2025 (6.1.6.0)'
      '-Penambahan Upload KIR, STNK, dan KPS'
      '-Penambahan Laporan Rekap Pergantian Part perArmada'
      ''
      '26/12/2024 (6.1.5.52)'
      '-Penambahan Filter Status Karyawan Di Running Days Driver'
      '-Penambahan Laporan Rekap History Armada Pergantian Part '
      ''
      '23/12/2024 (6.1.5.51)'
      '-Penambahan PPN di Modul Invoice'
      '-Penambahan kolom PPN di Laporan Pesanan Bulanan'
      'perArmada Jalan dan Laporan Pesanan Bulanan'
      ''
      '13/12/2024 (6.1.5.50)'
      '-Update Template Surat Jalan Terbaru (Versi 2)'
      ''
      '02/12/2024 (6.1.5.49)'
      '-Menghapus List PKB pada Form Buka PKB'
      ''
      '22/11/2024 (6.1.5.48)'
      '-Penambahan Master Pekerjaan Bengkel'
      '-Fitur Delete pada Grid Serah Terima Barang'
      '-Penambahan inputan KM Standard Pergantian pada Part'
      ''
      'Penambahan/Perubahan/Perbaikan:'
      '07/11/2024 (6.1.5.47)'
      '-Penambahan Modul Training Driver & Helper'
      '(Form Training, List Training, Laporan Training)'
      '-Penambahan Fitur cek History Training di Form Driver & Helper'
      '-Validasi saat non aktif armada, Cek jika masih ada Order'
      'maka tidak bisa dinon aktif'
      ''
      '30/10/2024 (6.1.5.46)'
      '-Penambahan form respon dikeluhan driver'
      '-Penambahan kolom service request di keluhan driver'
      '-Keluhan yang diambil untuk dijadikan service request'
      'hanya yang sudah direspon dan tidak mempunyai'
      'no service request'
      '-Penambahan Filter Tanggal di List PKB'
      ''
      '23/10/2024 (6.1.5.45)'
      '-Penambahan Form History Laka'
      '-Penambahan List History Laka'
      '-Penambahan Cetak History Laka'
      '-Penambahan Kolom Status PKB dan Tampilkan Tanggal Selesai'
      'di Laporan PKB'
      ''
      '09/10/2024 (6.1.5.44)'
      '-Penambahan filter Driver di Laporan Customer Complain'
      '-Penambahan fitur History Customer Complain di Form Data Driver'
      '-Penambahan Kolom Spare Part pada Laporan Service Request'
      '-Penambahan Kolom Spare Part pada Laporan PKB'
      
        '-Penambahan fitur copy biaya sebelumnya di Form Tambah Uang Orde' +
        'r'
      'jika order memakai fitur ulangi perjalan'
      ''
      ''
      '19/09/2024 (6.1.5.43)'
      '-Penambahan tanda order paket dirunning days mini'
      
        '-Buat validasi dan otorisasi saat simpan penjadwalan jika terjad' +
        'i driver atau armada '
      'yang berbeda'
      'di orderan paket'
      ''
      '29/08/2024 (6.1.5.42)'
      '-Penambahan catatan pada cetak SPPB '
      
        ' "Pengisian hanya berlaku di tanggal  [Tanggal Berangkat - Tangg' +
        'al Pulang]"'
      '-Penambahan tanda repeat order dirunning days mini'
      ''
      '06/08/2024 (6.1.5.41)'
      '-Penambahan modul ketidaksesuaian'
      ''
      '24/06/2024 (6.1.5.40)'
      '-Penambahan inputan wajib diisi di kolom aset kepemelikan pada '
      'form Armada'
      ''
      '14/06/2024  (6.1.5.39)'
      
        '-Perbaikan dipenjadwalan sudah langsung simpan ke DB Weha Online' +
        ' '
      ' tanpa Menggunakan API SOAP'
      '-Penambahan saat simpan penjadwalan dilakukan pengecekan driver '
      
        ' diweha online jika tidak ada akan langsung create User Driverny' +
        'a'
      ''
      '11/06/2024  (6.1.5.38)'
      
        '-Penambahan saat simpan ditambah driver dibuat langsung User den' +
        'gan '
      'Role Driver diweha onlinenya'
      '-Penambahan saat update data driver jika melakukan update maka '
      'diwehaonline ikut update seperti nama dan no HP.'
      ''
      '01/06/2024  (6.1.5.37)'
      '-Perbaikan disurat jalan saat simpan tidak menggunakan '
      ' API SOAP sudah langsung simpan ke DB Weha Online'
      ''
      '27/05/2024  (6.1.5.36)'
      '-Penambahan source diForm Menu setting Host'
      ''
      '15/05/2024  (6.1.5.35)'
      '-Penambahan PPH di Pesanan dan Invoice'
      ''
      '25/04/2024  (6.1.5.34)'
      
        '-Order PT Weha dirunning days  iconnya menjadi W dan warnanya Ol' +
        'ive'
      ''
      '02/04/2024  (6.1.5.33)'
      '-Surat Jalan dibuat bisa ubah kendaraan '
      'dan dibuat validasi kendaraan bisa diubah '
      'selama uang order belum ditransfer atau status Completed'
      ''
      '27/03/2024  (6.1.5.32)'
      
        '-Perubahan di Surat Perintah Pengisian BBM tanggal isinya menjad' +
        'i '
      'tanggal keberangkatan'
      ''
      '14/03/2024  (6.1.5.31)'
      '-Service request bisa ambil keluhan driver'
      '-Penambahan inputan Part (Service Request)'
      '-Penambahan inputan Foto (Service Request)'
      '-Penambahan inputan analisa (Service Request)'
      '-Penambahan inputan mekanik (Service Request)'
      '-Penambahan Cetak Form Barang & Jasa (Service Request)'
      '-Penambahan Label status (Service Request)'
      '-Penambahan Form Master Part'
      '-Penambahan List Master Part'
      '-Penambahan approval (Service Request)'
      '-Penambahan form terima barang'
      '-Penambahan cetak terima barang'
      '-Penambahan Filter tanggal di List Service Request'
      '-Penambahan inputan Part (Buka Perintah Bengkel)'
      '-Penambahan inputan Mekanik (Buka Perintah Bengkel)'
      '-Penambahan inputan Analisa (Buka Perintah Bengkel)'
      '-Penambahan ceklis Memo Khusus (Buka Perintah Bengkel)'
      '-Penambahan ceklis Memo Khusus (Service Request)'
      ''
      '05/12/2023 (6.1.5.30)'
      '-Penambahan Seat di Budget Armada'
      '-Penambahan Trip Type di tambah Fee Order'
      ''
      '11/11/2023 (6.1.5.29)'
      '-Menambahkan alasan tidak boleh kosong di Blok Unit'
      '-Menambahkan Ubah di Investigasi Complain'
      
        '-Memperbaiki Pencarian dan Filter Surat Jalan Cancel di Laporan ' +
        'Uang '
      'Order'
      ''
      '17/10/2023 (6.1.5.28)'
      '-Menambahkan menu ceklis transfer'
      '-Menambahkan filter status Bayar di Kontinuitas'
      ''
      '25/09/2023 (6.1.5.27)'
      '-Menambahkan 2 Driver di Penjadwalan'
      '-Menambahkan validasi pada penjadwalan '
      'jika memilih driver yang sudah terjadwal ditanggal yang sama'
      '-Menambahkan informasi driver ke dua dikontinuitas'
      ''
      '14/08/2023 (6.1.5.26)'
      '-Menambahkan Fiter Tanggal jalan dan Tanggal input di Laporan '
      'Customer Complain'
      ''
      '24/07/2023 (6.1.5.25)'
      '-Menambahkan Fiter Tanggal jalan dan Tanggal input di Laporan '
      'Customer Complain'
      ''
      '27/06/2023 (6.1.5.24)'
      '-Menambahkan inputan safety belt diarmada'
      '-Memberikan tanda dirunning days detail is safety belt'
      ''
      '07/06/2023 (6.1.5.23)'
      '-Menambahkan status pengiriman WA di Surat Jalan'
      ''
      '19/05/2023 (6.1.5.22)'
      '-Menambahkan pilihan SPBU di Uang Order'
      ''
      '15/05/2023 (6.1.5.22)'
      
        '-Perubahan ketika menampilkan data order di Form Complai Custome' +
        'r'
      '(Ditambahkan Filter No Order)'
      ''
      '21/02/2023 (6.1.5.21)'
      '-Penambahan Filter Mitra, Tipe Bus dan Seat pada Running Days '
      'Driver&Helper'
      
        '-Perubahan pada update service request (data yang sudah ada dapa' +
        't'
      'mengambil data dari service berkala)'
      ''
      '21/02/2023 (6.1.5.20)'
      '-Penambahan Filter Tanggal Perjalanan pada '
      'Laporan Pesanan Harian Batal perArmada Jalan'
      ''
      '09/01/2023 (6.1.5.19)'
      '-Penambahan Laporan Customer Complain Fasilitas & Crew'
      ''
      '06/01/2023 (6.1.5.18)'
      
        '-Perbaikan Data Absen Karyawan Driver dan Helper tanda hadir H d' +
        'iganti '
      '1'
      ''
      '02/11/2022 (6.1.5.17)'
      '-Penambahan data asuransi diform data armada dan '
      'penmbahan No Polisi di Form Data Asuransi'
      ''
      '24/10/2022  (6.1.5.16)'
      
        '-Perbaikan Cetak Invoice Total Discoun dan footer lain yang terl' +
        'alu turun'
      
        '-Penambahan rumus di Laporan Uang Order Harian di Total (Inc Tol' +
        ' & '
      'Lain2), '#39'+ Overtime'#39
      ''
      '22/10/2022  (6.1.5.15)'
      
        '-Perbaikan Send WA di Surat Jalan jika ada tanda '#39'&'#39' maka karakt' +
        'er '
      'selanjutnya hilang '
      ''
      '15/09/2022 (6.1.5.14)'
      '-Penambahan KM Estimasi di Surat Jalan'
      ''
      '18 Agustus 2022 (6.1.5.10) :'
      '- Perubahan Asuransi Kendaraan'
      ''
      '06 juli 2022 (6.1.5.8) :'
      '- Fix cetak invoice (layanan)'
      ''
      '26 juni 2022 (6.1.5.7) :'
      '- Export Investigasi'
      ''
      '17 juni 2022 (6.1.5.6) :'
      '- Fix bugs laporan bulanan armada jalan'
      ''
      '21 apr 2022 (6.1.5.5) :'
      
        '- Fix bugs penguncian penambahan/pengurangan uang order [integra' +
        'te]'
      ''
      '19 apr 2022 (6.1.5.4) :'
      '- Penguncian penambahan/pengurangan uang order'
      ''
      '09 apr 2022 (6.1.5.3) :'
      '- Perbaikan cetak invoice servicetotal'
      ''
      '11 mar 2022 (6.1.5.2) :'
      '- Perbaikan RD blok unit tidak tampil'
      '- Perbaikan cetak invoice get data bill to'
      ''
      '26 jan 2022 (6.1.5.1) :'
      '- Perbaikan RD mini (error jika unit tidak ada u/ batch tsb)'
      ''
      '25 jan 2022 (6.1.5.0) :'
      '- Penambahan field asset kepemilikan'
      '- Penambahan laporan data armada (asset)'
      ''
      '21 jan 2022 (6.1.4.16) :'
      '- Perbaikan cetak invoice'
      ''
      '04 jan 2022 (6.1.4.15) :'
      '- Perbaikan armada masuk jam stand by tidak valid.'
      ''
      '09 des 2021 (6.1.4.14) :'
      '- Perubahan Lap Kontinuitas (filter jenis armada)'
      ''
      '08 des 2021 (6.1.4.13) :'
      '- Perubahan cetak SPPB (tambah no order)'
      ''
      '01 des 2021 (6.1.4.12) :'
      '- Perbaikan Armada masuk :'
      '  1. Tanda Merah -> order yang sudah lewat belum diinput.'
      '  2. Tidak bisa input jika tanggal selesai <> tanggal server.'
      ''
      ''
      '22 Nop 2021 (6.1.4.11) :'
      '- Perbaikan pencarian Laporan Uang Harian Driver'
      '- Re-layout Cetak Invoice'
      ''
      '01 Nop 2021 (6.1.4.10) :'
      '- Penambahan Laporan Otorisasi Penjadwalan [Cetak SJ]'
      ''
      '25 Okt 2021 (6.1.4.9) :'
      '- Penambahan info Cuti/Ijin/Sakit'
      ''
      '22 Okt 2021 (6.1.4.8) :'
      '- Perubahan Laporan Aktifitas Armada (Penambahan kolom no HP)'
      ''
      '18 Okt 2021 (6.1.4.7) :'
      '- Penambahan pencatatan waktu armada masuk'
      '- Penambahan filter Laporan Uang Order Harian (Tgl Input)'
      ''
      '11 Okt 2021 (6.1.4.6) :'
      '- Penambahan fitur geser Driver'
      ''
      '28 Sep 2021 (6.1.4.5) :'
      '- Perbaikan jadwal/batangan driver dan co-driver'
      ''
      '24 Sep 2021 (6.1.4.4) :'
      '- Penambahan filter Laporan Uang Order Harian'
      ''
      '20 Sep 2021 (6.1.4.3) :'
      '- Perbaikan Armada Keluar'
      ''
      '16 Sep 2021 (6.1.4.2) :'
      
        '- Enhance RD Mini (Urutkan berdasarkan jenis armada : Big Bus, M' +
        'edium, '
      'Minivan, Rental)'
      ''
      '14 Sep 2021 (6.1.4.1) :'
      '- Otorisasi Penjadwalan [SJ]'
      '- Perbaikan Input Order (Service)'
      ''
      '31 Aug 2021 (6.1.4.0) :'
      '- Penambahan Input Asuransi Kendaraan'
      ''
      '27 Aug 2021 (6.1.3.14) :'
      '- Perbaikan Input Order (KIR/Service/FullTank/Exploitasi)'
      ''
      '19 Aug 2021 (6.1.3.13) :'
      '- Perbaikian RD Mini'
      '- Ceklis Integrate (tambah kolom jenis service)'
      ''
      '10 Aug 2021 (6.1.3.12) :'
      '- Perbaikan ubah armada'
      ''
      '09 Aug 2021 (6.1.3.11) :'
      '- Perubahan RD Mini (persen jalan perhari)'
      ''
      '03 Aug 2021 (6.1.3.10) :'
      '- Perbaikan pencatatan Upgrade dan Downgrade penjadwalan'
      ''
      '30 Jul 2021 (6.1.3.9) :'
      '- Pencatatan Upgrade dan Downgrade penjadwalan'
      '- Perubahan Laporan Uang Order Harian (Jenis Service)'
      '- Perubahan Laporan Pengeluaran per-Armada (Jenis Service)'
      ''
      '23 Jul 2021 (6.1.3.8) :'
      '- Split KM Surat Jalan (Order yang diinapkan)'
      ''
      '21 Jul 2021 (6.1.3.7) :'
      '- Revisi Ordo KM Surat Jalan'
      ''
      '17 Jul 2021 (6.1.3.6) :'
      '- Panambahan informasi keterangan dari Surat Jalan'
      ''
      '28 Jun 2021 (6.1.3.5) :'
      '- Perbaikan Edit Uang Order dari Laporan Uang Order Harian'
      ''
      '28 Jun 2021 (6.1.3.4) :'
      '- Perubahan input data Pesanan (Jenis Service)'
      
        '- Perbaikan penguncian Revisi Uang Order yang sudah diceklis Int' +
        'egrate'
      ''
      '23 Jun 2021 (6.1.3.3) :'
      '- Perbaikan Ubah data Driver/Helper/Karyawan'
      
        '- Perbaikan Penambahan/Pengurangan Uang Order (BBM Reiburse, BBM' +
        ' '
      'SPBU)'
      ''
      '18 Jun 2021 (6.1.3.2) :'
      '- Perbaikan Ubah data Driver/Helper/Karyawan'
      '- Perbaikan Laporan Kontinuitas'
      ''
      '11 Jun 2021 (6.1.3.1) :'
      
        '- Perubahan Laporan Uang Order Harian (tanda merah/belum selesai' +
        ')'
      ''
      '08 Jun 2021 (6.1.3.0) :'
      '- Setting Id Absen untuk Karyawan dan Crew'
      ''
      '04 Jun 2021 (6.1.2.12) :'
      '- Penambahan menu RD Co Driver'
      '- Penambahan Lap. Kontinuitas (Kenek)'
      ''
      '30 Apr 2021 (6.1.2.10) :'
      '- Kunci Edit Budget jika sudah diceklis Integrate'
      ''
      '24 Mar 2021 (6.1.2.9) :'
      '- Penambahan geser unit di penjadwalan'
      '- Penambahan Laporan kontinuitas (info keterangan)'
      ''
      '01 Mar 2021 (6.1.2.8) :'
      '- Penambahan Running days E-Toll'
      '- Perbaikan kirim pesan Whatsapp Web'
      ''
      '22 Feb 2021 (6.1.2.7) :'
      '- Perubahan Employee List'
      '- Penambahan Data Surat Jalan, tombol kirim pesan Whatsapp Web.'
      ''
      '18 Feb 2021 (6.1.2.6) :'
      '- Perbaikan Edit Topup Transaksi EToll'
      ''
      '16 Feb 2021 (6.1.2.5) :'
      '- Penambahan kolom Alias untuk no Etoll'
      '- Perubahan Laporan Uang Order Harian'
      '- Penambahan Foto KTP dan KK di master Driver/Co Driver'
      ''
      '04 Feb 2021 (6.1.2.4) :'
      '- Perbaikan Laporan Uang Order Harian (Search)'
      '- Perbaikan Daftar Topup E Toll (Search)'
      '- Perbaikan Input Topup E Toll'
      ''
      '28 Januari 2021 (6.1.2.3) :'
      '- Perbaikan Input Topup eToll'
      ''
      '27 Januari 2021 (6.1.2.2) :'
      '- Perubahan Input Master No eToll.'
      '- Perbaikan Input Topup eToll'
      ''
      '13 Januari 2021 (6.1.2.1) :'
      '- Perubahan Transaksi Tambah, Ubah topup eToll.'
      '- Perbaikan Laporan Uang Order Harian'
      '- Perubahan Laporan Aktifitas Harian'
      ''
      '12 Januari 2021 (6.1.2.0) :'
      '- Penambahan Transaksi Tambah, Ubah, Daftar topup eToll.'
      '- Perubahan Laporan Uang Order Harian'
      ''
      '18 Nopember 2020 (6.1.1.32) :'
      '- Penambahan Transaksi Upload topup eToll.'
      ''
      '13 Nopember 2020 (6.1.1.31) :'
      '- Penambahan kolom E-toll di aktifitas kendaraan.'
      ''
      '07 Nopember 2020 (6.1.1.30) :'
      '- Penambahan master E-toll.'
      '- Kelola Driver dan E-Toll'
      ''
      '16 Oktober 2020 (6.1.1.29) :'
      '- Penambahan E-toll di Data Driver'
      ''
      '22 Juli 2020 (6.1.1.28) :'
      '- Perubahan Integrate HPP ke GP'
      ''
      '16 Juli 2020 (6.1.1.27) :'
      '- Perbaikan Integrate HPP ke GP'
      '- Perbaikan input pembayaran DP'
      ''
      '10 Juli 2020 (6.1.1.26) :'
      '- Perubahan laporan log Sync data Order Weha Online ke GP'
      ''
      '09 Juli 2020 (6.1.1.25) :'
      '- Perbaikan lihat data Invoice'
      '- Perbaikan lihat data Pembayaran'
      '- Penambahan laporan log Sync data Order Weha Online ke GP'
      ''
      '10 Juni 2020 (6.1.1.24) :'
      '- Perubahan url API weha online'
      ''
      '17 Mar 2020 (6.1.1.23) :'
      '- Penambahan kolom KTP pada daftar Driver'
      ''
      '24 Mar 2020 (6.1.1.22) :'
      '- Penambahan cetakan reimburse BBM'
      ''
      '13 Mar 2020 (6.1.1.21) :'
      '- perbaikan input riwayat laka'
      ''
      '10 Mar 2020 (6.1.1.20) :'
      '- perbaikan input riwayat laka'
      ''
      '04 Mar 2020 (6.1.1.19) :'
      '- perbaikan laporan data SJ cancel'
      '- perbaikan input riwayat laka'
      ''
      '28 Feb 2020 (6.1.1.18) :'
      '- perbaikan link API'
      ''
      '28 Feb 2020 (6.1.1.17) :'
      '- Perubahan tambah uang armada (Overtime ada input jam selesai)'
      '- Penambahan Laporan perkiraan budget'
      ''
      '26 Feb 2020 (6.1.1.16) :'
      '- Perubahan tambah uang armada (LK/bermalam)'
      ''
      '14 Feb 2020 (6.1.1.14) :'
      '- Perubahan laporan uang harian driver (pilihan data cancel dan '
      'penambahan kolom jenis armada)'
      ''
      '05 Feb 2020 (6.1.1.13) :'
      '- Penambahan fitur Overtime'
      '- Perbaikan laporan uang order (total  Exc Tol)'
      ''
      '28 Jan 2020 (6.1.1.12) :'
      '- Penambahan field email User'
      '- Penambahan kolom keberangkatan (laporan uang order, laporan '
      'pengeluaran armada)'
      
        '- Perubahan laporan pengeluaran per-armada kolom Exc Tol dan Par' +
        'kir '
      'menjadi Exc Tol'
      ''
      '06 Jan 2020 (6.1.1.11) :'
      '- Perubahan pencarian Laporan PKB'
      ''
      '20 Desember 2019 (6.1.1.10) :'
      '- Perbaikan Budget (Bulanan dan Tahunan)'
      '- Perbaikan pembuatan SJ'
      ''
      '27 Nopember 2019 (6.1.1.9) :'
      '- Perbaikan Pencarian daftar komplen'
      '- Perbaikan PR'
      ''
      '13 Nopember 2019 (6.1.1.8) :'
      '- Perubahan RD Compact'
      ''
      '11 Nopember 2019 (6.1.1.7) : '
      '- Perubahan cetakan Budget LK'
      ''
      '23 Oktober 2019 (6.1.1.6) : '
      '- Perbaikan Laporan uang order harian'
      ''
      '17 Oktober 2019 (6.1.1.5) :'
      '- Perubahan Ceklist Armada'
      '- Perbaikan User Tree Menu'
      '- Perbaikan uang order harian (R BBM)'
      ''
      '04 Oktober 2019 (6.1.1.4) :'
      '- Perbaikan Input PKB'
      '- Perbaikan Input Blok Unit'
      '- Perubahan RD Mini (User Location)'
      ''
      '19 September 2019 (6.1.1.3) :'
      '- Perubahan uang Order'
      ''
      '18 September 2019 (6.1.1.2) :'
      '- Perbaikan daftar pembayaran'
      '- Perbaikan bulanan per-armada'
      ''
      '04 September 2019 (6.1.1.1) :'
      '- Perbaikan alokasi WL'
      ''
      '02 September 2019 (6.1.1.0) :'
      '- Perubahan data wifi armada'
      '- Penambahan Topup Kuota'
      ''
      '29 Agustus 2019 (6.1.0.19) :'
      ''
      '28 Agustus 2019 (6.1.0.18) :'
      ''
      '28 Agustus 2019 (6.1.0.17) :'
      '- Perbaikan tambah pesanan'
      ''
      '16 Agustus 2019 (6.1.0.16) :'
      '- Perbaikan Armada keluar & masuk (nopol)'
      ''
      '07 Agustus 2019 (6.1.0.15) :'
      '- Update url API'
      ''
      '07 Agustus 2019 (6.1.0.14) :'
      '- Perubahan Input Budget Order (Lock).'
      '- Perbaikan Laporan pengeluaran perArmada'
      ''
      '24 Juli 2019 (6.1.0.13) :'
      '- Perbaikan Input Budget BBM.'
      ''
      '15 Juli 2019 (6.1.0.12) :'
      '- Perbaikan penjadwalan Sewa Luar'
      ''
      '11 Juli 2019 (6.1.0.11) :'
      '- Penambahan Master Budget Operasional'
      '- Perubahan Input Uang Order'
      ''
      '08 Juli 2019 (6.1.0.10) :'
      '- Perbaikan Input Uang Order'
      ''
      '03 Juli 2019 (6.1.0.9) :'
      '- Perbaikan Lap Pengeluaran perArmada'
      ''
      '01 Juli 2019 (6.1.0.8) :'
      '- Perbaikan Armada Masuk (Overnight).'
      '- Perbaikan Group sub Menu'
      ''
      '26 Juni 2019 (6.1.0.6) :'
      '- Penambahan field data Armada.'
      '- Perubahan Ceklist Armada.'
      ''
      '21 Juni 2019 (6.1.0.5) :'
      '- Perbaikan Armada Masuk.'
      ''
      '20 Juni 2019 (6.1.0.4) :'
      '- Perbaikan Armada Masuk (Input BBM Scan Barcode).'
      ''
      '19 Juni 2019 (6.1.0.3) :'
      '- Perbaikan Armada Masuk.'
      '- Perbaikan Lap Pesanan Bulanan perArmada jalan.'
      ''
      '14 Juni 2019 (6.1.0.2) :'
      '- Perbaikan Laporan Bulanan Per-Armada.'
      ''
      '13 Juni 2019 (6.1.0.1) :'
      
        '- Penambahan No Rekening dan Nama Rekening di daftar driver dan ' +
        'Lap '
      'Uang Order Harian.'
      ''
      '14 Mei 2019 (6.1.0.0) :'
      '- Perbaikan Lap Bulanan perArmada'
      ''
      '10 Mei 2019 (6.0.9.9) :'
      '- Perubahan Customer complain Investigasi (Selesai/Is Closed)'
      '- Perubahan Lap Customer Complain'
      ''
      '06 Mei 2019 (6.0.9.8) :'
      '- Perbaikan Lap Pengeluaran perArmada'
      ''
      '30 Apr 2019 (6.0.9.7) :'
      '- Perbaikan Lap Bulanan perArmada'
      '- Perbaikan RD Mini'
      ''
      '29 Apr 2019 (6.0.9.6) :'
      '- Perbaikan Lap Uang Order Harian (Km Masuk)'
      ''
      '26 Apr 2019 (6.0.9.5) :'
      '- Perbaikan Armada Keluar dan Armada Masuk (Status_SJ)'
      ''
      '25 Apr 2019 (6.0.9.4) :'
      '- Penambahan Armada Keluar dan Armada Masuk (Status_SJ)'
      '- Penambahan Lap Pengeluaran Armada (Reimburse)'
      '- Penambahan Lap Uang Order Harian (Reimburse)'
      ''
      '16 Apr 2019 (6.0.9.3) :'
      '- Perubahan Penambahan/Pengembalian Uang Order (Reimburse)'
      ''
      '29 Mar 2019 (6.0.9.2) :'
      '- Perubahan Armada Kembali'
      ''
      '26 Mar 2019 (6.0.9.1) :'
      '- Penambahan Laporan Bulanan per-Armada'
      ''
      '18 Feb 2019 (6.0.9.0) :'
      '- Perubahan Cetakan Uang Order'
      '- Perbaikan Blok Unit Mudik'
      ''
      '16 Feb 2019 (6.0.8.9) :'
      '- Perbaikan Lap Order Harian Driver'
      ''
      '15 Feb 2019 (6.0.8.8) :'
      '- Perbaikan Lap RD Mini'
      '- Perubahan Blok Unit'
      '- Perubahan Lap. Order Fee'
      ''
      '19 Desember 2018 (6.0.8.7) :'
      '- Perbaikan Lap Kontinuitas (remark).'
      '- Perubahan RD'
      ''
      '14 Desember 2018 (6.0.8.6) :'
      '- Perubahan Lap Kontinuitas (remark).'
      ''
      '29 Nopember 2018 (6.0.8.5) :'
      '- Perbaikan Runningdays Mini.'
      ''
      '27 Nopember 2018 (6.0.8.4) :'
      '- Perbaikan Integrate.'
      '- Perbaikan Runningdays Mini.'
      ''
      '06 Nopember 2018 (6.0.8.3) :'
      '- Perbaikan alokasi WL.'
      '- Perubahan cetakan uang order.'
      ''
      '01 Nopember 2018 (6.0.8.2) :'
      '- Perbaikan ubah penjadwalan.'
      ''
      '31 Oktober 2018 (6.0.8.1) :'
      '- Perubahan Integrate Bus'
      '- Perubahan daftar penjadwalan'
      '- Perbaikan RD Mini'
      ''
      '12 Oktober 2018 (6.0.8.0) :'
      '- Perubahan laporan pengeluaran  per-armada'
      '- Perbaikan armada masuk'
      '- Perbaikan laporan uang order harian'
      ''
      '29 September 2018 (6.0.7.9) :'
      '- Perbaikan input BBM Budget'
      ''
      '27 September 2018 (6.0.7.8) :'
      '- Perubahan Running days mini (Co-Driver/Helper)'
      '- Tambah Jadwal Co-Driver/Helper'
      '- Tambah kategori "Mogok" di Customer Complain'
      
        '- Tambah kategori Crew, Staff, Teknikal di Investigasi Customer ' +
        'Complain'
      ''
      '24 September 2018 (6.0.7.7) :'
      
        '- Perubahan laporan aktifitas harian per-armada (Co-Driver/Helpe' +
        'r)'
      '- Perbaikan Uang Order (menginap)'
      '- Perubahan Laporan Uang Order Harian'
      '- Perubahan Laporan Pengeluaran Per-Armada'
      ''
      '18 September 2018 (6.0.7.6) :'
      '- Perbaikan Running Days Driver'
      '- Perbaikan cetakan SJ info PIC'
      ''
      '18 September 2018 (6.0.7.5) :'
      '- Preview Blok unit di RD Mini'
      '- Perubahan Input/Ubah Armada'
      '- Perubahan cetakan SJ info PIC/CP dan order menginap'
      
        '- Perubahan Uang Order (split antara BBM budget, spbu, reimburse' +
        ')'
      ''
      '07 September 2018 (6.0.7.4) :'
      '- Perbaikan alokasi 0 unit untuk waiting list'
      '- Penambahan Blok unit.'
      ''
      '05 September 2018 (6.0.7.3) :'
      '- Perbaikan update data jam stand by ke online'
      ''
      '01 September 2018 (6.0.7.2) :'
      '- Perbaikan URL API'
      ''
      '30 Agustus 2018 (6.0.7.1) :'
      '- Perbaikan tampilan detail Running Days Mini'
      '- Perbaikan SJ cancel [API]'
      ''
      '23 Agustus 2018 (6.0.7.0) :'
      '- Perbaikan tampilan Running Days Mini'
      ''
      '16 Agustus 2018 (6.0.6.9) :'
      
        '- Perbaikan Running Days Mini (Kendaraan sesuai dengan saat bula' +
        'n '
      'berjalan)'
      ''
      '07 Agustus 2018 (6.0.6.8) :'
      '- Perbaikan Running Days Mini'
      '- Perbaikan Uang Order Harian'
      ''
      '31 Juli 2018 (6.0.6.7) :'
      '- Perbaikan Laporan Pengeluaran perArmada'
      '- Perbaikan Laporan Aktifitas Harian'
      ''
      '25 Juli 2018 (6.0.6.6) :'
      '- Perbaikan input armada keluar dan masuk (API)'
      ''
      '18 Juli 2018 (6.0.6.5) :'
      '- Perbaikan tambah investigasi'
      ''
      '16 Juli 2018 (6.0.6.4) :'
      '- Penambahan input kernet di SJ'
      ''
      '14 Juli 2018 (6.0.6.3) :'
      '- Perbaikan input armadakeluar dan masuk'
      ''
      '10 Juli 2018 (6.0.6.2) :'
      '- Perbaikan Penjadwalan, buat SJ service tidak cek API'
      ''
      '04 Juli 2018 (6.0.6.2) :'
      '- Perbaikan Ubah SJ'
      ''
      '03 Juli 2018 (6.0.6.1) :'
      '- Perubahan pemanggilan API (Ints)'
      '- Perbaikan alignment Lap Uang Order Harian'
      ''
      '28 Juni 2018 (6.0.6.0) :'
      '- Perubahan buat SJ (Update stand by ke Apps)'
      ''
      '26 Juni 2018 (6.0.5.9) :'
      '- Perbaikan Laporan Data Invoice'
      '- Perbaikan pencarian data Penjadwalan'
      '- Order Booked tidak masuk ke penjualan'
      '- Perbaikan Lap Pesanan Bulanan perArmada Jalan Summary'
      ''
      '19 Jun 2018 (6.0.5.8) :'
      '- Perubahan dan Perbaikan Laporan Uang Order Harian'
      '- Perubahan Laporan Pengeluaran per-armada Jalan'
      ''
      '30 Apr 2018 (6.0.5.7) :'
      '- Penambahan menu Tambah Investigasi dan Penanganan Komplain '
      'Customer'
      '- Perbaikan ubah penjadwalan'
      ''
      '25 Apr 2018 (6.0.5.6) :'
      '- Penambahan menu Laporan Pesanan Bulanan per-Armada Jalan '
      '[Rekap dan Summary]'
      ''
      '17 Apr 2018 (6.0.5.5) :'
      '- Penambahan isFix di penjadwalan'
      '- Perbaikan Laporan Pesanan Bulanan per-Armada Jalan'
      ''
      '03 Apr 2018 (6.0.5.4) :'
      
        '- Perbaikan laporan data PKB yang sudah tutup (data teknisi tida' +
        'k '
      'muncul).'
      '- Penambahan tombol cetak ulang PKB yang sudah tutup.'
      ''
      '28 Mar 2018 (6.0.5.3) :'
      '- Perubahan laporan uang order driver'
      '- Perbaikan laporan pengeluaran per-armada'
      ''
      '08 Mar 2018 (6.0.5.2) :'
      '- Perbaikan logout'
      '- Perbaikan tambah uang order'
      ''
      '02 Mar 2018 (6.0.5.1) :'
      '- Perubahan cetakan uang order jogja'
      ''
      '29 Jan 2018 (6.0.5.0) :'
      '- Perbaikan list riwayat driver'
      ''
      '27 Jan 2018 (6.0.4.9) :'
      '- Perbaikan List armada'
      ''
      '22 Jan 2018 (6.0.4.8) :'
      '- Perubahan laporan PKB (tambah kolom SB dan SR)'
      '- Perbaikan laporan pesanan bulanan'
      ''
      '04 Jan 2018 (6.0.4.7) :'
      '- Perbaikan No NPWP di Invoice Weha Bali'
      '- Perbaikan list tracking maintenance by body'
      ''
      '29 Des 2017 (6.0.4.6) :'
      '- Perbaikan list dan laporan service berkala'
      ''
      '22 Des 2017 (6.0.4.5) :'
      '- Perbaikan Ubah Lokasi'
      '- Perbaikan service berkala'
      ''
      '15 Des 2017 (6.0.4.3) :'
      '- Perubahan url API'
      ''
      '12 Des 2017 (6.0.4.2) :'
      '- Perubahan ceklis armada keluar dan armada masuk'
      ''
      '26 Nop 2017 (6.0.4.1) :'
      '- Perubahan tracking maintenance by body'
      '- Perbaikan ubah uang order'
      ''
      '24 Nop 2017 (6.0.4.0) :'
      '- Perbaikan Armada Keluar dan Masuk'
      '- Perubahan list armada'
      ''
      '08 Nop 2017 (6.0.3.9) :'
      '- Perbaikan cetak SJ'
      ''
      '07 Nop 2017 (6.0.3.8) :'
      '- Perubahan laporan uang order'
      '- Perubahan input/ubah armada'
      ''
      '19 Okt 2017 (6.0.3.6) :'
      '- Perubahan cetakan bbm untuk grayline'
      ''
      '11 Okt 2017 (6.0.3.5) :'
      '- Perubahan cetakan input uang order'
      ''
      '29 Sep 2017 (6.0.3.5) :'
      '- Perbaikan input uang order'
      ''
      '29 Sep 2017 (6.0.3.4) :'
      '- Perubahan input uang order'
      '- Perbaikan laporan service berkala'
      '- Perubahan laporan uang order harian driver'
      '- Perubahan laporan pengeluaran per-armada'
      ''
      '22 Sep 2017 (6.0.3.3) :'
      '- Penambahan laporan training driver'
      ''
      '18 Sep 2017 (6.0.3.2) :'
      '- Perbaikan input/ubah Armada'
      '- Perubahan laporan pengeluaran perArmada'
      '- Perubahan Runningdays *'
      ''
      '15 Sep 2017 (6.0.3.1) :'
      '- Perbaikan input Armada masuk'
      '- Perubahan laporan PKB'
      ''
      '12 Sep 2017 (6.0.3.0) :'
      '- Perbaikan input SJ'
      '- Perbaikan ubah driver'
      '- Perubahan laporan uang harian driver'
      ''
      '08 Sep 2017 (6.0.2.9) :'
      '- Api weha online'
      ''
      '31 Agustus 2017 (6.0.2.6) :'
      '- Perbaikan laporan service request'
      '- Perbaikan laporan PKB'
      ''
      '28 Agustus 2017 (6.0.2.5) :'
      '- Perbaikan laporan uang order harian'
      '- Perbaikan ubah data komplain'
      '- Perbaikan laporan pesanan bulanan perArmada jalan'
      ''
      '22 Agustus 2017 (6.0.2.4) :'
      '- Perbaikan cetakan penambahan uang order'
      '- Perbaikan laporan data komplain'
      ''
      '12 Agustus 2017 (6.0.2.3) :'
      '- Perbaikan input armada masuk'
      ''
      '11 Agustus 2017 (6.0.2.2) :'
      '- Perbaikan input armada masuk'
      ''
      '03 Agustus 2017 (6.0.2.1) :'
      '- Perbaikan input armada'
      ''
      '28 Juli 2017 (6.0.2.0) :'
      '- Perbaikan laporan uang order harian'
      '- Perbaikan laporan kontinuitas per-armada jalan'
      '- Perbaikan info no hp pada pembuatan surat jalan'
      '- Perbaikan running days mini'
      ''
      '18 Juli 2017 (6.0.1.9) :'
      '- Perbaikan penjadwalan sewa luar'
      '- Perubahan input customer complain'
      ''
      '13 Juli 2017 (6.0.1.8) :'
      '- Perbaikan service berkala'
      '- Perubahan laporan pengeluaran per-armada'
      ''
      '12 Juli 2017 (6.0.1.7) :'
      '- Penambahan alokasi waiting list sewa luar'
      ''
      '07 Juli 2017 (6.0.1.6) :'
      '- Perbaikan laporan pengeluaran per-armada'
      ''
      '06 Juli 2017 (6.0.1.5) :'
      '- Perbaikan penambahan/pengembalian uang order'
      '- Perubahan laporan pengeluaran per-armada'
      ''
      '05 Juli 2017 (6.0.1.4) :'
      '- Perubahan laporan uang order harian'
      ''
      '03 Juli 2017 (6.0.1.3) :'
      '- Perbaikan laporan pesanan perarmada jalan'
      ''
      '22 Juni 2017 (6.0.1.2) :'
      '- Perbaikan Dashboard'
      '- Penambahan fitur Total BBM Harian pada Dashboard'
      '- Perbaikan Persen Utilisasi pada Dashboard'
      '- Perbaikan Laporan perngeluaran perArmada'
      '- Penambahan kolom pajak di list armada'
      ''
      '09 Juni 2017 (6.0.1.1) :'
      '- Perbaikan Dashboard'
      '- Perbaikan Runningdays Mini'
      '- Perbaikan penjualan per-armada'
      ''
      '08 Juni 2017 (6.0.1.0) :'
      '- Penambahan tampilan Dashboard'
      '- Perbaikan Runningdays Mini'
      '- Penambahan penjualan per-armada'
      ''
      '23 Mei 2017 (6.0.0.9) :'
      '- Patch perbaikan pembuatan surat jalan bayar dan kontrak.'
      ''
      '16 Mei 2017 (6.0.0.8) :'
      '- Perbaikan input Tutup PKB'
      '- Penambahan alokasi unit Waiting List'
      ''
      '28 Apr 2017 (6.0.0.7) :'
      '- Perbaikan input Tutup PKB'
      ''
      '23 Mar 2017 (6.0.0.6) :'
      '- Perbaikan running days'
      ''
      '22 Mar 2017 (6.0.0.5) :'
      '- Perbaikan cara menampilkan data running days dan pilihan seat'
      '- Perbaikan cara menampilkan data running days mini'
      '- Perbaikan pencarian data pesanan'
      '- Perbaikan input Tutup PKB'
      ''
      '28 Feb 2017 (6.0.0.4) :'
      '- Perbaikan modul penambahan penjadwalan'
      ''
      '21 Feb 2017 (6.0.0.2) :'
      '- Perbaikan modul integrasi online surat jalan'
      '- Perbaikan modul integrasi online armada keluar'
      '- Perbaikan modul integarsi online armada kembali'
      '- Perbaikan modul integrasi online penjadwalan'
      ''
      '27 Jan 2017 (6.0.0.0) :'
      '- Pengintegrasian modul online'
      '- Penambahan modul integrasi online surat jalan'
      '- Penambahan modul integrasi online armada keluar'
      '- Penambahan modul integarsi online armada kembali'
      '- Penambahan modul integrasi online penjadwalan'
      '- Penambahan total perkategori pada running days mini'
      '- Penambahan kolom pada laporan armada'
      ''
      '02 Jan 2017 (5.4.4.10) :'
      '- Perbaikan armada kembali, solar dalam nilai koma'
      '- Penambahan field reserved detail id pada booking'
      ''
      '28 Des 2016 (5.4.4.9) :'
      '- Perbaikan running days mini untuk pemilihan seat'
      '- Penambahan fasilitas pencarian pada tracking body'
      ''
      '23 Des 2016 (5.4.4.8) :'
      '- Penambahan Laporan pesanan batal perArmada Jalan'
      ''
      '13 Des 2016 (5.4.4.6) :'
      '- Perbaikan input data armada'
      '- Penambahan field email pada input mitra2'
      ''
      '09 Des 2016 (5.4.4.3) :'
      '- Perbaikan running days mini timeout'
      '- Perbaikan pencetakan riwayat '
      '- Perbaikan Laporan armada'
      ''
      '08 Des 2016 (5.4.4.2) :'
      '- Perbaikan input mitra2'
      ''
      '07 Des 2016 (5.4.4.1) :'
      '- Perbaikan input data armada2'
      '- Perbaikan fasilitas pencarian armada2'
      '- Perbaikan administrasi armada'
      ''
      '06 Des 2016 (5.4.4.0) :'
      '- Penambahan pencetakan Riwayat Pengemudi/BusBoy'
      '- Perbaikan Laporan Data Armada'
      ''
      '1 Des 2016 (5.4.3.0) :'
      '- Pencetakan foto/image'
      '- Perbaikan penambahan armada pada administrasi armada'
      ''
      '25 Nov 2016 (5.4.2.3) :'
      '- Perbaikan penambahan data administrasi'
      '- Penambahan kolom tanggal bayar pada cheklist administrasi'
      '- Penambahan opsi pilihan pengambilan data administrasi'
      '- Penghilangan kolom masa berlaku identitas dan tempat lahir'
      '- Perubahan tanggal expired menjadi opsional'
      '- Penambahan kotamadya dan propinsi'
      '- Otomatis capital pada no polisi, no rangka dan no mesin'
      '- Perbaikan PKB untuk jadwal bentrok'
      ''
      '15 Nov 2016 (5.4.2.0) :'
      '- Perbaikan PKB bentrok'
      '- Penambahan Laporan Armada lengkap'
      ''
      '14 Nov 2016 (5.4.1.3)'#10
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '- Perbaikan penambahan list administrasi armada'
      '- Penambahan Total Group pada laporan pesanan bulanan perArmada '
      'jalan'
      ''
      '04 Nov 2016 (5.4.1.2) :'
      '- Perbaikan Administrasi Armada'
      '- Perbaikan Input Armada connecting dgn Input Mitra'
      '- Penambahan fasiltas pencarian pada List administrasi'
      '- Penambahan kolom batch dan tahun pada administrasi armada'
      ''
      '01 Nov 2016 (5.4.1.1) :'
      '- Perbaikan servis berkala'
      '- Perbaikan tracking by body'
      ''
      '27 Okt 2016 (5.4.1.0) :'
      '- Perbaikan input tanggal servis berkala'
      '- Perbaikan running days'
      '- Penambahan Input Analisa Service Request'
      ''
      '21 Okt 2016 (5.4.0.1) :'
      '- Perbaikan pencarian laporan service request'
      '- Perbaikan input PKB untuk pengecekan running days'
      '- Perbaikan pencetakan tanggal mulai dan selesai service request'
      ''
      '14 Okt 2016 (5.4.0.0) :'
      '- Perbaikan pencarian pada laporan PKB'
      '- Perbaikan pencarian pada laporan service request'
      '- Perbaikan running days mini'
      '- Penambahan KM pada laporan service request'
      '- Penambahan fungsi tree menu company berbeda'
      '- Perbaikan kode kendaraan armada2'
      ''
      '30 Sept 2016 (5.3.2.6) :'
      '- Perbaikan running days driver'
      ''
      '29 Sept 2016 (5.3.2.5) :'
      '- Penambahan perubahan penjadwalan melalui running days mini'
      '- Penambahan progressbar untuk running days'
      '- Perbaikan perubahan administrasi armada'
      '- Perbaikan checklist administrasi armada'
      '- Perbaikan laporan pkb definisi selesai dan dalam pekerjaan'
      '- Penambahan kolom pekerjaan pada laporan pkb'
      '- Laporan pkb selesai dapat melihat data pekerjaan'
      '- Perbaikan surat jalan Bus'
      ''
      '22 Sept 2016 (5.3.2.3) :'
      '- Perbaikan spj taxi'
      '- Perbaikan running days driver bus'
      '- Penambahan Riwayat busboy'
      ''
      '20 Sep 2016 (5.3.2.1) :'
      '- Perbaikan PKB closed dataset'
      '- Progressbar pada laporan pesanan bulanan, pesanan harian '
      'perarmada '
      'jalan, list data pelanggan'
      ''
      '16 Sep 2016 (5.3.2.0) :'
      '- Perbaikan SPJ mitra logo, catatan dan posisi KM odo'
      
        '- Perbaikan Slip setoran mitra logo, kurang setor dan pembersiha' +
        'n kolom'
      
        '- Perbaikan perubahan penjadwalan melalui running days untuk 2 j' +
        'adwal '
      'atau lebih'
      '- Running days mini bisa melihat pesanan melalui double klik'
      
        '- Perbaikan running days mini untuk overlap pesanan dan perbaika' +
        'n'
      '- Perbaikan PKB tidak dapat overlap dengan pesanan'
      '- Perbaikan mutasi/keluar driver dan busboy'
      '- Perbaikan perubahan data mitra'
      '- Penambahan kategori pada running days mini'
      
        '- Penambahan progress bar pada running days mini, laporan pesana' +
        'n '
      'harian dan laporan pesanan bulanan perarmada jalan'
      ''
      '09 Sep 2016 (5.3.0.1) :'
      '- Penggunaan thread untuk waktu dan pesan'
      '- Penambahan kolom pengemudi pada data armada'
      '- Perbaikan Pelat nomor kendaraan pada data armada'
      '- Penambahan image pada form armada 2'
      '- Penghapusan image pada form driver'
      '- Penambahan ImageViewer untuk beberapa form'
      '- Penambahan link driver pada data armada '
      '- Penambahan link armada pada data driver '
      '- Perbaikan form update,foto busboy dan driver'
      
        '- Perbaikan SPJ taxi, menghilangkan logo, baris v29-v34 dan vouc' +
        'her BBM'
      '- Perbaikan Slip setoran taxi menghilangkan BBM dan logo'
      
        '- Perbaikan cetakan invoice blank form untuk service yg tidak ta' +
        'mpil'
      '- Perbaikan SPJ taxi untuk logo'
      '- Perbaikan slip setoran taxi untuk logo'
      ''
      '02 Sept 2016 (5.2.22.0) :'
      '- Perubahan Slip setoran input hanya km odo'
      '- Penambahan update data armada dari administrasi armada'
      ''
      '30 Agst 2016 (5.2.21.2) :'
      '- Perubahan SPJ Keluar Armada (hanya KM Odo)'
      '- Perbaikan Update data Armada v2'
      '- Perbaikan pencetakan invoice bus'
      ''
      '24 Agst 2016 (5.2.20.8) :'
      '- Perbaikan pencetakan invoice 1 halaman'
      '- Perbaikan pencetakan invoice fullprinted'
      '- Pencetakan SPPB pada continous form A5'
      '- Otorisasi semua kendaraan tombol F5 pada Surat Jalan bus'
      ''
      '15 Agst 2016 (5.2.20.5) :'
      '- Perbaikan cetakan uang order bermalam'
      '- Perbaikan laporan invoice bus'
      ''
      '08 Agst 2016 (5.2.20.3) :'
      '- Perbaikan tampilan perubahan pesanan'
      ''
      '05 Agst 2016 (5.2.20.2) :'
      '- Perbaikan pencetakan invoice'
      ''
      '04 Agst 2016 (5.2.20.1) :'
      '- Perbaikan pencetakan invoice'
      ''
      '03 Agst 2016 (5.2.20.0) :'
      '- Penambahan invoice pada continous form kosong '
      '- Perbaikan pencetakan invoice'
      ''
      '29 Juli 2016 (5.2.19.1) :'
      '- Perubahan pencetakan form Surat Jalan'
      ''
      '28 Juli 2016 (5.2.19.0) :'
      '- Penambahan form Uang Order pada continous form kosong'
      '- Perbaikan pencetakan form Surat Jalan'
      '- Pernbaikan form Uang Order'
      ''
      '27 Juli 2016 (5.2.18.0) :'
      '- Penambahan form Surat Jalan pada continous form kosong'
      '- Perbaikan pengambilan data PKB dari Service Request'
      ''
      '20 Juli 2016 (5.2.17.7) :'
      '- Perubahan Administrasi armada boleh backdate'
      '- Perbaikan checklist Administrasi armada'
      '- Perbaikan Service request menghapus keluhan'
      ''
      '19 Juli 2016 (5.2.17.5) :'
      '- Perbaikan view kolom data armada2'
      '- Penambahan checklist Administrasi'
      
        '- Pemilihan pengambilan data semua atau ok saja pada Administras' +
        'i'
      '- Perbaikan pengambilan PKB pada Service request'
      '- Pemisahan settingan Database dan Chat Server'
      '- Perbaikan perubahan Service request'
      '- Perbaikan list Service request'
      '- Perubahan label pada pencetakan Service request'
      ''
      '14 Juli 2016 (5.2.17.1) :'
      '- Perbaikan List Uang Order'
      '- Penambahan kolom tanggal selesai pada PKB'
      '- Penanda pekerjaan selesai pada Laporan PKB'
      
        '- Penambahan kolom referensi PKB/Servis berkala pada Service Req' +
        'uest'
      ''
      '30 Juni 2016 (5.2.17.0) :'
      '- Penambahan fungsi periode tanggal pada Laporan PKB'
      '- Penambahan lebar ukuran terms-condition surat penawaran'
      '- Penambahan Laporan Service Request'
      ''
      '14 Juni 2016 (5.2.16.0) :'
      '- Pengesetan otomatis tanggal saat ini pada service request'
      '- Penambahan export pada Tracking body'
      '- Penambahan nobody pada service request'
      '- Perbaikan double input pada Service request'
      '- Perbaikan pembersihan layar Laporan Invoice keuangan Bus'
      '- Perbaikan pembersihan layar data Invoice'
      '- Penambahan modul administrasi kendaraan'
      ''
      '06 Juni 2016 (5.2.15.1) :'
      '- Perbaikan pencetakan surat jalan'
      '- Perbaikan Laporan kontinuitas armada'
      ''
      '03 Juni 2016 (5.2.15.0) :'
      '- Fitur Penguncian Penjadwalan Armada '
      '- Penambahan nomor polisi pada data kontinuitas'
      '- Perbaikan Tracking by Body'
      '- Penambahan Laporan Servis berkala'
      '- Perbaikan PKB'
      '- Pencarian data PKB'
      '- List PKB'
      '- Perubahan pencetakan Uang Order dalam kota'
      '- Penambahan fungsi menggabungkan beberapa pesanan dalam 1 '
      'invoice'
      '- Penambahan kolom tanggal jalan pada Laporan Invoice'
      ''
      '13 Mei 2016 (5.2.14.0) :'
      '- Penambahan field Jam standby pada Uang Order'
      '- Perbaikan modul servis berkala'
      '- Service Request terintegrasi dengan Servis Berkala'
      '- Service Request terintegrasi dengan PKB'
      '- Perbaikan membalas pesan'
      '- Perbaikan pencetakan IDCard'
      ''
      '2 Mei 2016 (5.2.13.2) :'
      '- Perbaikan index armada untuk penambahan baru'
      ''
      '27 April 2016 (5.2.13.1) :'
      '- Perubahan kolom dan penampilan untuk perubahan data pesanan'
      ''
      '22 April 2016 (5.2.13.0) :'
      '- Penambahan modul Kontrak untuk Rental'
      '- Penambahan modul Invoice untuk Rental'
      ''
      '18 April 2016 (5.2.12.0) :'
      
        '- Penambahan data keluarga, emergency contact dan kendaraan pada' +
        ' '
      'Form Mitra/Driver/Karyawan'
      '- Penambahan eFile(Upload berkas ke dalam Sistem) pada '
      'Mitra/Driver/Karyawan'
      '- Perubahan fleksibilitas pada image viewer'
      ''
      '14 April 2016 (5.2.11.0) :'
      '- Perbaikan Form Mitra/Driver/Karyawan'
      '- Perbaikan Menu Surat Jalan car rental'
      '- Penambahan fasilitas dokumen Mitra/Driver/Karyawan'
      '- Penambahan kolom pada hutang piutang mitra'
      ''
      '11 April 2016 (5.2.10.14) :'
      '- Perbaikan confirmation form'
      ''
      '07 April 2016 (5.2.10.13) :'
      '- Perbaikan untuk konfirmasi pesanan'
      '- Percepatan membuat SJ bus melihat semua penjadwalan'
      '- Penambahan opsi menghilangkan no halaman pada Invoice bus'
      ''
      '31 Maret 2016 (5.2.10.9):'
      '- Perbaikan Prospek dan pelanggan untuk rental'
      '- Perbaikan Service Request'
      '- Tracking By Body dapat digunakan'
      ''
      '22 Maret 2016 (5.2.10.8) :'
      
        '- Penambahan kolom tabungan laka dan insentif argo pada pendapat' +
        'an '
      'per kendaraan'
      ''
      '17 Maret 2016 (5.2.10.7) :'
      '- Perbaikan total pada slip penerimaan uang mitra'
      '- Perbaikan Slip setoran mitra'
      '- Perbaikan pengeluaran uang mitra'
      ''
      '16 Maret 2016 (5.2.10.6) : '
      '- Perbaikan tabungan laka pada slip setoran mitra'
      ''
      '10 Maret 2016 (5.2.10.5) :'
      '-Perubahan total pada slip pembayaran mitra reguler'
      ''
      '04 Maret 2016 (5.2.10.4) :'
      '- Perbaikan struktur Menu bus'
      '- Perbaikan total insentif argo pada slip setoran'
      ''
      '01 Maret 2016 (5.2.10.1) :'
      '- Perubahan komposisi Tarif Reguler'
      ''
      '27 Februari 2016 (5.2.10.0) :'
      '- Perbaikan pencarian pada Tutup PKB'
      '- Dapat mencetak invoice sesuai perusahaan'
      '- Penambahan untuk SBU Car Rental'
      ''
      '19 Februari 2015(5.2.9.1):'
      '- Perbaikan Laporan Checklist Armada'
      ''
      '19 Februari 2015(5.2.9.0) :'
      '-Penambahan Laporan Checklist Armada'
      ''
      '17 Februari 2015 (5.2.8.0) :'
      '- Penambahan Armada Car Rental'
      ''
      '16 Februari 2015 (5.2.7.0) :'
      '- Penambahan fitur pemisahan mitra reguler dan eksekutif'
      '- Penambahan kolom detail dan export ke excel pada List PKB'
      '- Perbaikan Pesanan tanpa jam ditentukan, tidak menggunakan '
      'connecting'
      '- Perbaikan Perubahan pesanan untuk batal ditandai merah'
      
        '- Pesanan batal dapat terlihat status batal ketika dibuka Pesana' +
        'n nya'
      ''
      '02 Februari 2015 (5.2.6.0) :'
      '- Penambahan Laporan Pesanan '
      '- Penambahan Laporan Update Pesanan perHari'
      ''
      '29 Januari 2015 (5.2.5.2) :'
      '- Penambahan total pada laporan invoice'
      ''
      '28 Januari 2015 (5.2.5.1) :'
      '- Perbaikan posisi pencetakan Surat Jalan Bus'
      '- Penambahan Tambahan uang order'
      '- Perbaikan kolom rasio bbm pada laporan uang order'
      ''
      '21 Januari 2015 (5.2.4.2) :'
      '- Perbaikan posisi pencetakan Surat Jalan Bus'
      ''
      '20 Januari 2015 (5.2.4.1) :'
      '- Perubahan surat jalan bus menjadi continous form'
      ''
      '18 Januari 2015 (5.2.4.0) :'
      '- Penambahan Kolom Tanggal pada Laporan pengeluaran perArmada'
      ''
      '14 Januari 2015 (5.2.3.1) :'
      '- Perbaikan Uang order'
      '- Perbaikan Pesanan atas Surat Jalan'
      ''
      '13 Januari 2015 (5.2.3.0) :'
      '- Penambahan kolom Alias untuk customer'
      ''
      '12 Januari 2015 (5.2.2.3) :'
      '- Perbaikan kolom keterangan kontrak'
      '- Perbaikan nomor kontrak'
      ''
      '11 Januari 2015 (5.2.2.1) :'
      '- Perbaikan laporan aktifitas harian armada'
      ''
      '07 Januari 2015 (5.2.2.0) :'
      '- Perbaikan PKB penambahan detail'
      '- Perbaikan Aktifitas Armada'
      '- Penambahan fungsi tanggal sampai pada Laporan uang order '
      'operasional'
      '- Perubahan pengiriman dan penerimaan pesan'
      ''
      '05 Januari 2015 (5.2.1.0) :'
      
        '- Nama perusahaan pada surat konfirmasi dan surat penawaran beru' +
        'bah '
      'sesuai perusahaan'
      '- Perbaikan Armada kembali, penambahan kolom tol dan parkir'
      '- Penambahan kolom kelebihan pemakaian hari pada kontrak'
      '- Pengisian jumlah rupiah BBM pada order fee'
      ''
      '31 Desember 2015 (5.2.0.2) :'
      '- Perbaikan penarikan pesanan online dari web'
      '- Perbaikan penanggalan Laporan pesanan batal'
      ''
      '30 Desember 2015 (5.2.0.0) :'
      '- Perubahan model Pencetakan Confirmation Form'
      '- Perubahan model Pencetakan Offering Letter'
      '- Penambahan Modul Penarikan pesanan Online dari Web'
      '- Penambahan fungsi tanggal sampai pada Aktifitas harian Armada'
      
        '- Penambahan fungsi Cek List perlengkapan pada Armada Keluar dan' +
        ' '
      'Armada Kembali'
      ''
      '18 Desember 2015 (5.1.5.3) :'
      '- Perbaikan Form detail Armada'
      '- Perbaikan Laporan kontinuitas '
      '- Perbaikan Laporan aktifitas'
      '- Perbaikan Laporan penjuala bulanan'
      '- Perbaikan Laporan Invoice'
      '- Perbaikan Invoice Bus'
      '- Perbaikan Penerimaan Pembayaran Bus'
      '- Perbaikan Surat penawaran'
      '- Perbaikan prospek'
      '- Perbaikan Kontrak'
      ''
      '17 Desember 2015 (5.1.5.1) :'
      '- Penambahan Form group pekerjaan'
      '- Penambahan Form servis berkala'
      '- Perbaikan Form detail Armada'
      ''
      '15 Desember 2015 (5.1.4.0) :'
      '- Laporan Armada Taxi batal jalan'
      ''
      '10 Desember 2015 (5.1.3.5) :'
      '- Perubahan struktur menu'
      '- Perubahan kolom hutang piutang mitra/ex mitra taxi'
      ''
      '07 Desember 2015 (5.1.3.2) :'
      '- Perbaikan penjadwalan per running days'
      ''
      '04 Desember 2015 (5.1.3.1) :'
      '- Penambahan modul jenis armada'
      '- Penambahan modul blueprint armada'
      '- Perbaikan query penjadwalan'
      ''
      '30 November 2015 (5.1.2.1) :'
      '- Perbaikan list data untuk seluruh invoice'
      ''
      '27 November 2015 (5.1.2.0) :'
      '- Running Days dapat melihat perbaikan/kerusakan'
      '- Perubahan penjadwalan melalui running days'
      ''
      '23 November 2015 (5.1.0.3) :'
      '- Perbaikan List Data driver'
      '- Perbaikan List Driver pada Penjadwalan'
      '- Perbaikan penanggalan Gregorian'
      ''
      '18 November 2015 (5.1.0.0) :'
      '- Perbaikan List Armada'
      '- Regional setting bebas ( tidak perlu indonesia )'
      ''
      '17 November 2015 (5.0.2.16) :'
      '- Perbaikan Mitra blacklist bisa di keluarkan'
      ''
      '05 November 2015 (5.0.2.15) :'
      
        '- Pencetakan surat jalan bus melalui laporan pengeluaran perarma' +
        'da '
      'atau laporan uang order'
      '- Perbaikan total customer pada data customer'
      '- Pemisahan customer per perusahaan'
      '- Perbaikan penyimpanan pada tanggal Tutup PKB '
      '- Perbaikan running days mini dan running days '
      ''
      '04 November 2015 (5.0.2.11) :'
      '- Perbaikan slip setoran pada pencatatan fixed rate'
      
        '- Perbaikan total pada Laporan penjualan bulanan per armada jala' +
        'n bus'
      ''
      '02 November 2015 (5.0.2.10) :'
      '- BBM tunai pada slip setoran mitra selalu aktif'
      '- Perubahan form Uang Order Harian'
      ''
      '28 Oktober 2015 (5.0.2.6) :'
      
        '- Perbaikan Armada kembali tanggal masuk tidak boleh lebih kecil' +
        ' dari '
      'tanggal keluar'
      ''
      '27 Oktober 2015 (5.0.2.5):'
      
        '- Perbaikan persentase running days mini dan normal untuk armada' +
        ' tidak '
      'jalan'
      ''
      '23 Oktober 2015 (5.0.2.4) :'
      '- Perbaikan perpindahan keystroke enter pada Jadwal'
      ''
      '21 Oktober 2015 (5.0.2.3) :'
      '- Perbaikan untuk support Windows 10 Time Format'
      '- Perbaikan penyimpanan drop fixedrate baru'
      ''
      '16 Oktober 2015 (5.0.2.2) :'
      '- Perbaikan perekaman perubahan data mitra reguler dan eksekutif'
      ''
      '13 Oktober 2015 (5.0.2.1) :'
      '- Perbaikan Data Riwayat Daftar hitam'
      ''
      '06 Oktober 2015 (5.0.2.0) :'
      '- Perbaikan Form Armada ( Input dan detail )'
      '- Penginputan uang order kembali menganulir yg lama'
      '- Pembesaran kolom titik penjemputan pada uang order'
      '- Perbaikan List Armada untuk group'
      '- Log File Purging'
      ''
      '02 Oktober 2015 (5.0.1.1) :'
      '- Perbaikan Pesanan untuk perubahan/pengurangan pesanan'
      '- Perbaikan Slip setoran mitra setelah dibersikan'
      ''
      '01 Oktober 2015 (5.0.1.0) :'
      '- Penambahan perhitungan slip setoran untuk fixed rate baru'
      ''
      '30 September 2015 (5.0.0.4) :'
      '- Penambahan Kolom fixed rate pada SPJ'
      ''
      '29 September 2015 (5.0.0.2) :'
      '- Validasi jam Pengisian pesanan bus'
      '- Uang order dapat perbaikan mengosongkan BBM setelah terinput'
      '- Perbaikan perubahan data mitra/driver pada shift'
      '- Perbaikan pilihan data mitra reguler/eksekutif'
      ''
      '26 September 2015 (5.0.0.1) :'
      
        '- Perbaikan surat jalan buss untuk yg mau dibatalkan penjadwalan' +
        ' nya'
      ''
      '25 September 2015 (5.0.0.0) :'
      
        '- Keluaran terbaru WHAps dengan versi update file lebih kecil da' +
        'n lebih '
      'cepat'
      ''
      '22 September 2015 (4.0.3.18) :'
      '- Perbaikan fee bermalam perubahan uang order'
      '- Perubahan form pencetakan uang order bermalam'
      ''
      '16 September 2015 (4.0.3.16) :'
      '- Penambahan kolom insentif argo pada laporan pendapatan per '
      'kendaraan'
      
        '- Data Mitra blacklist diberi warna dan tidak bisa di daftarkan ' +
        'kembali'
      ''
      '12 September 2015 (4.0.3.15) :'
      '- Perbaikan penyimpanan perubahan data armada'
      ''
      '09 September 2015 (4.0.3.14) :'
      '- Perbaikan armada kembali'
      ''
      '08 September 2015 (4.0.3.13) :'
      '- Perbaikan perubahan pesanan'
      ''
      '07 September 2015 (4.0.3.12) :'
      '- Riwayat Driver dapat digunakan'
      '- Penambahan penjadwalan dapat menggabungkan hari'
      ''
      '03 September 2015 (4.0.3.11) :'
      '- Perbaikan ukuran laporan penjualan harian per armada jalan'
      ''
      '02 September 2015 (4.0.3.9) :'
      '- Perbaikan batangan pada running days mini'
      '- Perbaikan batangan pada running days'
      ''
      '27 Agustus 2015 (4.0.3.8) :'
      '- Perbaikan Riwayat mitra/driver'
      '- Perbaikan input/perubahan data kendaraan'
      '- Perbaikan list pesanan'
      '- Perbaikan list kendaraan pada pemilihan penjadwalan'
      '- Perbaikan input harga produk'
      ''
      '24 Agustus 2015 (4.0.3.7) :'
      
        '- Perubahan kecepatan tampilan modul kendaraan keluar pada SJ Bu' +
        's '
      'dan Checker'
      '- Perbaikan uang order paket harian'
      ''
      '21 Agustus 2015 (4.0.3.3) :'
      
        '- Penambahan kolom insentif rasio bbm pada pendapatan per kendar' +
        'aan'
      
        '- Penambahan opsi mitra keluar dan nonaktif ditampilkan pada lap' +
        'oran '
      'argo bulanan'
      ''
      '20 Agustus 2015 (4.0.3.1) :'
      '- Penambahan Modul Perlengkapan Armada'
      '- Perbaikan total discount per baris pada  Pesanan'
      ''
      '13 Agustus 2015 (4.0.2.15) :'
      '- Perbaikan Laporan pengeluaran per Armada'
      ''
      '11 Agustus 2015 (4.0.2.13) :'
      '- Perbaikan perpanjangan KPP'
      ''
      '06 Agustus 2015 (4.0.2.12) :'
      '- Perbaikan Penutupan PKB Bus'
      '- Perbaikan Buka PKB Bus'
      ''
      '04 Agustus 2015 (4.0.2.6) :'
      '- Perbaikan penambahan penjadwalan'
      ''
      '31 Juli 2015 (4.0.2.3) :'
      '- Perbaikan menu'
      ''
      '30 Juli 2015 (4.0.2.2) :'
      '- Perbaikan Laporan penjualan harian per armada jalan'
      ''
      '29 Juli 2015 (4.0.2.1) :'
      '- Penambahan blacklist pelanggan'
      ''
      '23 Juli 2015 (4.0.2.0) :'
      '- Penambahan Running Days Driver Bus'
      '- Penambahan Master Busboy'
      ''
      '15 Juli 2015 (4.0.1.4) : '
      '- Perbaikan perubahan uang order'
      '- Penambahan kolom kontrak pada laporan pengeluaran perArmada'
      ''
      '10 Juli 2015 (4.0.1.2) :'
      '- Perbaikan running days'
      '- Perubahan tanggal pada penjadwalan di tiadakan '
      ''
      '07 Juli 2015 (4.0.1.0) :'
      '- Perbaikan Laporan penjualan bulanan perarmada jalan'
      
        '- Penambahan coding warna, dan pilihan shift para Laporan pendap' +
        'atan '
      'perarmada'
      '- Penambahan tgl pencetakan pada form reservasi'
      '- Perbaikan input armada nomor polisi dgn 2 huruf awal'
      ''
      '06 Juli 2015 (4.0.0.1) :'
      '- Perbaikan perubahan data surat jalan bus'
      ''
      '01 Juli 2015 (4.0.0.0) :'
      '- Peningkatan keamanan dan proteksi menu'
      ''
      '29 Juni 2015 (3.5.4.2) :'
      '- Perbaikan pengambilan data dari Surat penawaran ke Pesanan'
      ''
      '19 Juni 2015 (3.5.4.1) :'
      '- Perubahan nomor hotline sales bus'
      ''
      '16 Juni 2015 (3.5.4.0) : '
      '- Penambahan List Numerator'
      ''
      '10 Juni 2015 (3.5.3.7) : '
      '- Perbaikan Pesanan'
      ''
      '08 Juni 2015 (3.5.3.6) :'
      '- Perbaikan laporan aktifitas harian'
      ''
      '04 Juni 2015 (3.5.3.5) :'
      '- Perbaikan Data pesanan dan mempercepat tampilan'
      '- Perbaikan Data invoice mempercepat tampilan'
      '- Perbaikan Data penjadwalan mempercepat tampilan'
      
        '- Perubahan pencarian dengan menggunakan tombol atau tekan enter' +
        ' '
      'untuk pesanan, invoice dan pejadwalan'
      '- Perbaikan pencarian customer dengan tombol atau tekan enter'
      ''
      '03 Juni 2015 (3.5.3.2) :'
      '- Perbaikan pencetakan Confirmation Form'
      '- Penambahan kolom rute pada aktifias harian armada'
      ''
      '01 Juni 2015 (3.5.3.0) :'
      '- Penambahan Laporan Data Invoice'
      ''
      '28 Mei 2015 (3.5.2.14) :'
      '- Perbaikan pencetkan Confirmation form'
      '- Penambahan Laporan Aktifitas Harian Armada'
      '- Perbaikan Counter reservasi'
      '- Penambahan nomor kontrak pada Laporan Penjualan'
      ''
      '27 Mei 2015 (3.5.2.10) :'
      '- Penambahan Tambahan penjadwalah'
      ''
      '26 Mei 2015 (3.5.2.8) :'
      '- Perubahan SJ dapat dibuka beberapa form'
      '- Penambahan pengaktifan kembali pesanan batal'
      '- Perbaikan otorisasi invoice'
      ''
      '22 Mei 2015 (3.5.2.6) :'
      '- Perbaikan invoice bus'
      ''
      '21 Mei 2015 (3.5.2.5) :'
      '- Perbaikan PKB'
      '- Perbaikan Surat Jalan Bus'
      ''
      '20 Mei 2015 (3.5.2.3) :'
      '- Penambahan tanggal sampai pada integrate penjualan bus'
      '- Perbaikan pembatalan surat jalan'
      ''
      '19 Mei 2015 (3.5.2.2) :'
      '- Perbaikan Running days'
      '- Penambahan Running Days mini'
      ''
      '13 Mei 2015 (3.5.1.9) :'
      '- Perbaikan Perubahan harga pesanan'
      ''
      '6 Mei 2015 (3.5.1.6) :'
      '- Penambahan click para laporan rekap penjualan tahunan'
      '- Perbaikan Laporan kontinuitas perArmada'
      ''
      '5 Mei 2015 (3.5.1.3) :'
      '- Penambahan Laporan kontinuitas perArmada'
      ''
      '1 Mei 2015 (3.5.1.2) :'
      '- Perbaikan Slip Setoran Mitra'
      ''
      '30 April 2015 (3.5.1.1) :'
      '- Penambahan kolom pada Integrate GP Bus'
      '- Dapat memodifikasi jam pada surat jalan'
      '- Dapat memodifikasi jam pada penjadwalan'
      '- Perbaikan timeout command query'
      ''
      '27 April 2015 (3.5.0.18) :'
      '- Perbaikan input numerator invoice bus'
      ''
      '24 April 2015 (3.5.0.17) :'
      '- Penambahan Numerator pada Invoice Bus'
      '- Perbaikan pencetakan Form Reservasi melalui pesanan'
      ''
      '23 April 2015 (3.5.0.16) :'
      '- Penambahan total pada daftar penjadwalan'
      ''
      '22 April 2015 (3.5.0.15) :'
      '- Perbaikan Penjadwalan'
      ''
      '10 April 2015 (3.5.0.14) :'
      '- Penambahan melihat semua surat jalan yg keluar'
      ''
      '9 April 2015 (3.5.0.13) :'
      '- Perbaikan Form Armada'
      ''
      '8 April 2015 (3.5.0.12) : '
      '- Perbaikan pembuatan kembali invoice void dan pencetakan biaya '
      'tambahan'
      ''
      '2 April 2015 (3.5.0.9) :'
      '- Perbaikan pembatalan invoice'
      '- Perbaikan korelasi additional driver  dan additional days'
      '- Perbaikan perubahan harga pesanan'
      '- Perbaikan Integrasi Sales Bus'
      ''
      '1 April 2015 (3.5.0.5) :'
      '- Perbaikan pencetakan total Invoice'
      '- Perbaikan tanggal dan nomor invoice'
      '- Perbaikan perubahan pesanan tanpa penjadwalan'
      '- Perbaikan input keterangan pada invoice'
      ''
      '31 Maret 2015 (3.5.0.0) :'
      '- Pemesanan dapat langsung melakukan penjadwalan'
      '- Penambahan segment level 3 pada customer'
      '- Perbaikan invoice untuk penambahan hari'
      '- Perbaikan invoice footer hanya pada halaman terakhir'
      '- Perbaikan integrasi gp penjualan bus untuk discount'
      '- Penambahan rekap laporan tahunan penjualan bus'
      
        '- Perbaikan confirmation form untuk service charge + additional ' +
        'day'
      '- Perbaikan invoice bus tanggal lewat bulan'
      ''
      '11 Maret 2015 (3.4.1.33) :'
      '- Perbaikan pencetakan invoice baru'
      '- Perbaikan armada keluar'
      '- Perbaikan armada masuk'
      ''
      '10 Maret 2015 (3.4.1.31) :'
      '- Perbaikan uang order'
      '- Perbaikan laporan pengeluaran armada jalan'
      '- Perbaikan laporan uang harian '
      ''
      '09 Maret 2015 (3.4.1.30) :'
      '- Pencatatan km odo dipindah ke uang order'
      '- Integrate penjualan bus berdasarkan tanggal pembuatan invoice'
      '- Perbaikan uang order'
      ''
      '05 Maret 2015 (3.4.1.28) :'
      '- Penambahan extention pada data pelanggan'
      '- Perbaikan pembuatan invoice'
      ''
      '04 Maret 2015 (3.4.1.27) :'
      '- Penambahan kolom customer id dan total pada data pelanggan'
      ''
      '04 Maret 2015 (3.4.1.25) :'
      '- Perbaikan form pelanggan'
      '- Penambahan kolom ketertangan pada laporan uang order'
      '- Perubahan penanggalan invoice bus'
      '- Perbaikan pencetakan invoice bus'
      ''
      '02 Maret 2015 (3.4.1.23) :'
      '- Perbaikan integrasi sales bus'
      ''
      '27 Februari 2015 (3.4.1.22) :'
      '- Perbaikan daftar harga produk'
      '- Perbaikan perhitungan subsidi pada slip setoran'
      ''
      '26 Februari 2015 (3.4.1.20) :'
      '- Penambahan customer id GP pada Laporan bulanan'
      '- Perbaikan Pesanan'
      ''
      '13 Februari 2015 (3.4.1.19) :'
      '- Perbaikan pencetakan SPPB'
      ''
      '12 Februari 2015 (3.4.1.18) :'
      '- Penambahan pilihan termasuk blm lunas dan sudah ada SJ di '
      'penjadwalan'
      '- Perbaikan ukuran kertas pada SPPB'
      '- Penambahan pilihan berdasarkan tgl jalan pada pesanan'
      '- Penambahan pilihan otomatis pada penjadwalan '
      ''
      '06 Februari 2015 (3.4.1.17)'
      '- Perbaikan rubah uang order'
      ''
      '05 Februari 2015 (3.4.1.15) :'
      '- Penambahan SPPB untuk bus'
      '- Perbaikan uang order paket'
      ''
      '04 Februari 2015 (3.4.1.12) :'
      '- Perbaikan uang order untuk metode pencarian'
      '- Perbaikan input uang order pengemudi'
      '- Perubahan posisi no order pada surat jalan bus'
      '- Perbaikan pencarian pada laporan penjualan bulanan perArmada'
      ''
      '03 Februari 2015 (3.4.1.9) :'
      '- Perbaikan Armada keluar untuk input bahan bakar setelah'
      '- Perbaikan Armada  kembali untuk input bahan bakal setelah'
      
        '- Perbaikan Laporan pengeluaran perArmada untuk input bahan baka' +
        'r '
      'setelah'
      '- Perbaikan Laporan Uang order harian'
      ''
      '02 Februari 2015 (3.4.1.6) :'
      
        '- Perbaikan perubahan uang order untuk modul bahan bakar input d' +
        'i '
      'checker'
      ''
      '30 Januari 2015 (3.4.1.5) :'
      '- Perbaikan list penjadwalan pada pembuatan surat jalan'
      '- Penambahan filter tanggal pada penjadwalan'
      ''
      '29 Januari 2015 (3.4.1.4):'
      '- Penambahan export to Excel untuk Pelanggan'
      ''
      '28 Januari 2015 (3.4.1.3) :'
      '- Perubahan modul uang order nominal bbm dapat input kosong'
      '- Penambahan jadwal dari data order diurut berdasarkan tanggal '
      'berangkat'
      '- Perbaikan Modul slip setoran Insentif >=n menjadi >n'
      '- Perbaikan simpan pada rubah data pengemudi '
      
        '- Penambahan SJ bus dari penjadwalan diperkecil range dan diurut' +
        ' '
      'tanggal berangkat'
      ''
      '24 Januari 2015 (3.4.1.2) :'
      '- Perbaikan input armada kembali'
      ''
      '23 Januari 2015 (3.4.1.1) :'
      '- Penambahan modul paket pada surat penawaran '
      '- Perbaikan pengambilan surat penawaran dari pesanan'
      '- Perbaikan kolom diskon pada perubahan harga pesanan '
      '- Perbaikan pencarian harga bahan bakar pada slip setoran'
      '- Perbaikan pencarian harga bahan bakar pada uang order'
      
        '- Perbaikan pencarian harga bahan bakar pada penambahan uang ord' +
        'er'
      '- Perbaikan penjadwalan'
      '- Penambahan kolom solar pada armada kembali'
      ''
      '13 Januari 2015 (3.4.1.0) :'
      '- Penambahan modul paket dan penambahan harga per hari'
      '- Perbaikan Integrasi penjualan bus'
      '- Perbaikan payment term pada kontrak'
      '- Perbaikan mekanisme harga pada slip setoran'
      '- Perbaikan input pembayaran KS'
      '- Perbaikan data penjualan harian'
      '- Perbaikan data penjualan harian perArmada'
      '- Perbaikan data penjualan bulanan'
      '- Perbaikan penambahan paket harga'
      '- Perbaikan penampilan kontrak'
      ''
      '24 Desember 2014 (3.4.0.6) :'
      '- Perbaikan SJ Bus Paket'
      ''
      '23 Desember 2014 (3.4.0.5) :'
      '- Perbaikan slip setoran mitra'
      ''
      '22 Desember 2014 (3.4.0.4) :'
      '- Perbaikan slip setoran mitra'
      ''
      '20 Desember 2014 (3.4.0.3)'
      '- Perbaikan slip setoran mitra'
      ''
      '19 Desember 2014 (3.4.0.2) :'
      '- Perbaikan slip setoran mitra'
      ''
      '17 Desember 2014 (3.4.0.1) :'
      '- Perbaikan slip setoran mitra'
      ''
      '17 Desember 2014 (3.4.0.0) :'
      '- Perbaikan slip setoran nilai argo Kotor'
      '- Perbaikan penyimpanan slip setoran'
      '- Perbaikan slip setoran untuk SPJ batal jalan'
      ''
      '16 Desember 2014 (3.3..0.1) :'
      '- Perbaikan Operasi kembali mitra'
      '- Perbaikan nilai komisi slip setoran yg tertera'
      ''
      '16 Desember 2014 (3.3.0.0) :'
      '- Penambahan tahan SPJ untuk Setoran argo minimum Taxi'
      
        '- Penambahan perhitungan argo kotor berdasarkan selisih fixed ra' +
        'te'
      '- Penambahan modul SJ Service Bus'
      '- Perbaikan slip setoran untuk otomatis kalkulasi rasio bbm '
      '- Perbaikan pencetakan slip setoran Taxi'
      '- Penambahan produk biaya per-hari tambahan untuk produk Bus'
      '- Penambahan hari per paket untuk produk Bus'
      ''
      '9 Desember 2014 (3.2.0.2) :'
      '- Penambahan Model perhitungan untuk BBM'
      ''
      '5 Desember 2014 (3.1.3.3) :'
      '- Perubahan SJ Bus'
      ''
      '4 Desember 2014 (3.1.2.1) :'
      '- Perbaikan Slip Setoran Mitra'
      '- Perbaikan SJ Bus'
      ''
      '3 Desember 2014 (3.1.2.0) :'
      '- Penambahan Modul BBM Produk'
      '- Penambahan tujuan pada Surat Jalan Bus'
      '- Penambahan BBM Produk pada Laporan Pengeluaran perArmada'
      ''
      '1 Desember 2014 (3.1.1.1):'
      '- Perbaikan total Surat Penawaran'
      '- Penambahan fitur HotKey baru'
      '- Penambahan modul Produk detail (Paket BBM)'
      '- Penambahan alasan perubahan armada pada Penjadwalan'
      ''
      '28 November 2014 (3.1.1.0):'
      '- Perbaikan model dan metode koneksi database'
      '- Panambahan fitur koneksi database manual'
      ''
      '27 November 2014 (3.1.0.0):'
      '- Perbaikan pencetakan surat penawaran'
      '- Perbaikan pencetakan surat konfirmasi'
      '- Perbaikan pengecekan koneksi database'
      ''
      '26 November 2014 (3.0.0.0) :'
      '- WHAps hanya dapat dijalankan 1 Aplikasi'
      '- Penambahan Event Logging'
      '- Perbaikan Form Mitra'
      ''
      '25 November 2014 (2.1.2.2) :'
      '- Perbaikan Pesanan untuk perubahan produk harga lama'
      '- Perbaikan Penawaran untuk perubahan produk harga lama'
      '- Penambahan kolom Jam, KM, dan Rasio pada Laporan Uang Order '
      'Harian'
      '- Perbaikan Laporan Pengeluaran perArmada'
      ''
      '24 November 2014 (2.1.2.1) :'
      '- Perbaikan Laporan Uang Order Driver Harian'
      '- Perbaikan Laporan Pengeluaran perKendaraan'
      '- Perbaikan Pengeluaran Biaya/Kas Taxi'
      ''
      '21 November 2014 (2.1.2.0) :'
      '- Penambahan Laporan Uang Order Driver Harian'
      '- Perbaikan Laporan Pengeluaran Per Kendaraan'
      '- Perbaikan Perubahan Surat Jalan Bus'
      ''
      '20 November 2014 (2.1.1.2) :'
      '- Penambahan kolom tanggal pada Armada Keluar'
      '- Perbaikan Armada Keluar'
      '- Penambahan Export to Excel pada Data SJ Bus'
      '- Perbaikan Perubahan Uang Order'
      ''
      '19 November 2014 (2.1.1.1) :'
      '- Penambahan info pelunasan pada Laporan Armada Jalan perHari'
      
        '- Penambahan nominal Invoice pada Laporan Pengeluaran PerKendara' +
        'an'
      '- Perbaikan perubahan Surat Jalan Bus'
      ''
      '18 November 2014 (2.1.1.0) :'
      '- Penambahan color coded pada Running Days Bus'
      '- Perbaikan dan percepatan Pengeluaran Biaya/Kas'
      ''
      '15 November 2014 (2.1.0.5) :'
      '- Perbaikan Uang order'
      ''
      '14 November 2014 (2.1.0.4) :'
      '- Perbaikan Update data Mitra'
      '- Perbaikan Surat Jalan Bus paket'
      '- Perbaikan Uang Order Bus paket'
      ''
      '12 November 2014 (2.1.0.3) :'
      '- Perbaikan Pesanan untuk perubahan harga pesanan '
      '- Penambahan menyimpan foto ke file'
      '- Perbaikan double klik pada foto '
      '- Penambahan tanda tangan pada Penawaran'
      ''
      '11 November 2014 (2.1.0.2) :'
      '- Penambahan melihat pesanan batal'
      '- Mempercepat tampilan pencetakan ulang Uang Order'
      '- Fasilitas pencarian pada daftar Surat Jalan'
      '- Perbaikan tanda tangan dan stempel pada Form Konfirmasi'
      ''
      '10 November 2014 (2.1.0.1) :'
      '- Perbaikan pemilihan kontak dengan alamat blank'
      ''
      '07 November 2014 (2.1.0.0) :'
      '- Penambahan fungsi dan input tanda tangan'
      '- Perbaikan Integrate GP Bus'
      '- Perbaikan tampilan JetBus dan VIP'
      '- Perbaikan Biaya Tambahan/Layanan pada Pesanan dan Surat '
      'Penawaran'
      ''
      '06 November 2014 (2.0.1.1) :'
      '- Perbaikan Pembayaran/Pengeluaran Kas Taxi'
      ''
      '05 November 2014 (2.0.1.0) :'
      '- Perbaikan dan percepatan penarikan data untuk Surat Jalan Bus'
      '- Percepatan penampilan Surat Jalan Bus'
      ''
      '04 November 2014 (2.0.0.0) :'
      '- Support SQLNCLI versi 10.1 dan 11 '
      '- Perbaikan Surat Penawaran untuk pergantian tahun'
      ''
      '03 November 2014 (1.3.5.19) :'
      '- Perbaikan Laporan Pendapatan Armada Harian'
      '- Perbaikan Penghasilan Mitra pada Slip setoran'
      ''
      '29 Oktober 2014 (1.3.5.18) :'
      '- Perbaikan Running Days Bus'
      ''
      '24 Oktober 2014 (1.3.5.17) :'
      
        '- Perbaikan no invoice pada Laporan Penjualan Harian perArmada J' +
        'alan'
      '- Perbaikan Interate GP Sales Bus'
      ''
      '23 Oktober 2014 (1.3.5.16) :'
      '- Perbaikan penutupan SPB Service'
      ''
      '21 Oktober 2014 (1.3.5.15) :'
      '- Perbaikan C.O.A pada Intergarasi Sales Bus'
      
        '- Perbaikan peningkatan digit Total Penjualan per Armada Jalan B' +
        'ulanan '
      'Bus'
      ''
      '20 Oktober 2014 (1.3.5.14) : '
      '- Perbaikan Integrasi Sales Bus'
      
        '- Perbaikan pencetakan invoice tanggal Invoice mengikuti tanggal' +
        ' '
      'penggunaan'
      ''
      '17 Oktober 2014 (1.3.5.13) :'
      '- Perbaikan pembatalan Pesanan'
      '- Perbaikan input tanggal pada Perubahan Harga Pesanan'
      '- Laporan Hutang/Piutang exMitra bisa melihat ke Pool Lain'
      '- Laporan Argo exMitra bisa melihat ke Pool Lain'
      ''
      '16 Oktober 2014 (1.3.5.12) :'
      '- Perbaikan pada Perubahan Harga Pesanan'
      ''
      '15 Oktober 2014 (1.3.5.11) :'
      '- Perbaikan Pencetakan urutan tanggal pada Form Konfirmasi'
      ''
      '14 Oktober 2014 (1.3.5.10) :'
      '- Perbaikan Laporan Kondite Mitra'
      '- Perbaikan perhitungan discount persentase pada invoice'
      ''
      '13 Oktober 2014 (1.3.5.9) :'
      '- Perbaikan nama group pada Invoice'
      ''
      '10 Oktober 2014 (1.3.5.8) :'
      '- Perbaikan pemilihan discount pada Pesanan'
      ''
      '9 Oktober 2014 (1.3.5.7) :'
      '- Perbaikan Rubah Harga Pesanan '
      ''
      '8 Oktober 2014 (1.3.5.6) :'
      '- Perbaikan nominal subtotal untuk pencetakan invoice'
      '- Penambahan Logo pada pencetakan Penerimaan pembayaran'
      ''
      '7 Oktober 2014 (1.3.5.5) :'
      '- Penambahan Laporan Kondite Mitra'
      ''
      '6 Oktober 2014 (1.3.5.3) : '
      '- Penambahan Cetakan Training Layanan Prima pada SPJ Taxi'
      '- Perbaikan pada penambahan Riwayat Mitra/Karyawan'
      ''
      '3 Oktober 2014 (1.3.5.2) :'
      
        '- Perubahan Reservation Confirmation Form menjadi Confirmation F' +
        'orm'
      '- Perubahan Kwitansi/Tanda Terima menjadi Payment Receipt'
      '- Untuk pembayaran Bus melalu iATM memasukkan no validasi'
      '- Untuk pembayaran Bus melalui Transfer memasukkan Nama Rekening'
      ''
      '2 Oktober 2014 (1.3.5.1) :'
      
        '- Daftar riwayat yg buruk berwarna merah, peningkatan berwarna h' +
        'ijau'
      '- Pernambahan cetakan invoice bus untuk detail perjalanan'
      
        '- Penambahan Form Reservasi Permintaan Khusus di bold tidak tamp' +
        'il di '
      'Form Konfirmasi'
      '- Perbaikan invoice bus'
      ''
      '1 Oktober 2014 (1.3.5.0) :'
      '- Satu Pesanan hanya satu nomor Invoice'
      '- Invoice yg direvisi ditandai R(x)'
      '- Tanda Terima pembayaran ditambahkan Kwitansi'
      '- Penambahan Modul Cetak Ulang Kwitansi'
      '- Perbaikan melihat Data Invoice'
      ''
      '30 September 2014 (1.3.4.0) :'
      '- Penambahan Komisi per Mitra'
      '- Penambahan Insentif perKomisi '
      '- Perbaikan perhitungan Pendapatan Mitra untuk Komisi 50%'
      '- Pencetakan Invoice bus model lama'
      ''
      '29 September 2014 (1.3.3.2) :'
      '- Perbaikan Form Penjadwalan untuk paket'
      '- Armada Keluar bisa merubah kilometer'
      '- Armada Keluar bisa melakukan pencarian'
      '- Armada Kembali bisa melakukan pencarian'
      '- Data Mitra baru untuk tanggal lahir kosong dapat ditampilkan'
      ''
      '26 September 2014 (1.3.3.1) :'
      '- Perbaikan Penjadwalan'
      ''
      '25 September 2014 (1.3.3.0) :'
      '- Perubahan Registry WHAps'
      ''
      '24 September 2014 (1.3.2.1) :'
      '- Perbaikan penyimpanan Penjadwalan paket'
      ''
      '23 September 2014 (1.3.2.0) :'
      '- Perbaikan perhitungan Pesanan untuk pergantian tahun'
      ''
      '22 September 2014 (1.3.1.11) :'
      '- Perbaikan pencetakan Form Reservasi untuk diatas 16 baris'
      ''
      '19 September 2014 (1.3.1.10) :'
      '- Penaktifan Modul perubahan Armada Bus'
      '- Pada Rubah harga Pesanan dapat merubah total unit'
      ''
      '18 September 2014 (1.3.1.9) :'
      
        '- Saat Perbaikan Pesanan untuk discount yg sudah diisi tidak oto' +
        'risasi '
      'lagi'
      
        '- Saat Perbaikan Penawaran untuk discount yg sudah diisi tidak o' +
        'torisasi '
      'lagi'
      ''
      '17 September 2014 (1.3.1.8) :'
      '- Pesanan dapat dirubah oleh Atasan beda departemen'
      '- Perbaikan Integrasi GP Penjualan Bus'
      ''
      '16 September 2014 (1.3.1.7) :'
      '- Perubahan ukuran catatan pada Form Konfirmasi'
      ''
      '14 September 2014 (1.3.1.6) :'
      '- Perbaikan Slip setoram Mitra'
      '- Perbaikan SJ Bus Paket'
      '- Perbaikan kecepatan tampilan Laporan Bulanan Bus'
      ''
      '12 September 2014 (1.3.1.6) :'
      '- Perbaikan Laporan Harian perArmada Jalan'
      '- Perbaikan kecepatan refresh Slip Setoran Mitra'
      ''
      '9 September 2014 (1.3.1.5) :'
      '- Perbaikan Pencetakan Form Reservasi untuk total unit diatas 16'
      
        '- Perbaikan Pencetakan Form Konfirmasi untuk total unit diatas 1' +
        '2'
      ''
      '8 September 2014 (1.3.1.5) :'
      '- Perbaikan Laporan Sales Penjualan Harian perArmada Jalan'
      '- Perbaikan perubahan Pesanan, perbaikan kolom yg ditampilkan'
      ''
      '5 September 2014 (1.3.0.4) :'
      '- Perubahan ukuran font Pada cetakan Uang order bus'
      '- Perbaikan Check keluar untuk pickup-point yg kosong'
      '- Perbaikan pencetakan Form Reservasi pada Pesanan'
      
        '- Perbaikan modul Rubah harga pesanan tidak bisa merubah yg suda' +
        'h '
      'dijadwalkan'
      ''
      '2 September 2014 (1.3.0.3) :'
      '- Penambahan Modul pencetakan Invoice tetap pada Invoice'
      ''
      '1 September 2014 (1.3.0.2) :'
      '- Penambahan modul Perubahan Harga pada Pesanan'
      '- Perbaikan pencetakan Uang Order (font bold)'
      '- Panambahan modul Invoice tetap pada Kontrak'
      ''
      '29 Agustus 2014 (1.3.0.1) :'
      '- Penambahan pencetakan Form Reservasi pada Pesanan'
      '- Perbaikan Form Pesanan untuk data Kontrak yg ditampilkan'
      
        '- Perubahan perhitungan Tol-Parkir dan Bermalam untuk perjalanan' +
        ' lebih '
      'dari 1 hari'
      '- Perbaikan tampilan pada Running Day Bus'
      ''
      '28 Agustus 2014 (1.3.0.0) :'
      '- Perbaikan Laporan Running Days Bus'
      '- Perbaikan Daftar Armada'
      '- Perbaikan Model versi WHAps'
      '- Perbaikan pemilihan data kendaraan pada Penjadwalan Bus'
      '- Perbaikan pencetakan slip Uang Order harian'
      ''
      '27 Agustus 2014 (1.2.11.0) :'
      '- Penambahan Integrasi GP Komisi Taxi'
      ''
      '26 Agustus 2014 (1.2.10.35) :'
      '- Penambahan Seat pada Laporan Running Days Bus'
      '- Penambahan kolom persentase pada Laporan Running Days Bus'
      '- Pergeseran kolom jam masuk dan keluar pada Laporan Pendapatan '
      'perKendaraan Taxi'
      ''
      '20 Agustus 2014 (1.2.9.34) :'
      '- Penambahan data coa customer pada database'
      '- Penambahan Integrasi GP Ansuransi Taxi'
      ''
      '19 Agustus 2014 (1.2.9.34) :'
      '- Perbaikan assign_id pada integrasi penjualan taxi reguler'
      ''
      '18 Agustus 2014 (1.2.9.34) :'
      '- Perbaikan pembatalan pembayaran invoice bus'
      '- Penambahan rit keluar dan masuk pada laporan armada jalan taxi'
      '- Perubahan penanda tangan invoice pada invoice bus'
      
        '- Penambahan kolom invoice pada laporan penjualan harian perarma' +
        'da '
      'jalan'
      '- Penambahan laporan pernjualan bulanan perarmada jalan'
      ''
      '15 Agustus 2014 (1.2.8.34) :'
      '- Penambahan Integrasi GP pendapatan Taxi'
      '- Perbaikan tampilan Data Penjadwalan'
      ''
      '13 Agustus 2014 (1.2.8.33) :'
      '- Update Form Part Detail menambahan Part Type'
      '- Perbaikan Surat Konfirmasi'
      '- Perbaikan Form Mitra masuk kembali untuk yg ada referensi'
      ''
      '12 Agustus 2012 (1.2.8.33) :'
      
        '- Penambahan kolom drop keluar dan drop masuk pada Laporan Armad' +
        'a '
      'Jalan'
      '- Perbaikan Form Perubahan Data Surat Jalan Bus'
      '- Otorisasi KS pada Form SPJ tidak diperbolehkan'
      '- Otorisasi KS pada Form Operasi Kembali tidak diperbolehkan'
      ''
      '11 Agustus 2014 (1.2.8.33) :'
      '- Perbaikan slip penerimaan pembayaran Bus'
      '- Penambahan opsi model pembayaran pada Penerimaan Pembayaran '
      'Bus'
      ''
      '07 Agustus 2014 (1.2.8.33) :'
      '- Penambahan Terms and Conditions pada Form Konfirmasi'
      ''
      '06 Agustus 2014 (1.2.8.33) :'
      '- Ditambahkan nominal KS pada daftar Stop Operasi Mitra'
      ''
      '05 Agustus 2014 (1.2.8.33) :'
      
        '- Perubahan data paket pada form Kontrak tidak menghilangkan nil' +
        'ai yg '
      'sudah diinput'
      '- Penambahan Kontrak pada form Harga Produk '
      '- Pernambahan form Pesanan jika ada Kontrak maka Harga Produk '
      'kontrak akan tampil'
      ''
      '04 Agustus 2014 (1.2.8.33) :'
      '- Menampilkan Form Perubahan Pelanggan Taxi'
      ''
      '02 Agustus 2014 (1.2.8.33) :'
      '- Informasi jumlah KS pada daftar stop operasi Mitra'
      ''
      '25 Juli 2014 (1.2.8.32) :'
      '- Perbaikan Form Surat Jalan, Uang Order, Check Out dan Check In'
      
        '- Limitasi Surat Jalan Bus yang sudah dibuat tidak bisa dibuat k' +
        'embali'
      ''
      '24 Juli 2014 (1.2.8.31) :'
      '- Perbaikan rute pada Form Konfirmasi'
      '- Perbaikan no HP pada Form Konfirmasi'
      '- Penambahan Guide dan no telp guide pada Form Konfirmasi'
      '- Nomor rekening pada Surat Penawaran dihilangkan'
      ''
      '22 Juli 2014 (1.2.8.30) :'
      '- Penambahan pecetakan ke e-mail untuk Form Konfirmasi pesanan'
      '- Perbaikan nomor Handphone pada Form Konfirmasi pesanan'
      ''
      '18 Juli 2014 (1.2.8.30) :'
      '- Penambahan Form Konfirmasi pada Pesanan'
      ''
      '15 Juli 2014 (1.2.7.30) :'
      '- Penjadwalan dapat menghapus Armada dan Driver yg sudah '
      'dijadwalkan'
      '- Penjadwalan tidak bisa ditambah setelah di klik simpan'
      '- Pencetakan nama driver pada Form Reservasi menjadi word-wrap'
      '- Nomor Reservasi setelah klik simpan sudah muncul'
      '- Nama Penjadwal pada Form Penjadwal berbeda dengan nama sales'
      ''
      '8 Juli 2014 (1.2.7.30) :'
      '- Penambahan User Level'
      
        '- Penambahan informasi Kontrak Pada Laporan Penjualan dan Penjua' +
        'lan '
      'per Armada Jalan'
      
        '- Perbaikan Laporan Harian perArmada Jalan dan Penambahan inform' +
        'asi '
      'Kontrak'
      '- Penambahan Segment Customer Pada Laporan Penjualan Harian dan '
      'Bulanan'
      '- Pembuatan Pesanan Sales yg tercantum adalam sesuai Sales '
      'Penawaran'
      '- Diskon F.O.C dapat dilakukan'
      ''
      '7 Juli 2014 (1.2.6.29) :'
      '- Penambahan waktu timeout pada Laporan KS Taxi'
      '- Perbaikan pencarian pada Penjadwalan'
      ''
      '4 Juli 2013 (1.2.6.28) :'
      '- Perbaikan SJ Bus di cetak ulang tidak dobel Alamat dan Rute'
      '- Penambahan perSales pada Laporan Penjualan Bulanan'
      '- Perbaikan perhitungan Total pada Laporan Surat Penawaran'
      ''
      '3 Juli 2014 (1.2.6.28) :'
      '- Penambahan perSales dalam Laporan Penjualan Harian'
      '- Penambahan perSales dalam Laporan Surat Penawaran Harian'
      '- Penambahan Kontak pada Kontrak'
      '- Perbaikan pemilihan Kontak pada Surat Penawaran dan Pesanan'
      ''
      '2 Juli 2014 (1.2.6.28) :'
      '- Perbaikan Pesanan untuk perubahan data dapat disimpan'
      
        '- Penambahan fasilitas input data Pesanan selain dari departemen' +
        ' sales'
      'dapat merujuk ke sales tertentu'
      ''
      '1 Juli 2014 (1.2.6.27 ) :'
      '- Penambahan Laporan Penjualan Bulanan Sales'
      '- Perbaikan diterima perusahaan Laporan Pendapatan Kendaraan'
      '- Perbaikan Rubah SJ Bus dapat di klik kembali'
      ''
      '26 Juni 2014 (1.2.5.27) :'
      '- Perbaikan Total per baris Laporan Surat Penawaran dan Total '
      'keseluruhan'
      '- Perbaikan Total keseluruhan Laporan Penjualan Harian'
      ''
      '25 Juni 2014 (1.2.5.27) :'
      
        '- Data order tidak tampil lebih dari 1x pada Laporan Harian Arma' +
        'da Jalan'
      
        '- Penambahan Laporan Harian perArmada Jalan untuk Operasional yg' +
        ' '
      'ditampilkan hanya tanggal bersangkutan'
      '- Perbaikan pencarian pada Penjadwalan'
      ''
      '18 Juni 2014 (1.2.5.26) :'
      '- Detail Kontrak dapat di lihat (scroll)'
      '- Penambahan kolom keterangan pada Kontrak'
      ''
      '17 Juni 2014 (1.2.5.25) :'
      
        '- Double klik pada detail untuk menampilkan data Customer/Prospe' +
        'k '
      'pada '
      'Surat Penawaran dan Pesanan'
      ''
      '16 Juni 2014 (1.2.5.25) :'
      '- Pencetakan Surat Jalan Bus menggunakan Huruf Besar Semua '
      ''
      '13 Juni 2014 (1.2.5.25) :'
      '- Penambahan Group pada Penjadwalan dan Surat Jalan'
      '- Perbaikan pencetakan Uang Order'
      '- Penambahan Group, dan Guide pada Uang Order, Checker Out dan '
      'Cheker In'
      '- Penambahan No Polisi pada List SPJ dan Uang Order'
      '- Perbaikan Kontrak waktu menyimpan ( no kontrak )'
      ''
      '12 Juni 2014 (1.2.5.25) :'
      '- Penambahan Group pada Surat Penawaran dan Pesanan'
      ''
      '11 Juni 2014 (1.2.5.24) :'
      '- Perbaikan Form Penambahan Mitra/Driver'
      '- Perbaikan Form Penambahan Armada'
      
        '- Perbaikan Pola Penyimpanan detail Surat penawaran, Pesanan, In' +
        'voice '
      'dan Booking menjadi satu per satu'
      '- Perbaikan Penyimpanan Pesanan lebih dari 1 baris'
      
        '- Perbaikan Pencetakan Form Reservasi ( seat unit sudah ditampil' +
        'kan )'
      '- Perbaikan Discount pada Surat Penawaran'
      '- Penambahan Laporan Penjualan Harian perArmada Jalan'
      '- Perbaikan Laporan Penjualan Harian'
      '- Perbaikan Laporan Surat Penawaran Harian'
      ''
      '10 Juni 2014 (1.2.5.24) :'
      '- Perbaikan pencetakan Surat Jalan Bus'
      
        '- Kolom rute,guide dan keterangan dapat di edit pada Surat Jalan' +
        ' Bus'
      '- Penambahan melihat Semua Data Pembayaran'
      
        '- Pembatalan Invoice otomatis membatalkan Pembayaran yang diteri' +
        'ma'
      '- Penambahan Hotline pada Surat Penawaran'
      ''
      '9 Juni 2014 (1.2.5.24)'
      
        '- Perbaikan perhitungan pada pencetakan Surat Penawaran untuk ko' +
        'lom '
      'total'
      '- Perbaikan perhitungan pada Surat Penawaran dan Pesanan untuk '
      'hitungan diatas 9 digit'
      '- Kolom discount harga pada Surat Penawaran dan Pesanan dapat '
      'menggunakan tanda minus (-) untuk menambah harga'
      ''
      '6 Juni 2014 (1.2.5.24)'
      '- Perbaikan baris yg benar pada Surat Penawaran untuk Produk yg '
      'dikosongkan'
      ''
      '5 Juni 2014 (1.2.5.24):'
      '- Pembatasan Insert,hanya dapat digunakan saat perubahan dan '
      'Penambahan pada Pesanan'
      '- Simpan tanpa detail pada Pesanan ditolak'
      '- Simpan tanpa detail pada Surat Penawaran ditolak'
      '- Perbaikan Laporan Penjualan Harian'
      ''
      '4 Juni 2014 (1.2.5.24) :'
      '- Penambahan Laporan Harian Sales'
      '- Perbaikan Pencetakan Surat Penawaran'
      ''
      '3 Juni 2014 (1.2.5.23) :'
      
        '- Perbaikan pada Surat Penawaran dan Pesanan kolom yg tidak bisa' +
        ' '
      'dikosongkan'
      '- Penambahan Kolom Last Update pada Data List Customer'
      '- Prospek dapat dibatalkan'
      '- Perbaikan Kolom Produk pada Pesanan yg tidak bisa dipilih'
      
        '- Perbaikan Kolom Produk pada Surat Penawaran yg tidak bisa dipi' +
        'lih'
      '- Surat Penawaran tanpa Kontak dapat disimpan'
      
        '- Cetakan Surat Pesanan yg dobel setelah di jadwalkan sudah tida' +
        'k '
      'muncul'
      
        '- Laporan Running days connecting sudah bisa dipilih perdetail P' +
        'esanan'
      ''
      '1 Juni 2014 (1.2.5.23) :'
      '- Pilihan Reguler/Executive muncul pada Form Armada Taxi.'
      ''
      '30 Mei 2014 (1.2.5.23) :'
      '- Pelanggan dapat dibatalkan'
      ''
      '26 Mei 2014 (1.2.5.23) :'
      '- Penambahan Kolom Total Jalan dan Total tersedia pada Laporan '
      'Running Day Bus'
      ''
      '23 Mei 2014 (1.2.5.22) :'
      '- Penambahan Kolom Sales pada Data Pesanan'
      '- Penambahan Kolom Sales pada Data Surat Penawaran'
      '- Validasi Armada pada Penjadwalan, 1 Armada tidak bisa dobel'
      
        '- Validasi Pengemudi pada Penjadwalan, 1 Pengemudi  tidak bisa d' +
        'obel'
      '- Pada Surat Penawaran, biaya Tambahan dimasukkan'
      '- Perbaikan tampilan status pada Data Penjadwalan'
      ''
      '22 Mei 2014 (1.2.5.21) :'
      '- Pada Cetakan Invoice discount ditambahkan nominal % '
      
        '- Surat Jalan yang sudah dibuat tidak bisa di pilih lagi pada pe' +
        'mbuatan '
      'surat jalan'
      '- Total Connecting untuk Armada dan Pengemudi menjadi 4'
      '- Contact Person pada Form Reservasi ditampilkan'
      '- Penambahan email pada Form Reservasi'
      ''
      '21 Mei 2014 (1.2.5.20) :'
      '- Discount dapat dirubah pada Pesanan setelah di simpan'
      '- Discount dapat dirubah pada Surat Penawaran setelah disimpan'
      '- Setelah Invoce dibayar Pesanan tidak dobel pada Data Pesanan'
      
        '- Pada Surat Penawaran jika tidak ada discount maka kolom discou' +
        'nt '
      'kosong sama sekali'
      '- Catatan pada Surat penawaran berada dibawah syarat dan kondisi'
      '- Dear ditambahkan Sir/Madam pada Surat Penawaran'
      '- Surat Penawaran dan Pesanan dapat direvisi oleh personil satu '
      'departemen'
      
        '- Perbaikan pada pencetakan ke 2 surat penawaran untuk kolom ala' +
        'mat'
      '- Pada Customer baru langsung di tampilkan sales yg menambahkan '
      'prospek'
      '- Titel hanya ada 3 Ms, Mr dan PT'
      '- Penambahan Kolom Tanggal pada Data Surat Penawaran'
      '- Penambahan Kolom Tanggal pada Data Pesanan'
      '- Opsi memilih data perhari pada Data Surat Penawaran'
      '- Opsi memilih data perHari pada Data Pesanan'
      '- Perubahan No Kontrak Menjadi PTRANS/XX.XX/MKT/CTXXX'
      ''
      '19 Mei 2014 (1.2.5.19):'
      
        '- Perubahan Field pada Jenis Armada dibagi menjadi per Jenis Det' +
        'ail '
      'pada Laporan Armada Jalan'
      '- Penambahan Field Pagi dan Malam pada Laporan Armada Jalan'
      '- Penambahan Kolom Reguler Limo pada Laporan Penghasilan Rata2 '
      'perbulan'
      '- Penambahan Kolom Reguler Limo pada Laporan Armada Operasi '
      'perBulan'
      '- Penambahan Kolom Batangan pada Laporan Pendapatan perArmada'
      ''
      '16 Mei 2014 (1.2.5.19): '
      '- Pada Kontrak dapat geser menggunakan kursor atas dan bawah'
      
        '- Pada Surat Penawaran dapat bergeser menggunakan kursor atas da' +
        'n '
      'bawah'
      '- Kolom keterangan pada Kontrak sudah dapat di input'
      '- Data Kontrak yg di cari sudah tidak bertumpuk'
      '- Perbaikan yg dapat merevisi Pesanan hanya user dan atasan'
      ''
      '23 April 2014 (1.2.5.18):'
      
        '- Semua Pool dapat melihat data semua mitra, termasuk riwayat da' +
        'n '
      'pendapatan'
      ''
      '15 April 2014 (1.2.5.17):'
      '-Perbaikan Customer Taxi'
      ''
      '13 April 2014 (1.2.5.17):'
      '- Perubahan Splashscreen Whitehorse Group'
      ''
      '11 April 2014 (1.2.5.17):'
      '- Penambahan Departemen pada User List'
      '- Penambahan Departemen pada Change User'
      ''
      '09 April 2014 (1.2.5.17):'
      '- Perbaikan pemilihan jenis kendaraan pada Penambahan Armada'
      ''
      '07 April 2014 (1.2.5.16):'
      '- Perbaikan Input Mitra dengan Referensi Mitra'
      '- Perbaikan No Transaksi Mitra pada Slip Setoran Mitra'
      '- Perbaikan Laporan KS Detail dengan penambahan detail'
      ''
      '03 April 2014 (1.2.5.15):'
      '- Penambahan Kolom denda Argo pada Laporan pendapatan '
      'perKendaraan'
      '- Penambahan Kolom Rasio KM Argo pada Laporan pendapatan '
      'perKendaraan'
      '- Perbaikan penarikan data modul Laporan pendapatan perKendaraan'
      ''
      '01 April 2014 (1.2.5.14) :'
      
        '- Perbaikan Setoran seragam yg tidak muncul pada Laporan Pendapa' +
        'tan '
      'perKendaraan'
      '- Perbaikan Setoran KS yg tidak muncul pada Laporan Pendapatan '
      'perKendaraan'
      ''
      '28 Maret 2014:'
      '- Perbaikan Cicilan Potongan OR pada Slip Setoran Mitra'
      '- Penambahan kolom KM Argo pada Laporan pendapatan per Kendaraan'
      '- Mempercepat pencarian/penampilan data Mitra/Driver/Karyawan'
      
        '- Perbaikan kolom seragam-tilang pada cetak ulang Slip Setoran M' +
        'itra'
      ''
      '26 Maret 2014:'
      '- Penambahan berbagai model potongan pada Slip Setoran Mitra'
      ''
      '21 Maret 2014:'
      '- Perbaikan input data driver'
      ''
      '20 Maret 2014:'
      '- Penambahan kolom pembuat catatan pada Riwayat '
      'Mitra/Driver/Karyawan'
      
        '- Penambahan kolom PB, Jaminan,Cicilan KS dan PB+Pot pada Lapora' +
        'n '
      'penggunaan BBM per Bulan'
      '- Perbaikan Mitra Masuk Kembali untuk CompanyId dan LocationId'
      '- Penambahan per jenis kendaraan pada Master Armada'
      ''
      '18  Maret 2014:'
      '- Penambahan Laporan Penggunaan BBM perBulan'
      '- Perbaikan Simpan UserGroup Menu/SubMenu/TreeMenu'
      ''
      '17  Maret 2014:'
      '- Perbaikan Upload foto Mitra menjadi lebih cepat'
      ''
      '15 Maret 2014:'
      '- Menonaktifkan cicilan seragam pada Setoran Mitra'
      '- Perbaikan Slip Penerimaan Uang tidak bisa dicetak'
      ''
      '13 Maret 2014:'
      '- Perbaikan Pencarian pada List Data Mitra Aktif/NonAktif/Keluar'
      ''
      '12 Maret 2014:'
      '- Perbaikan Pendapatan perKendaraan Bus'
      '- Penambahan fungsi CompanyId pada Pendapatan perKendaraan'
      
        '- Penambahan fungsi Export ke Excel baru, Export data termasuk w' +
        'arna '
      'cell dan border '
      '- Fungsi Export ke Excel support Office 2008++'
      
        '- Laporan Pendapatan perKendaraan Bus diupdate fungsi Export bar' +
        'u'
      
        '- Laporan Pendapatan perKendaraan Taxi diupdate fungsi Export ba' +
        'ru'
      '- Laporan Armada perBulan Taxi diupdate fungsi Export baru'
      '- Laporan KS Mitra diupdate fungsi Export baru'
      '- Laporan KS Detail Mitra diupdate fungsi Export baru'
      '- Laporan Hutang Piutang Mitra diupdate fungsi Export baru'
      '- Laporan Tunjangan Mitra perBulan diupdate fungsi Export baru'
      '- Laporan Komisi Mitra perBulan diupdate fungsi Export baru'
      '- Data Mitra/Driver/Karyawan diupdate fungsi Export baru'
      '- List Inventory diupdate fungsi Export baru'
      '- List Penerimaan barang ditambahkan fungsi Export baru'
      '- List Mutasi barang ditambahkan fungsi Export baru'
      '- Kolom KS dan KPP di Laporan KS Mitra diperbesar'
      ''
      '07 Maret 2014:'
      
        '- Keterangan pada Penerimaan pembayaran dapat disimpan dan dicet' +
        'ak'
      
        '- Mitra yang masuk kembali mendapat TX baru dan tidak perlu inpu' +
        't '
      'ulang data, hutang-piutang langsung terbawa'
      '- Perubahan table wh_status menjadi wh_empl_status'
      ''
      '28 Februari 2014'
      '- Perbaikan Laporan pendapatan per Kendaraan nilai 0 bisa keluar'
      
        '- Perbaikan Laporan kanebo untuk mutasi kendaraan pada hari H ti' +
        'dak '
      'terdeteksi'
      '- Penambahan Form Mitra masuk kembali'
      '- Perbaikan Form Caption Data Driver pada List Driver'
      ''
      '26 Februari 2014'
      '- Argo dan Komisi tahunan Mitra dapat dilihat'
      ''
      '24 Februari 2014'
      '- Pengeluaran Kas untuk tabungan tidak bisa minus'
      ''
      '21 Februari 2014'
      '- Perbaikan laporan pendapatan perkendaraan untuk value null'
      ''
      '14 Februari 2014'
      '- Penambahan modul Riwayat Latar Belakang Mitra'
      ''
      '13 Februari 2014'
      '- Dapat menutup SPB Service Asal pool lain'
      '- Perbaikan Tampilan Rit,Drop, dan KM SPB Service'
      '- Kalkulasi gas perLiter Pada SPB sudah berjalan'
      '- Penambahan Argo perBulan exMitra'
      '- Penambahan Hutang/Piutang exMitra'
      '- Perbaikan urutan Lokasi pada Laporan'
      ''
      '11 Ferbuari 2014:'
      '- Perbaikan perpanjangan KPP Mitra untuk nomor HP kosong bisa '
      'disimpan'
      
        '- P.R, P.O dan PBJ yang sudah selesai/batal hanya berubah warna ' +
        'text'
      ''
      '10 Februari 2014:'
      '- Perbaikan Jaminan pada setoran mitra sesuai dengna total'
      ''
      '06 Februari 2014:'
      '- Fasilitas Search pada List Vendor'
      ''
      '03 Februari 2014:'
      '- P.O Ganti vendor Nomor P.O Ganti'
      '- Penambahan kolom harga pada Penerimaan barang '
      '- Part Detail ditambahkan harga dan stock min'
      '- Penambahan Lokasi pada Inventory'
      '- Penambahan Form Print pada penerimaan barang'
      ''
      '12 Desember 2013:'
      '- Perbaikan Modul Transfer Antar Gudang ( Mutasi Stock )'
      ''
      '11 Desember 2013:'
      '- Penambahan Modul Permintaan Barang dan Jasa'
      '- Penambahan Link Permintaan Barang dan Jasa ke Modul PR'
      ''
      '5 Desember 2013 :'
      '- Sebelum update otomatis mendelete IE Cache'
      '- Memberikan informasi saat login untuk versi terbaru'
      '- Data Mitra Muncul lebih cepat'
      '- Part Type bisa di List'
      '- Part Group bisa di List'
      '- Part Detail bisa di List'
      ''
      '27 November 2013:'
      '- Penambahan modul input Budget Tahunan'
      '- P.R dapat dibatalkan'
      ''
      '26 November 2013:'
      '- P.O dapat dibatalkan'
      '- Pembatalan P.O tidak menggangu PR'
      '- Penambahan Modul Penerimaan Barang/Jasa'
      ''
      '25 November 2013:'
      '- Perbaikan Running days mitra di klik menampilkan data armada'
      
        '- Laporan Pendapatan perKendaraan di klik menampilkan slip setor' +
        'an'
      ''
      '22 November 2013:'
      '- Penambahan Lokasi pada modul Budget'
      ''
      '21 November 2013:'
      '- Penambahan modul Cetak Id Card'
      '- Penambahan modul Log '
      '- Perbaikan List Mitra Stop Operasi'
      '- Penambahan Lokasi pada modul Purchase Request'
      ''
      '20 November 2013:'
      '- Kolom jenis biaya pada Slip setoran lebih besar'
      
        '- Penambahan Modul pindah lokasi untuk user yg memiliki akses di' +
        ' '
      'beberapa pool/counter/cabang'
      '- Tercantum lokasi pada panel bawah aplikasi utama'
      '- BBM Tunai tercantum pada slip setoran'
      ''
      '19 November 2013:'
      '- Mitra di Stop Operasi Bisa Input Pembayaran'
      '- SPJ Batal Jalan tidak menambahkan Jaminan'
      '- Laporan Argo Mitra Perbulan ditambahkan kolom rata-rata'
      ''
      '15 November 2013:'
      '- Departemen diambil dari user detail'
      '- Penambahan Modul Setting Print Line'
      ''
      '11 November 2013:'
      '- Stop Operasi Mitra bisa search'
      ''
      '7 November 2013:'
      
        '- Cicilan KS bisa menyesuaikan total KS apabila KS lebih kecil d' +
        'ari '
      'Target'
      ''
      '1 November 2013:'
      '- Penambahan Jenis Kendaraan pada modul Armada'
      '- Perubahan/Update Cetakan KPP Mitra Terbaru'
      ''
      '27 Oktober 2013:'
      '- Laporan Running days Menampilkan data Mitra/Armada'
      
        '- Laporan Running days begitu di double klik akan menampilkan de' +
        'tail '
      '- Implementasi Minimal Tabungan '
      ''
      '25 Oktober 2013:'
      '- Penambahan Modul Stop Operasi'
      ''
      '22 Oktober 2013:'
      '- Perbaikan Update Armada'
      '- SIM Kadaluarsa tidak bisa operasi'
      ''
      '18 Oktober 2013:'
      '- Perubahan denda pada Slip Setoran Mitra menjadi per 1/2 jam'
      
        '- Perhitungan denda pada Slip Setoran Mitra berdasarkan tanggal ' +
        'keluar'
      '- Penambahan Modul COA'
      '- Penambahan Modul Budget'
      '- Penambahan Modul P.R'
      '- Penambahan Modul P.O'
      '- Penambahan Modul Vendor'
      ''
      '04 Oktober 2013:'
      '- Penambahan Modul P.I.C Customer Bus'
      '- Penambahan Modul Customer Order Bus'
      '- Penambahan Modul Kontrak Customer Bus'
      '- Penambahan Modul Lead Bus'
      '- Penambahan Modul Lead Order Bus'
      '- Penambahan Modul Produk Bus'
      '- Penambahan Modul Harga Produk Bus'
      '- Penambahan Modul Bank'
      '- Perbaikan perubahan Tree Menu'
      '- Perbaikan pengecekan versi'
      '- Versi WHAps menjadi 1.2.0.0'
      ''
      '18 September 2013:'
      '- Perbaikan klik di referensi untuk Laporan Mitra Baru '
      
        '- Status Aktif sudah terlihat di kolom Aktif untuk Laporan Mitra' +
        ' Baru'
      
        '- Perbaikan Laporan Komisi Mitra perBulan untuk tanggal yg tidak' +
        ' tampil '
      'akhir bulan'
      
        '- Perbaikan Pendapatan Mitra perBulan untuk pembersihan tampilan' +
        ' '
      'tanggal di akhir bulan'
      '- Perbaikan Total nominal tabungan dan jaminan di Laporan '
      'Hutang/Piutang Mitra'
      ''
      '16 September 2013:'
      '- Laporan Argo Mitra bisa di klik untuk data Mitra '
      '- Laporan Komisi Mitra bisa di klik untuk data Mitra '
      '- Laporan Tunjangan Mitra bisa di klik untuk data Mitra '
      '- Laporan Pendapatan Argo Mitra perBulan sudah bisa semua Mitra'
      '- Laporan Komisi Argo Mitra perBulan sudah bisa semua Mitra'
      '- Laporan Tunjangan Mitra perBulan sudah bisa semua Mitra'
      '- Laporan Referensi Mitra bisa di klik untuk data Mitra '
      '- Penambahan Total Mitra di Laporan Mitra Baru perBulan'
      '- Penambahan Kolom Aktif di Laporan Mitra Baru perBulan'
      '- Penambahan Kolom Lokasi di Laporan Mitra Baru perBulan'
      '- Laporan HRD Data Mitra sudah bisa digunakan'
      '- Penambahan Keterangan Group pada Laporan Pendapatan '
      'perKendaraan'
      '- Data Mitra bisa di klik di kolom referensi'
      ''
      '14 September 2013:'
      '- Penambahan Modul Customer untuk Bus'
      ''
      '11 September 2013:'
      
        '- Perbaikan Laporan Taxi Pendapatan per Kendaraan untuk Pendapat' +
        'an '
      'Mitra'
      '- Penambahan KM Out, KM In, Km Tempuh, Rasio KM, Rasio BBM pada '
      'Laporan Taxi Pendapatan per Kendaraan'
      '- Daftar perubahan yang terbaru berada diatas'
      ''
      '7 September 2013:'
      '- Perbaikan Modul Customer Taxi no Telp tidak muncul'
      ''
      '6 September 2013:'
      '- Penambahan Modul Customer Taxi'
      ''
      '5 September 2013:'
      
        '- Penambahan Fitur Input tanggal masuk pada Setoran Mitra (Tombo' +
        'l F9)'
      '- Pencegahan dobel input SPJ Taxi'
      '- Pencegahan dobile input Setoran Mitra'
      '- Perbaikan display SPJ Taxi pada  '#39'SPJ Reguler'#39
      ''
      '29 Agustus 2013:'
      
        '- Penambahan Fitur Input waktu masuk pada Setoran Mitra (Tombol ' +
        'F10)'
      ''
      '05 Agust 2013:'
      '- Penambahan fitur perubahan persentase komisi eksekutif'
      
        '- Penambahan field OnRisk,LaKa, Tilang dan Jaminan di Setoran Mi' +
        'tra'
      '- Menampilkan Denda pada kolom Denda di Laporan Pendapatan per '
      'Kendaraan'
      ''
      '31 Juli 2013:'
      '- Update Running Days Mitra, membersihkan display lama sebelum '
      'mapping display baru'
      '- Update Running Days Armada, membersihkan display lama sebelum '
      'mapping display baru'
      ''
      '26 Juli 2013:'
      '- Update Waktu dan Jam Server setiap check message'
      ''
      '25 Juli 2013:'
      '- Penambahan Denda otomatis sesuai Jam keterlambatan'
      ''
      '22 Juli 2013:'
      '- Tunjangan Hari kerja Normal dan PerPeriode sudah dapat '
      'digunakan'
      '- Perbaikan Cetakan Pengeluaran Kas External'
      ''
      '18 Juli 2013:'
      '- Perbaikan nilai yg ditampilkan Tilang dan Jaminan'
      '- Penambahan Modul Hutang/Piutang Mitra'
      ''
      '9 Juli 2013:'
      '- Penambahan Subsidi BBM Level 7 dan 8'
      ''
      '1 Juli 2013:'
      '- Penambahan OnRisk,Laka,Tilang'
      '- Penambahan Modul Penambahan Transaksi'
      '- Perbaikan Laporan KS Mitra'
      '- Slip Setoran untuk drop Minus di stop'
      '- Pemisahan Tabungan dan KS'
      '- Penggantian Tampilan Laporan KS, menjadi Laporan Transaksi'
      ''
      '3 April 2013:'
      
        '- Perbaikan penghasilan rata-rata (untuk kendaraan yang termutas' +
        'i '
      'sudah masuk ke pool sesuai tanggal)'
      
        '- Perbaikan Argo Mitra PerBulan (akhir bulan sudah masuk ke dala' +
        'm '
      'laporan)')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 4
  end
  object Sets2: TPanel
    Left = 8
    Top = 481
    Width = 25
    Height = 24
    BevelOuter = bvNone
    TabOrder = 5
  end
  object AppHotKey: TApplicationEvents
    OnShortCut = AppHotKeyShortCut
    Left = 16
    Top = 8
  end
  object ppReport: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 1270
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 2540
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'D:\WH App\OffLtr.rtm'
    DeviceType = 'Screen'
    EmailSettings.ReportFormat = 'PDF'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 904
    Top = 88
    Version = '10.06'
    mmColumnWidth = 0
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 73290
      mmPrintPosition = 0
      object ppLogo: TppImage
        UserName = 'Logo'
        MaintainAspectRatio = False
        Stretch = True
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        mmHeight = 21431
        mmLeft = 122767
        mmTop = 2117
        mmWidth = 65881
        BandType = 0
      end
      object ppLabel387: TppLabel
        UserName = 'LabelTo'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'To '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 8467
        mmTop = 27517
        mmWidth = 12965
        BandType = 0
      end
      object ppContactName: TppLabel
        UserName = 'Label21'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 23283
        mmTop = 27517
        mmWidth = 72231
        BandType = 0
      end
      object ppLabel91: TppLabel
        UserName = 'Label5'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'CONFIRMATION FORM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 8467
        mmTop = 8467
        mmWidth = 57415
        BandType = 0
      end
      object ppLabel93: TppLabel
        UserName = 'LabelTo5'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'E-Mail'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 8467
        mmTop = 31750
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel99: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Phone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 8467
        mmTop = 35983
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel100: TppLabel
        UserName = 'Label10'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 21167
        mmTop = 27517
        mmWidth = 1058
        BandType = 0
      end
      object ppLabel101: TppLabel
        UserName = 'Label1010'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 21167
        mmTop = 31750
        mmWidth = 1058
        BandType = 0
      end
      object ppLabel102: TppLabel
        UserName = 'Label1011'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 21167
        mmTop = 35983
        mmWidth = 1058
        BandType = 0
      end
      object ppLabel103: TppLabel
        UserName = 'LabelTo6'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Company'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 99484
        mmTop = 27517
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel104: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'HP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 99484
        mmTop = 31750
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel105: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Fax'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 99484
        mmTop = 35983
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel106: TppLabel
        UserName = 'Label1012'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 114300
        mmTop = 27517
        mmWidth = 1058
        BandType = 0
      end
      object ppLabel107: TppLabel
        UserName = 'Label10101'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 114300
        mmTop = 31750
        mmWidth = 1058
        BandType = 0
      end
      object ppLabel108: TppLabel
        UserName = 'Label23'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 114300
        mmTop = 35983
        mmWidth = 1058
        BandType = 0
      end
      object ppemail: TppLabel
        UserName = 'Label24'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 23283
        mmTop = 31750
        mmWidth = 72231
        BandType = 0
      end
      object ppPhoneNo: TppLabel
        UserName = 'Label2'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 23283
        mmTop = 35983
        mmWidth = 72231
        BandType = 0
      end
      object ppFaxNo: TppLabel
        UserName = 'Label9'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 116417
        mmTop = 35983
        mmWidth = 72231
        BandType = 0
      end
      object ppCelularNo: TppLabel
        UserName = 'Label25'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 116417
        mmTop = 31750
        mmWidth = 72231
        BandType = 0
      end
      object ppCustomerName: TppLabel
        UserName = 'Label26'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 116417
        mmTop = 27517
        mmWidth = 72231
        BandType = 0
      end
      object ppHeaderMemo: TppMemo
        UserName = 'Memo1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 8467
        mmTop = 42333
        mmWidth = 180182
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        mmHeight = 18521
        mmLeft = 8467
        mmTop = 55033
        mmWidth = 180182
        BandType = 0
      end
      object ppLabel109: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'RESERVATION DETAILS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 8467
        mmTop = 50800
        mmWidth = 180182
        BandType = 0
      end
      object ppLabel110: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Reservation No'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 10583
        mmTop = 55033
        mmWidth = 23548
        BandType = 0
      end
      object ppLabel112: TppLabel
        UserName = 'Label15'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 42333
        mmTop = 55033
        mmWidth = 1058
        BandType = 0
      end
      object ppLabel113: TppLabel
        UserName = 'Label16'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 42333
        mmTop = 59267
        mmWidth = 1058
        BandType = 0
      end
      object ppLabelDate: TppLabel
        UserName = 'LabelDate'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Date'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 8467
        mmTop = 68792
        mmWidth = 29898
        BandType = 0
      end
      object ppLabelUnit: TppLabel
        UserName = 'LabelUnit'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Unit/Seats'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 38100
        mmTop = 68792
        mmWidth = 25665
        BandType = 0
      end
      object ppLabelDestination: TppLabel
        UserName = 'LabelDestination'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Destination Details'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 63500
        mmTop = 69056
        mmWidth = 76465
        BandType = 0
      end
      object ppLabelPrice: TppLabel
        UserName = 'LabelPrice'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 160867
        mmTop = 69056
        mmWidth = 27781
        BandType = 0
      end
      object ppLine33: TppLine
        UserName = 'Line33'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 8467
        mmTop = 67733
        mmWidth = 180182
        BandType = 0
      end
      object ppLine34: TppLine
        UserName = 'Line34'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 38100
        mmTop = 67733
        mmWidth = 265
        BandType = 0
      end
      object ppLine35: TppLine
        UserName = 'Line35'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 63500
        mmTop = 67733
        mmWidth = 265
        BandType = 0
      end
      object ppLabel114: TppLabel
        UserName = 'LabelDestination1'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Flight'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 139700
        mmTop = 69056
        mmWidth = 21431
        BandType = 0
      end
      object ppLine36: TppLine
        UserName = 'Line36'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 139700
        mmTop = 67733
        mmWidth = 265
        BandType = 0
      end
      object ppLine37: TppLine
        UserName = 'Line37'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 160867
        mmTop = 67733
        mmWidth = 265
        BandType = 0
      end
      object ppReprinted: TppLabel
        UserName = 'Reprinted'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 8467
        mmTop = 14817
        mmWidth = 46831
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'PIC / Guide'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10583
        mmTop = 63500
        mmWidth = 29898
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label6'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 42333
        mmTop = 63500
        mmWidth = 1058
        BandType = 0
      end
      object ppGuide: TppLabel
        UserName = 'Label28'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 44450
        mmTop = 63500
        mmWidth = 142082
        BandType = 0
      end
      object ppOrderId: TppLabel
        UserName = 'Label17'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 44450
        mmTop = 55033
        mmWidth = 59531
        BandType = 0
      end
      object ppGroupName: TppLabel
        UserName = 'Label18'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 44450
        mmTop = 59267
        mmWidth = 144198
        BandType = 0
      end
      object ppMemo1: TppMemo
        UserName = 'Memo3'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 
          'Thank you for choosing White Horse Deluxe Coach as your Transpor' +
          'tation partner, It'#39's our pleasure to confirm your reservation de' +
          'tails as follows :'#13#10
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Lines.Strings = (
          
            'It'#39's our pleasure to confirm your reservation details as follows' +
            ' :')
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 8996
        mmLeft = 8467
        mmTop = 46567
        mmWidth = 180182
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLockSign: TppImage
        UserName = 'LockSign'
        MaintainAspectRatio = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Picture.Data = {
          0A544A504547496D61676589020000FFD8FFE100B045786966000049492A0008
          0000000500120103000100000001000000310102001C0000004A000000320102
          00140000006600000013020300010000000100000069870400010000007A0000
          00000000004143442053797374656D73204469676974616C20496D6167696E67
          00323031363A30353A31372032313A33343A3239000300909202000400000035
          30300002A00400010000000F00000003A00400010000000F00000000000000E0
          02D8D7FFC0001108000F000F03012100021101031101FFDB0084000201010101
          010201010102020202030503030202030604040305070607070706070608090B
          0908080A0806070A0D0A0A0B0C0C0D0C07090E0F0E0C0F0B0C0C0C0103030304
          030408040408120C0A0C12121212121212121212121212121212121212121212
          12121212121212121212121212121212121212121212121212121212FFC4005D
          0001010000000000000000000000000000050810000103030401040300000000
          00000000020103040506070809111221000A1415222331010100000000000000
          000000000000000000110100000000000000000000000000000000FFDA000C03
          010002110311003F00A93775D636DF74CDCBEC6D366E579AA033876D6B0A6DD1
          2EC93595262D52E07A6C7661373E2C51227442224875B6DD4E9C976545F1CAFB
          23EADF451756B4B3B697F4039C2355F0FF00D3D12EDB4ECF27E500D1A53BF219
          AB350989488F04743084E1363FADB37FF1E10F8F41037B86B18E77D226F9362E
          E655EC6E33B1DC29D6F54DA911654475E9A14F46525B1F1DD2E50D500C45487A
          F91545F1E19F6AA69E750D93B737C9FB8C55AC26215875AA6D5D972A272A2898
          CB9F39992DB4319A2E453AB6E72A80209D784FEA27A0FFD9}
        mmHeight = 4233
        mmLeft = 35983
        mmTop = 55563
        mmWidth = 5556
        BandType = 0
      end
      object ppLabel111: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Guest Name / Group'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10583
        mmTop = 59267
        mmWidth = 29898
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 7144
      mmPrintPosition = 0
      object ppDates: TppDBText
        UserName = 'Dates'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'dates'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 6350
        mmLeft = 8467
        mmTop = 529
        mmWidth = 29898
        BandType = 4
      end
      object ppLine100: TppLine
        UserName = 'Line4'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7144
        mmLeft = 8467
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppUnit: TppDBText
        UserName = 'Dates1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'unit_seat'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 6350
        mmLeft = 38100
        mmTop = 265
        mmWidth = 25665
        BandType = 4
      end
      object ppPrices: TppDBText
        UserName = 'Prices'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'total_amount'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 166688
        mmTop = 265
        mmWidth = 21431
        BandType = 4
      end
      object ppLine102: TppLine
        UserName = 'Line5'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7144
        mmLeft = 38100
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine103: TppLine
        UserName = 'Line6'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7144
        mmLeft = 63500
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine104: TppLine
        UserName = 'Line8'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7144
        mmLeft = 160867
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine105: TppLine
        UserName = 'Line12'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 7144
        mmLeft = 188384
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine38: TppLine
        UserName = 'Line38'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7144
        mmLeft = 139700
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppFlight: TppDBText
        UserName = 'Flight'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'flight'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 6350
        mmLeft = 139700
        mmTop = 265
        mmWidth = 21431
        BandType = 4
      end
      object ppRp: TppDBText
        UserName = 'Prices1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        DataField = 'rp'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 161396
        mmTop = 0
        mmWidth = 4498
        BandType = 4
      end
      object pp_route: TppDBMemo
        UserName = 'pp_route'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        CharWrap = False
        DataField = 'route'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 7408
        mmLeft = 64029
        mmTop = 265
        mmWidth = 75406
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 2910
      mmPrintPosition = 0
      object ppLabel5: TppLabel
        UserName = 'Label29'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'No Form :IT004'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2836
        mmLeft = 8647
        mmTop = 0
        mmWidth = 17018
        BandType = 8
      end
      object ppLabel6: TppLabel
        UserName = 'Label30'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Rev : 0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2836
        mmLeft = 96235
        mmTop = 0
        mmWidth = 7747
        BandType = 8
      end
      object ppLabel7: TppLabel
        UserName = 'Label301'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Tgl Terbit : 14-07-2014'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2836
        mmLeft = 160708
        mmTop = 0
        mmWidth = 24765
        BandType = 8
      end
    end
    object ppSummaryBand4: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 96838
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 20373
        mmLeft = 8467
        mmTop = 0
        mmWidth = 180182
        BandType = 7
      end
      object ppShape6: TppShape
        UserName = 'Shape6'
        mmHeight = 63236
        mmLeft = 8467
        mmTop = 27517
        mmWidth = 180182
        BandType = 7
      end
      object ppLine39: TppLine
        UserName = 'Line39'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 139700
        mmTop = 4498
        mmWidth = 48948
        BandType = 7
      end
      object ppLabel115: TppLabel
        UserName = 'Label20'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'TERMS & CONDITIONS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 8467
        mmTop = 22225
        mmWidth = 180182
        BandType = 7
      end
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ParentPrinterSetup = False
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 91017
        mmWidth = 197300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 1270
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 2540
          PrinterSetup.mmPaperHeight = 297128
          PrinterSetup.mmPaperWidth = 210080
          PrinterSetup.PaperSize = 9
          Units = utScreenPixels
          Version = '10.06'
          mmColumnWidth = 0
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 41804
            mmPrintPosition = 0
            object ppFooterMemo: TppMemo
              UserName = 'FooterMemo'
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              CharWrap = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 10848
              mmLeft = 8467
              mmTop = 0
              mmWidth = 173832
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
            object ppMemo4: TppMemo
              UserName = 'Memo5'
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 
                'If there'#39's any changes or cancellation in reservation. Please in' +
                'form us at'#13#10'Phone. +62-21-2967-5555  |  Fax. +62-21-2967-5005  |' +
                '  Hotline. +62-21-6855-1445'#13#10'e-mail. marketing_jkt@whitehorse.co' +
                '.id'#13#10
              CharWrap = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Lines.Strings = (
                
                  'Please sign this confirmation form and send it back to us by ema' +
                  'il or fax to confirm your booking. Thank you')
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4498
              mmLeft = 8467
              mmTop = 10583
              mmWidth = 173832
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
            object ppLabel385: TppLabel
              UserName = 'Label1'
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'Jakarta,'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 22490
              mmTop = 14817
              mmWidth = 11377
              BandType = 4
            end
            object ppDate: TppLabel
              UserName = 'Label2'
              AutoSize = False
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 33867
              mmTop = 14817
              mmWidth = 34131
              BandType = 4
            end
            object ppCompanySign: TppLabel
              UserName = 'CompanySign'
              AutoSize = False
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'PT. Panorama Transportasi Tbk'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 8467
              mmTop = 38100
              mmWidth = 61648
              BandType = 4
            end
            object ppAccepted: TppLabel
              UserName = 'Accepted'
              AutoSize = False
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'Accepted By,'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 116417
              mmTop = 19050
              mmWidth = 53181
              BandType = 4
            end
            object ppLabelSign: TppLabel
              UserName = 'LabelSign'
              AutoSize = False
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = '(..................................................)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 12700
              mmTop = 33867
              mmWidth = 53181
              BandType = 4
            end
            object ppLabelSignatureBelow: TppLabel
              UserName = 'Label1013'
              AutoSize = False
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'Customer'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 116417
              mmTop = 38100
              mmWidth = 53181
              BandType = 4
            end
            object ppLabelSignature: TppLabel
              UserName = 'Label3'
              AutoSize = False
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = '(..................................................)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 116417
              mmTop = 33867
              mmWidth = 53181
              BandType = 4
            end
            object ppSalesSign: TppLabel
              UserName = 'Label4'
              AutoSize = False
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 12700
              mmTop = 33602
              mmWidth = 53181
              BandType = 4
            end
            object ppSincerely: TppLabel
              UserName = 'Sincerely'
              AutoSize = False
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              Caption = 'Sincerely Yours,'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 12700
              mmTop = 18521
              mmWidth = 53181
              BandType = 4
            end
            object ppSignature: TppImage
              UserName = 'Signature'
              MaintainAspectRatio = False
              Stretch = True
              Transparent = True
              Border.BorderPositions = []
              Border.Color = clBlack
              Border.Style = psSolid
              Border.Visible = False
              mmHeight = 12171
              mmLeft = 12700
              mmTop = 21960
              mmWidth = 53181
              BandType = 4
            end
          end
          object ppSummaryBand2: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
      object ppLabelDiscountRp: TppLabel
        UserName = 'Label3'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3683
        mmLeft = 161396
        mmTop = 529
        mmWidth = 5038
        BandType = 7
      end
      object ppDiscount: TppLabel
        UserName = 'LabelPrice1'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3683
        mmLeft = 166688
        mmTop = 529
        mmWidth = 21431
        BandType = 7
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 20108
        mmLeft = 160867
        mmTop = 0
        mmWidth = 265
        BandType = 7
      end
      object ppTotal: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 167217
        mmTop = 12700
        mmWidth = 21431
        BandType = 7
      end
      object ppLabel2: TppLabel
        UserName = 'Label19'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'Rp.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 161396
        mmTop = 12700
        mmWidth = 5556
        BandType = 7
      end
      object ppLabel3: TppLabel
        UserName = 'Label22'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = 'TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 140229
        mmTop = 12700
        mmWidth = 20373
        BandType = 7
      end
      object ppLabelDiscount: TppLabel
        UserName = 'Label27'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 140229
        mmTop = 529
        mmWidth = 20108
        BandType = 7
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 20108
        mmLeft = 139700
        mmTop = 0
        mmWidth = 265
        BandType = 7
      end
      object ppRemakLabel: TppLabel
        UserName = 'LabelTo1'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 8996
        mmTop = 529
        mmWidth = 16669
        BandType = 7
      end
      object ppRemark: TppMemo
        UserName = 'Memo2'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 19844
        mmLeft = 25400
        mmTop = 529
        mmWidth = 113771
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 139700
        mmTop = 9260
        mmWidth = 48948
        BandType = 7
      end
      object ppServicesRp: TppLabel
        UserName = 'ServicesRp'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 161396
        mmTop = 5292
        mmWidth = 5027
        BandType = 7
      end
      object ppServices: TppLabel
        UserName = 'Services'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 166688
        mmTop = 5292
        mmWidth = 21431
        BandType = 7
      end
      object ppServicesLabel: TppLabel
        UserName = 'ServicesLabel'
        AutoSize = False
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 140229
        mmTop = 5292
        mmWidth = 20373
        BandType = 7
      end
      object ppTermsConditionDetail: TppMemo
        UserName = 'TermsConditionDetail'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        Caption = #13#10
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 65881
        mmLeft = 10583
        mmTop = 27517
        mmWidth = 178065
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppTermsConditionDetail2: TppMemo
        UserName = 'TermsConditionDetail1'
        Border.BorderPositions = []
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = False
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 57415
        mmLeft = 10583
        mmTop = 27517
        mmWidth = 178065
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppParameterList4: TppParameterList
    end
  end
end
