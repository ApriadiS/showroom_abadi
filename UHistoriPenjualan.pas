unit UHistoriPenjualan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, Vcl.Menus,
  Vcl.StdCtrls, Vcl.ComCtrls, CommCtrl;

type
  TF_Histori = class(TForm)
    ListView: TListView;
    GbHistori: TGroupBox;
    LabelTanggal: TLabel;
    DateTimePicker1: TDateTimePicker;
    BtnCari: TButton;
    ZConnection: TZConnection;
    ZQuery: TZQuery;
    LabelMerk: TLabel;
    LabelModel: TLabel;
    LabelPelanggan: TLabel;
    CbPelanggan: TComboBox;
    CbModel: TComboBox;
    CbMerk: TComboBox;
    BtnReset: TButton;
    procedure BtnCariClick(Sender: TObject);
    procedure BtnResetClick(Sender: TObject);
  private
    procedure LoadHistori(applyFilter: Boolean = False); // Tambahkan parameter applyFilter
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  F_Histori: TF_Histori;

implementation

{$R *.dfm}

procedure TF_Histori.LoadHistori(applyFilter: Boolean = False);
var
  sql, whereStr: string;
  params: array of Variant;
  paramIdx: Integer;
  tglAwal, tglAkhir: TDateTime;
begin
  sql :=
    'SELECT p.tanggal_jual, pl.nama_pelanggan, m.merk, m.model, m.tahun, m.warna, dp.harga_satuan, dp.jumlah, dp.sub_total ' +
    'FROM penjualan p ' +
    'JOIN pelanggan pl ON p.id_pelanggan = pl.id_pelanggan ' +
    'JOIN detail_penjualan dp ON p.id_penjualan = dp.id_penjualan ' +
    'JOIN mobil m ON dp.id_mobil = m.id_mobil ';
  whereStr := '';
  SetLength(params, 0);
  paramIdx := 0;

  if applyFilter then
  begin
    // Filter tanggal hanya jika user memilih tanggal (bukan sentinel)
    if Trunc(DateTimePicker1.Date) <> Trunc(EncodeDate(1899,12,30)) then
    begin
      tglAwal := Trunc(DateTimePicker1.Date);
      tglAkhir := tglAwal + 1;
      whereStr := whereStr + ' AND p.tanggal_jual >= :tgl_awal AND p.tanggal_jual < :tgl_akhir';
      SetLength(params, Length(params)+2);
      params[High(params)-1] := tglAwal;
      params[High(params)] := tglAkhir;
    end;
    // Filter pelanggan
    if (CbPelanggan.Text <> '') and (CbPelanggan.ItemIndex <> -1) then
    begin
      whereStr := whereStr + ' AND pl.nama_pelanggan = :pelanggan';
      SetLength(params, Length(params)+1);
      params[High(params)] := CbPelanggan.Text;
    end;
    // Filter merk
    if (CbMerk.Text <> '') and (CbMerk.ItemIndex <> -1) then
    begin
      whereStr := whereStr + ' AND m.merk = :merk';
      SetLength(params, Length(params)+1);
      params[High(params)] := CbMerk.Text;
    end;
    // Filter model
    if (CbModel.Text <> '') and (CbModel.ItemIndex <> -1) then
    begin
      whereStr := whereStr + ' AND m.model = :model';
      SetLength(params, Length(params)+1);
      params[High(params)] := CbModel.Text;
    end;
  end;

  if whereStr <> '' then
    sql := sql + ' WHERE ' + Copy(whereStr, 6, Length(whereStr)-5);
  sql := sql + ' ORDER BY p.tanggal_jual DESC';

  ZQuery.Close;
  ZQuery.SQL.Text := sql;
  // Set parameter
  for paramIdx := 0 to High(params) do
    ZQuery.Params[paramIdx].Value := params[paramIdx];
  ZQuery.Open;

  // Isi ListView
  ListView.Items.Clear;
  while not ZQuery.Eof do
  begin
    with ListView.Items.Add do
    begin
      Caption := DateToStr(ZQuery.FieldByName('tanggal_jual').AsDateTime);
      SubItems.Add(ZQuery.FieldByName('nama_pelanggan').AsString);
      SubItems.Add(ZQuery.FieldByName('merk').AsString + ' ' + ZQuery.FieldByName('model').AsString + ' ' + ZQuery.FieldByName('tahun').AsString);
      SubItems.Add(ZQuery.FieldByName('model').AsString);
      SubItems.Add(ZQuery.FieldByName('warna').AsString);
      SubItems.Add(IntToStr(ZQuery.FieldByName('jumlah').AsInteger));
      SubItems.Add(FormatFloat('#,##0', ZQuery.FieldByName('harga_satuan').AsFloat));
      SubItems.Add(FormatFloat('#,##0', ZQuery.FieldByName('sub_total').AsFloat));
    end;
    ZQuery.Next;
  end;
end;

procedure TF_Histori.BtnCariClick(Sender: TObject);
begin
  LoadHistori(True); // Terapkan filter hanya saat tombol Cari
end;

procedure TF_Histori.BtnResetClick(Sender: TObject);
begin
  // Reset semua filter
  DateTimePicker1.Date := Now; // Atur ke tanggal saat ini
  CbPelanggan.ItemIndex := -1;
  CbMerk.ItemIndex := -1;
  CbModel.ItemIndex := -1;
  // Refresh ListView tanpa filter
  LoadHistori(False);
end;

constructor TF_Histori.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  // Inisialisasi ComboBox filter
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

  CbModel.Items.Clear;
  ZQuery.Close;
  ZQuery.SQL.Text := 'SELECT DISTINCT model FROM mobil ORDER BY model';
  ZQuery.Open;
  while not ZQuery.Eof do
  begin
    CbModel.Items.Add(ZQuery.FieldByName('model').AsString);
    ZQuery.Next;
  end;
  CbModel.ItemIndex := -1;

  // Set nilai default DateTimePicker ke sentinel
  DateTimePicker1.Date := Now;
  // Load data histori awal tanpa filter
  LoadHistori(False);
  // Hubungkan event handler BtnReset
  BtnReset.OnClick := BtnResetClick;
  BtnCari.OnClick := BtnCariClick;
end;

destructor TF_Histori.Destroy;
begin
  // Cleanup code if necessary
  inherited Destroy;
end;


end.