object F_Histori: TF_Histori
  Left = 0
  Top = 0
  Caption = 'Histori Penjualan'
  ClientHeight = 422
  ClientWidth = 790
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object ListView: TListView
    Left = 5
    Top = 143
    Width = 777
    Height = 273
    Columns = <
      item
        Caption = 'Tanggal'
        Width = 84
      end
      item
        Caption = 'Pelanggan'
        Width = 115
      end
      item
        Caption = 'Mobil'
        Width = 187
      end
      item
        Caption = 'Tipe'
        Width = 87
      end
      item
        Caption = 'Warna'
        Width = 80
      end
      item
        Caption = 'Qty'
        Width = 42
      end
      item
        Caption = 'Harga'
        Width = 87
      end
      item
        Caption = 'Total'
        Width = 91
      end>
    TabOrder = 0
    ViewStyle = vsReport
  end
  object GbHistori: TGroupBox
    Left = 8
    Top = -1
    Width = 774
    Height = 138
    Caption = 'HIstori'
    TabOrder = 1
    object LabelTanggal: TLabel
      Left = 8
      Top = 24
      Width = 42
      Height = 15
      Caption = 'Tanggal'
    end
    object LabelMerk: TLabel
      Left = 272
      Top = 24
      Width = 27
      Height = 15
      Caption = 'Merk'
    end
    object LabelModel: TLabel
      Left = 8
      Top = 52
      Width = 34
      Height = 15
      Caption = 'Model'
    end
    object LabelPelanggan: TLabel
      Left = 269
      Top = 56
      Width = 56
      Height = 15
      Caption = 'Pelanggan'
    end
    object DateTimePicker1: TDateTimePicker
      Left = 62
      Top = 20
      Width = 186
      Height = 23
      Date = 45829.000000000000000000
      Time = 0.046859490743372590
      TabOrder = 0
    end
    object BtnCari: TButton
      Left = 416
      Top = 97
      Width = 75
      Height = 25
      Caption = 'Cari'
      TabOrder = 1
    end
    object CbPelanggan: TComboBox
      Left = 331
      Top = 52
      Width = 160
      Height = 23
      TabOrder = 2
    end
    object CbModel: TComboBox
      Left = 62
      Top = 49
      Width = 186
      Height = 23
      TabOrder = 3
    end
    object CbMerk: TComboBox
      Left = 331
      Top = 21
      Width = 160
      Height = 23
      TabOrder = 4
    end
    object BtnReset: TButton
      Left = 173
      Top = 97
      Width = 75
      Height = 25
      Caption = 'Reset'
      TabOrder = 5
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
    Left = 644
    Top = 8
  end
  object ZQuery: TZQuery
    Connection = ZConnection
    Params = <>
    Left = 564
    Top = 8
  end
end
