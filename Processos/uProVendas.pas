unit uProVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls,uDTMConexao, uDTMVenda,
  RxToolEdit, RxCurrEdit, JvExComCtrls, JvDateTimePicker, uEnum, cProVendas;

type
  TfrmVendas = class(TfrmTelaHeranca)
    QryListagemvendasId: TIntegerField;
    QryListagemclienteId: TIntegerField;
    QryListagemnome: TWideStringField;
    QryListagemdataVenda: TDateTimeField;
    QryListagemtotalVenda: TFloatField;
    edtVendaId: TLabeledEdit;
    lkpCliente: TDBLookupComboBox;
    Label4: TLabel;
    edtDataVenda: TJvDateTimePicker;
    Label3: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    edtValorTotal: TCurrencyEdit;
    Label1: TLabel;
    lkpProduto: TDBLookupComboBox;
    edtValorUnitario: TCurrencyEdit;
    edtQuantidade: TCurrencyEdit;
    edtTotalProduto: TCurrencyEdit;
    btnAdcionar: TBitBtn;
    btnApagarItem: TBitBtn;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Panel1: TPanel;
    dbGridItenVendas: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAdcionarClick(Sender: TObject);
    procedure lkpProdutoExit(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure edtQuantidadeEnter(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnApagarItemClick(Sender: TObject);
    procedure dbGridItenVendasDblClick(Sender: TObject);
    procedure dbGridItenVendasCellClick(Column: TColumn);
  private
    { Private declarations }
    dtmVenda : TdtmVenda;
    oVenda : TVenda;
    function Gravar (EstadoDoCadastro:TEstadoDoCadastro):Boolean; override;
    function Apagar: Boolean; override;
    function TotalizarProduto(valorUnitario, Quantidade:Double):Double;
    procedure LimparComponenteItem;
    procedure LimparCds;
    procedure CarregarRegistroSelecionado;

  public
    { Public declarations }

  end;

var
  frmVendas: TfrmVendas;

implementation

{$R *.dfm}
 {$region 'Override'}
function TfrmVendas.Apagar:Boolean;
begin
if oVenda.Selecionar(QryListagem.FieldByName('vendasId').AsInteger) then
  Result:=oVenda.Apagar;
end;

function TfrmVendas.Gravar(EstadoDoCadastro: TEstadoDoCadastro):Boolean;
begin
  if edtVendaId.Text <> EmptyStr then
    oVenda.VendaId := StrToInt(edtVendaId.Text)
  else
    oVenda.VendaId := 0;

  oVenda.ClienteId := lkpCliente.KeyValue;
  oVenda.DataVenda :=  edtDataVenda.Date;
  oVenda.TotalVenda := edtValorTotal.Value;

  if (EstadoDoCadastro = ecInserir) then
    Result := oVenda.Inserir
  else if (EstadoDoCadastro = ecAlterar) then
    Result := oVenda.Atualizar;
end;

procedure TfrmVendas.LimparCds;
begin
  dtmVenda.cdsItensVendas.First;
  while not dtmVenda.cdsItensVendas.Eof do
    dtmVenda.cdsItensVendas.Delete;
end;

procedure TfrmVendas.LimparComponenteItem;
begin
  lkpProduto.KeyValue   := null;
  edtQuantidade.Value   := 0;
  edtValorUnitario.Value:= 0;
  edtTotalProduto.Value := 0;
end;

procedure TfrmVendas.lkpProdutoExit(Sender: TObject);
begin
  inherited;
  edtValorUnitario.Value := dtmVenda.QryProdutos.FieldByName('valor').AsFloat;
  edtQuantidade.Value := 1;
  edtTotalProduto.Value:=TotalizarProduto(edtValorUnitario.Value, edtQuantidade.Value);
end;

function TfrmVendas.TotalizarProduto(valorUnitario, Quantidade: Double): Double;
begin
result :=valorUnitario * Quantidade;
end;



{$endregion}




procedure TfrmVendas.btnAdcionarClick(Sender: TObject);
begin
  inherited;
   if lkpProduto.KeyValue=Null then begin
     MessageDlg('Produto é um campo obrigatório' ,mtInformation,[mbOK],0);
     lkpProduto.SetFocus;
     abort;
  end;

  if edtValorUnitario.value<=0 then begin
     MessageDlg('Valor Unitário não pode ser Zero' ,mtInformation,[mbOK],0);
     edtValorUnitario.SetFocus;
     abort;
  end;

  if edtQuantidade.value<=0 then begin
     MessageDlg('Quantidade não pode ser Zero' ,mtInformation,[mbOK],0);
     edtQuantidade.SetFocus;
     abort;
  end;

  if dtmVenda.cdsItensVendas.Locate('produtoId', lkpProduto.KeyValue,[]) then begin
     MessageDlg('Este Produto já foi selecionado' ,mtInformation,[mbOK],0);
     lkpProduto.SetFocus;
     abort;
  end;
  edtTotalProduto.Value:=TotalizarProduto(edtValorUnitario.Value, edtQuantidade.Value);

  dtmVenda.cdsItensVendas.Append;
  dtmVenda.cdsItensVendas.FieldByName('produtoId').AsString:=lkpProduto.KeyValue;
  dtmVenda.cdsItensVendas.FieldByName('nomeProduto').AsString:=dtmVenda.QryProdutos.FieldByName('nome').AsString;
  dtmVenda.cdsItensVendas.FieldByName('quantidade').AsFloat:=edtQuantidade.Value;
  dtmVenda.cdsItensVendas.FieldByName('valorUnitario').AsFloat:=edtValorUnitario.Value;
  dtmVenda.cdsItensVendas.FieldByName('valorTotalProduto').AsFloat:=edtTotalProduto.Value;
  dtmVenda.cdsItensVendas.Post;
  //edtValorTotal.Value:=TotalizarVenda;
  LimparComponenteItem;
  lkpProduto.SetFocus;
end;

procedure TfrmVendas.btnAlterarClick(Sender: TObject);
begin
  if oVenda.Selecionar(QryListagem.FieldByName('vendasId').AsInteger {dtmVendas.cdsItensVenda}) then begin
     edtVendaId.Text     :=IntToStr(oVenda.VendaId);
     lkpCliente.KeyValue :=oVenda.ClienteId;
     edtDataVenda.Date   :=oVenda.DataVenda;
     edtValorTotal.Value :=oVenda.TotalVenda;
  end
  else begin
    btnCancelar.Click;
    Abort;
  end;
  inherited;

end;

procedure TfrmVendas.btnApagarItemClick(Sender: TObject);
begin
  inherited;
  if lkpProduto.KeyValue=Null then
  begin
     MessageDlg('Selecione o Produto a ser excluído' ,mtInformation,[mbOK],0);
     dbGridItenVendas.SetFocus;
     abort;
  end;

  if dtmVenda.cdsItensVendas.Locate('produtoId', lkpProduto.KeyValue, []) then
  begin
     dtmVenda.cdsItensVendas.Delete;
     LimparComponenteItem;
  end;


end;

procedure TfrmVendas.btnCancelarClick(Sender: TObject);
begin
  inherited;
  LimparCds;
end;

procedure TfrmVendas.btnGravarClick(Sender: TObject);
begin
  inherited;
   LimparCds;
end;

procedure TfrmVendas.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtDataVenda.Date := date;
  lkpCliente.SetFocus;
  LimparCds;
end;

procedure TfrmVendas.edtQuantidadeEnter(Sender: TObject);
begin
  inherited;
  edtTotalProduto.Value:=TotalizarProduto(edtValorUnitario.Value, edtQuantidade.Value);
end;

procedure TfrmVendas.edtQuantidadeExit(Sender: TObject);
begin
  inherited;
  edtTotalProduto.Value:=TotalizarProduto(edtValorUnitario.Value, edtQuantidade.Value);
end;

procedure TfrmVendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(dtmVenda) then
    FreeAndNil(dtmVenda);

  if Assigned(oVenda) then
    FreeAndNil(oVenda);
end;

procedure TfrmVendas.FormCreate(Sender: TObject);
begin
  inherited;
  dtmVenda:=TdtmVenda.Create(Self);

  oVenda := TVenda.Create(dtmPrincipal.ConexaoDB);

  IndiceAtual := 'clienteId';
end;

procedure TfrmVendas.CarregarRegistroSelecionado;
begin
  lkpProduto.KeyValue   := dtmVenda.cdsItensVendas.FieldByName('produtoId').AsString;
  edtQuantidade.Value   := dtmVenda.cdsItensVendas.FieldByName('quantidade').AsFloat;
  edtValorUnitario.Value:= dtmVenda.cdsItensVendas.FieldByName('valorUnitario').AsFloat;
  edtTotalProduto.Value := dtmVenda.cdsItensVendas.FieldByName('valorTotalProduto').AsFloat;
end;

procedure TfrmVendas.dbGridItenVendasCellClick(Column: TColumn);
begin
  inherited;
  CarregarRegistroSelecionado;
end;

procedure TfrmVendas.dbGridItenVendasDblClick(Sender: TObject);
begin
  inherited;
  CarregarRegistroSelecionado;
end;

end.
