object VendorList: TVendorList
  Left = 307
  Top = 200
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Vendor List'
  ClientHeight = 374
  ClientWidth = 798
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
  object Label6: TLabel
    Left = 270
    Top = 32
    Width = 18
    Height = 13
    Alignment = taRightJustify
    Caption = 'Cari'
  end
  object GroupLokasi: TGroupBox
    Left = 8
    Top = 0
    Width = 241
    Height = 57
    TabOrder = 0
    object Label2: TLabel
      Left = 8
      Top = 32
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'Location'
    end
    object Label1: TLabel
      Left = 25
      Top = 8
      Width = 22
      Height = 13
      Alignment = taRightJustify
      Caption = 'SBU'
    end
    object Lokasi: TComboBox
      Left = 56
      Top = 32
      Width = 41
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      OnChange = LokasiChange
    end
    object SBU: TComboBox
      Left = 56
      Top = 8
      Width = 41
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = SBUChange
    end
    object Panel1: TPanel
      Left = 96
      Top = 8
      Width = 129
      Height = 47
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 2
      object SBUDisp: TEdit
        Left = 0
        Top = 0
        Width = 121
        Height = 21
        TabStop = False
        TabOrder = 0
      end
      object LokasiDisp: TEdit
        Left = 0
        Top = 24
        Width = 121
        Height = 21
        TabStop = False
        TabOrder = 1
      end
    end
  end
  object StrGrid: TZColorStringGrid
    Left = 8
    Top = 64
    Width = 777
    Height = 265
    ColCount = 6
    DefaultRowHeight = 20
    DefaultDrawing = False
    FixedColor = clBtnFace
    FixedCols = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
    TabOrder = 1
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
    DefaultFixedCellStyle.BGColor = clBtnFace
    LineDesign.LineUpColor = clWhite
  end
  object Selesai: TButton
    Left = 368
    Top = 344
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 2
    OnClick = SelesaiClick
  end
  object Cari: TEdit
    Left = 296
    Top = 30
    Width = 129
    Height = 21
    TabOrder = 3
    OnChange = CariChange
  end
end
