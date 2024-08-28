object UserGroupForm: TUserGroupForm
  Left = 467
  Top = 189
  BorderIcons = [biHelp]
  BorderStyle = bsSingle
  Caption = 'User Group'
  ClientHeight = 156
  ClientWidth = 316
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 40
    Width = 60
    Height = 13
    Alignment = taRightJustify
    Caption = 'Group Name'
  end
  object Label2: TLabel
    Left = 9
    Top = 64
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = 'Group Detail'
  end
  object Label3: TLabel
    Left = 38
    Top = 88
    Width = 30
    Height = 13
    Alignment = taRightJustify
    Caption = 'Status'
  end
  object Label4: TLabel
    Left = 27
    Top = 16
    Width = 41
    Height = 13
    Alignment = taRightJustify
    Caption = 'Group Id'
  end
  object Group: TPanel
    Left = 80
    Top = 16
    Width = 225
    Height = 25
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 0
    object GroupId: TEdit
      Left = 0
      Top = 0
      Width = 81
      Height = 21
      TabOrder = 0
    end
  end
  object GroupInput: TPanel
    Left = 80
    Top = 40
    Width = 225
    Height = 73
    BevelOuter = bvNone
    TabOrder = 1
    object GroupName: TEdit
      Left = 0
      Top = 0
      Width = 145
      Height = 21
      TabOrder = 0
    end
    object GroupDetail: TEdit
      Left = 0
      Top = 24
      Width = 225
      Height = 21
      TabOrder = 1
    end
    object Active: TCheckBox
      Left = 0
      Top = 48
      Width = 57
      Height = 17
      Caption = 'Active'
      TabOrder = 2
    end
  end
  object Simpan: TButton
    Left = 40
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 2
    OnClick = SimpanClick
  end
  object Batal: TButton
    Left = 192
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Batal'
    TabOrder = 3
    OnClick = BatalClick
  end
end
