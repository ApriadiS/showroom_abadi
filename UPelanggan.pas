unit UPelanggan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ZAbstractConnection,
  ZConnection, Vcl.ComCtrls;

type
  TF_Pelanggan = class(TForm)
    LabelNama: TLabel;
    LabelAlamat: TLabel;
    LabelNoTelepon: TLabel;
    LabelEmail: TLabel;
    BtnTambah: TButton;
    BtnHapus: TButton;
    BtnUbah: TButton;
    BtnBatal: TButton;
    ZQuery: TZQuery;
    ZConnection: TZConnection;
    ListView: TListView;
    EdtNama: TEdit;
    EdtAlamat: TEdit;
    EdtNoTelp: TEdit;
    EdtEmail: TEdit;
    BtnKeluar: TButton;
    BtnSimpan: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnTambahClick(Sender: TObject);
    procedure BtnUbahClick(Sender: TObject);
    procedure BtnHapusClick(Sender: TObject);
    procedure BtnSimpanClick(Sender: TObject);
    procedure BtnBatalClick(Sender: TObject);
    procedure BtnKeluarClick(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
  private
    Mode: string; // 'NONE', 'TAMBAH', 'UBAH', 'HAPUS'
    SelectedId: Integer;
    procedure LoadData;
    procedure SetMode(AMode: string);
    procedure ClearEdit;
    procedure IsiEditDariListView;
    procedure EnableEdit(AEnable: Boolean);
  public
    { Public declarations }
  end;

var
  F_Pelanggan: TF_Pelanggan;

implementation

{$R *.dfm}

procedure TF_Pelanggan.FormCreate(Sender: TObject);
begin
  // Bind semua event handler tombol dan ListView
  BtnTambah.OnClick := BtnTambahClick;
  BtnUbah.OnClick := BtnUbahClick;
  BtnHapus.OnClick := BtnHapusClick;
  BtnSimpan.OnClick := BtnSimpanClick;
  BtnBatal.OnClick := BtnBatalClick;
  BtnKeluar.OnClick := BtnKeluarClick;
  ListView1.OnClick := ListView1Click;

  if not ZConnection.Connected then
    ZConnection.Connected := True;

  LoadData;
  SetMode('NONE');
end;

procedure TF_Pelanggan.LoadData;
begin
  ListView1.Items.Clear;
  ZQuery.Close;
  ZQuery.SQL.Text := 'SELECT * FROM pelanggan';
  ZQuery.Open;
  while not ZQuery.Eof do
  begin
    with ListView1.Items.Add do
    begin
      Caption := ZQuery.FieldByName('nama_pelanggan').AsString;
      SubItems.Add(ZQuery.FieldByName('alamat').AsString);
      SubItems.Add(ZQuery.FieldByName('no_telepon').AsString);
      SubItems.Add(ZQuery.FieldByName('email').AsString);
      Data := Pointer(ZQuery.FieldByName('id_pelanggan').AsInteger);
    end;
    ZQuery.Next;
  end;
end;

procedure TF_Pelanggan.SetMode(AMode: string);
begin
  Mode := AMode;
  if Mode = 'NONE' then
  begin
    BtnTambah.Enabled := True;
    BtnUbah.Enabled := ListView1.Selected <> nil;
    BtnHapus.Enabled := ListView1.Selected <> nil;
    BtnSimpan.Visible := False;
    BtnBatal.Enabled := False;
    EnableEdit(False);
  end
  else if (Mode = 'TAMBAH') or (Mode = 'UBAH') then
  begin
    BtnTambah.Enabled := False;
    BtnUbah.Enabled := False;
    BtnHapus.Enabled := False;
    BtnSimpan.Visible := True;
    BtnBatal.Enabled := True;
    EnableEdit(True);
    if Mode = 'TAMBAH' then
      ClearEdit;
  end;
end;

procedure TF_Pelanggan.ClearEdit;
begin
  EdtNama.Text := '';
  EdtAlamat.Text := '';
  EdtNoTelp.Text := '';
  EdtEmail.Text := '';
  SelectedId := -1;
end;

procedure TF_Pelanggan.EnableEdit(AEnable: Boolean);
begin
  EdtNama.Enabled := AEnable;
  EdtAlamat.Enabled := AEnable;
  EdtNoTelp.Enabled := AEnable;
  EdtEmail.Enabled := AEnable;
end;

procedure TF_Pelanggan.IsiEditDariListView;
begin
  if ListView1.Selected <> nil then
  begin
    EdtNama.Text := ListView1.Selected.Caption;
    EdtAlamat.Text := ListView1.Selected.SubItems[0];
    EdtNoTelp.Text := ListView1.Selected.SubItems[1];
    EdtEmail.Text := ListView1.Selected.SubItems[2];
    SelectedId := Integer(ListView1.Selected.Data);
  end;
end;

procedure TF_Pelanggan.ListView1Click(Sender: TObject);
begin
  IsiEditDariListView;
  SetMode('NONE');
end;

procedure TF_Pelanggan.BtnTambahClick(Sender: TObject);
begin
  SetMode('TAMBAH');
end;

procedure TF_Pelanggan.BtnUbahClick(Sender: TObject);
begin
  if ListView1.Selected <> nil then
    SetMode('UBAH');
end;

procedure TF_Pelanggan.BtnHapusClick(Sender: TObject);
begin
  if (ListView1.Selected <> nil) and
     (MessageDlg('Yakin hapus data?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    ZQuery.Close;
    ZQuery.SQL.Text := 'DELETE FROM pelanggan WHERE id_pelanggan = :id';
    ZQuery.ParamByName('id').AsInteger := Integer(ListView1.Selected.Data);
    ZQuery.ExecSQL;
    LoadData;
    ClearEdit;
    SetMode('NONE');
  end;
end;

procedure TF_Pelanggan.BtnSimpanClick(Sender: TObject);
begin
  if (Trim(EdtNama.Text) = '') then
  begin
    ShowMessage('Nama harus diisi!');
    Exit;
  end;
  if Mode = 'TAMBAH' then
  begin
    ZQuery.Close;
    ZQuery.SQL.Text := 'INSERT INTO pelanggan (nama_pelanggan, alamat, no_telepon, email) VALUES (:nama, :alamat, :telp, :email)';
    ZQuery.ParamByName('nama').AsString := EdtNama.Text;
    ZQuery.ParamByName('alamat').AsString := EdtAlamat.Text;
    ZQuery.ParamByName('telp').AsString := EdtNoTelp.Text;
    ZQuery.ParamByName('email').AsString := EdtEmail.Text;
    ZQuery.ExecSQL;
  end
  else if (Mode = 'UBAH') and (SelectedId > 0) then
  begin
    ZQuery.Close;
    ZQuery.SQL.Text := 'UPDATE pelanggan SET nama_pelanggan=:nama, alamat=:alamat, no_telepon=:telp, email=:email WHERE id_pelanggan=:id';
    ZQuery.ParamByName('nama').AsString := EdtNama.Text;
    ZQuery.ParamByName('alamat').AsString := EdtAlamat.Text;
    ZQuery.ParamByName('telp').AsString := EdtNoTelp.Text;
    ZQuery.ParamByName('email').AsString := EdtEmail.Text;
    ZQuery.ParamByName('id').AsInteger := SelectedId;
    ZQuery.ExecSQL;
  end;
  LoadData;
  SetMode('NONE');
end;

procedure TF_Pelanggan.BtnBatalClick(Sender: TObject);
begin
  SetMode('NONE');
  IsiEditDariListView;
end;

procedure TF_Pelanggan.BtnKeluarClick(Sender: TObject);
begin
  Close;
end;

end.
