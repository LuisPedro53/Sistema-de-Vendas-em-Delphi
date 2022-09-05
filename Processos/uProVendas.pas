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
    edtValoUnitario: TCurrencyEdit;
    edtQuantidade: TCurrencyEdit;
    edtTotalProduto: TCurrencyEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
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
  private
    { Private declarations }
    dtmVenda : TdtmVenda;
    oVenda : TVenda;
    function Gravar (EstadoDoCadastro:TEstadoDoCadastro):Boolean; override;
    function Apagar: Boolean; override;

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

{$endregion}




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

procedure TfrmVendas.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtDataVenda.Date := date;
  lkpCliente.SetFocus;
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

end.
