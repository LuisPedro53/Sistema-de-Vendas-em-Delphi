unit uDTMConexao;

interface

uses
  System.SysUtils, System.Classes, ZAbstractConnection, ZConnection, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TdtmPrincipal = class(TDataModule)
    ConexaoDB: TZConnection;
    QryScripItensVendas: TZQuery;
    QryScripVendas: TZQuery;
    QryScripCategorias: TZQuery;
    QryScripProdutos: TZQuery;
    QryScripClientes: TZQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmPrincipal: TdtmPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uPrincipal;

{$R *.dfm}

end.
