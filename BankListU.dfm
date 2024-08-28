object BankList: TBankList
  Left = 540
  Top = 201
  Width = 620
  Height = 378
  BorderIcons = []
  Caption = 'BankList'
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
    Width = 612
    Height = 38
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 5
      Top = 13
      Width = 18
      Height = 13
      Caption = 'Cari'
    end
    object edtCari: TEdit
      Left = 29
      Top = 9
      Width = 250
      Height = 21
      TabOrder = 0
      OnChange = edtCariChange
    end
    object btnSelesai: TButton
      Left = 284
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Selesai'
      TabOrder = 1
      OnClick = btnSelesaiClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 38
    Width = 612
    Height = 306
    Align = alClient
    TabOrder = 1
    object StrGridH: TZColorStringGrid
      Left = 1
      Top = 1
      Width = 610
      Height = 304
      Align = alClient
      ColCount = 3
      DefaultRowHeight = 19
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
end
