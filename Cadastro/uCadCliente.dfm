inherited frmCadCliente: TfrmCadCliente
  Caption = 'Cadastro de Clientes'
  ClientHeight = 550
  ClientWidth = 760
  ExplicitWidth = 776
  ExplicitHeight = 589
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlRodaPe: TPanel
    Top = 509
    Width = 760
    ExplicitTop = 509
    ExplicitWidth = 760
    inherited btnFechar: TBitBtn
      Left = 681
      ExplicitLeft = 681
    end
  end
  inherited pgcPrincipal: TPageControl
    Width = 760
    Height = 509
    ExplicitWidth = 760
    ExplicitHeight = 509
    inherited TabListagem: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 752
      ExplicitHeight = 481
      inherited pnlListagemTopo: TPanel
        Width = 752
        ExplicitWidth = 752
      end
      inherited grdListagem: TDBGrid
        Width = 752
        Height = 416
        DataSource = dstListagem
        PopupMenu = PopupMenu1
        Columns = <
          item
            Alignment = taLeftJustify
            Expanded = False
            FieldName = 'clienteId'
            Visible = True
          end
          item
            Alignment = taLeftJustify
            Expanded = False
            FieldName = 'nome'
            Width = 255
            Visible = True
          end
          item
            Alignment = taLeftJustify
            Expanded = False
            FieldName = 'telefone'
            Width = 127
            Visible = True
          end
          item
            Alignment = taLeftJustify
            Expanded = False
            FieldName = 'endereco'
            Width = 287
            Visible = True
          end>
      end
    end
    inherited TabManutencao: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 752
      ExplicitHeight = 481
      object GroupBox1: TGroupBox
        Left = -4
        Top = 0
        Width = 757
        Height = 182
        Caption = 'Cliente'
        TabOrder = 0
        object Label2: TLabel
          Left = 138
          Top = 124
          Width = 49
          Height = 13
          Caption = 'Telefone'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 283
          Top = 124
          Width = 113
          Height = 13
          Caption = 'Data de Nascimento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 7
          Top = 124
          Width = 20
          Height = 13
          Caption = 'CPF'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtDataNascimento: TJvDateTimePicker
          Left = 283
          Top = 143
          Width = 134
          Height = 21
          Date = 44792.000000000000000000
          Time = 0.475491400466126000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          DropDownDate = 44792.000000000000000000
        end
        object edtTelefone: TMaskEdit
          Left = 138
          Top = 143
          Width = 127
          Height = 24
          EditMask = '(99) 9 9999-9999;1;_'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Microsoft YaHei'
          Font.Style = [fsBold]
          MaxLength = 16
          ParentFont = False
          TabOrder = 1
          Text = '(  )       -    '
        end
        object edtNome: TLabeledEdit
          Tag = 2
          Left = 7
          Top = 94
          Width = 410
          Height = 24
          EditLabel.Width = 89
          EditLabel.Height = 13
          EditLabel.Caption = 'Nome Completo'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'Tahoma'
          EditLabel.Font.Style = [fsBold]
          EditLabel.ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Microsoft YaHei'
          Font.Style = [fsBold]
          MaxLength = 60
          ParentFont = False
          TabOrder = 2
        end
        object edtCPF: TMaskEdit
          Left = 3
          Top = 143
          Width = 114
          Height = 24
          EditMask = '999.999.999-99;1;_'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Microsoft YaHei'
          Font.Style = [fsBold]
          MaxLength = 14
          ParentFont = False
          TabOrder = 3
          Text = '   .   .   -  '
        end
        object edtClienteId: TLabeledEdit
          Tag = 1
          Left = 5
          Top = 48
          Width = 121
          Height = 21
          EditLabel.Width = 33
          EditLabel.Height = 13
          EditLabel.Caption = 'C'#243'digo'
          Enabled = False
          MaxLength = 10
          NumbersOnly = True
          TabOrder = 4
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 188
        Width = 756
        Height = 287
        Caption = 'Cadastro Endere'#231'o'
        TabOrder = 1
        object Label1: TLabel
          Left = 7
          Top = 35
          Width = 20
          Height = 13
          Caption = 'CEP'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtBairro: TLabeledEdit
          Tag = 2
          Left = 7
          Top = 200
          Width = 283
          Height = 24
          EditLabel.Width = 34
          EditLabel.Height = 13
          EditLabel.Caption = 'Bairro'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'Tahoma'
          EditLabel.Font.Style = [fsBold]
          EditLabel.ParentFont = False
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Microsoft YaHei'
          Font.Style = [fsBold]
          MaxLength = 40
          ParentFont = False
          TabOrder = 0
        end
        object edtCEP: TMaskEdit
          Left = 7
          Top = 54
          Width = 87
          Height = 21
          EditMask = '99999-999;1;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          MaxLength = 9
          ParentFont = False
          TabOrder = 1
          Text = '     -   '
        end
        object edtCidade: TLabeledEdit
          Tag = 2
          Left = 7
          Top = 151
          Width = 283
          Height = 24
          EditLabel.Width = 38
          EditLabel.Height = 13
          EditLabel.Caption = 'Cidade'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'Tahoma'
          EditLabel.Font.Style = [fsBold]
          EditLabel.ParentFont = False
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Microsoft YaHei'
          Font.Style = [fsBold]
          MaxLength = 50
          ParentFont = False
          TabOrder = 2
        end
        object edtEndereco: TLabeledEdit
          Tag = 2
          Left = 3
          Top = 105
          Width = 283
          Height = 24
          EditLabel.Width = 52
          EditLabel.Height = 13
          EditLabel.Caption = 'Endere'#231'o'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'Tahoma'
          EditLabel.Font.Style = [fsBold]
          EditLabel.ParentFont = False
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Microsoft YaHei'
          Font.Style = [fsBold]
          MaxLength = 60
          ParentFont = False
          TabOrder = 3
        end
        object edtEstado: TLabeledEdit
          Tag = 2
          Left = 7
          Top = 245
          Width = 78
          Height = 24
          EditLabel.Width = 38
          EditLabel.Height = 13
          EditLabel.Caption = 'Estado'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'Tahoma'
          EditLabel.Font.Style = [fsBold]
          EditLabel.ParentFont = False
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Microsoft YaHei'
          Font.Style = [fsBold]
          MaxLength = 60
          ParentFont = False
          TabOrder = 4
        end
        object edtNumero: TLabeledEdit
          Tag = 2
          Left = 304
          Top = 105
          Width = 93
          Height = 24
          EditLabel.Width = 44
          EditLabel.Height = 13
          EditLabel.Caption = 'N'#250'mero'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'Tahoma'
          EditLabel.Font.Style = [fsBold]
          EditLabel.ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Microsoft YaHei'
          Font.Style = [fsBold]
          MaxLength = 60
          ParentFont = False
          TabOrder = 5
        end
        object ProcurarCep: TBitBtn
          Left = 100
          Top = 52
          Width = 112
          Height = 25
          Caption = 'Buscar Endere'#231'o'
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFB2B2B2949393FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFBDBEBE9495959B9B9BFF00FFFF00FF
            FF00FFFF00FFFF00FF815148876C5F8A8877948678FF00FFFF00FFFF00FFACAC
            AC999A9A9D9E9EFF00FFFF00FFFF00FFFF00FF662C166A392674493968715869
            8B717D9C8494AD9A9C95899C9999A0A0A09EA0A0FF00FFFF00FFFF00FFFF00FF
            75310B6C26006D270260421C63836D747B757F827F89908A8C908A9FA0A09593
            92FF00FFFF00FFFF00FFFF00FF8B410E8140044D611B50631A7582747B92798C
            B2898FAF8E95AD979A9F99918F90886C67FF00FFFF00FFFF00FFFF00FFA35405
            4B8223238514688C6076906C8DBB808BB57F89AE7F87A88189A98BA0A19D7864
            5FFF00FFFF00FFFF00FFA75A11B96B014699272A9D0D73816C92C57190C0768E
            BA778DB97C89B37F89AE8490A58B8A7B78603229FF00FFFF00FFB46C13CC8A0F
            60B2413BB11E7A8C6F97CE7095CE8093CA808FBE7B86C48A89B07A84A3778D87
            82452A13FF00FFFF00FFBE7E1FDBA62CD7B8486CD1707B8B77A0DD95BED894AF
            D493A9C6868CC1818BAE7387AA8381887B2C461BFF00FFFF00FFC4882EE8BC4F
            F0D075CCE19D87A2919CC68E9CDF999BDFA68FCE9692C2818FBD7894A18A4465
            3F2A3E15FF00FFFF00FFFF00FFEECA6AF7DF9AF4EEBFC8E6C389908B96C9959C
            D4818FD19182C9878BAF8B7E8D7A0E570EFF00FFFF00FFFF00FFFF00FF89B23F
            FAE3A9FEF1CAD9EDCBB5D7B087A2908F9C8895A48B8F9E8E6E936C2A73242460
            23FF00FFFF00FFFF00FFFF00FFFF00FF6EC44DCFE498C1DD89D4E0A148DA8B4B
            CE8558BC7346AE6C308E392C7B3AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF1AAB101DC221A1C759B4C9718DC0655FC47854BA82649670FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF58914748913A5B
            8733588F53FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          TabOrder = 6
          OnClick = ProcurarCepClick
        end
      end
    end
  end
  inherited dstListagem: TDataSource
    Left = 576
    Top = 16
  end
  inherited QryListagem: TZQuery
    SQL.Strings = (
      'SELECT clienteId'
      '      ,nome'
      '      ,endereco'
      '      ,cidade'
      '      ,bairro'
      '      ,estado'
      '      ,cep'
      '      ,telefone'
      '      ,email'
      '      ,dataNascimento'
      '      ,numero'
      '      ,cpf'
      '      '
      ' FROM clientes')
    Left = 504
    Top = 24
    object QryListagemclienteId: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'C'#243'digo'
      FieldName = 'clienteId'
      ReadOnly = True
    end
    object QryListagemnome: TWideStringField
      Alignment = taCenter
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 60
    end
    object QryListagemendereco: TWideStringField
      Alignment = taCenter
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'endereco'
      Size = 60
    end
    object QryListagemcep: TWideStringField
      Alignment = taCenter
      DisplayLabel = 'CEP'
      FieldName = 'cep'
      Size = 10
    end
    object QryListagemtelefone: TWideStringField
      Alignment = taCenter
      DisplayLabel = 'Telefone'
      FieldName = 'telefone'
      Size = 14
    end
    object QryListagemcidade: TWideStringField
      Alignment = taCenter
      DisplayLabel = 'Cidade'
      FieldName = 'cidade'
      Size = 50
    end
    object QryListagembairro: TWideStringField
      Alignment = taCenter
      DisplayLabel = 'Bairro'
      FieldName = 'bairro'
      Size = 40
    end
    object QryListagemestado: TWideStringField
      Alignment = taCenter
      DisplayLabel = 'Estado'
      FieldName = 'estado'
      Size = 2
    end
    object QryListagememail: TWideStringField
      Alignment = taCenter
      DisplayLabel = 'E-mail'
      FieldName = 'email'
      Size = 100
    end
    object QryListagemdataNascimento: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data de Nascimento'
      FieldName = 'dataNascimento'
    end
    object QryListagemnumero: TWideStringField
      FieldName = 'numero'
      Size = 5
    end
    object QryListagemcpf: TWideStringField
      FieldName = 'cpf'
      Size = 15
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 640
    Top = 16
    object CEP1: TMenuItem
      Caption = 'CEP'
    end
    object Cidade1: TMenuItem
      Caption = 'Cidade'
    end
    object Nmero1: TMenuItem
      Caption = 'N'#250'mero'
    end
    object Bairro1: TMenuItem
      Caption = 'Bairro'
    end
    object Estado1: TMenuItem
      Caption = 'Estado'
    end
  end
end
