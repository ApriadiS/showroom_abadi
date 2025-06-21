unit UPenjualan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Menus, Vcl.StdCtrls,
  ZAbstractConnection, ZConnection, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TF_Penjualan = class(TForm)
    MainMenu: TMainMenu;
    MenuStock: TMenuItem;
    MenuPelanggan: TMenuItem;
    MenuLogout: TMenuItem;
    ListView: TListView;
    LabelMerk: TLabel;
    CbMerk: TComboBox;
    CbModel: TComboBox;
    LabelModel: TLabel;
    ZQuery: TZQuery;
    ZConnection: TZConnection;
    BtnJual: TButton;
    CbPelanggan: TComboBox;
    LabelPelanggan: TLabel;
    MenUHistoriPenjualan: TMenuItem;
    procedure CbMerkChange(Sender: TObject);
    procedure CbModelChange(Sender: TObject);
    procedure BtnJualClick(Sender: TObject);
    procedure ListViewSelectItem(Sender: TObject; Item: TListItem;Selected: Boolean);
    procedure MenuHistoriPenjualanClick(Sender: TObject);
    procedure MenuPelangganClick(Sender: TObject);
    procedure MenuStockClick(Sender: TObject);
    procedure MenuLogoutClick(Sender: TObject);

  private
    selectedIdMobil: Integer; // ID mobil yang dipilih
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  F_Penjualan: TF_Penjualan;

implementation

uses
  UHistoriPenjualan, UPelanggan, UStock, ULogin;

{$R *.dfm}

procedure TF_Penjualan.MenuLogoutClick(Sender: TObject);
begin
  // Kembali ke form login
  if Assigned(F_Login) then
  begin
    F_Login.Show;
    Self.Close;
  end;
end;

procedure TF_Penjualan.BtnJualClick(Sender: TObject);
var
  id_mobil, id_pelanggan, id_penjualan: Integer;
  harga_jual, sub_total: Double;
  tanggal: TDate;
  pelanggan: string;
