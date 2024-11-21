object Part: TPart
  Left = 598
  Top = 269
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Part'
  ClientHeight = 128
  ClientWidth = 478
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 478
    Height = 89
    TabOrder = 0
    object Label1: TLabel
      Left = 7
      Top = 12
      Width = 63
      Height = 13
      Caption = 'Kode Part GP'
    end
    object Label2: TLabel
      Left = 19
      Top = 38
      Width = 50
      Height = 13
      Caption = 'Nama Part'
    end
    object Label3: TLabel
      Left = 10
      Top = 60
      Width = 61
      Height = 13
      Caption = 'KM Standard'
    end
    object Label4: TLabel
      Left = 18
      Top = 71
      Width = 52
      Height = 13
      Caption = 'Pergantian'
    end
    object KodePart: TEdit
      Left = 75
      Top = 8
      Width = 137
      Height = 21
      TabOrder = 0
    end
    object KmStandardPergantian: TEdit
      Left = 76
      Top = 63
      Width = 92
      Height = 21
      TabOrder = 1
      OnChange = KmStandardPergantianChange
      OnExit = KmStandardPergantianExit
      OnKeyPress = KmStandardPergantianKeyPress
    end
  end
  object PartName: TEdit
    Left = 76
    Top = 35
    Width = 393
    Height = 21
    TabOrder = 1
  end
  object Panel2: TPanel
    Left = 0
    Top = 87
    Width = 478
    Height = 41
    Align = alBottom
    TabOrder = 2
    object Simpan: TButton
      Left = 233
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Simpan'
      TabOrder = 0
      OnClick = SimpanClick
    end
    object Bersihkan: TButton
      Left = 313
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Bersihkan'
      TabOrder = 1
      OnClick = BersihkanClick
    end
    object Selesai: TButton
      Left = 393
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Selesai'
      TabOrder = 2
      OnClick = SelesaiClick
    end
  end
end
