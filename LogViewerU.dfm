object LogViewer: TLogViewer
  Left = 361
  Top = 326
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'LogViewer'
  ClientHeight = 267
  ClientWidth = 557
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 8
    Width = 18
    Height = 13
    Caption = 'Cari'
  end
  object GroupLog: TGroupBox
    Left = 8
    Top = 32
    Width = 537
    Height = 201
    Caption = 'Log'
    TabOrder = 0
    object StrGrid: TStringGrid
      Left = 8
      Top = 24
      Width = 521
      Height = 169
      ColCount = 6
      DefaultRowHeight = 20
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      TabOrder = 0
      ColWidths = (
        43
        132
        90
        96
        64
        64)
    end
  end
  object Cari: TEdit
    Left = 48
    Top = 8
    Width = 161
    Height = 21
    TabOrder = 1
  end
  object Selesai: TButton
    Left = 216
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 2
  end
  object Hapus: TButton
    Left = 16
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Hapus'
    TabOrder = 3
  end
end
