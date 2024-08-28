object UserSignature: TUserSignature
  Left = 312
  Top = 143
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'UserSignature'
  ClientHeight = 433
  ClientWidth = 876
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
  object GroupFoto: TGroupBox
    Left = 6
    Top = 8
    Width = 859
    Height = 385
    Caption = 'Signature'
    TabOrder = 0
    object Signature: TImage
      Left = 8
      Top = 16
      Width = 841
      Height = 361
      OnDblClick = SignatureDblClick
    end
  end
  object Selesai: TButton
    Left = 400
    Top = 400
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 1
    OnClick = SelesaiClick
  end
end
