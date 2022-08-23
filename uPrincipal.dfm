object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Menu Principal'
  ClientHeight = 433
  ClientWidth = 812
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mainPrincipal
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object mainPrincipal: TMainMenu
    Left = 88
    Top = 24
    object Cadastro1: TMenuItem
      Tag = 1
      Caption = 'Cadastro'
      object Cliente1: TMenuItem
        Tag = 1
        Caption = 'Cliente'
        OnClick = Cliente1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Categoria1: TMenuItem
        Tag = 1
        Caption = 'Categoria'
        OnClick = Categoria1Click
      end
      object produto1: TMenuItem
        Tag = 1
        Caption = 'Produto'
        OnClick = produto1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object mnuFechar: TMenuItem
        Tag = 1
        Caption = 'Fechar'
        OnClick = mnuFecharClick
      end
    end
    object Movimentao1: TMenuItem
      Caption = 'Movimenta'#231#227'o'
      object Vendas1: TMenuItem
        Caption = 'Vendas'
        OnClick = Vendas1Click
      end
    end
    object Relatrio1: TMenuItem
      Caption = 'Relat'#243'rio'
      object Clientes1: TMenuItem
        Caption = 'Clientes'
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Produto2: TMenuItem
        Caption = 'Produto'
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object VendasporData1: TMenuItem
        Caption = 'Vendas por Data'
      end
    end
  end
end
