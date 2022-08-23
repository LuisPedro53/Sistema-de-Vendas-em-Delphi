object dtmPrincipal: TdtmPrincipal
  OldCreateOrder = False
  Height = 288
  Width = 550
  object ConexaoDB: TZConnection
    ControlsCodePage = cCP_UTF16
    AutoEncodeStrings = True
    Catalog = ''
    Properties.Strings = (
      'controls_cp=CP_UTF16'
      'AutoEncodeStrings=True')
    Connected = True
    SQLHourGlass = True
    HostName = 'LUIZ'
    Port = 0
    Database = 'vendas'
    User = 'sa'
    Password = 'serv'
    Protocol = 'mssql'
    LibraryLocation = 
      'C:\Users\luisp\OneDrive\'#193'rea de Trabalho\DELPHI 2\SISTEMA2 - VEN' +
      'DAS\Sistema-de-Vendas-em-Delphi\ntwdblib.dll'
    Left = 104
    Top = 32
  end
  object QryScripItensVendas: TZQuery
    Connection = ConexaoDB
    SQL.Strings = (
      'if OBJECT_ID ('#39'vendasItens'#39') is null'
      'begin'
      'create table vendasItens ('
      'vendaId int not null,'
      'produtoId int not null,'
      'valorUnitario decimal (18,5) default 0.00000,'
      'quantidade decimal (18,5) default 0.00000,'
      'totalProduto decimal(18,5) default 0.00000,'
      'PRIMARY KEY (vendaId, produtoId),'
      'constraint FK_VendasItensProdutos foreign key(produtoId)'
      'references produtos(produtoId)'
      ')'
      'end')
    Params = <>
    Left = 368
    Top = 48
  end
  object QryScripVendas: TZQuery
    Connection = ConexaoDB
    SQL.Strings = (
      'if OBJECT_ID ('#39'vendas'#39') is null'
      'begin'
      'CREATE TABLE vendas ('
      'vendaId int identity (1,1) not null,'
      'clienteId int not null,'
      'dataVenda datetime default getdate(),'
      ''
      'primary key (vendaId),'
      'constraint FK_VendasClientes foreign key (clienteId)'
      'references clientes(clienteId)'
      ''
      ')'
      'end')
    Params = <>
    Left = 280
    Top = 200
  end
  object QryScripCategorias: TZQuery
    Connection = ConexaoDB
    SQL.Strings = (
      'IF OBJECT_ID ('#39'categorias'#39') is null'
      'begin'
      'create table categorias('
      'categoriaId int IDENTITY (1,1) NOT NULL,'
      'descricao varchar (30) null,'
      'primary key (categoriaId)'
      ')'
      'end')
    Params = <>
    Left = 280
    Top = 72
  end
  object QryScripProdutos: TZQuery
    Connection = ConexaoDB
    SQL.Strings = (
      'if OBJECT_ID ('#39'produtos'#39') is null'
      'begin'
      'CREATE TABLE produtos('
      #9'produtoId int IDENTITY(1,1) NOT NULL,'
      #9'nome varchar(60) NULL,'
      #9'descricao varchar(255) NULL,'
      #9'valor decimal(18, 5) NULL,'
      #9'quantidade decimal(18, 5) NULL,'
      #9'categoriaId int NULL,'
      'PRIMARY KEY (produtoId),'
      'constraint FK_ProdutosCategorias'
      'FOREIGN KEY (categoriaId) references categorias(categoriaId)'
      ')'
      'end')
    Params = <>
    Left = 192
    Top = 160
  end
  object QryScripClientes: TZQuery
    Connection = ConexaoDB
    SQL.Strings = (
      'IF OBJECT_ID ('#39'clientes'#39') is null'
      'begin'
      'CREATE TABLE clientes('
      #9'clienteId int IDENTITY(1,1) NOT NULL,'
      #9'nome varchar(60) NULL,'
      #9'endereco varchar(60) NULL,'
      #9'cidade varchar(50) NULL,'
      #9'bairro varchar(40) NULL,'
      #9'estado varchar(2) NULL,'
      #9'cep varchar(10) NULL,'
      #9'telefone varchar(14) NULL,'
      #9'email varchar(100) NULL,'
      #9'dataNascimento datetime NULL,'
      #9'numero varchar(5) NULL,'
      #9'cpf varchar(15) NULL,'
      'PRIMARY KEY (clienteId)'
      ')'
      'end')
    Params = <>
    Left = 192
    Top = 80
  end
end
