object FormSPBU: TFormSPBU
  Left = 438
  Top = 260
  BorderStyle = bsSingle
  Caption = 'Form SPBU'
  ClientHeight = 177
  ClientWidth = 336
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 336
    Height = 136
    Align = alClient
    TabOrder = 0
    object lbl1: TLabel
      Left = 24
      Top = 16
      Width = 55
      Height = 13
      Caption = 'Nama SPBU'
    end
    object lbl2: TLabel
      Left = 24
      Top = 39
      Width = 33
      Height = 13
      Caption = 'Alamat'
    end
    object lbl3: TLabel
      Left = 88
      Top = 15
      Width = 4
      Height = 13
      Caption = ':'
    end
    object lbl4: TLabel
      Left = 88
      Top = 40
      Width = 4
      Height = 13
      Caption = ':'
    end
    object SPBU: TEdit
      Left = 98
      Top = 13
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object Alamat: TMemo
      Left = 99
      Top = 38
      Width = 230
      Height = 89
      TabOrder = 1
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 136
    Width = 336
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnSelesai: TButton
      Left = 255
      Top = 3
      Width = 75
      Height = 33
      Caption = 'Simpan'
      TabOrder = 0
    end
  end
end