begin
  if ListView.Selected = nil then
  begin
    ShowMessage('Pilih mobil yang akan dijual.');
    Exit;
  end;
  if CbPelanggan.ItemIndex = -1 then
  begin
    ShowMessage('Pilih pelanggan terlebih dahulu.');
    Exit;
  end;


  // Ambil id_mobil dari database berdasarkan data yang dipilih di ListView
  ZQuery.Close;
  ZQuery.SQL.Text := 'SELECT id_mobil, harga_jual, stok FROM mobil WHERE merk = :merk AND model = :model AND tahun = :tahun AND warna = :warna';
  ZQuery.ParamByName('merk').AsString := ListView.Selected.Caption;
  ZQuery.ParamByName('model').AsString := ListView.Selected.SubItems[0];
  ZQuery.ParamByName('tahun').AsString := ListView.Selected.SubItems[1];
  ZQuery.ParamByName('warna').AsString := ListView.Selected.SubItems[2];
  ZQuery.Open;
  if ZQuery.IsEmpty then
  begin
    ShowMessage('Data mobil tidak ditemukan.');
    Exit;
  end;
  id_mobil := ZQuery.FieldByName('id_mobil').AsInteger;
  harga_jual := ZQuery.FieldByName('harga_jual').AsFloat;
  if ZQuery.FieldByName('stok').AsInteger < 1 then
  begin
    ShowMessage('Stok mobil habis, tidak dapat dijual.');
    Exit;
  end;

  // Ambil id_pelanggan dari nama di ComboBox
  ZQuery.Close;
  ZQuery.SQL.Text := 'SELECT id_pelanggan FROM pelanggan WHERE nama_pelanggan = :nama';
  ZQuery.ParamByName('nama').AsString := CbPelanggan.Text;
  ZQuery.Open;
  if ZQuery.IsEmpty then
  begin
    ShowMessage('Data pelanggan tidak ditemukan.');
    Exit;
  end;
  id_pelanggan := ZQuery.FieldByName('id_pelanggan').AsInteger;

  // Mulai transaksi
  ZConnection.StartTransaction;
  try
    // 1. Insert ke tabel penjualan
    tanggal := Date;
    ZQuery.Close;
    ZQuery.SQL.Text := 'INSERT INTO penjualan (tanggal_jual, id_pelanggan, total_harga) VALUES (:tanggal, :id_pelanggan, :total_harga)';
    ZQuery.ParamByName('tanggal').AsDate := tanggal;
    ZQuery.ParamByName('id_pelanggan').AsInteger := id_pelanggan;
    ZQuery.ParamByName('total_harga').AsFloat := harga_jual;
    ZQuery.ExecSQL;

    // Ambil id_penjualan terakhir (AUTO_INCREMENT)
    ZQuery.Close;
    ZQuery.SQL.Text := 'SELECT LAST_INSERT_ID() AS id_penjualan';
    ZQuery.Open;
    id_penjualan := ZQuery.FieldByName('id_penjualan').AsInteger;

    // 2. Insert ke detail_penjualan
    sub_total := harga_jual * 1; // jumlah selalu 1
    ZQuery.Close;
    ZQuery.SQL.Text := 'INSERT INTO detail_penjualan (id_penjualan, id_mobil, harga_satuan, jumlah, sub_total) VALUES (:id_penjualan, :id_mobil, :harga_satuan, :jumlah, :sub_total)';
    ZQuery.ParamByName('id_penjualan').AsInteger := id_penjualan;
    ZQuery.ParamByName('id_mobil').AsInteger := id_mobil;
    ZQuery.ParamByName('harga_satuan').AsFloat := harga_jual;
    ZQuery.ParamByName('jumlah').AsInteger := 1;
    ZQuery.ParamByName('sub_total').AsFloat := sub_total;
    ZQuery.ExecSQL;

    // 3. Update stok mobil
    ZQuery.Close;
    ZQuery.SQL.Text := 'UPDATE mobil SET stok = stok - 1 WHERE id_mobil = :id_mobil';
    ZQuery.ParamByName('id_mobil').AsInteger := id_mobil;
    ZQuery.ExecSQL;

    ZConnection.Commit;
    ShowMessage('Penjualan berhasil disimpan!');
    // Refresh ListView
    if Assigned(CbModel.OnChange) then
      CbModel.OnChange(CbModel);
  except
    on E: Exception do
    begin
      ZConnection.Rollback;
      ShowMessage('Penjualan gagal: ' + E.Message);
    end;
  end;
end;

procedure TF_Penjualan.ListViewSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
begin
  // Jika mode adalah kasir, aktifkan BtnJual jika pelanggan sudah dipilih dan ada item yang dipilih
  if (CbPelanggan.ItemIndex <> -1) and (ListView.Selected <> nil) then
    BtnJual.Enabled := True
  else
    BtnJual.Enabled := False;
end;

procedure TF_Penjualan.MenuHistoriPenjualanClick(Sender: TObject);
begin

  F_Histori := TF_Histori.Create(Self);
  F_Histori.Show;
end;

procedure TF_Penjualan.MenuPelangganClick(Sender: TObject);
begin
  F_Pelanggan := TF_Pelanggan.Create(Self);
  F_Pelanggan.Show;
end;

