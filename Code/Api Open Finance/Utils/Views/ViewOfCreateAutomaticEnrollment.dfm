object ViewOfCreateAutomaticEnrollment: TViewOfCreateAutomaticEnrollment
  Left = 0
  Top = 0
  Caption = 'Modal da Requisi'#231#227'o'
  ClientHeight = 499
  ClientWidth = 584
  Color = 6001140
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 13
  object GroupBox3: TGroupBox
    Left = 0
    Top = 0
    Width = 584
    Height = 499
    Align = alClient
    Caption = '*Campos Obrigat'#243'rios'
    TabOrder = 0
    object Label2: TLabel
      Left = 4
      Top = 21
      Width = 90
      Height = 13
      Caption = '*Idempotency Key'
    end
    object btnConfirmRequest: TButton
      Left = 288
      Top = 461
      Width = 292
      Height = 32
      Caption = 'Confirmar a Requisi'#231#227'o'
      TabOrder = 0
      OnClick = btnConfirmRequestClick
    end
    object btnCancelRequest: TButton
      Left = 3
      Top = 462
      Width = 280
      Height = 32
      Caption = 'Cancelar a Requisi'#231#227'o'
      TabOrder = 1
      OnClick = btnCancelRequestClick
    end
    object GroupBox5: TGroupBox
      Left = 3
      Top = 42
      Width = 577
      Height = 87
      Caption = 'Pagador'
      TabOrder = 2
      object Label11: TLabel
        Left = 8
        Top = 41
        Width = 25
        Height = 13
        Caption = '*CPF'
      end
      object Label1: TLabel
        Left = 7
        Top = 17
        Width = 92
        Height = 13
        Caption = '*ID do Participante'
      end
      object Label3: TLabel
        Left = 287
        Top = 41
        Width = 25
        Height = 13
        Caption = 'CNPJ'
      end
      object Label9: TLabel
        Left = 8
        Top = 65
        Width = 33
        Height = 13
        Caption = '*Nome'
      end
      object txtIdParticipante: TEdit
        Left = 105
        Top = 14
        Width = 469
        Height = 21
        TabOrder = 0
      end
      object txtCPF: TEdit
        Left = 39
        Top = 38
        Width = 241
        Height = 21
        MaxLength = 11
        TabOrder = 1
      end
      object txtCNPJ: TEdit
        Left = 318
        Top = 38
        Width = 256
        Height = 21
        MaxLength = 200
        TabOrder = 2
      end
      object txtNomePagador: TEdit
        Left = 47
        Top = 62
        Width = 527
        Height = 21
        MaxLength = 11
        TabOrder = 3
      end
    end
    object txtIdemKey: TEdit
      Left = 99
      Top = 18
      Width = 478
      Height = 21
      TabOrder = 3
    end
    object GroupBox6: TGroupBox
      Left = 3
      Top = 223
      Width = 577
      Height = 235
      Caption = 'Assinatura'
      TabOrder = 4
      object Label10: TLabel
        Left = 8
        Top = 18
        Width = 94
        Height = 13
        Caption = '*Data de Expira'#231#227'o'
      end
      object Label12: TLabel
        Left = 283
        Top = 18
        Width = 48
        Height = 13
        Caption = 'ID Pr'#243'prio'
      end
      object Label13: TLabel
        Left = 8
        Top = 43
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object GroupBox8: TGroupBox
        Left = 3
        Top = 64
        Width = 572
        Height = 167
        Caption = 'Configura'#231#227'o'
        TabOrder = 0
        object Label18: TLabel
          Left = 5
          Top = 67
          Width = 50
          Height = 13
          Caption = '*Intervalo'
        end
        object Label19: TLabel
          Left = 185
          Top = 67
          Width = 57
          Height = 13
          Caption = '*Data In'#237'cio'
        end
        object Label20: TLabel
          Left = 364
          Top = 67
          Width = 102
          Height = 13
          Caption = '*Permite Retentativa'
        end
        object GroupBox2: TGroupBox
          Left = 3
          Top = 17
          Width = 566
          Height = 41
          Caption = '*Valor - Obs.: Escolher apenas um tipo.'
          TabOrder = 0
          object Label14: TLabel
            Left = 7
            Top = 19
            Width = 20
            Height = 13
            Caption = 'Fixo'
          end
          object Label16: TLabel
            Left = 186
            Top = 19
            Width = 32
            Height = 13
            Caption = 'M'#237'nimo'
          end
          object Label17: TLabel
            Left = 377
            Top = 19
            Width = 36
            Height = 13
            Caption = 'M'#225'ximo'
          end
          object txtValorMaximo: TEdit
            Left = 418
            Top = 16
            Width = 145
            Height = 21
            MaxLength = 4
            TabOrder = 0
          end
          object txtValorMinimo: TEdit
            Left = 224
            Top = 16
            Width = 145
            Height = 21
            MaxLength = 4
            TabOrder = 1
          end
          object txtValorFixo: TEdit
            Left = 31
            Top = 16
            Width = 145
            Height = 21
            MaxLength = 4
            TabOrder = 2
          end
        end
        object cmbIntervalo: TComboBox
          Left = 61
          Top = 64
          Width = 118
          Height = 21
          TabOrder = 1
        end
        object txtDataInicio: TEdit
          Left = 248
          Top = 64
          Width = 110
          Height = 21
          MaxLength = 4
          TabOrder = 2
        end
        object boolRetentativa: TComboBox
          Left = 472
          Top = 64
          Width = 97
          Height = 21
          TabOrder = 3
        end
        object GroupBox4: TGroupBox
          Left = 3
          Top = 91
          Width = 566
          Height = 72
          Caption = 'Primeiro Pagamento'
          TabOrder = 4
          object Label21: TLabel
            Left = 7
            Top = 21
            Width = 23
            Height = 13
            Caption = 'Data'
          end
          object Label22: TLabel
            Left = 316
            Top = 21
            Width = 24
            Height = 13
            Caption = 'Valor'
          end
          object Label23: TLabel
            Left = 7
            Top = 46
            Width = 113
            Height = 13
            Caption = 'Informa'#231#227'o do Pagador'
          end
          object txtData: TEdit
            Left = 36
            Top = 18
            Width = 272
            Height = 21
            MaxLength = 4
            TabOrder = 0
          end
          object txtValor: TEdit
            Left = 345
            Top = 18
            Width = 218
            Height = 21
            MaxLength = 4
            TabOrder = 1
          end
          object txtInfoPagador: TEdit
            Left = 126
            Top = 43
            Width = 437
            Height = 21
            MaxLength = 4
            TabOrder = 2
          end
        end
      end
      object txtDataExpiracao: TEdit
        Left = 108
        Top = 15
        Width = 169
        Height = 21
        MaxLength = 4
        TabOrder = 1
      end
      object txtIDProprio: TEdit
        Left = 337
        Top = 15
        Width = 237
        Height = 21
        MaxLength = 4
        TabOrder = 2
      end
      object txtDescricao: TEdit
        Left = 60
        Top = 40
        Width = 514
        Height = 21
        MaxLength = 4
        TabOrder = 3
      end
    end
    object GroupBox1: TGroupBox
      Left = 3
      Top = 131
      Width = 577
      Height = 91
      Caption = '*Favorecido'
      TabOrder = 5
      object Label4: TLabel
        Left = 8
        Top = 18
        Width = 38
        Height = 13
        Caption = 'Ag'#234'ncia'
      end
      object Label5: TLabel
        Left = 142
        Top = 18
        Width = 29
        Height = 13
        Caption = 'Conta'
      end
      object Label6: TLabel
        Left = 8
        Top = 43
        Width = 67
        Height = 13
        Caption = 'Tipo da Conta'
      end
      object Label7: TLabel
        Left = 351
        Top = 18
        Width = 80
        Height = 13
        Caption = 'C'#243'digo do Banco'
      end
      object Label8: TLabel
        Left = 250
        Top = 43
        Width = 127
        Height = 13
        Caption = 'Documento (CPF ou CNPJ)'
      end
      object Label15: TLabel
        Left = 8
        Top = 68
        Width = 27
        Height = 13
        Caption = 'Nome'
      end
      object txtAgencia: TEdit
        Left = 52
        Top = 15
        Width = 83
        Height = 21
        MaxLength = 4
        TabOrder = 0
      end
      object txtConta: TEdit
        Left = 177
        Top = 15
        Width = 168
        Height = 21
        MaxLength = 4
        TabOrder = 1
      end
      object cmbTipoConta: TComboBox
        Left = 81
        Top = 40
        Width = 162
        Height = 21
        TabOrder = 2
      end
      object txtCodigoBanco: TEdit
        Left = 437
        Top = 15
        Width = 137
        Height = 21
        MaxLength = 4
        TabOrder = 3
      end
      object txtDocumento: TEdit
        Left = 382
        Top = 40
        Width = 192
        Height = 21
        MaxLength = 4
        TabOrder = 4
      end
      object txtNome: TEdit
        Left = 41
        Top = 65
        Width = 533
        Height = 21
        MaxLength = 4
        TabOrder = 5
      end
    end
  end
end
