object PhotoOdoViewer: TPhotoOdoViewer
  Left = 300
  Top = 120
  Width = 287
  Height = 519
  BorderIcons = [biSystemMenu]
  Caption = 'Foto Odo'
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
  DesignSize = (
    271
    480)
  PixelsPerInch = 96
  TextHeight = 13
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 271
    Height = 480
    Align = alClient
    TabOrder = 0
    object Gambar: TImage
      Left = 0
      Top = 0
      Width = 265
      Height = 435
    end
  end
  object Selesai: TButton
    Left = 91
    Top = 447
    Width = 90
    Height = 25
    Anchors = [akBottom]
    Caption = 'Selesai'
    TabOrder = 1
    OnClick = SelesaiClick
  end
end
