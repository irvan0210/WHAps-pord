object LihatPesanForm: TLihatPesanForm
  Left = 510
  Top = 110
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Lihat Pesan'
  ClientHeight = 263
  ClientWidth = 459
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
  object Label1: TLabel
    Left = 9
    Top = 8
    Width = 40
    Height = 13
    Alignment = taRightJustify
    Caption = 'Pengirim'
  end
  object Label2: TLabel
    Left = 10
    Top = 32
    Width = 39
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tanggal'
  end
  object Label4: TLabel
    Left = 19
    Top = 56
    Width = 30
    Height = 13
    Alignment = taRightJustify
    Caption = 'Pesan'
  end
  object Panel1: TPanel
    Left = 56
    Top = 8
    Width = 305
    Height = 49
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 0
    object Label3: TLabel
      Left = 118
      Top = 24
      Width = 19
      Height = 13
      Alignment = taRightJustify
      Caption = 'Jam'
    end
    object Dari: TEdit
      Left = 0
      Top = 0
      Width = 305
      Height = 21
      TabOrder = 0
    end
    object Tanggal: TEdit
      Left = 0
      Top = 24
      Width = 73
      Height = 21
      TabOrder = 1
    end
    object Jam: TEdit
      Left = 144
      Top = 24
      Width = 41
      Height = 21
      TabOrder = 2
    end
  end
  object Pesan: TMemo
    Left = 56
    Top = 56
    Width = 393
    Height = 169
    ReadOnly = True
    TabOrder = 1
  end
  object Reply: TBitBtn
    Left = 385
    Top = 229
    Width = 28
    Height = 25
    Hint = 'Balas pesan ke pengirim'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = ReplyClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
      333333333333337FF3333333333333903333333333333377FF33333333333399
      03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
      99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
      99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
      03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
      33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
      33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
      3333777777333333333333333333333333333333333333333333}
    NumGlyphs = 2
  end
  object Selesai: TBitBtn
    Left = 419
    Top = 229
    Width = 28
    Height = 25
    Hint = 'Keluar / Selesai'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = SelesaiClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
      3333333777333777FF3333993333339993333377FF3333377FF3399993333339
      993337777FF3333377F3393999333333993337F777FF333337FF993399933333
      399377F3777FF333377F993339993333399377F33777FF33377F993333999333
      399377F333777FF3377F993333399933399377F3333777FF377F993333339993
      399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
      99333773FF3333777733339993333339933333773FFFFFF77333333999999999
      3333333777333777333333333999993333333333377777333333}
    NumGlyphs = 2
  end
end
