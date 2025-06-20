object MateriTrainingForm: TMateriTrainingForm
  Left = 466
  Top = 333
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Materi Training Form'
  ClientHeight = 84
  ClientWidth = 527
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
    Top = 43
    Width = 527
    Height = 41
    Align = alBottom
    TabOrder = 0
    object Simpan: TButton
      Left = 363
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Simpan'
      TabOrder = 0
      OnClick = SimpanClick
    end
    object Selesai: TButton
      Left = 443
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Selesai'
      TabOrder = 1
      OnClick = SelesaiClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 527
    Height = 43
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 71
      Height = 13
      Caption = 'Materi Training'
    end
    object Materi: TEdit
      Left = 88
      Top = 9
      Width = 433
      Height = 21
      TabOrder = 0
      OnKeyPress = MateriKeyPress
    end
  end
end
