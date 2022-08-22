unit uCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  JvExComCtrls, JvDateTimePicker,cCadCliente, uEnum, RxToolEdit, RxCurrEdit,
  Vcl.Menus;

type
  TfrmCadCliente = class(TfrmTelaHeranca)
    Label1: TLabel;
    edtCEP: TMaskEdit;
    edtEndereco: TLabeledEdit;
    edtBairro: TLabeledEdit;
    edtCidade: TLabeledEdit;
    edtTelefone: TMaskEdit;
    Label2: TLabel;
    edtDataNascimento: TJvDateTimePicker;
    Label3: TLabel;
    QryListagemclienteId: TIntegerField;
    QryListagemnome: TWideStringField;
    QryListagemendereco: TWideStringField;
    QryListagemcep: TWideStringField;
    QryListagemtelefone: TWideStringField;
    ProcurarCep: TBitBtn;
    edtEstado: TLabeledEdit;
    QryListagemcidade: TWideStringField;
    QryListagembairro: TWideStringField;
    QryListagemestado: TWideStringField;
    QryListagememail: TWideStringField;
    QryListagemdataNascimento: TDateTimeField;
    edtNumero: TLabeledEdit;
    PopupMenu1: TPopupMenu;
    CEP1: TMenuItem;
    Cidade1: TMenuItem;
    Nmero1: TMenuItem;
    Bairro1: TMenuItem;
    Estado1: TMenuItem;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    edtNome: TLabeledEdit;
    edtCPF: TMaskEdit;
    Label4: TLabel;
    edtClienteId: TLabeledEdit;
    QryListagemnumero: TWideStringField;
    QryListagemcpf: TWideStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure ProcurarCepClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    oCliente:TCliente;
    function Apagar:Boolean; override;
    function Gravar(EstadoDoCadastro: TEstadoDoCadastro):Boolean;override;
  end;

var
  frmCadCliente: TfrmCadCliente;

implementation

{$R *.dfm}

uses cCadCategoria, Enter, uCadCategorias, uDTMConexao, uPrincipal, dmDados;


{ TfrmCadCliente }

function TfrmCadCliente.Apagar: Boolean;
  begin
  if oCliente.Selecionar(QryListagem.FieldByName('clienteId').AsInteger) then begin
     Result:=oCliente.Apagar;
  end;
end;

procedure TfrmCadCliente.btnAlterarClick(Sender: TObject);
var test1: string;
begin
  //if oCliente.Selecionar(QryListagem.FieldByName('clienteId').AsInteger) then
      if  oCliente.Selecionar(QryListagemclienteId.AsInteger) then
    begin
    ShowMessage('teste');
       edtClienteId.Text:=IntToStr(oCliente.codigo);
       edtNome.Text     :=oCliente.nome;
       edtCEP.Text      :=oCliente.cep;
       edtEndereco.Text :=oCliente.endereco;
       edtBairro.Text   :=oCliente.bairro;
       edtCidade.Text   :=oCliente.cidade;
       edtTelefone.Text :=oCliente.telefone;
       edtDataNascimento.Date:=oCliente.dataNascimento;
       edtNumero.Text  :=oCliente.numero;
    //   edtCPF.text  :=oCliente.cpf;
    end
  else begin
    btnCancelar.Click;
    Abort;
  end;

  inherited;

end;

procedure TfrmCadCliente.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtDataNascimento.Date := Date;
  edtNome.SetFocus;

end;

procedure TfrmCadCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(oCliente) then
    FreeAndNil(oCliente);
  inherited;

end;

procedure TfrmCadCliente.FormCreate(Sender: TObject);
begin
  inherited;
  oCliente:=TCliente.Create(dtmPrincipal.ConexaoDB);
  IndiceAtual:='nome';
end;

function TfrmCadCliente.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
  if edtClienteId.Text<>EmptyStr then
     oCliente.codigo:=StrToInt(edtClienteId.Text)
  else
     oCliente.codigo:=0;

  oCliente.nome           :=edtNome.Text;
  oCliente.cep            :=edtCEP.Text;
  oCliente.endereco       :=edtEndereco.Text;
  oCliente.bairro         :=edtBairro.Text;
  oCliente.cidade         :=edtCidade.Text;
  oCliente.telefone       :=edtTelefone.Text;
  oCliente.dataNascimento :=edtDataNascimento.Date;
  oCliente.numero         :=edtNumero.Text;
  oCliente.estado         :=edtEstado.Text;
 // oCliente.cpf            :=edtCPF.Text;

  if (EstadoDoCadastro=ecInserir) then
     Result:=oCliente.Inserir
  else if (EstadoDoCadastro=ecAlterar) then
     Result:=oCliente.Atualizar;
end;

procedure TfrmCadCliente.PopupMenu1Popup(Sender: TObject);
begin
  inherited;
  PopupMenu1.Items[0].Caption := PopupMenu1.Items[0].Caption + ' : ' + QryListagemcep.AsString;
  while QryListagemcep = QryListagemcep do
    begin
      PopupMenu1.Items[0].Caption := 'CEP : ' + QryListagemcep.AsString;
      break;
    end;

  PopupMenu1.Items[1].Caption := PopupMenu1.Items[1].Caption + ' : ' + QryListagemcidade.AsString;
  while QryListagemcidade = QryListagemcidade do
    begin
      PopupMenu1.Items[1].Caption := 'Cidade : ' + QryListagemcidade.AsString;
      break;
    end;
    PopupMenu1.Items[2].Caption := PopupMenu1.Items[2].Caption + ' : ' + QryListagemnumero.AsString;
  while QryListagemnumero.AsString = QryListagemnumero.AsString do
    begin
      PopupMenu1.Items[2].Caption := 'Número : ' + QryListagemnumero.AsString;
      break;
    end;
    PopupMenu1.Items[3].Caption := PopupMenu1.Items[3].Caption + ' : ' + QryListagembairro.AsString;
  while QryListagembairro = QryListagembairro do
    begin
      PopupMenu1.Items[3].Caption := 'Bairro : ' + QryListagembairro.AsString;
      break;
    end;
    PopupMenu1.Items[4].Caption := PopupMenu1.Items[4].Caption + ' : ' + QryListagemestado.AsString;
  while QryListagemestado = QryListagemestado do
    begin
      PopupMenu1.Items[4].Caption := 'Estado : ' + QryListagemestado.AsString;
      break;
    end;
end;

procedure TfrmCadCliente.ProcurarCepClick(Sender: TObject);
begin
  inherited;
  begin
DataModule1.RESTClient1.BaseURL:= 'https://viacep.com.br/ws/'+edtCep.text+'/json/';
DataModule1.RESTRequest1.Execute;
edtEndereco.Text := DataModule1.FDMemTable1.FieldByName('logradouro').AsString;
edtEstado.Text := DataModule1.FDMemTable1.FieldByName('uf').AsString;
edtCidade.Text := DataModule1.FDMemTable1.FieldByName('localidade').AsString;
edtBairro.Text := DataModule1.FDMemTable1.FieldByName('bairro').AsString;
end;
end;

end.
