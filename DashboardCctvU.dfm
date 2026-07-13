object DashboardCctv: TDashboardCctv
  Left = 220
  Top = 90
  Width = 900
  Height = 600
  BorderIcons = []
  Caption = 'Dashboard CCTV'
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 892
    Height = 45
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 12
      Top = 17
      Width = 30
      Height = 13
      Caption = 'Dari '
    end
    object Label2: TLabel
      Left = 175
      Top = 17
      Width = 45
      Height = 13
      Caption = 'Sampai '
    end
    object TglFrom: TDateTimePicker
      Left = 55
      Top = 13
      Width = 110
      Height = 21
      Date = 39000.000000000000000000
      Time = 0.500000000000000000
      TabOrder = 0
      OnChange = TglFromChange
    end
    object TglTo: TDateTimePicker
      Left = 228
      Top = 13
      Width = 110
      Height = 21
      Date = 39000.000000000000000000
      Time = 0.500000000000000000
      TabOrder = 1
      OnChange = TglToChange
    end
    object Tampilkan: TButton
      Left = 350
      Top = 11
      Width = 90
      Height = 25
      Caption = 'Tampilkan'
      TabOrder = 2
      OnClick = TampilkanClick
    end
  end
  object PanelSummary: TPanel
    Left = 0
    Top = 45
    Width = 892
    Height = 70
    Align = alTop
    TabOrder = 1
    object PanelTotal: TPanel
      Left = 8
      Top = 8
      Width = 200
      Height = 54
      BevelOuter = bvLowered
      Color = clWhite
      TabOrder = 0
      object LabelTotal: TLabel
        Left = 8
        Top = 6
        Width = 80
        Height = 13
        Caption = 'Total Kamera-Hari'
      end
      object lblTotal: TLabel
        Left = 8
        Top = 24
        Width = 30
        Height = 26
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object PanelHidup: TPanel
      Left = 220
      Top = 8
      Width = 200
      Height = 54
      BevelOuter = bvLowered
      Color = clWhite
      TabOrder = 1
      object LabelHidup: TLabel
        Left = 8
        Top = 6
        Width = 35
        Height = 13
        Caption = 'Hidup'
      end
      object lblHidup: TLabel
        Left = 8
        Top = 24
        Width = 30
        Height = 26
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object PanelMati: TPanel
      Left = 432
      Top = 8
      Width = 200
      Height = 54
      BevelOuter = bvLowered
      Color = clWhite
      TabOrder = 2
      object LabelMati: TLabel
        Left = 8
        Top = 6
        Width = 30
        Height = 13
        Caption = 'Mati'
      end
      object lblMati: TLabel
        Left = 8
        Top = 24
        Width = 30
        Height = 26
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object PanelPctMati: TPanel
      Left = 644
      Top = 8
      Width = 200
      Height = 54
      BevelOuter = bvLowered
      Color = clWhite
      TabOrder = 3
      object LabelPctMati: TLabel
        Left = 8
        Top = 6
        Width = 90
        Height = 13
        Caption = 'Rata-rata % Mati'
      end
      object lblPctMati: TLabel
        Left = 8
        Top = 24
        Width = 60
        Height = 26
        Caption = '0.00 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object Chart1: TChart
    Left = 0
    Top = 115
    Width = 892
    Height = 400
    BackWall.Brush.Color = clWhite
    Title.Text.Strings = (
      'TChart')
    View3DOptions.Elevation = 315
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 0
    View3DOptions.Rotation = 360
    Align = alClient
    TabOrder = 2
    object Series1: TBarSeries
      Marks.ArrowLength = 20
      Marks.Style = smsValue
      Marks.Visible = True
      SeriesColor = clBlue
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
  end
  object PanelFooter: TPanel
    Left = 0
    Top = 515
    Width = 892
    Height = 35
    Align = alBottom
    TabOrder = 3
    object Tutup: TButton
      Left = 800
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Tutup'
      TabOrder = 0
      OnClick = TutupClick
    end
  end
end