constructor TF_Penjualan.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  // Jangan buat ulang ZConnection dan ZQuery, gunakan komponen form designer
  // Pastikan ZQuery.Connection sudah diatur ke ZConnection di Object Inspector

  CbMerk.OnChange := CbMerkChange;
  CbModel.OnChange := CbModelChange;
  BtnJual.OnClick := BtnJualClick;
  ListView.OnSelectItem := ListViewSelectItem;
  MenuHistoriPenjualan.OnClick := MenuHistoriPenjualanClick;
  MenuPelanggan.OnClick := MenuPelangganClick;
  MenuLogout.OnClick := MenuLogoutClick;
  MenuStock.OnClick := MenuStockClick;
  MenuLogout.OnClick := MenuLogoutClick;

  // Pastikan koneksi database aktif
  if not ZConnection.Connected then
    ZConnection.Connected := True;

  // Refresh ComboBox Merk
  CbMerk.Items.Clear;
  ZQuery.Close;
  ZQuery.SQL.Text := 'SELECT DISTINCT merk FROM mobil ORDER BY merk';
  ZQuery.Open;
  while not ZQuery.Eof do
  begin
    CbMerk.Items.Add(ZQuery.FieldByName('merk').AsString);
    ZQuery.Next;
  end;
  CbMerk.ItemIndex := -1;

  // Kosongkan ComboBox Model
  CbModel.Items.Clear;
  CbModel.ItemIndex := -1;

  // Refresh ComboBox Pelanggan
  CbPelanggan.Items.Clear;
  ZQuery.Close;
  ZQuery.SQL.Text := 'SELECT nama_pelanggan FROM pelanggan ORDER BY nama_pelanggan';
  ZQuery.Open;
  while not ZQuery.Eof do
  begin
    CbPelanggan.Items.Add(ZQuery.FieldByName('nama_pelanggan').AsString);
    ZQuery.Next;
  end;
  CbPelanggan.ItemIndex := -1;

  // Kosongkan ListView
  ListView.Items.Clear;
end;

procedure TF_Penjualan.MenuStockClick(Sender: TObject);
begin
  // Panggil form stock
  F_Stock := TF_Stock.Create(Self);
  F_Stock.Show;
end;

destructor TF_Penjualan.Destroy;
begin
  // Jangan Free komponen form designer, akan di-free otomatis
  inherited Destroy;
end;

procedure TF_Penjualan.CbMerkChange(Sender: TObject);
var
  merk: string;
begin

  // Query ambil data Tahun, Warna, Harga Jual, Stock berdasarkan merk
  merk := CbMerk.Text;
  ZQuery.Close;
  ZQuery.SQL.Text := 'SELECT * FROM mobil WHERE merk = :merk';
  ZQuery.ParamByName('merk').AsString := merk;
  ZQuery.Open;

  // Kosongkan item ListView saja, jangan kolom
  ListView.Items.Clear;
  CbModel.Items.Clear;
  while not ZQuery.Eof do
  begin
    // Tambah model ke CbModel jika belum ada
    if CbModel.Items.IndexOf(ZQuery.FieldByName('model').AsString) = -1 then
      CbModel.Items.Add(ZQuery.FieldByName('model').AsString);
    // Tambah data ke ListView
    with ListView.Items.Add do
    begin
      Caption := ZQuery.FieldByName('merk').AsString;
      SubItems.Add(ZQuery.FieldByName('model').AsString);
      SubItems.Add(ZQuery.FieldByName('tahun').AsString);
      SubItems.Add(ZQuery.FieldByName('warna').AsString);
      SubItems.Add(FormatFloat('#,##0', ZQuery.FieldByName('harga_jual').AsFloat));
      SubItems.Add(ZQuery.FieldByName('stok').AsString);
    end;
    ZQuery.Next;
  end;
end;

procedure TF_Penjualan.CbModelChange(Sender: TObject);
var
  merk, model: string;
begin

  // Query ambil data Tahun, Warna, Harga Jual, Stock berdasarkan merk dan model
  merk := CbMerk.Text;
  model := CbModel.Text;
  ZQuery.Close;
  ZQuery.SQL.Text := 'SELECT * FROM mobil WHERE merk = :merk AND model = :model';
  ZQuery.ParamByName('merk').AsString := merk;
  ZQuery.ParamByName('model').AsString := model;
  ZQuery.Open;

  // Kosongkan item ListView saja, jangan kolom
  ListView.Items.Clear;
  while not ZQuery.Eof do
  begin
    with ListView.Items.Add do
    begin
      Caption := ZQuery.FieldByName('merk').AsString;
      SubItems.Add(ZQuery.FieldByName('model').AsString);
      SubItems.Add(ZQuery.FieldByName('tahun').AsString);
      SubItems.Add(ZQuery.FieldByName('warna').AsString);
      SubItems.Add(FormatFloat('#,##0', ZQuery.FieldByName('harga_jual').AsFloat));
      SubItems.Add(ZQuery.FieldByName('stok').AsString);
    end;
    ZQuery.Next;
  end;
end;

end.
