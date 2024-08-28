object VehicleInsurance: TVehicleInsurance
  Left = 187
  Top = 137
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Asuransi Kendaraan'
  ClientHeight = 432
  ClientWidth = 901
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    901
    432)
  PixelsPerInch = 96
  TextHeight = 13
  object GroupInput: TGroupBox
    Left = 7
    Top = 2
    Width = 887
    Height = 422
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 0
    object Simpan: TButton
      Left = 800
      Top = 273
      Width = 75
      Height = 25
      Caption = 'Simpan'
      TabOrder = 0
      OnClick = SimpanClick
    end
    object Bersihkan: TButton
      Left = 800
      Top = 305
      Width = 75
      Height = 25
      Caption = 'Bersihkan'
      TabOrder = 1
      OnClick = BersihkanClick
    end
    object Selesai: TButton
      Left = 800
      Top = 371
      Width = 75
      Height = 25
      Caption = 'Selesai'
      TabOrder = 2
      OnClick = SelesaiClick
    end
    object GroupPanel: TPanel
      Left = 7
      Top = 6
      Width = 784
      Height = 395
      BevelOuter = bvNone
      TabOrder = 3
      object Label1: TLabel
        Left = 73
        Top = 64
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Penerbit Polis'
      end
      object Label4: TLabel
        Left = 82
        Top = 40
        Width = 55
        Height = 13
        Alignment = taRightJustify
        Caption = 'Nomor Polis'
      end
      object Label13: TLabel
        Left = 118
        Top = 16
        Width = 19
        Height = 13
        Alignment = taRightJustify
        Caption = 'SBU'
      end
      object Label16: TLabel
        Left = 144
        Top = 12
        Width = 6
        Height = 20
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label21: TLabel
        Left = 144
        Top = 36
        Width = 6
        Height = 20
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 7
        Top = 137
        Width = 130
        Height = 13
        Alignment = taRightJustify
        Caption = 'Nilai Pertanggung Jawaban'
      end
      object Label17: TLabel
        Left = 144
        Top = 132
        Width = 6
        Height = 20
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label32: TLabel
        Left = 144
        Top = 60
        Width = 6
        Height = 20
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label18: TLabel
        Left = 49
        Top = 196
        Width = 86
        Height = 13
        Alignment = taRightJustify
        Caption = 'Daftar Kendaraan'
      end
      object Label2: TLabel
        Left = 633
        Top = 163
        Width = 19
        Height = 13
        Caption = 'Cari'
      end
      object Label5: TLabel
        Left = 57
        Top = 161
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = 'Periode Asuransi'
      end
      object Label6: TLabel
        Left = 245
        Top = 161
        Width = 21
        Height = 13
        Alignment = taRightJustify
        Caption = ' s/d '
      end
      object Label7: TLabel
        Left = 27
        Top = 88
        Width = 110
        Height = 13
        Alignment = taRightJustify
        Caption = 'Kondisi Pertanggungan'
      end
      object Label8: TLabel
        Left = 144
        Top = 84
        Width = 6
        Height = 20
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 33
        Top = 112
        Width = 104
        Height = 13
        Alignment = taRightJustify
        Caption = 'Nama Pertanggungan'
      end
      object Label10: TLabel
        Left = 144
        Top = 108
        Width = 6
        Height = 20
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object SBU: TComboBox
        Left = 152
        Top = 16
        Width = 161
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        TabStop = False
      end
      object NoPolis: TEdit
        Left = 152
        Top = 40
        Width = 313
        Height = 21
        TabOrder = 1
        OnKeyPress = NoPolisKeyPress
      end
      object NilaiPolis: TEdit
        Left = 152
        Top = 136
        Width = 217
        Height = 21
        TabOrder = 5
        OnEnter = NilaiPolisEnter
        OnExit = NilaiPolisExit
        OnKeyPress = NilaiPolisKeyPress
      end
      object Cari: TEdit
        Left = 657
        Top = 160
        Width = 121
        Height = 21
        TabOrder = 9
        OnChange = CariChange
      end
      object StrGrid: TZColorStringGrid
        Left = 408
        Top = 191
        Width = 369
        Height = 226
        ColCount = 19
        DefaultRowHeight = 20
        DefaultDrawing = False
        FixedColor = clBtnFace
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
        TabOrder = 10
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
      object StrGridVhcList: TZColorStringGrid
        Left = 152
        Top = 191
        Width = 216
        Height = 226
        ColCount = 3
        DefaultRowHeight = 20
        DefaultDrawing = False
        FixedColor = clBtnFace
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
        PopupMenu = PopupMenu1
        TabOrder = 8
        OnSelectCell = StrGridVhcListSelectCell
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
        ColWidths = (
          75
          116
          64)
      end
      object GroupBox1: TGroupBox
        Left = 408
        Top = 424
        Width = 97
        Height = 33
        Enabled = False
        TabOrder = 11
        object Label3: TLabel
          Left = 8
          Top = 8
          Width = 24
          Height = 13
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
      object fromDate: TDateTimePicker
        Left = 152
        Top = 159
        Width = 89
        Height = 21
        Date = 41927.000000000000000000
        Time = 41927.000000000000000000
        TabOrder = 6
      end
      object toDate: TDateTimePicker
        Left = 272
        Top = 159
        Width = 89
        Height = 21
        Date = 41927.000000000000000000
        Time = 41927.000000000000000000
        TabOrder = 7
      end
      object eInsIssuer: TComboBox
        Left = 152
        Top = 63
        Width = 217
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 2
      end
      object eInsCoverage: TComboBox
        Left = 152
        Top = 87
        Width = 217
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 3
      end
      object eInsName: TComboBox
        Left = 152
        Top = 111
        Width = 217
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 4
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 446
    Top = 16
    object HapusData1: TMenuItem
      Caption = 'Hapus Data'
      OnClick = HapusData1Click
    end
  end
end
