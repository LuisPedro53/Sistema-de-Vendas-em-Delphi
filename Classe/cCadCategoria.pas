unit cCadCategoria;

interface

uses System.Classes,
      Vcl.Controls,
      Vcl.ExtCtrls,
      Vcl.Dialogs,
      ZAbstractConnection,
      ZConnection,
      ZAbstractRODataset,
  ZAbstractDataset, ZDataset
  ,System.SysUtils;
type
  TCategoria = class
  private
      ConexaoDB:TZConnection;
      F_categoriaId:Integer;
      F_descricao : String;
      function getCodigo: Integer;
      function getDescricao : string;
      procedure setCodigo (const Value: Integer);
      procedure setDescricao (const Value:string);
  public
    constructor Create(aConexao:TZConnection);
    destructor Destroy; override;
    function Inserir:Boolean;
    function Atualizar : Boolean;
    function Apagar: Boolean;
    function Selecionar (id:Integer):Boolean;


    published
      property codigo:Integer read getCodigo write setCodigo;
      property descricao:string read getDescricao write setDescricao;
end;

implementation

{ TCategoria }

function TCategoria.Apagar: Boolean;
var Qry:TZQuery;
begin
  if MessageDlg('Deseja Apagar o Registro? '+#13+#13+
                'C�digo: '+IntToStr(F_categoriaId)+#13+
                'Descri��o: '+F_descricao,mtConfirmation,[mbYes, mbNo],0)=mrNo then begin
     Result:=false;
     abort;
  end;

  try
    Result:=true;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('DELETE FROM categorias '+
                ' WHERE categoriaId=:categoriaId ');
    Qry.ParamByName('categoriaId').AsInteger :=F_categoriaId;
    Try
      ConexaoDB.StartTransaction;
      Qry.ExecSQL;
      ConexaoDB.Commit;
    Except
      ConexaoDB.Rollback;
      Result:=false;
    End;

  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;

function TCategoria.Atualizar: Boolean;
var Qry:TZQuery;
begin
  try
    Result:=true;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE categorias '+
                '   SET descricao=:descricao '+
                ' WHERE categoriaId=:categoriaId ');
    Qry.ParamByName('categoriaId').AsInteger :=Self.F_categoriaId;
    Qry.ParamByName('descricao').AsString    :=Self.F_descricao;

    Try
      ConexaoDB.StartTransaction;
      Qry.ExecSQL;
      ConexaoDB.Commit;
    Except
      ConexaoDB.Rollback;
      Result:=false;
    End;

  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;

function TCategoria.Inserir: Boolean;
var QRY : TZQuery;
begin
  try
    Result :=true;
    QRY :=TZQuery.Create(nil);
    QRY .Connection := ConexaoDB;
    QRY .SQL.Clear;
    QRY .SQL.Add('INSERT INTO categorias(descricao) values(:descricao)');
    QRY .ParamByName('descricao').AsString:=self.F_descricao;
    try
      QRY .ExecSQL;
    Except
      Result:=false;
    end;
  finally
    if Assigned(QRY ) then
      FreeAndNil(QRY );
  end;
end;

function TCategoria.Selecionar(id: Integer): Boolean;
var Qry:TZQuery;
begin
  try
    Result:=true;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT categoriaId, '+
                '       descricao '+
                '  FROM categorias '+
                ' WHERE categoriaId=:categoriaId');
    Qry.ParamByName('categoriaId').AsInteger:=id;
    Try
      Qry.Open;

      Self.F_categoriaId := Qry.FieldByName('categoriaId').AsInteger;
      Self.F_descricao   := Qry.FieldByName('descricao').AsString;
    Except
      Result:=false;
    End;

  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;

constructor TCategoria.Create(aConexao:TZConnection);
begin
   ConexaoDB:=aConexao;
end;

destructor TCategoria.Destroy;
begin

  inherited;
end;

function TCategoria.getCodigo: Integer;
begin
    Result := Self.F_categoriaId;
end;

function TCategoria.getDescricao: string;
begin
    Result := Self.F_descricao;
end;



procedure TCategoria.setCodigo(const Value: Integer);
begin
   Self.F_categoriaId :=  Value;
end;

procedure TCategoria.setDescricao(const Value: string);
begin
     Self.F_descricao:=  Value;
end;

end.
