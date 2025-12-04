object PreviewDocument: TPreviewDocument
  Left = 424
  Top = 118
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Preview Document'
  ClientHeight = 483
  ClientWidth = 608
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
    Left = 267
    Top = 447
    Width = 75
    Height = 25
    Caption = 'Selesai'
    TabOrder = 0
    OnClick = SelesaiClick
  end
  object PdfViewer: TWebBrowser
    Left = 8
    Top = 0
    Width = 594
    Height = 440
    TabOrder = 1
    ControlData = {
      4C000000643D00007A2D00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
end
