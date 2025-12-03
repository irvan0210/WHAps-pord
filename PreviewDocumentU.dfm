object PreviewDocument: TPreviewDocument
  Left = 480
  Top = 277
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Preview Document'
  ClientHeight = 324
  ClientWidth = 552
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
  object Selesai: TButton
    Left = 240
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 0
    OnClick = SelesaiClick
  end
  object PdfViewer: TWebBrowser
    Left = 8
    Top = 8
    Width = 537
    Height = 281
    TabOrder = 1
    ControlData = {
      4C000000803700000B1D00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
end
