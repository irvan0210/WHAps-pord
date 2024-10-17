object EmployeeHistoryForm: TEmployeeHistoryForm
  Left = 346
  Top = 136
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Latar Karyawan'
  ClientHeight = 543
  ClientWidth = 869
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 869
    Height = 130
    Align = alTop
    Caption = 'Data'
    Enabled = False
    TabOrder = 0
    object LabelId: TLabel
      Left = 99
      Top = 8
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'No KPP'
    end
    object Label10: TLabel
      Left = 109
      Top = 56
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nama'
    end
    object Label3: TLabel
      Left = 105
      Top = 104
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Alamat'
    end
    object Label5: TLabel
      Left = 273
      Top = 8
      Width = 16
      Height = 13
      Alignment = taRightJustify
      Caption = 's/d'
    end
    object Label6: TLabel
      Left = 55
      Top = 80
      Width = 82
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tempat/Tgl Lahir'
    end
    object Label7: TLabel
      Left = 43
      Top = 32
      Width = 94
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tanggal Bergabung'
    end
    object IdKaryawan: TEdit
      Left = 144
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object KPPExpired: TEdit
      Left = 296
      Top = 8
      Width = 81
      Height = 21
      TabOrder = 1
    end
    object Name: TEdit
      Left = 144
      Top = 56
      Width = 233
      Height = 21
      TabOrder = 2
    end
    object Address: TEdit
      Left = 144
      Top = 104
      Width = 385
      Height = 21
      TabOrder = 3
    end
    object Birth: TEdit
      Left = 144
      Top = 80
      Width = 137
      Height = 21
      TabOrder = 4
    end
    object JoinDate: TEdit
      Left = 144
      Top = 32
      Width = 81
      Height = 21
      TabOrder = 5
    end
  end
  object Groupbox_data_korban: TGroupBox
    Left = 0
    Top = 130
    Width = 869
    Height = 159
    Align = alTop
    Caption = 'Data Korban'
    TabOrder = 1
    object Label1: TLabel
      Left = 9
      Top = 16
      Width = 128
      Height = 13
      Alignment = taRightJustify
      Caption = 'Pencapaian / Kemunduran'
    end
    object Label2: TLabel
      Left = 98
      Top = 40
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tanggal'
    end
    object Labelsd: TLabel
      Left = 241
      Top = 41
      Width = 16
      Height = 13
      Alignment = taRightJustify
      Caption = 's/d'
    end
    object LabelDept: TLabel
      Left = 85
      Top = 63
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = 'Departmen'
    end
    object lblUsiaKorban: TLabel
      Left = 512
      Top = 64
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Caption = 'Usia Korban'
    end
    object lblJamkejadian: TLabel
      Left = 507
      Top = 15
      Width = 63
      Height = 13
      Alignment = taRightJustify
      Caption = 'Jam Kejadian'
    end
    object lblNamaKorban: TLabel
      Left = 505
      Top = 41
      Width = 65
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nama Korban'
    end
    object LabelInstitusi: TLabel
      Left = 102
      Top = 87
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Institusi'
    end
    object lblTools: TLabel
      Left = 492
      Top = 87
      Width = 78
      Height = 13
      Alignment = taRightJustify
      Caption = 'Alat yang terlibat'
    end
    object LabelKota: TLabel
      Left = 114
      Top = 108
      Width = 22
      Height = 13
      Alignment = taRightJustify
      Caption = 'Kota'
    end
    object lblProsess: TLabel
      Left = 490
      Top = 110
      Width = 80
      Height = 13
      Alignment = taRightJustify
      Caption = 'Proses / Aktifitas'
    end
    object lblMateriSejumlah: TLabel
      Left = 61
      Top = 133
      Width = 75
      Height = 13
      Alignment = taRightJustify
      Caption = 'Materi Sejumlah'
    end
    object lblAbsent: TLabel
      Left = 481
      Top = 133
      Width = 89
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tidak Masuk Kerja'
    end
    object lblKet_materi: TLabel
      Left = 236
      Top = 132
      Width = 48
      Height = 13
      Alignment = taRightJustify
      Caption = 'Ket Materi'
    end
    object lblPelapor: TLabel
      Left = 630
      Top = 15
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Pelapor'
    end
    object Detail: TComboBox
      Left = 144
      Top = 12
      Width = 206
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = DetailChange
    end
    object DateStart: TDateTimePicker
      Left = 144
      Top = 36
      Width = 89
      Height = 21
      Date = 41683.700159282410000000
      Time = 41683.700159282410000000
      TabOrder = 1
    end
    object DateEnd: TDateTimePicker
      Left = 264
      Top = 36
      Width = 89
      Height = 21
      Date = 41683.700159282410000000
      Time = 41683.700159282410000000
      TabOrder = 2
    end
    object Departemen: TEdit
      Left = 144
      Top = 60
      Width = 137
      Height = 21
      TabOrder = 3
    end
    object VictimsName: TEdit
      Left = 576
      Top = 36
      Width = 273
      Height = 21
      TabOrder = 4
    end
    object Institution: TEdit
      Left = 144
      Top = 83
      Width = 313
      Height = 21
      TabOrder = 5
    end
    object Tools: TEdit
      Left = 576
      Top = 83
      Width = 273
      Height = 21
      TabOrder = 6
    end
    object City: TEdit
      Left = 144
      Top = 106
      Width = 313
      Height = 21
      TabOrder = 7
    end
    object Proses: TEdit
      Left = 576
      Top = 106
      Width = 273
      Height = 21
      TabOrder = 8
    end
    object AmountOfMaterial: TEdit
      Left = 144
      Top = 129
      Width = 89
      Height = 21
      TabOrder = 9
      OnKeyPress = AmountOfMaterialKeyPress
    end
    object Absent: TEdit
      Left = 576
      Top = 129
      Width = 273
      Height = 21
      TabOrder = 10
    end
    object victimsaAge: TSpinEdit
      Left = 576
      Top = 59
      Width = 71
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 11
      Value = 0
    end
    object Time: TMaskEdit
      Left = 576
      Top = 12
      Width = 44
      Height = 21
      EditMask = '99:99;1;_'
      MaxLength = 5
      TabOrder = 12
      Text = '  :  '
    end
    object amount_note: TEdit
      Left = 293
      Top = 128
      Width = 164
      Height = 21
      TabOrder = 13
    end
    object Reporter: TEdit
      Left = 672
      Top = 12
      Width = 177
      Height = 21
      TabOrder = 14
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 289
    Width = 869
    Height = 213
    Align = alClient
    TabOrder = 2
    object LabelFollowUp: TLabel
      Left = 15
      Top = 149
      Width = 65
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tindak Lanjut'
      WordWrap = True
    end
    object labelAccident: TLabel
      Left = 23
      Top = 75
      Width = 57
      Height = 26
      Alignment = taRightJustify
      Caption = 'Penyebab '#13#10'Kecelakaan'
      WordWrap = True
    end
    object LabelKet: TLabel
      Left = 25
      Top = 13
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'Keterangan'
      WordWrap = True
    end
    object lblSaranAtasan: TLabel
      Left = 465
      Top = 15
      Width = 104
      Height = 26
      Alignment = taRightJustify
      Caption = 'Saran / Rekomendasi'#13#10' Atasan Terkait'
    end
    object lblSaranQHSE: TLabel
      Left = 465
      Top = 84
      Width = 104
      Height = 26
      Alignment = taRightJustify
      Caption = 'Saran / Rekomendasi'#13#10' QHSE / MR'
    end
    object lblSaranDireaksi: TLabel
      Left = 465
      Top = 151
      Width = 104
      Height = 26
      Alignment = taRightJustify
      Caption = 'Saran / Rekomendasi'#13#10'Direktur Oprasional'
    end
    object FollowUp: TMemo
      Left = 85
      Top = 145
      Width = 364
      Height = 60
      TabOrder = 0
    end
    object Accident: TMemo
      Left = 84
      Top = 75
      Width = 286
      Height = 65
      TabOrder = 1
    end
    object Description: TMemo
      Left = 85
      Top = 12
      Width = 286
      Height = 60
      TabOrder = 2
    end
    object note_spv: TMemo
      Left = 575
      Top = 12
      Width = 281
      Height = 60
      TabOrder = 3
    end
    object note_mr: TMemo
      Left = 576
      Top = 83
      Width = 281
      Height = 65
      TabOrder = 4
    end
    object note_direktur: TMemo
      Left = 576
      Top = 147
      Width = 281
      Height = 60
      TabOrder = 5
    end
    object pnlunsafe: TPanel
      Left = 370
      Top = 12
      Width = 80
      Height = 61
      TabOrder = 6
      object chkUnsafe_action: TCheckBox
        Left = 5
        Top = 4
        Width = 70
        Height = 25
        Caption = 'Unsafe action'
        TabOrder = 0
        WordWrap = True
        OnClick = chkUnsafe_actionClick
      end
      object chkUnsafe_condition: TCheckBox
        Left = 5
        Top = 34
        Width = 70
        Height = 25
        Caption = 'Unsafe condition'
        TabOrder = 1
        WordWrap = True
        OnClick = chkUnsafe_conditionClick
      end
    end
    object pnlfactor: TPanel
      Left = 370
      Top = 76
      Width = 80
      Height = 64
      TabOrder = 7
      object chkPersonal_factor: TCheckBox
        Left = 5
        Top = 4
        Width = 70
        Height = 25
        Caption = 'Personal factor'
        TabOrder = 0
        WordWrap = True
        OnClick = chkPersonal_factorClick
      end
      object chkJob_factor: TCheckBox
        Left = 5
        Top = 32
        Width = 70
        Height = 25
        Caption = 'Job factor'
        TabOrder = 1
        WordWrap = True
        OnClick = chkJob_factorClick
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 502
    Width = 869
    Height = 41
    Align = alBottom
    TabOrder = 3
    object Simpan: TButton
      Left = 236
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Simpan'
      TabOrder = 0
      OnClick = SimpanClick
    end
    object Selesai: TButton
      Left = 325
      Top = 8
      Width = 75
      Height = 24
      Caption = 'Selesai'
      TabOrder = 1
      OnClick = SelesaiClick
    end
  end
end
