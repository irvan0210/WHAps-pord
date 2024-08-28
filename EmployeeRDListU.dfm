object EmployeeRDList: TEmployeeRDList
  Left = 360
  Top = 283
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Data Karyawan'
  ClientHeight = 510
  ClientWidth = 602
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
    Left = 409
    Top = 8
    Width = 18
    Height = 13
    Caption = 'Cari'
  end
  object Selesai: TButton
    Left = 518
    Top = 481
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 1
    OnClick = SelesaiClick
  end
  object KolomCari: TEdit
    Left = 433
    Top = 8
    Width = 161
    Height = 21
    TabOrder = 0
    OnChange = KolomCariChange
  end
  object StrGrid: TZColorStringGrid
    Left = 0
    Top = 40
    Width = 601
    Height = 441
    ColCount = 19
    DefaultRowHeight = 20
    DefaultDrawing = False
    FixedColor = clBtnFace
    FixedCols = 0
    RowCount = 3
    FixedRows = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
    TabOrder = 2
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
  object GroupLokasi: TGroupBox
    Left = 8
    Top = 0
    Width = 225
    Height = 33
    TabOrder = 3
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 31
      Height = 13
      Caption = 'Lokasi'
    end
    object Lokasi: TComboBox
      Left = 43
      Top = 8
      Width = 38
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = LokasiChange
    end
    object LokasiDisp: TEdit
      Left = 80
      Top = 8
      Width = 137
      Height = 21
      TabStop = False
      Enabled = False
      TabOrder = 1
    end
  end
  object GroupTotal: TGroupBox
    Left = 8
    Top = 475
    Width = 89
    Height = 33
    Enabled = False
    TabOrder = 4
    object Label4: TLabel
      Left = 9
      Top = 8
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'Total'
    end
    object Total: TEdit
      Left = 40
      Top = 8
      Width = 41
      Height = 21
      TabOrder = 0
    end
  end
end
