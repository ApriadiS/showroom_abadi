unit UStock;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, ZAbstractConnection,
  ZConnection, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  Vcl.StdCtrls;

type
  TF_Stock = class(TForm)
    LabelMerk: TLabel;
    LabelModel: TLabel;
    LabelTahun: TLabel;
    LabelWarna: TLabel;
    LabelNoRangka: TLabel;
    LabelNoMesin: TLabel;
    LabelHargaBeli: TLabel;
    LabelHargaJual: TLabel;
    LabelStok: TLabel;
    BtnTambah: TButton;
    BtnHapus: TButton;
    BtnUbah: TButton;
    BtnBatal: TButton;
    BtnSimpan: TButton;
    BtnKeluar: TButton;
    ZQuery: TZQuery;
    ZConnection: TZConnection;
    ListView1: TListView;
    EdtMerk: TEdit;
    EdtModel: TEdit;
    EdtTahun: TEdit;
    EdtWarna: TEdit;
    EdtNoRangka: TEdit;
    EdtNoMesin: TEdit;
    EdtHargaBeli: TEdit;
    EdtHargaJual: TEdit;
    EdtStok: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure BtnTambahClick(Sender: TObject);
    procedure BtnUbahClick(Sender: TObject);
    procedure BtnHapusClick(Sender: TObject);
    procedure BtnSimpanClick(Sender: TObject);
    procedure BtnBatalClick(Sender: TObject);
    procedure BtnKeluarClick(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
  private
    Mode: string; // 'NONE', 'TAMBAH', 'UBAH'
    SelectedId: Integer;
    procedure LoadData;
    procedure SetMode(AMode: string);
    procedure ClearEdit;
    procedure IsiEditDariListView;
    procedure EnableEdit(AEnable: Boolean);
  public
  end;

var
  F_Stock: TF_Stock;

implementation

{$R *.dfm}

procedure TF_Stock.FormCreate(Sender: TObject);
begin
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

procedure TF_Stock.LoadData;
begin
  if not ZConnection.Connected then
    ZConnection.Connected := True;
  ListView1.Items.Clear;
  ZQuery.Close;
  ZQuery.SQL.Text := 'SELECT * FROM mobil';
  ZQuery.Open;
  while not ZQuery.Eof do
  begin
    with ListView1.Items.Add do
    begin
      Caption := ZQuery.FieldByName('merk').AsString;
      SubItems.Add(ZQuery.FieldByName('model').AsString);
      SubItems.Add(ZQuery.FieldByName('tahun').AsString);
      SubItems.Add(ZQuery.FieldByName('warna').AsString);
      SubItems.Add(ZQuery.FieldByName('no_rangka').AsString);
      SubItems.Add(ZQuery.FieldByName('no_mesin').AsString);
      SubItems.Add(FormatFloat('#,##0', ZQuery.FieldByName('harga_beli').AsFloat));
      SubItems.Add(FormatFloat('#,##0', ZQuery.FieldByName('harga_jual').AsFloat));
      SubItems.Add(ZQuery.FieldByName('stok').AsString);
      Data := Pointer(ZQuery.FieldByName('id_mobil').AsInteger);
    end;
    ZQuery.Next;
  end;
end;

procedure TF_Stock.SetMode(AMode: string);
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

procedure TF_Stock.ClearEdit;
begin
  EdtMerk.Text := '';
  EdtModel.Text := '';
  EdtTahun.Text := '';
  EdtWarna.Text := '';
  EdtNoRangka.Text := '';
  EdtNoMesin.Text := '';
  EdtHargaBeli.Text := '';
  EdtHargaJual.Text := '';
  EdtStok.Text := '';
  SelectedId := -1;
end;

procedure TF_Stock.EnableEdit(AEnable: Boolean);
begin
  EdtMerk.Enabled := AEnable;
  EdtModel.Enabled := AEnable;
  EdtTahun.Enabled := AEnable;
  EdtWarna.Enabled := AEnable;
  EdtNoRangka.Enabled := AEnable;
  EdtNoMesin.Enabled := AEnable;
  EdtHargaBeli.Enabled := AEnable;
  EdtHargaJual.Enabled := AEnable;
  EdtStok.Enabled := AEnable;
end;

procedure TF_Stock.IsiEditDariListView;
begin
  if ListView1.Selected <> nil then
  begin
    EdtMerk.Text := ListView1.Selected.Caption;
    EdtModel.Text := ListView1.Selected.SubItems[0];
    EdtTahun.Text := ListView1.Selected.SubItems[1];
    EdtWarna.Text := ListView1.Selected.SubItems[2];
    EdtNoRangka.Text := ListView1.Selected.SubItems[3];
    EdtNoMesin.Text := ListView1.Selected.SubItems[4];
    EdtHargaBeli.Text := ListView1.Selected.SubItems[5];
    EdtHargaJual.Text := ListView1.Selected.SubItems[6];
    EdtStok.Text := ListView1.Selected.SubItems[7];
    SelectedId := Integer(ListView1.Selected.Data);
  end;
end;

procedure TF_Stock.ListView1Click(Sender: TObject);
begin
  IsiEditDariListView;
  SetMode('NONE');
end;

procedure TF_Stock.BtnTambahClick(Sender: TObject);
begin
  SetMode('TAMBAH');
end;

procedure TF_Stock.BtnUbahClick(Sender: TObject);
begin
  if ListView1.Selected <> nil then
    SetMode('UBAH');
end;

procedure TF_Stock.BtnHapusClick(Sender: TObject);
begin
  if (ListView1.Selected <> nil) and
     (MessageDlg('Yakin hapus data?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    ZQuery.Close;
    ZQuery.SQL.Text := 'DELETE FROM mobil WHERE id_mobil = :id';
    ZQuery.ParamByName('id').AsInteger := Integer(ListView1.Selected.Data);
    ZQuery.ExecSQL;
    LoadData;
    ClearEdit;
    SetMode('NONE');
  end;
end;

procedure TF_Stock.BtnSimpanClick(Sender: TObject);
begin
  if (Trim(EdtMerk.Text) = '') or (Trim(EdtModel.Text) = '') or
     (Trim(EdtNoRangka.Text) = '') or (Trim(EdtNoMesin.Text) = '') then
  begin
    ShowMessage('Merk, Model, No Rangka, dan No Mesin wajib diisi!');
    Exit;
  end;
  if Mode = 'TAMBAH' then
  begin
    ZQuery.Close;
    ZQuery.SQL.Text :=
      'INSERT INTO mobil (merk, model, tahun, warna, no_rangka, no_mesin, harga_beli, harga_jual, stok) ' +
      'VALUES (:merk, :model, :tahun, :warna, :no_rangka, :no_mesin, :harga_beli, :harga_jual, :stok)';
    ZQuery.ParamByName('merk').AsString := EdtMerk.Text;
    ZQuery.ParamByName('model').AsString := EdtModel.Text;
    ZQuery.ParamByName('tahun').AsInteger := StrToIntDef(EdtTahun.Text, 0);
    ZQuery.ParamByName('warna').AsString := EdtWarna.Text;
    ZQuery.ParamByName('no_rangka').AsString := EdtNoRangka.Text;
    ZQuery.ParamByName('no_mesin').AsString := EdtNoMesin.Text;
    ZQuery.ParamByName('harga_beli').AsFloat := StrToFloatDef(EdtHargaBeli.Text, 0);
    ZQuery.ParamByName('harga_jual').AsFloat := StrToFloatDef(EdtHargaJual.Text, 0);
    ZQuery.ParamByName('stok').AsInteger := StrToIntDef(EdtStok.Text, 0);
    ZQuery.ExecSQL;
  end
  else if (Mode = 'UBAH') and (SelectedId > 0) then
  begin
    ZQuery.Close;
    ZQuery.SQL.Text :=
      'UPDATE mobil SET merk=:merk, model=:model, tahun=:tahun, warna=:warna, no_rangka=:no_rangka, no_mesin=:no_mesin, ' +
      'harga_beli=:harga_beli, harga_jual=:harga_jual, stok=:stok WHERE id_mobil=:id';
    ZQuery.ParamByName('merk').AsString := EdtMerk.Text;
    ZQuery.ParamByName('model').AsString := EdtModel.Text;
    ZQuery.ParamByName('tahun').AsInteger := StrToIntDef(EdtTahun.Text, 0);
    ZQuery.ParamByName('warna').AsString := EdtWarna.Text;
    ZQuery.ParamByName('no_rangka').AsString := EdtNoRangka.Text;
    ZQuery.ParamByName('no_mesin').AsString := EdtNoMesin.Text;
    ZQuery.ParamByName('harga_beli').AsFloat := StrToFloatDef(EdtHargaBeli.Text, 0);
    ZQuery.ParamByName('harga_jual').AsFloat := StrToFloatDef(EdtHargaJual.Text, 0);
    ZQuery.ParamByName('stok').AsInteger := StrToIntDef(EdtStok.Text, 0);
    ZQuery.ParamByName('id').AsInteger := SelectedId;
    ZQuery.ExecSQL;
  end;
  LoadData;
  SetMode('NONE');
end;

procedure TF_Stock.BtnBatalClick(Sender: TObject);
begin
  SetMode('NONE');
  IsiEditDariListView;
end;

procedure TF_Stock.BtnKeluarClick(Sender: TObject);
begin
  Close;
end;

end.
