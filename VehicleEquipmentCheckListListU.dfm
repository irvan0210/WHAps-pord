object VehicleEquipmentCheckListList: TVehicleEquipmentCheckListList
  Left = 634
  Top = 302
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Data Check List'
  ClientHeight = 393
  ClientWidth = 508
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
  object StrGrid: TZColorStringGrid
    Left = 10
    Top = 40
    Width = 487
    Height = 313
    DefaultRowHeight = 20
    DefaultDrawing = False
    FixedColor = clBtnFace
    FixedCols = 0
    TabOrder = 0
    OnDblClick = StrGridDblClick
    OnSelectCell = StrGridSelectCell
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
  object Selesai: TButton
    Left = 216
    Top = 360
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 1
    OnClick = SelesaiClick
  end
  object GroupCompany: TGroupBox
    Left = 8
    Top = 0
    Width = 489
    Height = 33
    TabOrder = 2
    object Label1: TLabel
      Left = 17
      Top = 8
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'No Armada'
    end
    object Label3: TLabel
      Left = 213
      Top = 8
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'No Body'
    end
    object Label4: TLabel
      Left = 341
      Top = 11
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'No Polisi'
    end
    object VehicleId: TComboBox
      Left = 80
      Top = 8
      Width = 113
      Height = 21
      Style = csSimple
      ItemHeight = 13
      TabOrder = 0
      OnChange = VehicleIdChange
    end
    object NoBody: TEdit
      Left = 264
      Top = 8
      Width = 57
      Height = 21
      TabOrder = 1
    end
    object NoPolisi: TEdit
      Left = 392
      Top = 8
      Width = 81
      Height = 21
      TabOrder = 2
    end
  end
end
