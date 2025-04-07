object DetailOrderEstimasiBudgetForm: TDetailOrderEstimasiBudgetForm
  Left = 300
  Top = 285
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Detail Perjalanan Order'
  ClientHeight = 264
  ClientWidth = 789
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 44
    Height = 13
    Caption = 'No Order'
  end
  object Label2: TLabel
    Left = 16
    Top = 40
    Width = 38
    Height = 13
    Caption = 'Tanggal'
  end
  object Label3: TLabel
    Left = 16
    Top = 64
    Width = 46
    Height = 13
    Caption = 'Customer'
  end
  object Label4: TLabel
    Left = 16
    Top = 88
    Width = 23
    Height = 13
    Caption = 'Rute'
  end
  object Label5: TLabel
    Left = 392
    Top = 40
    Width = 39
    Height = 13
    Caption = 'No Polisi'
  end
  object Label6: TLabel
    Left = 392
    Top = 16
    Width = 64
    Height = 13
    Caption = 'Jenis Armada'
  end
  object Label7: TLabel
    Left = 392
    Top = 64
    Width = 29
    Height = 13
    Caption = 'Driver'
  end
  object Label8: TLabel
    Left = 392
    Top = 88
    Width = 56
    Height = 13
    Caption = 'Keterangan'
  end
  object Label9: TLabel
    Left = 666
    Top = 16
    Width = 22
    Height = 13
    Caption = 'Seat'
  end
  object Label10: TLabel
    Left = 287
    Top = 40
    Width = 19
    Height = 13
    Caption = 'Hari'
  end
  object Label11: TLabel
    Left = 8
    Top = 192
    Width = 45
    Height = 13
    Caption = 'Trip Type'
  end
  object NoOrder: TEdit
    Left = 72
    Top = 14
    Width = 169
    Height = 21
    ReadOnly = True
    TabOrder = 0
  end
  object Tanggal: TEdit
    Left = 72
    Top = 38
    Width = 209
    Height = 21
    ReadOnly = True
    TabOrder = 1
  end
  object Customer: TEdit
    Left = 72
    Top = 62
    Width = 273
    Height = 21
    ReadOnly = True
    TabOrder = 2
  end
  object Rute: TMemo
    Left = 72
    Top = 88
    Width = 305
    Height = 89
    Lines.Strings = (
      'Rute')
    ReadOnly = True
    TabOrder = 3
  end
  object JenisArmada: TEdit
    Left = 464
    Top = 14
    Width = 193
    Height = 21
    ReadOnly = True
    TabOrder = 4
  end
  object Seat: TEdit
    Left = 690
    Top = 14
    Width = 33
    Height = 21
    TabOrder = 5
  end
  object NoPol: TEdit
    Left = 464
    Top = 38
    Width = 97
    Height = 21
    ReadOnly = True
    TabOrder = 6
  end
  object Driver: TEdit
    Left = 464
    Top = 62
    Width = 297
    Height = 21
    ReadOnly = True
    TabOrder = 7
  end
  object Keterangan: TMemo
    Left = 464
    Top = 88
    Width = 305
    Height = 89
    Lines.Strings = (
      'Memo1')
    ReadOnly = True
    TabOrder = 8
  end
  object Hari: TEdit
    Left = 313
    Top = 38
    Width = 33
    Height = 21
    ReadOnly = True
    TabOrder = 9
  end
  object TripType: TComboBox
    Left = 69
    Top = 191
    Width = 188
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 10
  end
  object Panel1: TPanel
    Left = 0
    Top = 223
    Width = 789
    Height = 41
    Align = alBottom
    TabOrder = 11
    object btn1: TButton
      Left = 402
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Selesai'
      TabOrder = 0
      OnClick = btn1Click
    end
    object Button1: TButton
      Left = 322
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Simpan'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
end
