object Setting: TSetting
  Left = 252
  Top = 164
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Setting Database'
  ClientHeight = 183
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
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 31
    Height = 13
    Caption = 'Server'
  end
  object Label2: TLabel
    Left = 16
    Top = 56
    Width = 48
    Height = 13
    Caption = 'Username'
  end
  object Label3: TLabel
    Left = 16
    Top = 80
    Width = 46
    Height = 13
    Caption = 'Password'
  end
  object Label4: TLabel
    Left = 16
    Top = 32
    Width = 46
    Height = 13
    Caption = 'Database'
  end
  object Label5: TLabel
    Left = 16
    Top = 128
    Width = 39
    Height = 13
    Caption = 'Provider'
  end
  object Username: TEdit
    Left = 80
    Top = 56
    Width = 137
    Height = 21
    TabOrder = 2
    OnKeyPress = UsernameKeyPress
  end
  object Simpan: TButton
    Left = 88
    Top = 152
    Width = 59
    Height = 25
    Caption = 'Simpan'
    Enabled = False
    TabOrder = 4
    OnClick = SimpanClick
  end
  object Batal: TButton
    Left = 168
    Top = 152
    Width = 59
    Height = 25
    Caption = 'Batal'
    TabOrder = 5
    OnClick = BatalClick
  end
  object Database: TEdit
    Left = 80
    Top = 32
    Width = 137
    Height = 21
    TabOrder = 1
    OnKeyPress = DatabaseKeyPress
  end
  object Host: TEdit
    Left = 80
    Top = 8
    Width = 137
    Height = 21
    TabOrder = 0
    OnKeyPress = HostKeyPress
  end
  object Password: TMaskEdit
    Left = 80
    Top = 80
    Width = 137
    Height = 21
    PasswordChar = '*'
    TabOrder = 3
    OnKeyPress = PasswordKeyPress
  end
  object Cek: TButton
    Left = 8
    Top = 152
    Width = 57
    Height = 25
    Caption = 'Cek'
    TabOrder = 6
    OnClick = CekClick
  end
  object ChangeProvider: TCheckBox
    Left = 80
    Top = 104
    Width = 57
    Height = 17
    Hint = 'Please Do Not Change This Value Without Proper Knowledge'
    Caption = 'Lock'
    Checked = True
    ParentShowHint = False
    ShowHint = True
    State = cbChecked
    TabOrder = 8
    OnClick = ChangeProviderClick
  end
  object Provider: TEdit
    Left = 80
    Top = 120
    Width = 137
    Height = 21
    TabOrder = 7
    OnKeyPress = DatabaseKeyPress
  end
end
