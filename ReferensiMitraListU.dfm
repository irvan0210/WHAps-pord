object ReferensiMitraList: TReferensiMitraList
  Left = 432
  Top = 125
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Referensi Mitra'
  ClientHeight = 448
  ClientWidth = 682
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
    Left = 48
    Top = 40
    Width = 18
    Height = 13
    Alignment = taRightJustify
    Caption = 'Cari'
  end
  object Label2: TLabel
    Left = 28
    Top = 64
    Width = 38
    Height = 13
    Alignment = taRightJustify
    Caption = 'No KPP'
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 88
    Width = 665
    Height = 353
    Caption = 'Data Mitra Referensi'
    TabOrder = 5
    object StrGrid: TZColorStringGrid
      Left = 8
      Top = 16
      Width = 649
      Height = 297
      ColCount = 33
      DefaultRowHeight = 20
      DefaultDrawing = False
      FixedColor = clBtnFace
      FixedCols = 0
      RowCount = 3
      FixedRows = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
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
    object GroupTotal: TGroupBox
      Left = 8
      Top = 312
      Width = 89
      Height = 33
      Enabled = False
      TabOrder = 1
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
  object Tampilkan: TButton
    Left = 336
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Tampilkan'
    TabOrder = 4
    OnClick = TampilkanClick
  end
  object NoKPP: TComboBox
    Left = 72
    Top = 64
    Width = 105
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 2
    OnChange = NoKPPChange
  end
  object Selesai: TButton
    Left = 592
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 6
    OnClick = SelesaiClick
  end
  object Panel1: TPanel
    Left = 176
    Top = 64
    Width = 153
    Height = 25
    BevelOuter = bvNone
    Caption = 'Panel1'
    Enabled = False
    TabOrder = 3
    object Mitra: TEdit
      Left = 0
      Top = 0
      Width = 145
      Height = 21
      TabOrder = 0
    end
  end
  object GroupLokasi: TGroupBox
    Left = 24
    Top = 0
    Width = 265
    Height = 33
    TabOrder = 0
    object Label3: TLabel
      Left = 8
      Top = 8
      Width = 31
      Height = 13
      Caption = 'Lokasi'
    end
    object Lokasi: TComboBox
      Left = 48
      Top = 8
      Width = 41
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = LokasiChange
    end
    object LokasiDisp: TEdit
      Left = 88
      Top = 8
      Width = 137
      Height = 21
      TabStop = False
      Enabled = False
      TabOrder = 1
    end
  end
  object Cari: TEdit
    Left = 72
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 1
    OnChange = CariChange
  end
end
