object UserList: TUserList
  Left = 296
  Top = 108
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'UserList'
  ClientHeight = 414
  ClientWidth = 811
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
  object Label1: TLabel
    Left = 32
    Top = 8
    Width = 18
    Height = 13
    Caption = 'Cari'
  end
  object Selesai: TButton
    Left = 368
    Top = 384
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 1
    OnClick = SelesaiClick
  end
  object Cari: TEdit
    Left = 56
    Top = 8
    Width = 153
    Height = 21
    TabOrder = 0
    OnChange = CariChange
    OnKeyPress = CariKeyPress
  end
  object StrGrid: TZColorStringGrid
    Left = 8
    Top = 40
    Width = 793
    Height = 337
    ColCount = 7
    DefaultRowHeight = 20
    DefaultDrawing = False
    FixedColor = clBtnFace
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
    TabOrder = 2
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
