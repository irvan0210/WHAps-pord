object ItemServiceRequestList: TItemServiceRequestList
  Left = 242
  Top = 164
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'ItemServiceRequestList'
  ClientHeight = 418
  ClientWidth = 921
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
  object Label9: TLabel
    Left = 304
    Top = 392
    Width = 93
    Height = 13
    Caption = '>>Sudah Posting<<'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object GroupDetail: TGroupBox
    Left = 5
    Top = 0
    Width = 913
    Height = 65
    TabOrder = 0
    object Label2: TLabel
      Left = 336
      Top = -39
      Width = 88
      Height = 13
      Alignment = taRightJustify
      Caption = 'S.B.U/Cost Centre'
      Visible = False
    end
    object Label1: TLabel
      Left = 17
      Top = 14
      Width = 81
      Height = 13
      Alignment = taRightJustify
      Caption = 'Departemen Asal'
    end
    object Label6: TLabel
      Left = 393
      Top = -15
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Lokasi'
      Visible = False
    end
    object Label7: TLabel
      Left = 4
      Top = 38
      Width = 94
      Height = 13
      Alignment = taRightJustify
      Caption = 'Departemen Tujuan'
    end
    object Label5: TLabel
      Left = 529
      Top = 15
      Width = 20
      Height = 13
      Alignment = taRightJustify
      Caption = 'S/D'
    end
    object Label4: TLabel
      Left = 330
      Top = 16
      Width = 97
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tanggal Dibutuhkan'
    end
    object Label3: TLabel
      Left = 749
      Top = 24
      Width = 18
      Height = 13
      Caption = 'Cari'
    end
    object Label8: TLabel
      Left = 397
      Top = 41
      Width = 30
      Height = 13
      Caption = 'Status'
    end
    object GroupCombo: TPanel
      Left = 1000
      Top = -100
      Width = 251
      Height = 26
      BevelOuter = bvNone
      TabOrder = 4
      Visible = False
      object SBU: TComboBox
        Left = 11
        Top = 1
        Width = 94
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnChange = SBUChange
      end
      object Location: TComboBox
        Left = 108
        Top = 2
        Width = 138
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnChange = LocationChange
      end
    end
    object ToDepartmentDisp: TEdit
      Left = 282
      Top = 38
      Width = 33
      Height = 21
      TabStop = False
      TabOrder = 3
      Visible = False
    end
    object DepartmentDisp: TEdit
      Left = 282
      Top = 14
      Width = 33
      Height = 21
      TabStop = False
      TabOrder = 1
      Visible = False
    end
    object Department: TComboBox
      Left = 104
      Top = 14
      Width = 169
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = DepartmentChange
    end
    object ToDepartment: TComboBox
      Left = 104
      Top = 38
      Width = 169
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      OnChange = ToDepartmentChange
    end
    object Year: TEdit
      Left = 1035
      Top = 40
      Width = 41
      Height = 21
      TabOrder = 5
      Visible = False
    end
    object Month: TComboBox
      Left = 923
      Top = 40
      Width = 97
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 6
      Visible = False
    end
    object Lihat: TButton
      Left = 659
      Top = 19
      Width = 75
      Height = 25
      Caption = 'Lihat'
      TabOrder = 7
      OnClick = LihatClick
    end
    object Cari: TEdit
      Left = 775
      Top = 22
      Width = 129
      Height = 21
      TabOrder = 8
      OnChange = CariChange
    end
    object Tanggal: TDateTimePicker
      Left = 433
      Top = 12
      Width = 89
      Height = 21
      Date = 41208.000000000000000000
      Time = 41208.000000000000000000
      TabOrder = 9
      OnChange = TanggalChange
    end
    object SampaiTgl: TDateTimePicker
      Left = 559
      Top = 12
      Width = 89
      Height = 21
      Date = 41208.000000000000000000
      Time = 41208.000000000000000000
      TabOrder = 10
      OnChange = SampaiTglChange
    end
    object Status: TComboBox
      Left = 433
      Top = 37
      Width = 216
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 11
      Text = 'SEMUA'
      Items.Strings = (
        'SEMUA'
        'BELUM POSTING'
        'SUDAH POSTING')
    end
  end
  object StrGrid: TZColorStringGrid
    Left = 3
    Top = 70
    Width = 912
    Height = 310
    ColCount = 11
    DefaultRowHeight = 20
    DefaultDrawing = False
    FixedColor = clBtnFace
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
    ScrollBars = ssVertical
    TabOrder = 1
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
    Left = 418
    Top = 388
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 2
    OnClick = SelesaiClick
  end
end
