object PaymentReceived: TPaymentReceived
  Left = 245
  Top = 136
  Width = 1051
  Height = 526
  BorderIcons = []
  Caption = 'PaymentReceived'
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
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDisplayH: TPanel
    Left = 0
    Top = 0
    Width = 1043
    Height = 120
    Align = alTop
    TabOrder = 0
    object Label2: TLabel
      Left = 14
      Top = 10
      Width = 94
      Height = 13
      Caption = 'Nama Perusahaan  '
    end
    object Label3: TLabel
      Left = 81
      Top = 76
      Width = 27
      Height = 13
      Caption = 'Total '
    end
    object edtTotalH: TEdit
      Left = 107
      Top = 72
      Width = 144
      Height = 21
      TabOrder = 0
      Text = '0'
      OnExit = edtTotalHExit
      OnKeyPress = edtTotalHKeyPress
    end
    object GroupBox5: TGroupBox
      Left = 107
      Top = 26
      Width = 240
      Height = 43
      Caption = 'Pembayaran '
      TabOrder = 1
      object Label5: TLabel
        Left = 9
        Top = 20
        Width = 18
        Height = 13
        Caption = 'Tgl '
      end
      object Label6: TLabel
        Left = 141
        Top = 20
        Width = 22
        Height = 13
        Caption = 'Jam '
      end
      object dtpTglPembayaran: TDateTimePicker
        Left = 29
        Top = 16
        Width = 86
        Height = 21
        Date = 41473.647034143520000000
        Time = 41473.647034143520000000
        TabOrder = 0
        OnKeyPress = dtpTglPembayaranKeyPress
      end
      object dtpWaktuPembayaran: TDateTimePicker
        Left = 165
        Top = 16
        Width = 68
        Height = 21
        Date = 41473.647034143520000000
        Time = 41473.647034143520000000
        Kind = dtkTime
        TabOrder = 1
        OnKeyPress = dtpWaktuPembayaranKeyPress
      end
    end
    object cmbNamaCompany: TComboBox
      Left = 107
      Top = 7
      Width = 150
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      OnChange = cmbNamaCompanyChange
      OnKeyPress = cmbNamaCompanyKeyPress
    end
  end
  object pnlDisplayD: TPanel
    Left = 0
    Top = 120
    Width = 1043
    Height = 340
    Align = alTop
    TabOrder = 1
    object Label24: TLabel
      Left = 719
      Top = 201
      Width = 30
      Height = 13
      Caption = 'Total  '
      Visible = False
    end
    object Label27: TLabel
      Left = 720
      Top = 177
      Width = 30
      Height = 13
      Caption = 'Pajak '
      Visible = False
    end
    object Label28: TLabel
      Left = 157
      Top = 231
      Width = 61
      Height = 13
      Caption = 'Keterangan  '
      Visible = False
    end
    object Label1: TLabel
      Left = 320
      Top = 179
      Width = 60
      Height = 13
      Caption = 'No Account '
      Visible = False
    end
    object Label4: TLabel
      Left = 341
      Top = 201
      Width = 39
      Height = 13
      Caption = 'Amount '
      Visible = False
    end
    object Label7: TLabel
      Left = 811
      Top = 178
      Width = 14
      Height = 13
      Caption = '%  '
      Visible = False
    end
    object GroupBox2: TGroupBox
      Left = 3
      Top = 220
      Width = 57
      Height = 60
      Caption = 'Di Terima '
      TabOrder = 1
      Visible = False
      object Label14: TLabel
        Left = 13
        Top = 36
        Width = 35
        Height = 13
        Caption = 'Waktu '
      end
      object Label13: TLabel
        Left = 6
        Top = 14
        Width = 42
        Height = 13
        Caption = 'Tanggal '
      end
    end
    object cmbNamaTypeID: TComboBox
      Left = 11
      Top = 175
      Width = 150
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      Visible = False
      OnChange = cmbNamaTypeIDChange
      OnExit = cmbNamaTypeIDExit
    end
    object edtTypeID: TEdit
      Left = 165
      Top = 175
      Width = 150
      Height = 21
      ReadOnly = True
      TabOrder = 3
      Visible = False
    end
    object edtNoAccount: TEdit
      Left = 379
      Top = 175
      Width = 150
      Height = 21
      TabOrder = 4
      Visible = False
      OnEnter = edtNoAccountEnter
      OnExit = edtNoAccountExit
      OnKeyPress = edtNoAccountKeyPress
    end
    object edtAmount: TEdit
      Left = 379
      Top = 197
      Width = 150
      Height = 21
      TabOrder = 5
      Text = '0'
      Visible = False
      OnEnter = edtAmountEnter
      OnExit = edtAmountExit
      OnKeyPress = edtAmountKeyPress
    end
    object edtDiscRupiahDetail: TEdit
      Left = 592
      Top = 175
      Width = 120
      Height = 21
      MaxLength = 10
      TabOrder = 6
      Text = '0'
      Visible = False
      OnEnter = edtDiscRupiahDetailEnter
      OnExit = edtDiscRupiahDetailExit
      OnKeyPress = edtDiscRupiahDetailKeyPress
    end
    object edtDiscPercentDetail: TEdit
      Left = 592
      Top = 197
      Width = 56
      Height = 21
      MaxLength = 3
      TabOrder = 7
      Text = '0'
      Visible = False
      OnEnter = edtDiscPercentDetailEnter
      OnExit = edtDiscPercentDetailExit
      OnKeyPress = edtDiscPercentDetailKeyPress
    end
    object edtPajakDetail: TEdit
      Left = 752
      Top = 175
      Width = 56
      Height = 21
      MaxLength = 3
      TabOrder = 8
      Text = '0'
      Visible = False
      OnEnter = edtPajakDetailEnter
      OnExit = edtPajakDetailExit
      OnKeyPress = edtPajakDetailKeyPress
    end
    object edtTotalD: TEdit
      Left = 753
      Top = 197
      Width = 150
      Height = 21
      TabOrder = 9
      Text = '0'
      Visible = False
      OnEnter = edtTotalDEnter
      OnExit = edtTotalDExit
      OnKeyPress = edtTotalDKeyPress
    end
    object dtpTglDiterima: TDateTimePicker
      Left = 64
      Top = 230
      Width = 90
      Height = 21
      Date = 41473.000000000000000000
      Time = 41473.000000000000000000
      DragKind = dkDock
      TabOrder = 10
      Visible = False
      OnExit = dtpTglDiterimaExit
      OnKeyPress = dtpTglDiterimaKeyPress
    end
    object dtpWaktuDiterima: TDateTimePicker
      Left = 64
      Top = 252
      Width = 90
      Height = 21
      Date = 41473.647034143520000000
      Time = 41473.647034143520000000
      Kind = dtkTime
      TabOrder = 11
      Visible = False
      OnExit = dtpWaktuDiterimaExit
      OnKeyPress = dtpWaktuDiterimaKeyPress
    end
    object mKeteranganD: TMemo
      Left = 221
      Top = 227
      Width = 264
      Height = 21
      TabOrder = 12
      Visible = False
      OnEnter = mKeteranganDEnter
      OnExit = mKeteranganDExit
      OnKeyPress = mKeteranganDKeyPress
    end
    object cmbNamaBankH: TComboBox
      Left = 11
      Top = 197
      Width = 150
      Height = 21
      ItemHeight = 13
      TabOrder = 13
      Visible = False
      OnChange = cmbNamaBankHChange
      OnExit = cmbNamaBankHExit
    end
    object edtBankID: TEdit
      Left = 165
      Top = 197
      Width = 150
      Height = 21
      ReadOnly = True
      TabOrder = 14
      Visible = False
    end
    object btnSimpanH: TButton
      Left = 962
      Top = 283
      Width = 75
      Height = 25
      Caption = 'Simpan'
      TabOrder = 15
      OnClick = btnSimpanHClick
    end
    object btnBersih: TButton
      Left = 962
      Top = 311
      Width = 75
      Height = 25
      Caption = 'Bersih'
      TabOrder = 16
      OnClick = btnBersihClick
    end
    object GroupBox4: TGroupBox
      Left = 532
      Top = 168
      Width = 57
      Height = 60
      Caption = 'Discount'
      TabOrder = 17
      Visible = False
      object Label15: TLabel
        Left = 9
        Top = 15
        Width = 17
        Height = 13
        Caption = 'Rp '
      end
      object Label16: TLabel
        Left = 11
        Top = 37
        Width = 14
        Height = 13
        Caption = '%  '
      end
    end
    object GroupNamaProduct: TGroupBox
      Left = 1
      Top = 1
      Width = 1041
      Height = 280
      Align = alTop
      Caption = 'Nama Product '
      TabOrder = 0
      TabStop = True
      object GridNamaProduct: TStringGrid
        Left = 2
        Top = 15
        Width = 1037
        Height = 263
        Align = alClient
        ColCount = 11
        DefaultRowHeight = 18
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goVertLine, goHorzLine]
        TabOrder = 0
        OnSelectCell = GridNamaProductSelectCell
        ColWidths = (
          79
          56
          65
          47
          75
          92
          64
          54
          64
          64
          64)
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 460
    Width = 1043
    Height = 32
    Align = alClient
    TabOrder = 2
    object btnSelesai: TButton
      Left = 962
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Selesai'
      TabOrder = 0
      OnClick = btnSelesaiClick
    end
  end
end
