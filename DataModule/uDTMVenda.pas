unit uDTMVenda;

interface

uses
  System.SysUtils, System.Classes, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Datasnap.DBClient;

type
  TdtmVenda = class(TDataModule)
    QryCliente: TZQuery;
    QryClienteclienteId: TIntegerField;
    QryClientenome: TWideStringField;
    QryProdutos: TZQuery;
    QryProdutosprodutoId: TIntegerField;
    QryProdutosnome: TWideStringField;
    QryProdutosquantidade: TFloatField;
    QryProdutosvalor: TFloatField;
    dtsCliente: TDataSource;
    dtsProdutos: TDataSource;
    dtsItensVendas: TDataSource;
    cdsItensVendas: TClientDataSet;
    cdsItensVendasprodutoId: TIntegerField;
    cdsItensVendasNomeProduto: TStringField;
    cdsItensVendasquantidade: TFloatField;
    cdsItensVendasvalorUnitario: TFloatField;
    cdsItensVendasvalorTotalProduto: TFloatField;
    cdsItensVendasvalorTotalVenda: TAggregateField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmVenda: TdtmVenda;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uDTMConexao;

{$R *.dfm}

procedure TdtmVenda.DataModuleCreate(Sender: TObject);
begin
cdsItensVendas.CreateDataSet;
QryCliente.Open;
QryProdutos.Open;
end;

procedure TdtmVenda.DataModuleDestroy(Sender: TObject);
begin
cdsItensVendas.Close;
QryCliente.Close;
QryProdutos.Close;
end;

end.
