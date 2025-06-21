object F_Login: TF_Login
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Login'
  ClientHeight = 180
  ClientWidth = 320
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object LabelUsername: TLabel
    Left = 32
    Top = 32
    Width = 56
    Height = 15
    Caption = 'Username:'
  end
  object LabelPassword: TLabel
    Left = 32
    Top = 72
    Width = 53
    Height = 15
    Caption = 'Password:'
  end
  object EditUsername: TEdit
    Left = 120
    Top = 28
    Width = 160
    Height = 23
    TabOrder = 0
  end
  object EditPassword: TEdit
    Left = 120
    Top = 68
    Width = 160
    Height = 23
    PasswordChar = '*'
    TabOrder = 1
  end
  object BtnLogin: TButton
    Left = 205
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Login'
    TabOrder = 2
  end
  object BtnKeluar: TButton
    Left = 32
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Keluar'
    TabOrder = 3
  end
  object ZQuery: TZQuery
    SQL.Strings = (
      'SELECT * FROM mobil')
    Params = <>
    Left = 172
    Top = 152
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
    Left = 108
    Top = 152
  end
end
