object PartTypeForm: TPartTypeForm
  Left = 381
  Top = 242
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Part Type'
  ClientHeight = 123
  ClientWidth = 483
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
    Left = 36
    Top = 16
    Width = 52
    Height = 13
    Alignment = taRightJustify
    Caption = 'Kode Type'
  end
  object Label2: TLabel
    Left = 60
    Top = 40
    Width = 28
    Height = 13
    Alignment = taRightJustify
    Caption = 'Nama'
  end
  object Label5: TLabel
    Left = 41
    Top = 88
    Width = 47
    Height = 13
    Alignment = taRightJustify
    Caption = 'GP-Ref Id'
  end
  object Label3: TLabel
    Left = 59
    Top = 64
    Width = 29
    Height = 13
    Alignment = taRightJustify
    Caption = 'Group'
  end
  object TypeId: TEdit
    Left = 96
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
    OnKeyPress = TypeIdKeyPress
  end
  object TypeName: TEdit
    Left = 96
    Top = 40
    Width = 281
    Height = 21
    TabOrder = 1
    OnKeyPress = TypeNameKeyPress
  end
  object Simpan: TButton
    Left = 400
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 3
    OnClick = SimpanClick
  end
  object Selesai: TButton
    Left = 400
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 5
    OnClick = SelesaiClick
  end
  object GPReferenceId: TEdit
    Left = 96
    Top = 88
    Width = 145
    Height = 21
    TabOrder = 2
    OnKeyPress = GPReferenceIdKeyPress
  end
  object Bersihkan: TButton
    Left = 400
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Bersihkan'
    TabOrder = 4
    OnClick = BersihkanClick
  end
  object VehicleModule: TCheckBox
    Left = 96
    Top = 64
    Width = 161
    Height = 17
    Caption = 'Tampilkan Modul Kendaraan'
    TabOrder = 6
  end
end
