program Vendas;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uDTMConexao in 'DataModule\uDTMConexao.pas' {dtmPrincipal: TDataModule},
  uTelaHeranca in 'Heranca\uTelaHeranca.pas' {frmTelaHeranca},
  uCadCategorias in 'Cadastro\uCadCategorias.pas' {frmCadCategoria},
  Enter in 'terceiros\Enter.pas',
  uEnum in 'Heranca\uEnum.pas',
  cCadCategoria in 'Classe\cCadCategoria.pas',
  uCadCliente in 'Cadastro\uCadCliente.pas' {frmCadCliente},
  cCadCliente in 'Classe\cCadCliente.pas',
  uCadProdutos in 'Cadastro\uCadProdutos.pas' {frmCadProdutos},
  cCadProduto in 'Classe\cCadProduto.pas',
  dmDados in 'DataModule\dmDados.pas' {DataModule1: TDataModule},
  ufrmAtualizaDB in 'DataModule\ufrmAtualizaDB.pas' {frmAtualizaDB},
  uDTMVenda in 'DataModule\uDTMVenda.pas' {dtmVenda: TDataModule},
  uProVendas in 'Processos\uProVendas.pas' {frmVendas};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdtmVenda, dtmVenda);
  Application.CreateForm(TfrmVendas, frmVendas);
  Application.Run;
end.
