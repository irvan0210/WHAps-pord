object BrowseEmployee: TBrowseEmployee
  Left = 403
  Top = 280
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'BrowseEmployee'
  ClientHeight = 537
  ClientWidth = 840
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
  object Label1: TLabel
    Left = 480
    Top = 8
    Width = 19
    Height = 13
    Caption = 'Cari'
  end
  object Label2: TLabel
    Left = 120
    Top = 575
    Width = 108
    Height = 13
    Caption = 'Pengemudi yang dipilih'
    Visible = False
  end
  object Selesai: TButton
    Left = 416
    Top = 495
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 0
    OnClick = SelesaiClick
  end
  object KolomCari: TEdit
    Left = 504
    Top = 6
    Width = 161
    Height = 21
    TabOrder = 1
    OnChange = KolomCariChange
  end
  object PanelJenis: TPanel
    Left = 248
    Top = 2
    Width = 209
    Height = 31
    BevelOuter = bvNone
    TabOrder = 2
    object Label3: TLabel
      Left = 10
      Top = 8
      Width = 64
      Height = 13
      Caption = 'Jenis Armada'
    end
    object Jenis: TComboBox
      Left = 80
      Top = 4
      Width = 121
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object GroupCompany: TGroupBox
    Left = 8
    Top = 0
    Width = 241
    Height = 33
    TabOrder = 3
    object Label5: TLabel
      Left = 19
      Top = 8
      Width = 19
      Height = 13
      Alignment = taRightJustify
      Caption = 'SBU'
    end
    object SBU: TComboBox
      Left = 48
      Top = 8
      Width = 185
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object MemDriverdiPilih: TMemo
    Left = 248
    Top = 580
    Width = 489
    Height = 89
    TabOrder = 4
    Visible = False
  end
  object Submit: TButton
    Left = 331
    Top = 495
    Width = 75
    Height = 25
    Caption = 'Submit'
    TabOrder = 5
    OnClick = SubmitClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 288
    Width = 825
    Height = 201
    Caption = 'Peserta Dipilih'
    TabOrder = 6
    object Label7: TLabel
      Left = 626
      Top = 171
      Width = 163
      Height = 13
      Alignment = taRightJustify
      Caption = 'F5    =  Menghapus Peserta Dipilih'
    end
    object StrGridTemp: TZColorStringGrid
      Left = 5
      Top = 21
      Width = 807
      Height = 140
      DefaultRowHeight = 20
      DefaultDrawing = False
      FixedColor = clBtnFace
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
      TabOrder = 0
      OnKeyDown = StrGridTempKeyDown
      OnSelectCell = StrGridTempSelectCell
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
    object GroupBox3: TGroupBox
      Left = 12
      Top = 162
      Width = 93
      Height = 33
      TabOrder = 1
      object Label6: TLabel
        Left = 5
        Top = 11
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = 'Total'
      end
      object TotalTemp: TEdit
        Left = 36
        Top = 8
        Width = 41
        Height = 21
        Enabled = False
        TabOrder = 0
      end
    end
    object Bersihkan: TButton
      Left = 113
      Top = 168
      Width = 73
      Height = 25
      Caption = 'Bersihkan'
      TabOrder = 2
      OnClick = BersihkanClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 40
    Width = 825
    Height = 247
    TabOrder = 7
    object StrGrid: TZColorStringGrid
      Left = 5
      Top = 15
      Width = 815
      Height = 193
      ColCount = 6
      DefaultRowHeight = 20
      DefaultDrawing = False
      FixedColor = clBtnFace
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
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
    object CheckSelect: TCheckBox
      Left = 119
      Top = 106
      Width = 14
      Height = 15
      TabOrder = 1
      Visible = False
      OnExit = CheckSelectExit
    end
    object GroupTotal: TGroupBox
      Left = 12
      Top = 207
      Width = 93
      Height = 33
      TabOrder = 2
      object Label4: TLabel
        Left = 6
        Top = 11
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = 'Total'
      end
      object Total: TEdit
        Left = 37
        Top = 8
        Width = 41
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object chk1: TCheckBox
        Left = 148
        Top = 11
        Width = 82
        Height = 17
        Caption = 'Ceklis semua'
        TabOrder = 1
        OnClick = chk1Click
      end
    end
  end
end
