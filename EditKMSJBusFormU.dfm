object EditKMSJBusForm: TEditKMSJBusForm
  Left = 467
  Top = 189
  BorderIcons = [biHelp]
  BorderStyle = bsSingle
  Caption = 'Revisi KM Surat Jalan'
  ClientHeight = 192
  ClientWidth = 322
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
  object Label4: TLabel
    Left = 42
    Top = 58
    Width = 49
    Height = 13
    Alignment = taRightJustify
    Caption = 'KM Keluar'
  end
  object Label1: TLabel
    Left = 21
    Top = 26
    Width = 70
    Height = 13
    Alignment = taRightJustify
    Caption = 'No Surat Jalan'
  end
  object Label5: TLabel
    Left = 89
    Top = 60
    Width = 14
    Height = 13
    Alignment = taRightJustify
    Caption = ' * '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label2: TLabel
    Left = 40
    Top = 83
    Width = 51
    Height = 13
    Alignment = taRightJustify
    Caption = 'KM Masuk'
  end
  object Label6: TLabel
    Left = 89
    Top = 85
    Width = 14
    Height = 13
    Alignment = taRightJustify
    Caption = ' * '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label14: TLabel
    Left = 63
    Top = 110
    Width = 26
    Height = 13
    Alignment = taRightJustify
    Caption = 'Jarak'
  end
  object GroupInput: TPanel
    Left = 102
    Top = 15
    Width = 179
    Height = 125
    BevelOuter = bvNone
    TabOrder = 0
    object Label7: TLabel
      Left = 97
      Top = 94
      Width = 14
      Height = 13
      Alignment = taRightJustify
      Caption = ' * '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label8: TLabel
      Left = 111
      Top = 94
      Width = 48
      Height = 13
      Caption = 'Harus diisi'
    end
    object out_ordo_km: TEdit
      Left = 0
      Top = 41
      Width = 87
      Height = 21
      TabOrder = 2
      OnChange = out_ordo_kmChange
      OnEnter = out_ordo_kmEnter
      OnExit = out_ordo_kmExit
      OnKeyPress = out_ordo_kmKeyPress
    end
    object NoSJ: TEdit
      Left = 0
      Top = 6
      Width = 145
      Height = 21
      Enabled = False
      TabOrder = 1
      OnExit = NoSJExit
      OnKeyPress = NoSJKeyPress
    end
    object in_ordo_km: TEdit
      Left = 0
      Top = 65
      Width = 87
      Height = 21
      TabOrder = 3
      OnChange = out_ordo_kmChange
      OnEnter = in_ordo_kmEnter
      OnExit = in_ordo_kmExit
      OnKeyPress = in_ordo_kmKeyPress
    end
    object jarak: TEdit
      Left = 0
      Top = 91
      Width = 87
      Height = 21
      Color = 12320767
      ReadOnly = True
      TabOrder = 0
    end
  end
  object Simpan: TButton
    Left = 61
    Top = 148
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 1
    OnClick = SimpanClick
  end
  object Batal: TButton
    Left = 188
    Top = 149
    Width = 75
    Height = 25
    Caption = 'Batal'
    TabOrder = 2
    OnClick = BatalClick
  end
end
