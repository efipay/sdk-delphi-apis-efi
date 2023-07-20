object CreateDueCharge: TCreateDueCharge
  Left = 60
  Top = 10
  Width = 596
  Height = 800
  Margins.Top = 10
  Margins.Bottom = 10
  AutoScroll = True
  Caption = 'Modal da Requisi'#231#227'o'
  Color = 6001140
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Padding.Bottom = 10
  Position = poDesigned
  OnCreate = FormCreate
  TextHeight = 13
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 578
    Height = 880
    Align = alTop
    Caption = 'Body da Requisi'#231#227'o - *Campos Obrigat'#243'rios'
    TabOrder = 0
    ExplicitWidth = 572
    object Label3: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 18
      Width = 156
      Height = 21
      Align = alTop
      Caption = '*Identificador :txid da Cobran'#231'a:'
      Constraints.MaxHeight = 21
      Constraints.MaxWidth = 156
      Constraints.MinHeight = 21
      Constraints.MinWidth = 156
      Layout = tlCenter
      ExplicitLeft = 3
      ExplicitTop = 21
    end
    object Label12: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 52
      Width = 156
      Height = 13
      Margins.Top = 10
      Align = alTop
      Caption = '*Chave Pix - (CPF, e-mail, etc)'
      Constraints.MaxWidth = 156
      Constraints.MinWidth = 156
      Layout = tlCenter
    end
    object Label13: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 86
      Width = 156
      Height = 21
      Margins.Top = 18
      Align = alTop
      Caption = 'N'#250'mero Location - (Tipo COBV)'
      Constraints.MaxHeight = 21
      Constraints.MaxWidth = 156
      Constraints.MinHeight = 21
      Constraints.MinWidth = 156
      Layout = tlCenter
      ExplicitLeft = 3
      ExplicitTop = 85
    end
    object GroupBox2: TGroupBox
      Left = 5
      Top = 467
      Width = 275
      Height = 127
      Margins.Left = 5
      Caption = '*Calend'#225'rio'
      Constraints.MinWidth = 190
      TabOrder = 0
      object Label1: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 18
        Width = 173
        Height = 13
        Align = alTop
        Caption = 'Data de Vencimento (AAAA-MM-DD)'
        Constraints.MaxWidth = 173
        Constraints.MinWidth = 173
      end
      object Label2: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 64
        Width = 173
        Height = 13
        Align = alTop
        Caption = 'Validade ap'#243's o vencimento'
        Constraints.MaxWidth = 173
        Constraints.MinWidth = 173
        ExplicitLeft = 16
        ExplicitTop = 56
      end
      object txtDueDate: TEdit
        AlignWithMargins = True
        Left = 5
        Top = 37
        Width = 265
        Height = 21
        Align = alTop
        Constraints.MinWidth = 173
        TabOrder = 0
      end
      object txtValidade: TEdit
        AlignWithMargins = True
        Left = 5
        Top = 83
        Width = 265
        Height = 21
        Align = alTop
        Constraints.MinWidth = 173
        TabOrder = 1
      end
    end
    object txtTXID: TEdit
      Left = 176
      Top = 21
      Width = 390
      Height = 21
      Align = alCustom
      Constraints.MaxHeight = 21
      Constraints.MaxWidth = 390
      Constraints.MinHeight = 21
      Constraints.MinWidth = 390
      TabOrder = 1
    end
    object GroupBox3: TGroupBox
      AlignWithMargins = True
      Left = 5
      Top = 120
      Width = 568
      Height = 325
      Margins.Top = 10
      Align = alTop
      Caption = '*Configura'#231#245'es da cobran'#231'a'
      TabOrder = 2
      ExplicitWidth = 562
      object GroupBox4: TGroupBox
        Left = 3
        Top = 71
        Width = 275
        Height = 118
        Caption = 'Abatimento'
        TabOrder = 0
        object Label5: TLabel
          AlignWithMargins = True
          Left = 5
          Top = 18
          Width = 60
          Height = 13
          Align = alTop
          Caption = 'Modalidade'
          Constraints.MaxWidth = 60
          ExplicitWidth = 54
        end
        object Label4: TLabel
          AlignWithMargins = True
          Left = 5
          Top = 64
          Width = 265
          Height = 13
          Align = alTop
          Caption = 'Valor Percentual'
          ExplicitWidth = 78
        end
        object txtModAbatimento: TEdit
          AlignWithMargins = True
          Left = 5
          Top = 37
          Width = 265
          Height = 21
          Align = alTop
          TabOrder = 0
        end
        object txtPercentAbatimento: TEdit
          AlignWithMargins = True
          Left = 5
          Top = 83
          Width = 265
          Height = 21
          Align = alTop
          TabOrder = 1
        end
      end
      object GroupBox5: TGroupBox
        Left = 2
        Top = 15
        Width = 564
        Height = 50
        Align = alTop
        Caption = '*Valor (EX: R$1,00 = 1.00)'
        TabOrder = 1
        ExplicitWidth = 558
        object txtValue: TEdit
          AlignWithMargins = True
          Left = 5
          Top = 18
          Width = 554
          Height = 21
          Align = alTop
          TabOrder = 0
          ExplicitWidth = 548
        end
      end
      object GroupBox6: TGroupBox
        Left = 284
        Top = 71
        Width = 275
        Height = 118
        Caption = 'Desconto'
        TabOrder = 2
        object Label6: TLabel
          AlignWithMargins = True
          Left = 5
          Top = 18
          Width = 265
          Height = 13
          Align = alTop
          Caption = 'Modalidade'
          ExplicitWidth = 54
        end
        object Label7: TLabel
          AlignWithMargins = True
          Left = 5
          Top = 64
          Width = 265
          Height = 13
          Align = alTop
          Caption = 'Valor Percentual'
          ExplicitWidth = 78
        end
        object txtModDesconto: TEdit
          AlignWithMargins = True
          Left = 5
          Top = 37
          Width = 265
          Height = 21
          Align = alTop
          TabOrder = 0
        end
        object txtPercentDesconto: TEdit
          AlignWithMargins = True
          Left = 5
          Top = 83
          Width = 265
          Height = 21
          Align = alTop
          TabOrder = 1
        end
      end
      object GroupBox7: TGroupBox
        Left = 3
        Top = 195
        Width = 275
        Height = 118
        Caption = 'Juros'
        TabOrder = 3
        object Label8: TLabel
          AlignWithMargins = True
          Left = 5
          Top = 18
          Width = 265
          Height = 13
          Align = alTop
          Caption = 'Modalidade'
          ExplicitWidth = 54
        end
        object Label9: TLabel
          AlignWithMargins = True
          Left = 5
          Top = 64
          Width = 265
          Height = 13
          Align = alTop
          Caption = 'Valor Percentual'
          ExplicitWidth = 78
        end
        object txtModJuros: TEdit
          AlignWithMargins = True
          Left = 5
          Top = 37
          Width = 265
          Height = 21
          Align = alTop
          TabOrder = 0
        end
        object txtPercentJuros: TEdit
          AlignWithMargins = True
          Left = 5
          Top = 83
          Width = 265
          Height = 21
          Align = alTop
          TabOrder = 1
        end
      end
      object GroupBox8: TGroupBox
        Left = 284
        Top = 195
        Width = 275
        Height = 118
        Caption = 'Multa'
        TabOrder = 4
        object Label10: TLabel
          AlignWithMargins = True
          Left = 5
          Top = 18
          Width = 265
          Height = 13
          Align = alTop
          Caption = 'Modalidade'
          ExplicitWidth = 54
        end
        object Label11: TLabel
          AlignWithMargins = True
          Left = 5
          Top = 64
          Width = 265
          Height = 13
          Align = alTop
          Caption = 'Valor Percentual'
          ExplicitWidth = 78
        end
        object txtModMulta: TEdit
          AlignWithMargins = True
          Left = 5
          Top = 37
          Width = 265
          Height = 21
          Align = alTop
          TabOrder = 0
        end
        object txtPercentMulta: TEdit
          AlignWithMargins = True
          Left = 5
          Top = 83
          Width = 265
          Height = 21
          Align = alTop
          TabOrder = 1
        end
      end
    end
    object txtChave: TEdit
      Left = 176
      Top = 53
      Width = 390
      Height = 21
      Constraints.MaxWidth = 390
      Constraints.MinWidth = 390
      TabOrder = 3
    end
    object txtNumLocation: TEdit
      Left = 176
      Top = 86
      Width = 390
      Height = 21
      Constraints.MaxWidth = 390
      Constraints.MinWidth = 390
      TabOrder = 4
    end
    object GroupBox9: TGroupBox
      Left = 300
      Top = 467
      Width = 275
      Height = 127
      Caption = 'Solicita'#231#227'o do Pagador - Ex. N'#250'mero do pedido'
      TabOrder = 5
      object txtSolicitacaoPagador: TEdit
        AlignWithMargins = True
        Left = 5
        Top = 18
        Width = 265
        Height = 104
        Align = alClient
        TabOrder = 0
        ExplicitHeight = 21
      end
    end
    object GroupBox10: TGroupBox
      Left = 3
      Top = 600
      Width = 572
      Height = 225
      Caption = '*Devedor'
      TabOrder = 6
      object Label14: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 18
        Width = 100
        Height = 13
        Align = alTop
        Caption = '*Nome/Raz'#227'o Social'
        Constraints.MaxWidth = 100
        Constraints.MinWidth = 100
      end
      object Label15: TLabel
        Left = 291
        Top = 18
        Width = 128
        Height = 13
        Caption = '*CPF/CNPJ (Sem m'#225'scara)'
      end
      object Label16: TLabel
        AlignWithMargins = True
        Left = 10
        Top = 64
        Width = 28
        Height = 13
        Caption = 'E-mail'
        Constraints.MaxWidth = 28
      end
      object Label17: TLabel
        Left = 291
        Top = 110
        Width = 55
        Height = 13
        Caption = 'Logradouro'
      end
      object Label18: TLabel
        AlignWithMargins = True
        Left = 10
        Top = 110
        Width = 33
        Height = 13
        Caption = 'Cidade'
      end
      object Label19: TLabel
        Left = 10
        Top = 156
        Width = 96
        Height = 13
        Caption = 'Estado  (Abreviado)'
        Constraints.MaxWidth = 96
        Constraints.MinWidth = 96
      end
      object Label20: TLabel
        Left = 291
        Top = 156
        Width = 93
        Height = 13
        Caption = 'CEP (Sem m'#225'scara)'
      end
      object txtNome: TEdit
        AlignWithMargins = True
        Left = 5
        Top = 37
        Width = 265
        Height = 21
        Constraints.MaxWidth = 265
        Constraints.MinWidth = 265
        TabOrder = 0
      end
      object txtDocumento: TEdit
        Left = 286
        Top = 37
        Width = 265
        Height = 21
        TabOrder = 1
      end
      object txtEmail: TEdit
        AlignWithMargins = True
        Left = 5
        Top = 83
        Width = 546
        Height = 21
        Constraints.MaxWidth = 546
        Constraints.MinWidth = 265
        TabOrder = 2
      end
      object txtRua: TEdit
        Left = 286
        Top = 129
        Width = 265
        Height = 21
        Constraints.MaxWidth = 265
        Constraints.MinWidth = 265
        TabOrder = 3
      end
      object txtCidade: TEdit
        AlignWithMargins = True
        Left = 5
        Top = 129
        Width = 265
        Height = 21
        Constraints.MaxWidth = 265
        Constraints.MinWidth = 265
        TabOrder = 4
      end
      object txtEstado: TEdit
        AlignWithMargins = True
        Left = 5
        Top = 175
        Width = 265
        Height = 21
        Constraints.MaxWidth = 265
        Constraints.MinWidth = 265
        TabOrder = 5
      end
      object txtCep: TEdit
        Left = 286
        Top = 175
        Width = 265
        Height = 21
        Constraints.MaxWidth = 365
        Constraints.MinWidth = 265
        TabOrder = 6
      end
    end
    object btnCancelar: TButton
      Left = 3
      Top = 852
      Width = 265
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 7
      OnClick = btnCancelarClick
    end
    object btnCreate: TButton
      Left = 310
      Top = 852
      Width = 265
      Height = 25
      Caption = 'Criar'
      TabOrder = 8
      OnClick = btnCreateClick
    end
  end
end
