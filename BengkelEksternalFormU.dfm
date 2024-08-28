object BengkelEksternalForm: TBengkelEksternalForm
  Left = 325
  Top = 178
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Bengkel Eksternal'
  ClientHeight = 217
  ClientWidth = 337
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
  OnActivate = FormActivate
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 18
    Top = 32
    Width = 70
    Height = 13
    Alignment = taRightJustify
    Caption = 'Nama Bengkel'
  end
  object Label2: TLabel
    Left = 56
    Top = 56
    Width = 32
    Height = 13
    Alignment = taRightJustify
    Caption = 'Alamat'
  end
  object Label3: TLabel
    Left = 67
    Top = 80
    Width = 21
    Height = 13
    Alignment = taRightJustify
    Caption = 'Telp'
  end
  object Label4: TLabel
    Left = 71
    Top = 104
    Width = 17
    Height = 13
    Alignment = taRightJustify
    Caption = 'Fax'
  end
  object Label5: TLabel
    Left = 40
    Top = 128
    Width = 48
    Height = 13
    Alignment = taRightJustify
    Caption = 'Nama PIC'
  end
  object Label6: TLabel
    Left = 32
    Top = 152
    Width = 56
    Height = 13
    Alignment = taRightJustify
    Caption = 'Handphone'
  end
  object Label7: TLabel
    Left = 19
    Top = 8
    Width = 69
    Height = 13
    Alignment = taRightJustify
    Caption = 'Bussiness Unit'
  end
  object Selesai: TButton
    Left = 240
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 0
    OnClick = SelesaiClick
  end
  object Simpan: TButton
    Left = 24
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 1
    OnClick = SimpanClick
  end
  object GroupInput: TPanel
    Left = 96
    Top = 8
    Width = 209
    Height = 169
    BevelOuter = bvNone
    TabOrder = 2
    object Nama: TEdit
      Left = 0
      Top = 24
      Width = 206
      Height = 21
      TabOrder = 0
      OnKeyPress = NamaKeyPress
    end
    object Alamat: TEdit
      Left = 0
      Top = 48
      Width = 206
      Height = 21
      TabOrder = 1
      OnKeyPress = AlamatKeyPress
    end
    object NoTelp1: TMaskEdit
      Left = 0
      Top = 72
      Width = 76
      Height = 21
      EditMask = '999-99999999;0;_'
      MaxLength = 12
      TabOrder = 2
      OnKeyPress = NoTelp1KeyPress
    end
    object NoTelp2: TMaskEdit
      Left = 75
      Top = 72
      Width = 77
      Height = 21
      EditMask = '999-99999999;0;_'
      MaxLength = 12
      TabOrder = 3
      OnKeyPress = NoTelp2KeyPress
    end
    object NoFax: TMaskEdit
      Left = 0
      Top = 96
      Width = 78
      Height = 21
      EditMask = '999-99999999;0;_'
      MaxLength = 12
      TabOrder = 4
      OnKeyPress = NoFaxKeyPress
    end
    object NamaPIC: TEdit
      Left = 0
      Top = 120
      Width = 161
      Height = 21
      TabOrder = 5
      OnKeyPress = NamaPICKeyPress
    end
    object NoHP: TEdit
      Left = 0
      Top = 144
      Width = 121
      Height = 21
      TabOrder = 6
      OnKeyPress = NoHPKeyPress
    end
    object BU: TComboBox
      Left = 0
      Top = 0
      Width = 41
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 7
      OnChange = BUChange
      OnKeyPress = BUKeyPress
    end
    object BUDisp: TEdit
      Left = 40
      Top = 0
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 8
    end
  end
end
