object CctvCameraList: TCctvCameraList
  Left = 432
  Top = 365
  Width = 620
  Height = 400
  BorderIcons = []
  Caption = 'Daftar Kamera CCTV'
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 604
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 12
      Top = 13
      Width = 21
      Height = 13
      Caption = 'Cari '
    end
    object edtCari: TEdit
      Left = 45
      Top = 9
      Width = 220
      Height = 21
      TabOrder = 0
      OnChange = edtCariChange
    end
    object btnTambah: TButton
      Left = 273
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Tambah'
      TabOrder = 1
      OnClick = btnTambahClick
    end
    object btnEdit: TButton
      Left = 353
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Edit'
      TabOrder = 2
      OnClick = btnEditClick
    end
    object btnNonaktifkan: TButton
      Left = 433
      Top = 8
      Width = 90
      Height = 25
      Caption = 'Nonaktifkan'
      TabOrder = 3
      OnClick = btnNonaktifkanClick
    end
    object btnSelesai: TButton
      Left = 528
      Top = 8
      Width = 70
      Height = 25
      Caption = 'Selesai'
      TabOrder = 4
      OnClick = btnSelesaiClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 604
    Height = 320
    Align = alClient
    TabOrder = 1
    object StrGridH: TZColorStringGrid
      Left = 1
      Top = 1
      Width = 602
      Height = 318
      Align = alClient
      ColCount = 6
      DefaultColWidth = 100
      DefaultRowHeight = 18
      DefaultDrawing = False
      FixedColor = clBtnFace
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
      TabOrder = 0
      OnDblClick = StrGridHDblClick
      OnSelectCell = StrGridHSelectCell
      DefaultCellStyle.Font.Charset = DEFAULT_CHARSET
      DefaultCellStyle.Font.Color = clWindowText
      DefaultCellStyle.Font.Height = -11
      DefaultCellStyle.Font.Name = 'Tahoma'
      DefaultCellStyle.Font.Style = []
      DefaultCellStyle.BGColor = clWindow
      DefaultFixedCellStyle.Font.Charset = DEFAULT_CHARSET
      DefaultFixedCellStyle.Font.Color = clWindowText
      DefaultFixedCellStyle.Font.Height = -11
      DefaultFixedCellStyle.Font.Name = 'Tahoma'
      DefaultFixedCellStyle.Font.Style = []
      DefaultFixedCellStyle.BGColor = clBtnFace
      LineDesign.LineUpColor = clWhite
    end
  end
end
