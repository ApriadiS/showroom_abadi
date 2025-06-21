object F_Mobil: TF_Mobil
  Left = 0
  Top = 0
  Caption = 'Master Data Mobil'
  ClientHeight = 420
  ClientWidth = 700
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object LabelMerk: TLabel
    Left = 32
    Top = 32
    Width = 30
    Height = 15
    Caption = 'Merk:'
  end
  object LabelModel: TLabel
    Left = 32
    Top = 64
    Width = 37
    Height = 15
    Caption = 'Model:'
  end
  object LabelTahun: TLabel
    Left = 32
    Top = 96
    Width = 36
    Height = 15
    Caption = 'Tahun:'
  end
  object LabelWarna: TLabel
    Left = 32
    Top = 128
    Width = 37
    Height = 15
    Caption = 'Warna:'
  end
  object LabelNoRangka: TLabel
    Left = 32
    Top = 160
    Width = 64
    Height = 15
    Caption = 'No. Rangka:'
  end
  object LabelNoMesin: TLabel
    Left = 32
    Top = 192
    Width = 57
    Height = 15
    Caption = 'No. Mesin:'
  end
  object LabelHargaBeli: TLabel
    Left = 32
    Top = 224
    Width = 57
    Height = 15
    Caption = 'Harga Beli:'
  end
  object LabelHargaJual: TLabel
    Left = 32
    Top = 256
    Width = 58
    Height = 15
    Caption = 'Harga Jual:'
  end
  object LabelStok: TLabel
    Left = 32
    Top = 288
    Width = 26
    Height = 15
    Caption = 'Stok:'
  end
  object DBGridMobil: TDBGrid
    Left = 320
    Top = 16
    Width = 360
    Height = 200
    DataSource = DataSourceMobil
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object DBNavigatorMobil: TDBNavigator
    Left = 320
    Top = 224
    Width = 360
    Height = 25
    DataSource = DataSourceMobil
    TabOrder = 1
  end
  object DBEditMerk: TDBEdit
    Left = 120
    Top = 28
    Width = 160
    Height = 23
    DataField = 'merk'
    DataSource = DataSourceMobil
    TabOrder = 2
  end
  object DBEditModel: TDBEdit
    Left = 120
    Top = 60
    Width = 160
    Height = 23
    DataField = 'model'
    DataSource = DataSourceMobil
    TabOrder = 3
  end
  object DBEditTahun: TDBEdit
    Left = 120
    Top = 92
    Width = 160
    Height = 23
    DataField = 'tahun'
    DataSource = DataSourceMobil
    TabOrder = 4
  end
  object DBEditWarna: TDBEdit
    Left = 120
    Top = 124
    Width = 160
    Height = 23
    DataField = 'warna'
    DataSource = DataSourceMobil
    TabOrder = 5
  end
  object DBEditNoRangka: TDBEdit
    Left = 120
    Top = 156
    Width = 160
    Height = 23
    DataField = 'no_rangka'
    DataSource = DataSourceMobil
    TabOrder = 6
  end
  object DBEditNoMesin: TDBEdit
    Left = 120
    Top = 188
    Width = 160
    Height = 23
    DataField = 'no_mesin'
    DataSource = DataSourceMobil
    TabOrder = 7
  end
  object DBEditHargaBeli: TDBEdit
    Left = 120
    Top = 220
    Width = 160
    Height = 23
    DataField = 'harga_beli'
    DataSource = DataSourceMobil
    TabOrder = 8
  end
  object DBEditHargaJual: TDBEdit
    Left = 120
    Top = 252
    Width = 160
    Height = 23
    DataField = 'harga_jual'
    DataSource = DataSourceMobil
    TabOrder = 9
  end
  object DBEditStok: TDBEdit
    Left = 120
    Top = 284
    Width = 160
    Height = 23
    DataField = 'stok'
    DataSource = DataSourceMobil
    TabOrder = 10
  end
  object ZConnection1: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
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
    Left = 656
    Top = 296
  end
  object ZQueryMobil: TZQuery
    Connection = ZConnection1
    SQL.Strings = (
      'SELECT * FROM mobil')
    Params = <>
    Left = 656
    Top = 336
  end
  object DataSourceMobil: TDataSource
    DataSet = ZQueryMobil
    Left = 656
    Top = 376
  end
end
