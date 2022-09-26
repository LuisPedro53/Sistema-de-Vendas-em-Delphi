unit uTelaHeranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,uDTMConexao, uPrincipal,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.ComCtrls, Vcl.ExtCtrls, uEnum, RxToolEdit,
  RxCurrEdit;

type
  TfrmTelaHeranca = class(TForm)
    pnlRodaPe: TPanel;
    mskPesquisar: TMaskEdit;
    btnPesquisar: TBitBtn;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    btnApagar: TBitBtn;
    btnFechar: TBitBtn;
    dstListagem: TDataSource;
    QryListagem: TZQuery;
    pgcPrincipal: TPageControl;
    TabListagem: TTabSheet;
    pnlListagemTopo: TPanel;
    TabManutencao: TTabSheet;
    grdListagem: TDBGrid;
    lblIndice: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdListagemTitleClick(Column: TColumn);
    procedure mskPesquisarChange(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure grdListagemDblClick(Sender: TObject);
    procedure grdListagemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }

    procedure ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,
           btnApagar:TBitBtn; pgcPrincipal:TPageControl;
           Flag:Boolean);
    procedure ControlarIndiceTab(pgcPrincipal: TPageControl; Indice: Integer);
    function RetornarCampoTraduzido(Campo: String): string;
    procedure ExibirLabelIndice(Campo:string; aLabel:TLabel);
    function ExisteCampoObrigatorio: Boolean;
    procedure DesabilitarEditPK;
    procedure LimparEditS;

  public
    { Public declarations }
    //EstadoDoCadastro:TEstadoDoCadastro;
    IndiceAtual: string;
    EstadoDoCadastro:TEstadoDoCadastro;
    function Apagar:Boolean; virtual;
    function Gravar(EstadoDoCadastro: TEstadoDoCadastro):Boolean;virtual;
    procedure BloqueiaCTRL_DEL_DBGrid(var Key: Word; Shift: TShiftState);
  end;

var
  frmTelaHeranca: TfrmTelaHeranca;

implementation

{$R *.dfm}
{$Region 'OBSERVAÇÕES'}
 //TAG: 1 - CHAVE PRIMARIA
 //TAG: 2 - CMAPOS OBRIGATÓRIOS
{$endregion}
{$Region 'FUNÇÕES E PROCEDURES'}
//PROCEDURE DE CONTROLE DE TELA

procedure  TfrmTelaHeranca.ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,
           btnApagar:TBitBtn; pgcPrincipal:TPageControl;
           Flag:Boolean);//ControlarBotoes = Nome da procedure para ser chamada posteriormente
begin
     btnNovo.Enabled :=Flag; //Aqui irei definir btnNovo como Flag(boolean)para posteriomente ser definida como true ou false.
     btnAlterar.Enabled :=Flag;
     btnApagar.Enabled :=Flag;
     pgcPrincipal.Pages[0].TabVisible :=Flag;//Aqui irei definir o TAB 0(Listagem) como boolean
     btnCancelar.Enabled := not(flag); //Aqui defini not flag, pois quero q seja o contrario dos botões normais, por exemplo,
     //caso os botoes que tem flag sejam habilitados, os que tem not flag ficaram desabilitados.
     btnGravar.Enabled :=not(flag);
end;

procedure  TfrmTelaHeranca.ControlarIndiceTab(pgcPrincipal:TPageControl;Indice:Integer);
begin
  if (pgcPrincipal.Pages[Indice].TabVisible) then
    pgcPrincipal.TabIndex :=Indice;
end;

function TfrmTelaHeranca.RetornarCampoTraduzido (Campo:String):string; //TODA FUNÇÃO TEM UM RETORNO, ESSA 
//POR EXEMPLO, RETORNA O ':String'
//TRADUZINDO A LINHA ACIMA: TEMOS UMA FUNÇÃO QUE SE CHAMA 'RetornarCampoTraduzido', QUE VAI RECEBER UM CAMPO
// DO TIPO STRING E VAI RETORNAR UMA STRING
var i : Integer;
begin
  for I := 0 to QryListagem.Fields.Count-1 do
    begin
       if LowerCase(QryListagem.Fields[i].FieldName)=LowerCase(Campo) then //LOWERCASE SERVE PARA DEIXAR TUDO MINUSCULO
        begin
          Result:=QryListagem.Fields[i].DisplayLabel;
          break;
        end;
    end;
end;

procedure TfrmTelaHeranca.ExibirLabelIndice(Campo:string; aLabel:TLabel);
begin
     aLabel.Caption := RetornarCampoTraduzido(Campo);
end;

procedure TfrmTelaHeranca.btnAlterarClick(Sender: TObject);
begin
   ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnApagar,pgcPrincipal,false);
   EstadoDoCadastro := ecAlterar;
end;

procedure TfrmTelaHeranca.btnExcluirClick(Sender: TObject);
begin
    try
      if Apagar then
      begin
        ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnApagar,pgcPrincipal,true);
        ControlarIndiceTab(pgcPrincipal,0);
        LimparEditS;
        QryListagem.Refresh;
      end
      else
      begin
        MessageDlg('Erro na Exclusão', mtError,[mbOK],0);
      end;
    finally
        EstadoDoCadastro := ecNenhum;
    end;
end;

procedure TfrmTelaHeranca.btnCancelarClick(Sender: TObject);
begin
   ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnApagar,pgcPrincipal,true);
   ControlarIndiceTab(pgcPrincipal,0);
   LimparEditS;
end;

