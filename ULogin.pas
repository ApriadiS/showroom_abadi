unit ULogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.UITypes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ZAbstractConnection,
  ZConnection, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, UPenjualan;

type
  TF_Login = class(TForm)
    LabelUsername: TLabel;
    EditUsername: TEdit;
    LabelPassword: TLabel;
    EditPassword: TEdit;
    BtnLogin: TButton;
    BtnKeluar: TButton;
    ZQuery: TZQuery;
    ZConnection: TZConnection;
    procedure BtnLoginClick(Sender: TObject);
    procedure BtnKeluarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  F_Login: TF_Login;

implementation

{$R *.dfm}


constructor TF_Login.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  BtnLogin.OnClick := BtnLoginClick;
  BtnKeluar.OnClick := BtnKeluarClick;
end;
destructor TF_Login.Destroy;
begin
  // Pastikan untuk membersihkan resource yang digunakan
  ZQuery.Free;
  ZConnection.Free;
  inherited Destroy;
end;

procedure TF_Login.BtnLoginClick(Sender: TObject);
begin
  // Placeholder autentikasi hardcode
  if (EditUsername.Text = 'admin') and (EditPassword.Text = 'admin123') then
  begin
    ModalResult := mrOk;
    EditPassword.Clear;
    EditUsername.SetFocus;
    F_Login.Hide;
    if not Assigned(F_Penjualan) then
      F_Penjualan := TF_Penjualan.Create(Application);
    F_Penjualan.ShowModal;
    F_Login.Show;
  end
  else
  begin
    MessageDlg('Username atau password salah!', mtError, [mbOK], 0);
    ModalResult := mrNone;
  end;
end;

procedure TF_Login.BtnKeluarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Application.Terminate; // Keluar dari aplikasi
end;

end.








