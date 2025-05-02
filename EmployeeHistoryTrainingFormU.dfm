object EmployeeHistoryTrainingForm: TEmployeeHistoryTrainingForm
  Left = 426
  Top = 71
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Driver Training Form'
  ClientHeight = 580
  ClientWidth = 560
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 560
    Height = 548
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 38
      Height = 13
      Caption = 'Tanggal'
    end
    object Label2: TLabel
      Left = 150
      Top = 12
      Width = 46
      Height = 13
      Caption = 'Jam Mulai'
    end
    object Label3: TLabel
      Left = 13
      Top = 36
      Width = 29
      Height = 13
      Caption = 'Lokasi'
    end
    object Label4: TLabel
      Left = 13
      Top = 61
      Width = 30
      Height = 13
      Caption = 'Materi'
    end
    object Label5: TLabel
      Left = 9
      Top = 85
      Width = 34
      Height = 13
      Caption = 'Trainer'
    end
    object Label8: TLabel
      Left = 44
      Top = 58
      Width = 5
      Height = 16
      Alignment = taRightJustify
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 44
      Top = 83
      Width = 5
      Height = 16
      Alignment = taRightJustify
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 198
      Top = 9
      Width = 5
      Height = 16
      Alignment = taRightJustify
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 42
      Top = 32
      Width = 5
      Height = 16
      Alignment = taRightJustify
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 308
      Top = 9
      Width = 5
      Height = 16
      Alignment = taRightJustify
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 253
      Top = 12
      Width = 55
      Height = 13
      Caption = 'Jam Selesai'
    end
    object Label14: TLabel
      Left = 10
      Top = 109
      Width = 39
      Height = 13
      Caption = 'Catatan'
    end
    object Label15: TLabel
      Left = 364
      Top = 11
      Width = 33
      Height = 13
      Caption = 'Durasi '
    end
    object Materi: TEdit
      Left = 50
      Top = 58
      Width = 471
      Height = 21
      Enabled = False
      TabOrder = 0
      OnKeyPress = MateriKeyPress
    end
    object Lokasi: TEdit
      Left = 49
      Top = 33
      Width = 256
      Height = 21
      TabOrder = 1
      OnKeyPress = LokasiKeyPress
    end
    object Trainer: TEdit
      Left = 50
      Top = 83
      Width = 247
      Height = 21
      TabOrder = 2
    end
    object Jam: TMaskEdit
      Left = 204
      Top = 9
      Width = 37
      Height = 21
      EditMask = '99:99;1;_'
      MaxLength = 5
      TabOrder = 3
      Text = '  :  '
      OnExit = JamExit
      OnKeyPress = JamKeyPress
    end
    object Tgl: TDateTimePicker
      Left = 50
      Top = 9
      Width = 89
      Height = 21
      Date = 41963.592647025470000000
      Time = 41963.592647025470000000
      TabOrder = 4
    end
    object GroupOrder: TGroupBox
      Left = 9
      Top = 253
      Width = 544
      Height = 293
      Caption = 'Data Peserta'
      TabOrder = 5
      DesignSize = (
        544
        293)
      object Label6: TLabel
        Left = 77
        Top = -2
        Width = 5
        Height = 16
        Alignment = taRightJustify
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object GroupTotal: TGroupBox
        Left = 5
        Top = 257
        Width = 124
        Height = 33
        Enabled = False
        TabOrder = 0
        object Label7: TLabel
          Left = 7
          Top = 11
          Width = 64
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total Peserta'
        end
        object Total: TMemo
          Left = 72
          Top = 8
          Width = 49
          Height = 22
          Alignment = taRightJustify
          TabOrder = 0
        end
      end
      object StrGridPeserta: TZColorStringGrid
        Left = 2
        Top = 20
        Width = 525
        Height = 237
        Anchors = [akLeft, akTop, akRight]
        ColCount = 20
        DefaultRowHeight = 20
        DefaultDrawing = False
        FixedColor = clSkyBlue
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goColMoving]
        TabOrder = 1
        OnKeyDown = StrGridPesertaKeyDown
        OnSelectCell = StrGridPesertaSelectCell
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
        WordWrap = True
        ColWidths = (
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64)
      end
    end
    object TambahPeserta: TButton
      Left = 232
      Top = 229
      Width = 97
      Height = 25
      Caption = 'Tambah Peserta'
      TabOrder = 6
      OnClick = TambahPesertaClick
    end
    object RadType: TRadioGroup
      Left = 304
      Top = 75
      Width = 249
      Height = 30
      Caption = 'Type'
      Columns = 2
      Ctl3D = True
      ItemIndex = 0
      Items.Strings = (
        'Internal'
        'Eksternal')
      ParentCtl3D = False
      TabOrder = 7
    end
    object JamSelesai: TMaskEdit
      Left = 313
      Top = 9
      Width = 37
      Height = 21
      EditMask = '99:99;1;_'
      MaxLength = 5
      TabOrder = 8
      Text = '  :  '
      OnExit = JamSelesaiExit
      OnKeyPress = JamSelesaiKeyPress
    end
    object Note: TMemo
      Left = 50
      Top = 105
      Width = 503
      Height = 120
      TabOrder = 9
    end
    object Duration: TEdit
      Left = 396
      Top = 8
      Width = 85
      Height = 21
      Enabled = False
      TabOrder = 10
    end
    object Button1: TButton
      Left = 528
      Top = 56
      Width = 25
      Height = 25
      Caption = '...'
      TabOrder = 11
      OnClick = Button1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 548
    Width = 560
    Height = 32
    Align = alBottom
    TabOrder = 1
    object Simpan: TButton
      Left = 318
      Top = 3
      Width = 73
      Height = 25
      Caption = 'Simpan'
      TabOrder = 0
      OnClick = SimpanClick
    end
    object Bersihkan: TButton
      Left = 398
      Top = 3
      Width = 73
      Height = 25
      Caption = 'Bersihkan'
      TabOrder = 1
      OnClick = BersihkanClick
    end
    object Selesai: TButton
      Left = 478
      Top = 3
      Width = 73
      Height = 25
      Caption = 'Selesai'
      TabOrder = 2
      OnClick = SelesaiClick
    end
  end
end
