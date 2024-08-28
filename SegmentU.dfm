object Segment: TSegment
  Left = 349
  Top = 234
  Width = 428
  Height = 210
  BorderIcons = []
  Caption = 'Segment'
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
  object pnlDisplay: TPanel
    Left = 0
    Top = 0
    Width = 420
    Height = 144
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 34
      Top = 43
      Width = 76
      Height = 13
      Caption = 'Nama Segment '
    end
    object Label2: TLabel
      Left = 81
      Top = 65
      Width = 29
      Height = 13
      Caption = 'Level '
    end
    object Label3: TLabel
      Left = 96
      Top = 21
      Width = 14
      Height = 13
      Caption = 'ID '
    end
    object edtID: TEdit
      Left = 112
      Top = 17
      Width = 121
      Height = 21
      TabOrder = 0
      OnKeyPress = edtIDKeyPress
    end
    object edtNamaSegment: TEdit
      Left = 112
      Top = 40
      Width = 250
      Height = 21
      TabOrder = 1
      OnKeyPress = edtNamaSegmentKeyPress
    end
    object edtLevel: TEdit
      Left = 112
      Top = 62
      Width = 30
      Height = 21
      TabOrder = 2
      OnKeyPress = edtLevelKeyPress
    end
    object btnSimpanH: TButton
      Left = 340
      Top = 89
      Width = 75
      Height = 25
      Caption = 'Simpan'
      TabOrder = 3
      OnClick = btnSimpanHClick
    end
    object btnBersih: TButton
      Left = 340
      Top = 116
      Width = 75
      Height = 25
      Caption = 'Bersih'
      TabOrder = 4
      OnClick = btnBersihClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 144
    Width = 420
    Height = 32
    Align = alClient
    TabOrder = 1
    object btnSelesai: TButton
      Left = 339
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Selesai'
      TabOrder = 0
      OnClick = btnSelesaiClick
    end
  end
end
