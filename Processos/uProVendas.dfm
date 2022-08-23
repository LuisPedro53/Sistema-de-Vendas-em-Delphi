inherited frmVendas: TfrmVendas
  Caption = 'Vendas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlRodaPe: TPanel
    ExplicitWidth = 578
  end
  inherited pgcPrincipal: TPageControl
    ActivePage = TabManutencao
    ExplicitWidth = 578
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
            FieldName = 'vendasId'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'clienteId'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dataVenda'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'totalVenda'
            Visible = True
          end>
      end
    end
    inherited TabManutencao: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 570
      ExplicitHeight = 382
      object Label4: TLabel
        Left = 3
        Top = 87
        Width = 33
        Height = 13
        Caption = 'Cliente'
      end
      object edtVendaId: TLabeledEdit
        Tag = 1
        Left = 5
        Top = 48
        Width = 121
        Height = 21
        EditLabel.Width = 85
        EditLabel.Height = 13
        EditLabel.Caption = 'N'#250'mero da Venda'
        Enabled = False
        MaxLength = 10
        NumbersOnly = True
        TabOrder = 0
      end
      object lkpCliente: TDBLookupComboBox
        Left = 3
        Top = 106
        Width = 294
        Height = 21
        DataField = 'nome'
        DataSource = dtmVenda.dtsCliente
        KeyField = 'categoriaId'
        ListField = 'nome'
        ListSource = dtmVenda.dtsCliente
        TabOrder = 1
      end
    end
  end
  inherited QryListagem: TZQuery
    SQL.Strings = (
      'SELECT vendas.vendasId'
      '        , vendas.clienteId'
      '        ,clientes.nome'
      '        ,vendas.dataVenda'
      '        ,vendas.totalVenda'
      'FROM vendas'
      'INNER JOIN clientes ON clientes.clienteId = vendas.clienteId')
    DataSource = dtmVenda.dtsCliente
    object QryListagemvendasId: TIntegerField
      DisplayLabel = 'Numero Venda'
      FieldName = 'vendasId'
      ReadOnly = True
    end
    object QryListagemclienteId: TIntegerField
      DisplayLabel = 'C'#243'digo Cliente'
      FieldName = 'clienteId'
      Required = True
    end
    object QryListagemnome: TWideStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'nome'
      Size = 60
    end
    object QryListagemdataVenda: TDateTimeField
      DisplayLabel = 'Data da Venda'
      FieldName = 'dataVenda'
    end
    object QryListagemtotalVenda: TFloatField
      DisplayLabel = 'Total da Venda'
      FieldName = 'totalVenda'
    end
  end
end
