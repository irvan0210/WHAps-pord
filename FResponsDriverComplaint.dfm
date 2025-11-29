object ResponsDriverComplaint: TResponsDriverComplaint
  Left = 383
  Top = 97
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Respons Driver Complaint'
  ClientHeight = 301
  ClientWidth = 655
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 655
    Height = 305
    Align = alTop
    Caption = 'Data Keluhan Driver'
    TabOrder = 0
    object Label1: TLabel
      Left = 19
      Top = 24
      Width = 86
      Height = 13
      Alignment = taRightJustify
      Caption = 'No Keluhan Driver'
    end
    object Label2: TLabel
      Left = 53
      Top = 49
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = 'Pengemudi'
    end
    object Label3: TLabel
      Left = 341
      Top = 49
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'No Polisi'
    end
    object Label4: TLabel
      Left = 341
      Top = 24
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tanggal'
    end
    object Label5: TLabel
      Left = 67
      Top = 75
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Keluhan'
    end
    object NoKeluhan: TEdit
      Left = 112
      Top = 21
      Width = 217
      Height = 21
      TabOrder = 0
    end
    object Driver: TEdit
      Left = 112
      Top = 46
      Width = 217
      Height = 21
      TabOrder = 1
    end
    object NoPolisi: TEdit
      Left = 387
      Top = 46
      Width = 89
      Height = 21
      TabOrder = 2
    end
    object tgl_request: TEdit
      Left = 387
      Top = 20
      Width = 88
      Height = 21
      TabOrder = 3
    end
    object StrGrid: TZColorStringGrid
      Left = 112
      Top = 72
      Width = 537
      Height = 184
      DefaultColWidth = 50
      DefaultRowHeight = 20
      DefaultDrawing = False
      FixedColor = clSkyBlue
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColMoving]
      TabOrder = 4
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
      DefaultFixedCellStyle.BGColor = clSkyBlue
      LineDesign.LineUpColor = clWhite
      ColWidths = (
        50
        97
        109
        269
        50)
    end
    object Status: TComboBox
      Left = 264
      Top = 96
      Width = 97
      Height = 21
      ItemHeight = 13
      TabOrder = 5
      Text = 'DISETUJUI'
      Visible = False
      OnExit = StatusExit
      Items.Strings = (
        'DISETUJUI'
        'DITOLAK')
    end
    object Respon: TEdit
      Left = 363
      Top = 93
      Width = 262
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 6
      Visible = False
      OnExit = ResponExit
      OnKeyPress = ResponKeyPress
    end
    object save: TButton
      Left = 271
      Top = 266
      Width = 75
      Height = 25
      Caption = 'Simpan'
      TabOrder = 7
      OnClick = saveClick
    end
    object keluar: TButton
      Left = 353
      Top = 265
      Width = 75
      Height = 25
      Caption = 'Keluar'
      TabOrder = 8
      OnClick = keluarClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 305
    Width = 655
    Height = 1
    Align = alClient
    TabOrder = 1
    object Label6: TLabel
      Left = 66
      Top = 31
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Respon '
    end
    object Label7: TLabel
      Left = 77
      Top = 11
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tolak '
    end
    object memoRespon: TMemo
      Left = 112
      Top = 30
      Width = 366
      Height = 75
      HideSelection = False
      TabOrder = 0
    end
    object CheckReject: TCheckBox
      Left = 112
      Top = 11
      Width = 14
      Height = 17
      Alignment = taLeftJustify
      TabOrder = 1
    end
  end
end
