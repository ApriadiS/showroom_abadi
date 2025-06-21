unit UMobil;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ZAbstractConnection,
  ZConnection;

type
  TF_Mobil = class(TForm)
    LabelMerk: TLabel;
    LabelModel: TLabel;
    LabelTahun: TLabel;
    LabelWarna: TLabel;
    LabelNoRangka: TLabel;
    LabelNoMesin: TLabel;
    LabelHargaBeli: TLabel;
    LabelHargaJual: TLabel;
    LabelStok: TLabel;
    DBGridMobil: TDBGrid;
    DBNavigatorMobil: TDBNavigator;
    DBEditMerk: TDBEdit;
    DBEditModel: TDBEdit;
    DBEditTahun: TDBEdit;
    DBEditWarna: TDBEdit;
    DBEditNoRangka: TDBEdit;
    DBEditNoMesin: TDBEdit;
    DBEditHargaBeli: TDBEdit;
    DBEditHargaJual: TDBEdit;
    DBEditStok: TDBEdit;
    ZConnection1: TZConnection;
    ZQueryMobil: TZQuery;
    DataSourceMobil: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Mobil: TF_Mobil;

implementation

{$R *.dfm}

end.
