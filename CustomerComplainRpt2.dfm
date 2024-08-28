object FCustomerComplainRpt2: TFCustomerComplainRpt2
  Left = 409
  Top = 266
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Laporan Customer Complain Fasilitas & Crew'
  ClientHeight = 179
  ClientWidth = 287
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 305
    Height = 153
    TabOrder = 0
    object lbl2: TLabel
      Left = 7
      Top = 19
      Width = 19
      Height = 13
      Alignment = taRightJustify
      Caption = 'SBU'
    end
    object cbbSBU: TComboBox
      Left = 96
      Top = 16
      Width = 185
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
    end
    object dtpBulan: TDateTimePicker
      Left = 95
      Top = 74
      Width = 89
      Height = 20
      Date = 41964.570029108800000000
      Format = 'MMM yyyy'
      Time = 41964.570029108800000000
      TabOrder = 1
    end
    object dtpTanggal: TDateTimePicker
      Left = 95
      Top = 46
      Width = 89
      Height = 20
      Date = 0.570029108799644700
      Time = 0.570029108799644700
      TabOrder = 2
    end
    object dtpTglSampai: TDateTimePicker
      Left = 192
      Top = 46
      Width = 89
      Height = 20
      Date = 41964.570029108800000000
      Time = 41964.570029108800000000
      TabOrder = 3
    end
    object rb1: TRadioButton
      Left = 5
      Top = 48
      Width = 84
      Height = 17
      Caption = 'Tanggal'
      TabOrder = 4
    end
    object rb2: TRadioButton
      Left = 5
      Top = 76
      Width = 62
      Height = 17
      Caption = 'Bulan'
      TabOrder = 5
    end
    object grp1: TGroupBox
      Left = 88
      Top = 101
      Width = 174
      Height = 31
      TabOrder = 6
      object NotCategorized: TRadioButton
        Left = 96
        Top = 9
        Width = 69
        Height = 17
        Caption = 'Tgl. Input'
        TabOrder = 0
      end
      object Categorized: TRadioButton
        Left = 9
        Top = 9
        Width = 82
        Height = 17
        Caption = 'Tgl. Jalan'
        TabOrder = 1
      end
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 138
    Width = 287
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnLihatData: TButton
      Left = 112
      Top = 7
      Width = 75
      Height = 26
      Caption = 'Lihat'
      TabOrder = 0
      OnClick = btnLihatDataClick
    end
    object btn1: TButton
      Left = 195
      Top = 7
      Width = 75
      Height = 26
      Caption = 'Selesai'
      TabOrder = 1
      OnClick = btn1Click
    end
  end
  object frxdbdtst1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'tgla=tgla'
      'vhc_batch_id=vhc_batch_id'
      'batch_name=batch_name'
      'seat=seat'
      'vhc_trans_id=vhc_trans_id'
      'from_dates=from_dates'
      'to_dates=to_dates'
      'from_time=from_time'
      'standby_time=standby_time'
      'from_dates_l=from_dates_l'
      'to_dates_l=to_dates_l'
      'employee_id=employee_id'
      'name=name'
      'body_id=body_id'
      'license_plate=license_plate'
      'PlatNo_Driver=PlatNo_Driver'
      'phone_no=phone_no'
      'out_ordo_km=out_ordo_km'
      'description=description'
      'field_contact=field_contact'
      'field_contact_cellular_no=field_contact_cellular_no'
      'route=route'
      'customer_name=customer_name'
      'day=day'
      'pickup_point=pickup_point'
      'submit_dates=submit_dates'
      'out_dates=out_dates'
      'customer_order_id=customer_order_id'
      'reserved_order_detail_id=reserved_order_detail_id'
      'cust_complain_id=cust_complain_id'
      'UpdateDate=UpdateDate'
      'UpdateUser=UpdateUser'
      'cust_complain_kategori_id=cust_complain_kategori_id'
      'cust_complain_id_1=cust_complain_id_1'
      'kebersihan_status=kebersihan_status'
      'fasilitas_status=fasilitas_status'
      'pelayanan_status=pelayanan_status'
      'penjemputan_status=penjemputan_status'
      'mogok_status=mogok_status'
      'driver_bermasalah_status=driver_bermasalah_status'
      'status=status'
      'update_time=update_time'
      'update_user=update_user'
      'status_complain=status_complain'
      'sales_id=sales_id'
      'SalesId=SalesId'
      'ComplainInDetail=ComplainInDetail'
      'investigation=investigation'
      'handling=handling'
      'crew=crew'
      'staff=staff'
      'technical=technical'
      'is_closed=is_closed'
      'closed_reason=closed_reason'
      'segment_name1=segment_name1'
      'segment_name2=segment_name2')
    DataSet = qryComplainCust
    BCDToCurrency = False
    Left = 280
    Top = 120
  end
  object frxrprt2: TfrxReport
    Version = '4.12.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44890.581328761600000000
    ReportOptions.LastChange = 44890.581328761600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnBeforePrint = frxrprt2BeforePrint
    Left = 56
    Top = 112
    Datasets = <
      item
        DataSet = frxdbdtst1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 95.488250000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Shape1: TfrxShapeView
          Top = 1.000000000000000000
          Width = 740.031496060000000000
          Height = 94.488250000000000000
          ShowHint = False
        end
        object Memo9: TfrxMemoView
          Top = 15.779530000000000000
          Width = 740.031496060000000000
          Height = 68.031540000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'LAPORAN CUSTOMER COMPLAIN'
            'FASILITAS & CREW')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Top = 62.354360000000000000
          Width = 740.031496060000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 260.787570000000000000
        Width = 740.409927000000000000
        DataSet = frxdbdtst1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        Stretched = True
        object Memo22: TfrxMemoView
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object tgl: TfrxMemoView
          Left = 30.236240000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataSet = frxdbdtst1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."UpdateDate"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object jenis_service: TfrxMemoView
          Left = 94.488250000000000000
          Width = 170.078740160000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataSet = frxdbdtst1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBDataset1."PlatNo_Driver"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 264.944881890000000000
          Width = 76.346456690000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataSet = frxdbdtst1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."from_dates"] '
            's/d '
            '[frxDBDataset1."to_dates"]'
            ''
            ' ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 340.929133860000000000
          Width = 113.385821890000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'customer_name'
          DataSet = frxdbdtst1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBDataset1."customer_name"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 453.629921260000000000
          Width = 286.488188976378000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'ComplainInDetail'
          DataSet = frxdbdtst1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBDataset1."ComplainInDetail"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer1: TfrxFooter
        Height = 22.677180000000000000
        Top = 302.362400000000000000
        Width = 740.409927000000000000
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 64.724409450000000000
        Top = 173.858380000000000000
        Width = 740.409927000000000000
        Condition = 'frxDBDataset1."status_complain"'
        object Memo10: TfrxMemoView
          Top = 36.000000000000000000
          Width = 30.236240000000000000
          Height = 28.724409448818900000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            'No')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 30.236240000000000000
          Top = 36.000000000000000000
          Width = 64.252010000000000000
          Height = 28.724409448818900000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            'Tanggal')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 94.488250000000000000
          Top = 36.000000000000000000
          Width = 170.078850000000000000
          Height = 28.724409448818900000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            'No Pol / Type Armada / Driver')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 265.008040000000000000
          Top = 36.000000000000000000
          Width = 76.346456690000000000
          Height = 28.724409450000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            'Tanggal Pemakaian')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo1: TfrxMemoView
          Left = 340.929500000000000000
          Top = 36.000000000000000000
          Width = 113.385900000000000000
          Height = 28.724409450000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            'Customer / Sales')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 453.543307090000000000
          Top = 36.000000000000000000
          Width = 286.488188976378000000
          Height = 28.724409450000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            'Komplain')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 0.559060000000000000
          Top = 10.779530000000000000
          Width = 322.771741420000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -17
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'JUDUL')
          ParentFont = False
        end
      end
    end
  end
  object qryComplainCust: TADOQuery
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'EXEC GetCustomerComplainRpt 6,1,2,@Dates='#39'2022-12-01'#39',@DatesTo='#39 +
        '2022-12-31'#39',@Rpt='#39'2'#39'; ')
    Left = 40
    Top = 65535
  end
  object con1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Persist Security Info=False;User ID=nanang;I' +
      'nitial Catalog=wh_prod;Data Source=192.168.10.247;'
    Provider = 'SQLOLEDB.1'
    Left = 264
    Top = 80
  end
  object frxPDFExport1: TfrxPDFExport
    FileName = 'D:\NANANG\TEST.pdf'
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    CreationTime = 44929.637251608790000000
    DataOnly = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    Left = 16
    Top = 152
  end
  object frxlsxprt1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    ExportEMF = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 8
    Top = 130
  end
end
