object MateriTrainingList: TMateriTrainingList
  Left = 419
  Top = 420
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Materi Training List'
  ClientHeight = 531
  ClientWidth = 757
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
  object Label1: TLabel
    Left = 504
    Top = 12
    Width = 19
    Height = 13
    Caption = 'Cari'
  end
  object StrGrid: TZColorStringGrid
    Left = 2
    Top = 40
    Width = 751
    Height = 441
    ColCount = 9
    DefaultRowHeight = 22
    DefaultDrawing = False
    FixedColor = clSkyBlue
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
    TabOrder = 0
    OnDblClick = StrGridDblClick
    OnSelectCell = StrGridSelectCell
    DefaultCellStyle.Font.Charset = DEFAULT_CHARSET
    DefaultCellStyle.Font.Color = clWindowText
    DefaultCellStyle.Font.Height = -11
    DefaultCellStyle.Font.Name = 'MS Sans Serif'
    DefaultCellStyle.Font.Style = []
    DefaultCellStyle.BGColor = clWindow
    DefaultFixedCellStyle.Font.Charset = DEFAULT_CHARSET
    DefaultFixedCellStyle.Font.Color = clWindowText
    DefaultFixedCellStyle.Font.Height = -11
    DefaultFixedCellStyle.Font.Name = 'MS Sans Serif'
    DefaultFixedCellStyle.Font.Style = []
    DefaultFixedCellStyle.BGColor = clSkyBlue
    LineDesign.LineUpColor = clWhite
  end
  object Selesai: TButton
    Left = 381
    Top = 496
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 1
    OnClick = SelesaiClick
  end
  object GroupTotal: TGroupBox
    Left = 5
    Top = 485
    Width = 92
    Height = 33
    Enabled = False
    TabOrder = 2
    object Label2: TLabel
      Left = 8
      Top = 11
      Width = 24
      Height = 13
      Caption = 'Total'
    end
    object Total: TMemo
      Left = 42
      Top = 8
      Width = 47
      Height = 22
      Alignment = taRightJustify
      TabOrder = 0
    end
  end
  object Cari: TEdit
    Left = 528
    Top = 8
    Width = 225
    Height = 21
    TabOrder = 3
    OnChange = CariChange
  end
  object Tambah: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Tambah'
    TabOrder = 4
    OnClick = TambahClick
  end
end
