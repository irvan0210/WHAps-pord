object UserRDLocationForm: TUserRDLocationForm
  Left = 485
  Top = 340
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'User RD Location'
  ClientHeight = 360
  ClientWidth = 626
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
  object LabelStatus: TLabel
    Left = 91
    Top = 88
    Width = 30
    Height = 13
    Alignment = taRightJustify
    Caption = 'Status'
  end
  object Label5: TLabel
    Left = 61
    Top = 67
    Width = 60
    Height = 13
    Alignment = taRightJustify
    Caption = 'RD Location'
  end
  object Label6: TLabel
    Left = 99
    Top = 44
    Width = 22
    Height = 13
    Alignment = taRightJustify
    Caption = 'User'
  end
  object Batal: TButton
    Left = 528
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Batal'
    TabOrder = 2
    OnClick = BatalClick
  end
  object Simpan: TButton
    Left = 528
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 3
    OnClick = SimpanClick
  end
  object GroupId: TPanel
    Left = 32
    Top = 8
    Width = 217
    Height = 33
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 0
    object Label1: TLabel
      Left = 11
      Top = 11
      Width = 78
      Height = 13
      Alignment = taRightJustify
      Caption = 'User Location Id'
    end
    object UserLocId: TEdit
      Left = 104
      Top = 8
      Width = 57
      Height = 21
      TabOrder = 0
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 120
    Width = 609
    Height = 233
    Caption = 'User Location'
    TabOrder = 4
    object StrGrid: TZColorStringGrid
      Left = 8
      Top = 16
      Width = 593
      Height = 209
      DefaultRowHeight = 20
      DefaultDrawing = False
      FixedColor = clBtnFace
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
      TabOrder = 0
      DefaultCellStyle.Font.Charset = DEFAULT_CHARSET
      DefaultCellStyle.Font.Color = clWindowText
      DefaultCellStyle.Font.Height = -11
      DefaultCellStyle.Font.Name = 'MS Sans Serif'
      DefaultCellStyle.Font.Style = []
      DefaultCellStyle.BGColor = clWindow
      DefaultFixedCellStyle.Font.Charset = DEFAULT_CHARSET
      DefaultFixedCellStyle.Font.Color = clWindowText
      DefaultFixedCellStyle.Font.Height = -11
      DefaultFixedCellStyle.Font.Name = 'MS Sans Serif'
      DefaultFixedCellStyle.Font.Style = []
      DefaultFixedCellStyle.BGColor = clBtnFace
      LineDesign.LineUpColor = clWhite
    end
  end
  object GroupInput1: TPanel
    Left = 136
    Top = 40
    Width = 265
    Height = 25
    BevelOuter = bvNone
    TabOrder = 5
    object Username: TComboBox
      Left = 0
      Top = 0
      Width = 153
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = UsernameChange
      OnKeyPress = UsernameKeyPress
    end
  end
  object GroupInput: TPanel
    Left = 136
    Top = 64
    Width = 265
    Height = 41
    BevelOuter = bvNone
    TabOrder = 1
    object Active: TCheckBox
      Left = 0
      Top = 24
      Width = 105
      Height = 17
      Caption = 'Active'
      TabOrder = 1
      OnKeyPress = ActiveKeyPress
    end
    object CompanyLocation: TComboBox
      Left = 0
      Top = 0
      Width = 209
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = CompanyLocationChange
      OnKeyPress = CompanyLocationKeyPress
    end
  end
  object btnClear: TButton
    Left = 528
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Bersihkan'
    TabOrder = 6
    OnClick = btnClearClick
  end
end
