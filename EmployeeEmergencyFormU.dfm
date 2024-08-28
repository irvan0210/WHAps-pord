object EmployeeEmergencyForm: TEmployeeEmergencyForm
  Left = 253
  Top = 276
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Yang dihubungi saat Darurat'
  ClientHeight = 261
  ClientWidth = 425
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
  object GroupBox2: TGroupBox
    Left = 8
    Top = 0
    Width = 409
    Height = 105
    Caption = 'Data'
    Enabled = False
    TabOrder = 0
    object Label10: TLabel
      Left = 61
      Top = 8
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nama'
    end
    object Label6: TLabel
      Left = 7
      Top = 56
      Width = 82
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tempat/Tgl Lahir'
    end
    object Label7: TLabel
      Left = 19
      Top = 32
      Width = 70
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tgl Bergabung'
    end
    object Label3: TLabel
      Left = 57
      Top = 80
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Alamat'
    end
    object Name: TEdit
      Left = 96
      Top = 8
      Width = 193
      Height = 21
      TabOrder = 0
    end
    object Address: TEdit
      Left = 96
      Top = 80
      Width = 305
      Height = 21
      TabOrder = 1
    end
    object Birth: TEdit
      Left = 96
      Top = 56
      Width = 137
      Height = 21
      TabOrder = 2
    end
    object JoinDate: TEdit
      Left = 96
      Top = 32
      Width = 73
      Height = 21
      TabOrder = 3
    end
  end
  object StrGrid: TZColorStringGrid
    Left = 5
    Top = 109
    Width = 412
    Height = 116
    ColCount = 3
    DefaultRowHeight = 20
    DefaultDrawing = False
    FixedColor = clBtnFace
    FixedCols = 0
    RowCount = 3
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
    ScrollBars = ssHorizontal
    TabOrder = 1
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
    Left = 168
    Top = 229
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 2
    OnClick = SelesaiClick
  end
  object IdKaryawan: TEdit
    Left = 288
    Top = 232
    Width = 121
    Height = 21
    TabOrder = 3
    Visible = False
  end
end
