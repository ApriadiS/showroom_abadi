object F_Penjualan: TF_Penjualan
  Left = 0
  Top = 0
  Caption = 'Penjualan'
  ClientHeight = 383
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu
  TextHeight = 15
  object LabelMerk: TLabel
    Left = 16
    Top = 216
    Width = 27
    Height = 15
    Caption = 'Merk'
  end
  object LabelModel: TLabel
    Left = 16
    Top = 245
    Width = 34
    Height = 15
    Caption = 'Model'
  end
  object LabelPelanggan: TLabel
    Left = 16
    Top = 274
    Width = 56
    Height = 15
    Caption = 'Pelanggan'
  end
  object ListView: TListView
    Left = 8
    Top = 8
    Width = 616
    Height = 185
    Columns = <
      item
        Caption = 'Merk'
        Width = 87
      end
      item
        Caption = 'Model'
        Width = 102
      end
      item
        Caption = 'Tahun'
        Width = 55
      end
      item
        Caption = 'Warna'
        Width = 124
      end
      item
        Caption = 'Harga'
        Width = 176
      end
      item
        Caption = 'Stock'
        Width = 67
      end>
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
  end
  object BtnJual: TButton
    Left = 163
    Top = 307
    Width = 75
    Height = 25
    Caption = 'Jual'
    Enabled = False
    TabOrder = 1
    OnClick = BtnJualClick
  end
  object CbMerk: TComboBox
    Left = 78
    Top = 212
    Width = 160
    Height = 23
    TabOrder = 2
  end
  object CbModel: TComboBox
    Left = 78
    Top = 241
    Width = 160
    Height = 23
    TabOrder = 3
  end
  object CbPelanggan: TComboBox
    Left = 78
    Top = 270
    Width = 160
    Height = 23
    TabOrder = 4
  end
  object MainMenu: TMainMenu
    Left = 304
    Top = 296
    object MenuStock: TMenuItem
      Caption = 'Stok'
      OnClick = MenuStockClick
    end
    object MenuPelanggan: TMenuItem
      Caption = 'Pelanggan'
      OnClick = MenuPelangganClick
    end
    object MenUHistoriPenjualan: TMenuItem
      Caption = 'Histori Penjualan'
      OnClick = MenUHistoriPenjualanClick
    end
    object MenuReport: TMenuItem
      Caption = 'Report'
      object SubMenuReportStok: TMenuItem
        Caption = 'Report Stok'
        OnClick = MenuReportStockClick
      end
      object SubMenuReportPenjualan: TMenuItem
        Caption = 'Report Penjualan'
        OnClick = MenuReportPenjualanClick
      end
    end
    object MenuLogout: TMenuItem
      Caption = 'Logout'
    end
  end
  object ZConnection: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Properties.Strings = (
      'RawStringEncoding=DB_CP')
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
    Left = 364
    Top = 296
  end
  object ZQuery: TZQuery
    Connection = ZConnection
    Params = <>
    Left = 420
    Top = 296
  end
end