procedure TfrmTelaHeranca.btnFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmTelaHeranca.btnGravarClick(Sender: TObject);
begin
if ExisteCampoObrigatorio then
  abort;
Try
   if Gravar(EstadoDoCadastro) then begin
     ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnApagar,pgcPrincipal,true);
     ControlarIndiceTab(pgcPrincipal,0);
     EstadoDoCadastro := ecNenhum;
     LimparEditS;
     QryListagem.Refresh;
   end
   else begin
     MessageDlg('Erro na Gravação', mtWarning,[mbOK],0);
   end;
Finally

End;

end;

procedure TfrmTelaHeranca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     QryListagem.Close;
end;

procedure TfrmTelaHeranca.FormCreate(Sender: TObject);
begin
      QryListagem.Connection := dtmPrincipal.ConexaoDB;
      dstListagem.DataSet:=QryListagem;
      grdListagem.DataSource := dstListagem;
end;

procedure TfrmTelaHeranca.FormShow(Sender: TObject);
begin
  if QryListagem.SQL.Text <> '' then
  begin
    QryListagem.IndexFieldNames:= IndiceAtual;
    ExibirLabelIndice(IndiceAtual, lblIndice);
    QryListagem.Open;
  end;
  ControlarIndiceTab(pgcPrincipal,0);
  DesabilitarEditPK;
  ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnApagar,pgcPrincipal,True);
  
end;

function TfrmTelaHeranca.ExisteCampoObrigatorio:Boolean;
var i: Integer;
begin
   Result:= false;
    for i := 0 to ComponentCount-1 do // ele vai ler todos os componentes existentes
    begin
      if (Components[i] is TLabeledEdit) then
      begin
        if (TLabeledEdit(Components[i]).Tag = 2) and
        (TLabeledEdit(Components[i]).text = EmptyStr) then
        begin
          MessageDlg(TLabeledEdit(Components[i]).EditLabel.Caption + ' é um campo obrigatório',mtInformation,[mbOK],0);
          TLabeledEdit(Components[i]).SetFocus;
          Result:=True;
          break;
        end;
      end;
    end;
end;

procedure TfrmTelaHeranca.DesabilitarEditPK;
var i: Integer;
begin
    for i := 0 to ComponentCount-1 do
    begin
      if (Components[i] is TLabeledEdit) then
      begin
        if (TLabeledEdit(Components[i]).Tag = 1) then
        begin
          TLabeledEdit(Components[i]).Enabled := false;
          Break;
        end;
      end;
    end;
end;

procedure TfrmTelaHeranca.LimparEditS;
var i: Integer;
begin
    for i := 0 to ComponentCount-1 do
    begin
      if (Components[i] is TLabeledEdit) then
        begin
          TLabeledEdit(Components[i]).Text:=EmptyStr;
        end
        else if (Components[i] is TEdit) then
        begin
          TEdit(Components[i]).Text:=EmptyStr;
        end
        else if (Components[i] is TMemo) then
        begin
          TMemo(Components[i]).Text:=EmptyStr;
        end
         else if (Components[i] is TDBLookupComboBox) then
        begin
          TDBLookupComboBox(Components[i]).KeyValue:=NULL;
        end
         else if (Components[i] is TCurrencyEdit) then
        begin
          TCurrencyEdit(Components[i]).Value:=0;
        end
        else if (Components[i] is TDateEdit) then
        begin
          TDateEdit(Components[i]).DATE:=0;
        end
         else if (Components[i] is TMaskEdit) then
        begin
          TMaskEdit(Components[i]).Text:=EmptyStr;
        end;

    end;
end;

{$endregion}
{$Region 'METODOS VIRTUAIS'}
procedure TfrmTelaHeranca.BloqueiaCTRL_DEL_DBGrid(var Key: Word; Shift: TShiftState);
begin
   //Bloqueia o CTRL + DEL
   if (Shift = [ssCtrl]) and (Key = 46) then
      Key := 0;
end;
function TfrmTelaHeranca.Apagar: Boolean;
begin
   ShowMessage('DELETADO');
   Result := True;
end;
function TfrmTelaHeranca.Gravar(EstadoDoCadastro: TEstadoDoCadastro):Boolean;
  begin
    if (EstadoDoCadastro = ecInserir) then
        ShowMessage('Inserido')
    else if (EstadoDoCadastro = ecAlterar) then
        ShowMessage('Alterado');
    Result := True;
  end;

{$endregion}
procedure TfrmTelaHeranca.grdListagemDblClick(Sender: TObject);
begin
    btnAlterar.Click;
end;

procedure TfrmTelaHeranca.grdListagemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     BloqueiaCTRL_DEL_DBGrid(Key,Shift);
end;

procedure TfrmTelaHeranca.grdListagemTitleClick(Column: TColumn);
begin
    IndiceAtual :=Column.FieldName;
    QryListagem.IndexFieldNames := IndiceAtual;
    ExibirLabelIndice(IndiceAtual,lblIndice);
end;

procedure TfrmTelaHeranca.mskPesquisarChange(Sender: TObject);
begin
   QryListagem.Locate(IndiceAtual,TMaskEdit(Sender).Text,[loPartialKey]);
end;

procedure TfrmTelaHeranca.btnNovoClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnApagar,pgcPrincipal,false);
  EstadoDoCadastro :=ecInserir;
  LimparEditS;
end;

   procedure TfrmTelaHeranca.btnPesquisarClick(Sender: TObject);
begin

end;

//O PROFESSOR ENSINA A CONECTAR O BANCO DE DADOS NA AULA 36

end.
