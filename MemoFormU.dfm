object MemoForm: TMemoForm
  Left = 399
  Top = 245
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Memo Form'
  ClientHeight = 254
  ClientWidth = 547
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
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
  object Label2: TLabel
    Left = 15
    Top = 65
    Width = 75
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Judul Memo'
  end
  object Label3: TLabel
    Left = 15
    Top = 90
    Width = 75
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Tanggal'
  end
  object Label1: TLabel
    Left = 15
    Top = 12
    Width = 75
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'ID Document'
  end
  object Label5: TLabel
    Left = 15
    Top = 39
    Width = 75
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Nomor Memo'
  end
  object Label6: TLabel
    Left = 104
    Top = 184
    Width = 3
    Height = 13
    Alignment = taRightJustify
    Caption = ':'
  end
  object Label11: TLabel
    Left = 15
    Top = 111
    Width = 75
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Deskripsi'
  end
  object Label30: TLabel
    Left = 93
    Top = 37
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
  object Label13: TLabel
    Left = 93
    Top = 63
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
  object Batal: TButton
    Left = 248
    Top = 223
    Width = 75
    Height = 25
    Caption = 'Batal'
    TabOrder = 2
    OnClick = BatalClick
  end
  object Simpan: TButton
    Left = 152
    Top = 223
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 3
    OnClick = SimpanClick
  end
  object GroupId: TPanel
    Left = 100
    Top = 4
    Width = 97
    Height = 33
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 0
    object Label9: TLabel
      Left = 3
      Top = 5
      Width = 5
      Height = 16
      Alignment = taRightJustify
      Caption = ':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DocId: TEdit
      Left = 15
      Top = 5
      Width = 57
      Height = 21
      TabOrder = 0
    end
  end
  object GroupInput: TPanel
    Left = 100
    Top = 32
    Width = 437
    Height = 137
    BevelOuter = bvNone
    TabOrder = 1
    object Label4: TLabel
      Left = 3
      Top = 5
      Width = 5
      Height = 16
      Alignment = taRightJustify
      Caption = ':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 3
      Top = 30
      Width = 5
      Height = 16
      Alignment = taRightJustify
      Caption = ':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 3
      Top = 55
      Width = 5
      Height = 16
      Alignment = taRightJustify
      Caption = ':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 3
      Top = 78
      Width = 5
      Height = 16
      Alignment = taRightJustify
      Caption = ':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DocTitle: TEdit
      Left = 15
      Top = 30
      Width = 423
      Height = 21
      TabOrder = 1
      OnKeyPress = DocTitleKeyPress
    end
    object DocNumber: TEdit
      Left = 15
      Top = 5
      Width = 200
      Height = 21
      TabOrder = 0
      OnKeyPress = DocTitleKeyPress
    end
    object StartDate: TDateTimePicker
      Left = 15
      Top = 54
      Width = 89
      Height = 21
      Date = 41927.000000000000000000
      Time = 41927.000000000000000000
      TabOrder = 2
    end
    object Description: TMemo
      Left = 16
      Top = 80
      Width = 422
      Height = 55
      TabOrder = 3
    end
  end
  object Active: TCheckBox
    Left = 478
    Top = 3
    Width = 58
    Height = 17
    Caption = 'Active'
    Enabled = False
    TabOrder = 4
    OnKeyPress = ActiveKeyPress
  end
  object GroupBox1: TGroupBox
    Left = 9
    Top = 171
    Width = 528
    Height = 42
    TabOrder = 5
    object Label10: TLabel
      Left = 7
      Top = 16
      Width = 75
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Nama File'
    end
    object Label14: TLabel
      Left = 85
      Top = 10
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
    object Label15: TLabel
      Left = 7
      Top = 45
      Width = 75
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'File Ext'
    end
    object Label16: TLabel
      Left = 233
      Top = 45
      Width = 73
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'File Size (KB) : '
    end
    object Label17: TLabel
      Left = 95
      Top = 13
      Width = 5
      Height = 16
      Alignment = taRightJustify
      Caption = ':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label18: TLabel
      Left = 93
      Top = 43
      Width = 5
      Height = 16
      Alignment = taRightJustify
      Caption = ':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EditFileName: TEdit
      Left = 107
      Top = 12
      Width = 279
      Height = 21
      ReadOnly = True
      TabOrder = 1
      OnKeyPress = EditFileNameKeyPress
    end
    object Upload: TButton
      Left = 392
      Top = 9
      Width = 71
      Height = 24
      Caption = 'Upload File'
      TabOrder = 0
      OnClick = UploadClick
    end
    object Preview: TButton
      Left = 470
      Top = 9
      Width = 52
      Height = 24
      Caption = 'Preview'
      TabOrder = 2
      OnClick = PreviewClick
    end
    object EditFileExt: TEdit
      Left = 107
      Top = 42
      Width = 70
      Height = 21
      TabOrder = 3
    end
    object EditFileSize: TEdit
      Left = 316
      Top = 42
      Width = 70
      Height = 21
      TabOrder = 4
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 312
  end
end
