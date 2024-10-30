object ResponsDriverComplaint: TResponsDriverComplaint
  Left = 503
  Top = 110
  Width = 529
  Height = 451
  Caption = 'Respons Driver Complaint'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 513
    Height = 265
    Align = alTop
    Caption = 'Data Keluhan Driver'
    TabOrder = 0
    object Label1: TLabel
      Left = 19
      Top = 24
      Width = 86
      Height = 13
      Alignment = taRightJustify
      Caption = 'No Keluhan Driver'
    end
    object Label2: TLabel
      Left = 53
      Top = 49
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = 'Pengemudi'
    end
    object Label3: TLabel
      Left = 341
      Top = 49
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'No Polisi'
    end
    object Label4: TLabel
      Left = 341
      Top = 24
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tanggal'
    end
    object Label5: TLabel
      Left = 67
      Top = 75
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Keluhan'
    end
    object NoKeluhan: TEdit
      Left = 112
      Top = 21
      Width = 217
      Height = 21
      TabOrder = 0
    end
    object Driver: TEdit
      Left = 112
      Top = 46
      Width = 217
      Height = 21
      TabOrder = 1
    end
    object NoPolisi: TEdit
      Left = 387
      Top = 46
      Width = 89
      Height = 21
      TabOrder = 2
    end
    object tgl_request: TEdit
      Left = 387
      Top = 20
      Width = 88
      Height = 21
      TabOrder = 3
    end
    object StrGrid: TStringGrid
      Left = 111
      Top = 71
      Width = 364
      Height = 178
      Color = clBtnFace
      ColCount = 1
      DefaultColWidth = 340
      DefaultRowHeight = 18
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      TabOrder = 4
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 265
    Width = 513
    Height = 147
    Align = alClient
    TabOrder = 1
    object Label6: TLabel
      Left = 66
      Top = 19
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Respon '
    end
    object memoRespon: TMemo
      Left = 112
      Top = 14
      Width = 366
      Height = 89
      HideSelection = False
      TabOrder = 0
    end
    object keluar: TButton
      Left = 296
      Top = 109
      Width = 75
      Height = 25
      Caption = 'Keluar'
      TabOrder = 1
      OnClick = keluarClick
    end
    object save: TButton
      Left = 214
      Top = 110
      Width = 75
      Height = 25
      Caption = 'Simpan'
      TabOrder = 2
      OnClick = saveClick
    end
  end
end
