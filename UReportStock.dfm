object F_ReportStock: TF_ReportStock
  Left = 0
  Top = 0
  Width = 810
  Height = 1100
  AutoScroll = True
  AutoSize = True
  Caption = 'Report Stok'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  TextHeight = 15
  object QuickRep: TQuickRep
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    ShowingPreview = False
    DataSet = ZQuery
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Continuous = False
    Page.Values = (
      127.000000000000000000
      2970.000000000000000000
      127.000000000000000000
      2100.000000000000000000
      127.000000000000000000
      127.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.MemoryLimit = 1000000
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
    PrintIfEmpty = True
    SnapToGrid = True
    Units = Inches
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    PreviewWidth = 500
    PreviewHeight = 500
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stPDF
    PreviewLeft = 0
    PreviewTop = 0
    object TitleBand1: TQRBand
      Left = 48
      Top = 48
      Width = 698
      Height = 161
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        425.979166666666700000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
      object QRShape1: TQRShape
        Left = 576
        Top = 120
        Width = 121
        Height = 41
        Size.Values = (
          108.479166666666700000
          1524.000000000000000000
          317.500000000000000000
          320.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape2: TQRShape
        Left = 0
        Top = 120
        Width = 153
        Height = 41
        Size.Values = (
          108.479166666666700000
          0.000000000000000000
          317.500000000000000000
          404.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape3: TQRShape
        Left = 144
        Top = 120
        Width = 145
        Height = 41
        Size.Values = (
          108.479166666666700000
          381.000000000000000000
          317.500000000000000000
          383.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape4: TQRShape
        Left = 431
        Top = 120
        Width = 146
        Height = 41
        Size.Values = (
          108.479166666666700000
          1140.354166666667000000
          317.500000000000000000
          386.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape5: TQRShape
        Left = 287
        Top = 120
        Width = 146
        Height = 41
        Size.Values = (
          108.479166666666700000
          759.354166666666700000
          317.500000000000000000
          386.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel1: TQRLabel
        Left = 0
        Top = 0
        Width = 721
        Height = 34
        Size.Values = (
          89.958333333333330000
          0.000000000000000000
          0.000000000000000000
          1907.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'LAPORAN STOK'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlCenter
        FontSize = 20
      end
      object QRLabel2: TQRLabel
        Left = 43
        Top = 128
        Width = 58
        Height = 32
        Size.Values = (
          84.666666666666670000
          113.770833333333300000
          338.666666666666700000
          153.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'MERK'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlCenter
        FontSize = 14
      end
      object QRLabel3: TQRLabel
        Left = 180
        Top = 128
        Width = 72
        Height = 32
        Size.Values = (
          84.666666666666670000
          476.250000000000000000
          338.666666666666700000
          190.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'MODEL'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlCenter
        FontSize = 14
      end
      object QRLabel4: TQRLabel
        Left = 327
        Top = 128
        Width = 66
        Height = 32
        Size.Values = (
          84.666666666666670000
          865.187500000000000000
          338.666666666666700000
          174.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'TAHUN'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlCenter
        FontSize = 14
      end
      object QRLabel5: TQRLabel
        Left = 469
        Top = 128
        Width = 70
        Height = 32
        Size.Values = (
          84.666666666666670000
          1240.895833333333000000
          338.666666666666700000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'WARNA'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlCenter
        FontSize = 14
      end
      object QRLabel6: TQRLabel
        Left = 612
        Top = 128
        Width = 56
        Height = 32
        Size.Values = (
          84.666666666666670000
          1619.250000000000000000
          338.666666666666700000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'STOK'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlCenter
        FontSize = 14
      end
    end
    object DetailBand1: TQRBand
      Left = 48
      Top = 209
      Width = 698
      Height = 40
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRShape10: TQRShape
        Left = 576
        Top = -1
        Width = 121
        Height = 41
        Size.Values = (
          108.479166666666700000
          1524.000000000000000000
          -2.645833333333333000
          320.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape6: TQRShape
        Left = 0
        Top = -1
        Width = 145
        Height = 41
        Size.Values = (
          108.479166666666700000
          0.000000000000000000
          -2.645833333333333000
          383.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape7: TQRShape
        Left = 144
        Top = -1
        Width = 145
        Height = 41
        Size.Values = (
          108.479166666666700000
          381.000000000000000000
          -2.645833333333333000
          383.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape8: TQRShape
        Left = 431
        Top = -1
        Width = 146
        Height = 41
        Size.Values = (
          108.479166666666700000
          1140.354166666667000000
          -2.645833333333333000
          386.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape9: TQRShape
        Left = 287
        Top = -1
        Width = 146
        Height = 41
        Size.Values = (
          108.479166666666700000
          759.354166666666700000
          -2.645833333333333000
          386.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText1: TQRDBText
        Left = 8
        Top = 5
        Width = 130
        Height = 28
        Size.Values = (
          74.083333333333330000
          21.166666666666670000
          13.229166666666670000
          343.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = ZQuery
        DataField = 'merk'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlCenter
        FontSize = 10
      end
      object QRDBText2: TQRDBText
        Left = 151
        Top = 5
        Width = 130
        Height = 28
        Size.Values = (
          74.083333333333330000
          399.520833333333300000
          13.229166666666670000
          343.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = ZQuery
        DataField = 'model'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlCenter
        FontSize = 10
      end
      object QRDBText3: TQRDBText
        Left = 295
        Top = 5
        Width = 130
        Height = 28
        Size.Values = (
          74.083333333333330000
          780.520833333333300000
          13.229166666666670000
          343.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = ZQuery
        DataField = 'tahun'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlCenter
        FontSize = 10
      end
      object QRDBText4: TQRDBText
        Left = 440
        Top = 5
        Width = 130
        Height = 28
        Size.Values = (
          74.083333333333330000
          1164.166666666667000000
          13.229166666666670000
          343.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = ZQuery
        DataField = 'warna'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlCenter
        FontSize = 10
      end
      object QRDBText5: TQRDBText
        Left = 583
        Top = 6
        Width = 106
        Height = 28
        Size.Values = (
          74.083333333333330000
          1542.520833333333000000
          15.875000000000000000
          280.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = ZQuery
        DataField = 'stok'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlCenter
        FontSize = 10
      end
    end
  end
  object ZQuery: TZQuery
    Connection = ZConnection
    Active = True
    SQL.Strings = (
      'SELECT * FROM mobil')
    Params = <>
    Left = 716
    Top = 48
  end
  object ZConnection: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Properties.Strings = (
      'RawStringEncoding=DB_CP')
    Connected = True
    DisableSavepoints = False
    HostName = 'localhost'
    Port = 3306
    Database = 'showroom_abadi'
    User = 'root'
    Password = ''
    Protocol = 'mysql'
    LibraryLocation = 
      'C:\Users\MSI A12VE\Documents\GitHub\showroom_abadi\Win32\Debug\l' +
      'ibmysql.dll'
    Left = 716
    Top = 128
  end
end
