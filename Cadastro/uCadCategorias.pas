unit uCadCategorias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Menus,uDTMConexao, uEnum, cCadCategoria, RxToolEdit, RxCurrEdit;

type
  TfrmCadCategoria = class(TfrmTelaHeranca)
    PopupMenu1: TPopupMenu;
    este1: TMenuItem;
    ESTE21: TMenuItem;
    N1: TMenuItem;
    Limpar1: TMenuItem;
    edtCategoriaId: TLabeledEdit;
    edtDescricao: TLabeledEdit;
    QryListagemcategoriaID: TIntegerField;
    QryListagemdescricao: TWideStringField;
    procedure PopupMenu1Popup(Sender: TObject);
    procedure Limpar1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }

     oCategoria:TCategoria;
    function Apagar:Boolean; override;
    function Gravar(EstadoDoCadastro: TEstadoDoCadastro):Boolean;override;
  public
    { Public declarations }
  end;

var
  frmCadCategoria: TfrmCadCategoria;

implementation

{$R *.dfm}





function TfrmCadCategoria.Apagar: Boolean;
begin
if oCategoria.Selecionar(QryListagem.FieldByName('categoriaId').AsInteger) then
    begin
      Result:=oCategoria.Apagar;
    end;
end;

function TfrmCadCategoria.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
    if edtCategoriaId.Text <> EmptyStr then
      oCategoria.codigo := StrToInt(edtCategoriaId.Text)
    else
      oCategoria.codigo:=0;
    oCategoria.descricao := edtDescricao.Text;

    if EstadoDoCadastro=ecInserir then
      result := oCategoria.Inserir
    else if EstadoDoCadastro=ecAlterar then
      result := oCategoria.Atualizar;

end;

procedure TfrmCadCategoria.btnAlterarClick(Sender: TObject);
begin
  //if oCategoria.Selecionar(QryListagem.FieldByName('categoriaId').AsInteger) then
    if oCategoria.Selecionar(QryListagemcategoriaID.AsInteger) then

    begin
      edtCategoriaId.Text := IntToStr(oCategoria.codigo);
      edtDescricao.Text := oCategoria.descricao;
    end
    else begin
      btnCancelar.Click;
      abort;
    end;

  inherited;

end;

procedure TfrmCadCategoria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(oCategoria) then
    FreeAndNil(oCategoria);
end;

procedure TfrmCadCategoria.FormCreate(Sender: TObject);
begin
  inherited;
  oCategoria:=TCategoria.Create(dtmPrincipal.ConexaoDB);
  IndiceAtual :='descricao'
end;



procedure TfrmCadCategoria.Limpar1Click(Sender: TObject);
begin
  inherited;
  if QryListagemcategoriaID = QryListagemcategoriaID then
      PopupMenu1.Items[0].Caption := 'Código ';
  if QryListagemdescricao = QryListagemdescricao then
      PopupMenu1.Items[1].Caption := 'Descrição ';
end;

procedure TfrmCadCategoria.PopupMenu1Popup(Sender: TObject);
begin
  inherited;
  PopupMenu1.Items[0].Caption := PopupMenu1.Items[0].Caption + ' = ' + QryListagemcategoriaID.AsString;
  while QryListagemcategoriaID = QryListagemcategoriaID do
    begin
      PopupMenu1.Items[0].Caption := 'Código = ' + QryListagemcategoriaID.AsString;
      break;
    end;

  PopupMenu1.Items[1].Caption := PopupMenu1.Items[1].Caption + ' = ' + QryListagemdescricao.AsString;
  while QryListagemcategoriaID = QryListagemcategoriaID do
    begin
      PopupMenu1.Items[1].Caption := 'Descrição = ' + QryListagemdescricao.AsString;
      break;
    end;

end;

end.
