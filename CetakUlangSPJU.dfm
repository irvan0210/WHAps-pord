object CetakUlangSPJ: TCetakUlangSPJ
  Left = 199
  Top = 205
  Width = 1089
  Height = 385
  BorderIcons = []
  Caption = 'CetakUlangSPJ'
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
    Top = 36
    Width = 1081
    Height = 283
    Align = alTop
    TabOrder = 0
    object StrGrid: TZColorStringGrid
      Left = 1
      Top = 1
      Width = 1079
      Height = 281
      Align = alClient
      ColCount = 6
      DefaultRowHeight = 20
      DefaultDrawing = False
      FixedColor = clBtnFace
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
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
      DefaultFixedCellStyle.BGColor = clBtnFace
      LineDesign.LineUpColor = clWhite
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 319
    Width = 1081
    Height = 32
    Align = alClient
    TabOrder = 1
    object Label2: TLabel
      Left = 13
      Top = 9
      Width = 36
      Height = 13
      Caption = 'SPJ ID '
    end
    object btnCetak: TButton
      Left = 262
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Cetak'
      TabOrder = 0
      OnClick = btnCetakClick
    end
    object edtDataSPJID: TEdit
      Left = 55
      Top = 5
      Width = 200
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object btnSelesai: TButton
      Left = 344
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Selesai'
      TabOrder = 2
      OnClick = btnSelesaiClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 1081
    Height = 36
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 13
      Top = 12
      Width = 74
      Height = 13
      Caption = 'Reservation ID '
    end
    object edtIReservationID: TEdit
      Left = 86
      Top = 8
      Width = 290
      Height = 21
      TabOrder = 0
    end
    object btnBatal: TButton
      Left = 382
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Batal'
      TabOrder = 1
      OnClick = btnBatalClick
    end
  end
end
