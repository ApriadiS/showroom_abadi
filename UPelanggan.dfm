object F_Pelanggan: TF_Pelanggan
  Left = 0
  Top = 0
  Caption = 'Master Data Pelanggan'
  ClientHeight = 301
  ClientWidth = 717
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object LabelNama: TLabel
    Left = 32
    Top = 32
    Width = 35
    Height = 15
    Caption = 'Nama:'
  end
  object LabelAlamat: TLabel
    Left = 32
    Top = 64
    Width = 41
    Height = 15
    Caption = 'Alamat:'
  end
  object LabelNoTelepon: TLabel
    Left = 32
    Top = 96
    Width = 67
    Height = 15
    Caption = 'No. Telepon:'
  end
  object LabelEmail: TLabel
    Left = 32
    Top = 128
    Width = 32
    Height = 15
    Caption = 'Email:'
  end
  object BtnTambah: TButton
    Left = 113
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Tambah'
    TabOrder = 0
  end
  object BtnHapus: TButton
    Left = 113
    Top = 191
    Width = 75
    Height = 25
    Caption = 'Hapus'
    TabOrder = 1
  end
  object BtnUbah: TButton
    Left = 206
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Ubah'
    TabOrder = 2
  end
  object BtnBatal: TButton
    Left = 206
    Top = 191
    Width = 75
    Height = 25
    Caption = 'Batal'
    TabOrder = 3
  end
  object BtnSimpan: TButton
    Left = 113
    Top = 222
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 10
    Visible = False
    OnClick = BtnSimpanClick
  end
  object ListView1: TListView
    Left = 304
    Top = 32
    Width = 405
    Height = 261
    Columns = <
      item
        Caption = 'Nama'
        Width = 100
      end
      item
        Caption = 'Alamat'
        Width = 100
      end
      item
        Caption = 'No Telp'
        Width = 100
      end
      item
        Caption = 'Email'
        Width = 100
      end>
    RowSelect = True
    TabOrder = 4
    ViewStyle = vsReport
  end
  object EdtNama: TEdit
    Left = 113
    Top = 29
    Width = 168
    Height = 23
    TabOrder = 5
  end
  object EdtAlamat: TEdit
    Left = 113
    Top = 61
    Width = 168
    Height = 23
    TabOrder = 6
  end
  object EdtNoTelp: TEdit
    Left = 113
    Top = 93
    Width = 168
    Height = 23
    TabOrder = 7
  end
  object EdtEmail: TEdit
    Left = 113
    Top = 125
    Width = 168
    Height = 23
    TabOrder = 8
  end
  object BtnKeluar: TButton
    Left = 206
    Top = 222
    Width = 75
    Height = 25
    Caption = 'Keluar'
    TabOrder = 9
  end
  object ZQuery: TZQuery
    Connection = ZConnection
    Params = <>
    Left = 548
    Top = 232
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
    Left = 628
    Top = 232
  end
end
