program ShowroomAbadi;

uses
  Vcl.Forms,
  ULogin in 'ULogin.pas' {F_Login},
  UPenjualan in 'UPenjualan.pas' {F_Penjualan},
  UHistoriPenjualan in 'UHistoriPenjualan.pas' {F_Histori},
  UPelanggan in 'UPelanggan.pas' {F_Pelanggan},
  UStock in 'UStock.pas' {F_Stock};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TF_Login, F_Login);
  Application.CreateForm(TF_Penjualan, F_Penjualan);
  Application.CreateForm(TF_Histori, F_Histori);
  Application.CreateForm(TF_Pelanggan, F_Pelanggan);
  Application.CreateForm(TF_Stock, F_Stock);
  Application.Run;
end.
