object PartSelectForm: TPartSelectForm
  Left = 429
  Top = 163
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'PartSelectForm'
  ClientHeight = 73
  ClientWidth = 371
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnDeactivate = FormDeactivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 3
    Top = 24
    Width = 29
    Height = 13
    Alignment = taRightJustify
    Caption = 'Group'
  end
  object Label2: TLabel
    Left = 5
    Top = 48
    Width = 27
    Height = 13
    Alignment = taRightJustify
    Caption = 'Detail'
  end
  object Label3: TLabel
    Left = 8
    Top = 0
    Width = 24
    Height = 13
    Alignment = taRightJustify
    Caption = 'Type'
  end
  object PartType: TComboBox
    Left = 40
    Top = 0
    Width = 185
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnChange = PartTypeChange
  end
  object PartGroup: TComboBox
    Left = 40
    Top = 24
    Width = 329
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
    OnChange = PartGroupChange
  end
  object PartDetail: TComboBox
    Left = 40
    Top = 48
    Width = 329
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 2
    OnChange = PartDetailChange
  end
  object ApplicationEvnt: TApplicationEvents
    OnShortCut = ApplicationEvntShortCut
    Left = 352
  end
end
