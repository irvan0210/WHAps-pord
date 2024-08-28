object ArgoAllowanceForm: TArgoAllowanceForm
  Left = 253
  Top = 276
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Argo dan Komisi Mitra'
  ClientHeight = 276
  ClientWidth = 1022
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
  object Label2: TLabel
    Left = 114
    Top = 136
    Width = 31
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tahun'
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 0
    Width = 537
    Height = 129
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
    object Label3: TLabel
      Left = 105
      Top = 104
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Alamat'
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
  object Year: TEdit
    Left = 152
    Top = 132
    Width = 57
    Height = 21
    TabOrder = 1
  end
  object StrGrid: TZColorStringGrid
    Left = 5
    Top = 157
    Width = 1004
    Height = 84
    ColCount = 15
    DefaultRowHeight = 20
    DefaultDrawing = False
    FixedColor = clBtnFace
    FixedCols = 0
    RowCount = 3
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
    ScrollBars = ssHorizontal
    TabOrder = 2
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
    Left = 456
    Top = 245
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 3
    OnClick = SelesaiClick
  end
  object Lihat: TButton
    Left = 216
    Top = 131
    Width = 75
    Height = 25
    Caption = 'Lihat'
    TabOrder = 4
    OnClick = LihatClick
  end
end
