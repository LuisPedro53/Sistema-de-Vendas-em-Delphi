object dtmVenda: TdtmVenda
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 373
  Width = 540
  object QryCliente: TZQuery
    Connection = dtmPrincipal.ConexaoDB
    SQL.Strings = (
      'SELECT clienteId, nome '
      'from clientes')
    Params = <>
    Left = 112
    Top = 72
    object QryClienteclienteId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'clienteId'
      ReadOnly = True
    end
    object QryClientenome: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 60
    end
  end
  object QryProdutos: TZQuery
    Connection = dtmPrincipal.ConexaoDB
    SQL.Strings = (
      'SELECT produtoId,'
      '             valor,'
      '             nome,'
      '             quantidade'
      'FROM produtos')
    Params = <>
    Left = 248
    Top = 72
    object QryProdutosprodutoId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'produtoId'
      ReadOnly = True
    end
    object QryProdutosnome: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 60
    end
    object QryProdutosquantidade: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'quantidade'
    end
    object QryProdutosvalor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'valor'
    end
  end
  object cdsItensVendas: TClientDataSet
    PersistDataPacket.Data = {
      8F0000009619E0BD0100000018000000050000000000030000008F000970726F
      6475746F496404000100000000000B4E6F6D6550726F6475746F010049000000
      0100055749445448020002003C000A7175616E74696461646508000400000000
      000D76616C6F72556E69746172696F08000400000000001176616C6F72546F74
      616C50726F6475746F08000400000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 208
    Top = 208
    object cdsItensVendasprodutoId: TIntegerField
      FieldName = 'produtoId'
    end
    object cdsItensVendasNomeProduto: TStringField
      FieldName = 'NomeProduto'
      Size = 60
    end
    object cdsItensVendasquantidade: TFloatField
      FieldName = 'quantidade'
    end
    object cdsItensVendasvalorUnitario: TFloatField
      FieldName = 'valorUnitario'
    end
    object cdsItensVendasvalorTotalProduto: TFloatField
      FieldName = 'valorTotalProduto'
    end
    object cdsItensVendasValorTotalVenda: TAggregateField
      FieldName = 'ValorTotalVenda'
      DisplayName = ''
      Expression = 'SUM(ValorTotalProduto)'
    end
  end
  object dtsCliente: TDataSource
    DataSet = QryCliente
    Left = 336
    Top = 152
  end
  object dtsProdutos: TDataSource
    DataSet = QryProdutos
    Left = 280
    Top = 152
  end
  object dtsItensVendas: TDataSource
    DataSet = cdsItensVendas
    Left = 200
    Top = 152
  end
end
