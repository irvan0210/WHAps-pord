object NoteRejectPKB: TNoteRejectPKB
  Left = 224
  Top = 168
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Reject PKB'
  ClientHeight = 157
  ClientWidth = 342
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 7
    Top = 16
    Width = 39
    Height = 13
    Caption = 'Alasan :'
  end
  object NoteReject: TMemo
    Left = 56
    Top = 8
    Width = 273
    Height = 113
    TabOrder = 0
  end
  object Simpan: TButton
    Left = 167
    Top = 125
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 1
    OnClick = SimpanClick
  end
  object Batal: TButton
    Left = 248
    Top = 125
    Width = 75
    Height = 25
    Caption = 'Batal'
    TabOrder = 2
    OnClick = BatalClick
  end
end
