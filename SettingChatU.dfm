object SettingChat: TSettingChat
  Left = 331
  Top = 284
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Setting Chat'
  ClientHeight = 115
  ClientWidth = 248
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
    Left = 16
    Top = 24
    Width = 56
    Height = 13
    Caption = 'Chat Server'
  end
  object Label7: TLabel
    Left = 16
    Top = 48
    Width = 44
    Height = 13
    Caption = 'Chat Port'
  end
  object Simpan: TButton
    Left = 96
    Top = 80
    Width = 59
    Height = 25
    Caption = 'Simpan'
    Enabled = False
    TabOrder = 0
    OnClick = SimpanClick
  end
  object Batal: TButton
    Left = 176
    Top = 80
    Width = 59
    Height = 25
    Caption = 'Batal'
    TabOrder = 1
    OnClick = BatalClick
  end
  object Cek: TButton
    Left = 16
    Top = 80
    Width = 57
    Height = 25
    Caption = 'Cek'
    TabOrder = 2
    OnClick = CekClick
  end
  object ChatHost: TEdit
    Left = 80
    Top = 24
    Width = 137
    Height = 21
    TabOrder = 3
    OnKeyPress = ChatHostKeyPress
  end
  object ChatPorts: TEdit
    Left = 80
    Top = 48
    Width = 137
    Height = 21
    TabOrder = 4
    OnKeyPress = ChatPortsKeyPress
  end
  object AutoConnect: TCheckBox
    Left = 80
    Top = 6
    Width = 97
    Height = 17
    Caption = 'Auto Connect'
    TabOrder = 5
    OnKeyPress = AutoConnectKeyPress
  end
end
