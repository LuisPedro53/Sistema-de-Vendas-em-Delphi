inherited frmCadProdutos: TfrmCadProdutos
  Caption = 'Cadastro de Produtos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    ActivePage = TabManutencao
    inherited TabListagem: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 570
      ExplicitHeight = 382
      inherited pnlListagemTopo: TPanel
        ExplicitWidth = 570
      end
      inherited grdListagem: TDBGrid
        DataSource = dstListagem
        Columns = <
          item
            Expanded = False
            FieldName = 'produtoId'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Width = 276
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor'
            Width = 94
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'quantidade'
            Width = 115
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DescricaoCategoria'
            Width = 178
            Visible = True
          end>
      end
    end
    inherited TabManutencao: TTabSheet
      object Label1: TLabel
        Left = 35
        Top = 117
        Width = 107
        Height = 13
        Caption = 'Descri'#231#227'o do Produtos'
      end
      object Label2: TLabel
        Left = 197
        Top = 277
        Width = 27
        Height = 13
        Caption = 'Valor '
      end
      object Label3: TLabel
        Left = 35
        Top = 277
        Width = 59
        Height = 13
        Caption = 'Quantidade '
      end
      object Label4: TLabel
        Left = 35
        Top = 231
        Width = 47
        Height = 13
        Caption = 'Categoria'
      end
      object edtProdutoId: TLabeledEdit
        Tag = 1
        Left = 35
        Top = 24
        Width = 118
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'C'#243'digo'
        MaxLength = 10
        NumbersOnly = True
        TabOrder = 0
      end
      object edtNome: TLabeledEdit
        Tag = 2
        Left = 35
        Top = 80
        Width = 466
        Height = 21
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome'
        MaxLength = 60
        TabOrder = 1
      end
      object edtDescricao: TMemo
        Left = 35
        Top = 136
        Width = 466
        Height = 89
        Lines.Strings = (
          'edtDescricao')
        TabOrder = 2
      end
      object lkpCategoria: TDBLookupComboBox
        Left = 35
        Top = 250
        Width = 145
        Height = 21
        KeyField = 'categoriaId'
        ListField = 'descricao'
        ListSource = dtsCategoria
        TabOrder = 3
      end
      object edtQuantidade: TCurrencyEdit
        Left = 35
        Top = 296
        Width = 121
        Height = 21
        DisplayFormat = ' ,0.00;- ,0.00'
        TabOrder = 4
      end
      object edtValor: TCurrencyEdit
        Left = 197
        Top = 296
        Width = 121
        Height = 21
        TabOrder = 5
      end
    end
  end
  inherited QryListagem: TZQuery
    Active = True
    SQL.Strings = (
      'SELECT p.produtoId'
      '      ,p.nome'
      '      ,p.descricao'
      '      ,p.valor'
      '      ,p.quantidade'
      '      ,p.categoriaId'
      '      ,c.categoriaId As DescricaoCategoria'
      '  FROM produtos as p'
      '  LEFT JOIN categorias as c on c.categoriaId = p.categoriaId')
    object QryListagemprodutoId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'produtoId'
      ReadOnly = True
    end
    object QryListagemnome: TWideStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 28
      FieldName = 'nome'
      Size = 60
    end
    object QryListagemdescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 29
      FieldName = 'descricao'
      Size = 255
    end
    object QryListagemvalor: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'valor'
    end
    object QryListagemquantidade: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 10
      FieldName = 'quantidade'
    end
    object QryListagemcategoriaId: TIntegerField
      DisplayLabel = 'C'#243'd.Categoria'
      DisplayWidth = 11
      FieldName = 'categoriaId'
    end
    object QryListagemDescricaoCategoria: TIntegerField
      DisplayLabel = 'Descricao da Categoria'
      DisplayWidth = 17
      FieldName = 'DescricaoCategoria'
      ReadOnly = True
    end
  end
  object QryCategoria: TZQuery
    Connection = dtmPrincipal.ConexaoDB
    Active = True
    SQL.Strings = (
      'Select categoriaId, descricao from categorias')
    Params = <>
    Left = 528
    Top = 224
    object QryCategoriacategoriaId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'categoriaId'
      ReadOnly = True
    end
    object QryCategoriadescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 30
    end
  end
  object dtsCategoria: TDataSource
    DataSet = QryCategoria
    Left = 600
    Top = 240
  end
end
