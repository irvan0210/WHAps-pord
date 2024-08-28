object UserExportForm: TUserExportForm
  Left = 565
  Top = 171
  BorderIcons = [biHelp]
  BorderStyle = bsDialog
  Caption = 'UserExportForm'
  ClientHeight = 369
  ClientWidth = 521
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupInput: TGroupBox
    Left = 0
    Top = 0
    Width = 521
    Height = 65
    Align = alTop
    TabOrder = 0
    object Label6: TLabel
      Left = 17
      Top = 17
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'User Name'
    end
    object Label5: TLabel
      Left = 43
      Top = 41
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'Menu'
    end
    object UserExportId: TEdit
      Left = 307
      Top = 6
      Width = 73
      Height = 21
      TabOrder = 0
      Visible = False
    end
    object cb_username: TComboBox
      Left = 75
      Top = 14
      Width = 233
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnChange = cb_usernameChange
    end
    object cb_menu: TComboBox
      Left = 75
      Top = 38
      Width = 233
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      OnChange = cb_menuChange
      OnKeyPress = cb_menuKeyPress
    end
    object Simpan: TButton
      Left = 342
      Top = 31
      Width = 60
      Height = 25
      Caption = 'Simpan'
      TabOrder = 3
      OnClick = SimpanClick
    end
    object Bersihkan: TButton
      Left = 405
      Top = 31
      Width = 60
      Height = 25
      Caption = 'Bersihkan'
      TabOrder = 4
      OnClick = BersihkanClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 329
    Width = 521
    Height = 40
    Align = alBottom
    TabOrder = 1
    object Label3: TLabel
      Left = 15
      Top = 11
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'Filter Status'
    end
    object Edit: TButton
      Left = 213
      Top = 7
      Width = 60
      Height = 25
      Caption = 'Edit'
      TabOrder = 2
      OnClick = EditClick
    end
    object selesai: TButton
      Left = 405
      Top = 7
      Width = 60
      Height = 25
      Caption = 'Selesai'
      TabOrder = 1
      OnClick = selesaiClick
    end
    object Tambah: TButton
      Left = 279
      Top = 7
      Width = 60
      Height = 25
      Caption = 'Tambah'
      TabOrder = 0
      OnClick = TambahClick
    end
    object batal: TButton
      Left = 342
      Top = 7
      Width = 60
      Height = 25
      Caption = 'Batal'
      TabOrder = 3
      OnClick = batalClick
    end
    object is_active: TCheckBox
      Left = 76
      Top = 10
      Width = 58
      Height = 17
      Caption = 'Active'
      TabOrder = 4
      OnClick = is_activeClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 65
    Width = 521
    Height = 264
    Align = alClient
    TabOrder = 2
    object StrGrid: TZColorStringGrid
      Left = 1
      Top = 41
      Width = 519
      Height = 222
      Align = alClient
      ColCount = 4
      DefaultRowHeight = 20
      DefaultDrawing = False
      FixedColor = clBtnFace
      FixedCols = 0
      RowCount = 2
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
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 519
      Height = 40
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 48
        Top = 17
        Width = 18
        Height = 13
        Caption = 'Cari'
      end
      object Cari: TEdit
        Left = 77
        Top = 13
        Width = 207
        Height = 21
        TabOrder = 0
        OnChange = CariChange
      end
    end
  end
end
