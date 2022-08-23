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
    Left = 176
    Top = 144
  end
  object cdsItensVendas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 80
    Top = 184
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
    object cdsItensVendasvalorTotalVenda: TAggregateField
      FieldName = 'valorTotalVenda'
      DisplayName = ''
      Expression = 'SUM(ValorTotalProduto)'
    end
  end
end
