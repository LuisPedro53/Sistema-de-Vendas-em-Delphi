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
  dmDados in 'DataModule\dmDados.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
