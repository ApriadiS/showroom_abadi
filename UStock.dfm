object F_Stock: TF_Stock
  Left = 0
  Top = 0
  Caption = 'Stock'
  ClientHeight = 441
  ClientWidth = 919
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object LabelMerk: TLabel
    Left = 24
    Top = 40
    Width = 30
    Height = 15
    Caption = 'Merk:'
  end
  object LabelModel: TLabel
    Left = 24
    Top = 72
    Width = 37
    Height = 15
    Caption = 'Model:'
  end
  object LabelTahun: TLabel
    Left = 24
    Top = 104
    Width = 36
    Height = 15
    Caption = 'Tahun:'
  end
  object LabelWarna: TLabel
    Left = 24
    Top = 136
    Width = 37
    Height = 15
    Caption = 'Warna:'
  end
  object LabelNoRangka: TLabel
    Left = 296
    Top = 40
    Width = 61
    Height = 15
    Caption = 'No Rangka:'
  end
  object LabelNoMesin: TLabel
    Left = 296
    Top = 72
    Width = 54
    Height = 15
    Caption = 'No Mesin:'
  end
  object LabelHargaBeli: TLabel
    Left = 296
    Top = 104
    Width = 57
    Height = 15
    Caption = 'Harga Beli:'
  end
  object LabelHargaJual: TLabel
    Left = 296
    Top = 136
    Width = 58
    Height = 15
    Caption = 'Harga Jual:'
  end
  object LabelStok: TLabel
    Left = 568
    Top = 40
    Width = 26
    Height = 15
    Caption = 'Stok:'
  end
  object BtnTambah: TButton
    Left = 609
    Top = 70
    Width = 75
    Height = 25
    Caption = 'Tambah'
    TabOrder = 0
  end
  object BtnHapus: TButton
    Left = 609
    Top = 101
    Width = 75
    Height = 25
    Caption = 'Hapus'
    TabOrder = 1
  end
  object BtnUbah: TButton
    Left = 702
    Top = 70
    Width = 75
    Height = 25
    Caption = 'Ubah'
    TabOrder = 2
  end
  object BtnBatal: TButton
    Left = 702
    Top = 101
    Width = 75
    Height = 25
    Caption = 'Batal'
    TabOrder = 3
  end
  object BtnSimpan: TButton
    Left = 609
    Top = 132
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 4
    Visible = False
  end
  object EdtMerk: TEdit
    Left = 105
    Top = 37
    Width = 168
    Height = 23
    TabOrder = 5
  end
  object EdtModel: TEdit
    Left = 105
    Top = 69
    Width = 168
    Height = 23
    TabOrder = 6
  end
  object EdtTahun: TEdit
    Left = 105
    Top = 101
    Width = 168
    Height = 23
    TabOrder = 7
  end
  object EdtWarna: TEdit
    Left = 105
    Top = 133
    Width = 168
    Height = 23
    TabOrder = 8
  end
  object BtnKeluar: TButton
    Left = 702
    Top = 132
    Width = 75
    Height = 25
    Caption = 'Keluar'
    TabOrder = 9
  end
  object ListView: TListView
    Left = 8
    Top = 172
    Width = 905
    Height = 261
    Columns = <
      item
        Caption = 'Merk'
        Width = 100
      end
      item
        Caption = 'Model'
        Width = 100
      end
      item
        Caption = 'Tahun'
        Width = 100
      end
      item
        Caption = 'Warna'
        Width = 100
      end
      item
        Caption = 'No Rangka'
        Width = 100
      end
      item
        Caption = 'No Mesin'
        Width = 100
      end
      item
        Caption = 'Harga Beli'
        Width = 100
      end
      item
        Caption = 'Harga Jual'
        Width = 100
      end
      item
        Caption = 'Stok'
        Width = 100
      end>
    RowSelect = True
    TabOrder = 10
    ViewStyle = vsReport
  end
  object EdtNoRangka: TEdit
    Left = 377
    Top = 37
    Width = 168
    Height = 23
    TabOrder = 11
  end
  object EdtNoMesin: TEdit
    Left = 377
    Top = 69
    Width = 168
    Height = 23
    TabOrder = 12
  end
  object EdtHargaBeli: TEdit
    Left = 377
    Top = 101
    Width = 168
    Height = 23
    TabOrder = 13
  end
  object EdtHargaJual: TEdit
    Left = 377
    Top = 133
    Width = 168
    Height = 23
    TabOrder = 14
  end
  object EdtStok: TEdit
    Left = 609
    Top = 37
    Width = 168
    Height = 23
    TabOrder = 15
  end
  object ZQuery: TZQuery
    Connection = ZConnection
    Params = <>
    Left = 852
    Top = 32
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
    Left = 852
    Top = 112
  end
end
