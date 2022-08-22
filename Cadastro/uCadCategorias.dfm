inherited frmCadCategoria: TfrmCadCategoria
  Caption = 'Cadastro de Categoria '
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlRodaPe: TPanel
    TabOrder = 1
  end
  inherited pgcPrincipal: TPageControl
    ActivePage = TabManutencao
    TabOrder = 0
    inherited TabListagem: TTabSheet
      inherited pnlListagemTopo: TPanel
        inherited btnPesquisar: TBitBtn
          Top = 24
          ExplicitTop = 24
        end
        inherited mskPesquisar: TMaskEdit
          Top = 23
          ExplicitTop = 23
        end
      end
      inherited grdListagem: TDBGrid
        PopupMenu = PopupMenu1
      end
    end
    inherited TabManutencao: TTabSheet
      object edtCategoriaId: TLabeledEdit
        Tag = 1
        Left = 35
        Top = 64
        Width = 121
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'C'#243'digo'
        MaxLength = 10
        NumbersOnly = True
        TabOrder = 0
      end
      object edtDescricao: TLabeledEdit
        Tag = 2
        Left = 35
        Top = 120
        Width = 466
        Height = 21
        EditLabel.Width = 46
        EditLabel.Height = 13
        EditLabel.Caption = 'Descri'#231#227'o'
        MaxLength = 30
        TabOrder = 1
      end
    end
  end
  inherited QryListagem: TZQuery
    SQL.Strings = (
      'SELECT categoriaID, descricao FROM categorias')
    object QryListagemcategoriaID: TIntegerField
      FieldName = 'categoriaID'
      ReadOnly = True
    end
    object QryListagemdescricao: TWideStringField
      FieldName = 'descricao'
      Size = 30
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 560
    Top = 120
    object este1: TMenuItem
      Caption = 'C'#243'digo'
    end
    object ESTE21: TMenuItem
      Caption = 'Descri'#231#227'o'
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Limpar1: TMenuItem
      Caption = 'Limpar'
      OnClick = Limpar1Click
    end
  end
end
