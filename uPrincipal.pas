unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,uDTMConexao,Enter,
  Vcl.ExtCtrls, QuickRpt, JvComponentBase, JvgCrossTable, JvBaseDlg,
  JvJVCLAboutForm, Vcl.StdCtrls, Vcl.Mask, RxToolEdit, RLReport, frxDock, frxClass, JvExStdCtrls, JvEdit,
  JvDBSearchEdit;

type
  TfrmPrincipal = class(TForm)
    mainPrincipal: TMainMenu;
    Cadastro1: TMenuItem;
    Cliente1: TMenuItem;
    N1: TMenuItem;
    Categoria1: TMenuItem;
    produto1: TMenuItem;
    N4: TMenuItem;
    mnuFechar: TMenuItem;
    Movimentao1: TMenuItem;
    Relatrio1: TMenuItem;
    Clientes1: TMenuItem;
    N2: TMenuItem;
    Produto2: TMenuItem;
    N3: TMenuItem;
    VendasporData1: TMenuItem;
    procedure mnuFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Categoria1Click(Sender: TObject);
    procedure Cliente1Click(Sender: TObject);
    procedure produto1Click(Sender: TObject);


  private
    TeclaEnter : TMREnter;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uCadCategorias, cCadCategoria, cCadCliente, uCadCliente, uEnum,
  uTelaHeranca, cCadProduto, uCadProdutos;





procedure TfrmPrincipal.Categoria1Click(Sender: TObject);
begin
frmCadCategoria := TfrmCadCategoria.Create(nil);
  try
    frmCadCategoria.ShowModal;
  finally
    FreeAndNil(frmCadCategoria);
  end;
end;

procedure TfrmPrincipal.Cliente1Click(Sender: TObject);
begin
   frmCadCliente:=TfrmCadCliente.Create(self);
   frmCadCliente.ShowModal;
   frmCadCliente.Release;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    FreeAndNil(TeclaEnter);
    FreeAndNil(dtmPrincipal);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
dtmPrincipal := TdtmPrincipal.Create(Self);
with dtmPrincipal.ConexaoDB do begin  //AQUI NÃO PRECISA COLOCAR 'dtmPrincipal.ConexaoDB' no inicio de cada item abaixo.
  SQLHourGlass:=true;
  Protocol := 'mssql';
  LibraryLocation := 'C:\Users\luisp\OneDrive\Área de Trabalho\DELPHI\SISTEMA2 - VENDAS\ntwdblib.dll';
  HostName :='LUIZ';
  Port :=1433;
  User := 'sa';
  Password :='12345678';
  Database :='vendas';
  Connected :=True ;
end;
TeclaEnter := TMREnter.Create(Self);
TeclaEnter.FocusEnabled := true;
TeclaEnter.FocusColor:=clInfoBk;


end;


procedure TfrmPrincipal.mnuFecharClick(Sender: TObject);
begin
close;
end;
procedure TfrmPrincipal.produto1Click(Sender: TObject);
begin
    frmCadProdutos:=TfrmCadProdutos.Create(self);
    frmCadProdutos.ShowModal;
    frmCadProdutos.Release;
end;

end.
