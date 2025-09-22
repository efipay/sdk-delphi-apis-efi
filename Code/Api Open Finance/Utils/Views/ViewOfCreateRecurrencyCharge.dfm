object ViewOfCreateRecurrencyCharge: TViewOfCreateRecurrencyCharge
  Left = 0
  Top = 0
  Caption = 'Modal da Requisi'#231#227'o'
  ClientHeight = 586
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
    Height = 586
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
      Left = 289
      Top = 549
      Width = 292
      Height = 32
      Caption = 'Confirmar a Requisi'#231#227'o'
      TabOrder = 0
      OnClick = btnConfirmRequestClick
    end
    object btnCancelRequest: TButton
      Left = 3
      Top = 549
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
      Height = 65
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
      object txtIdParticipante: TEdit
        Left = 105
        Top = 14
        Width = 469
        Height = 21
        TabOrder = 0
      end
      object txtCPF: TEdit
        Left = 40
        Top = 38
        Width = 240
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
    end
    object txtIdemKey: TEdit
      Left = 99
      Top = 18
      Width = 478
      Height = 21
      TabOrder = 3
    end
    object GroupBox7: TGroupBox
      Left = 3
      Top = 110
      Width = 578
      Height = 203
      Caption = '*Favorecido - Obs.: Escolher entre conta, chave Pix ou QR Code.'
      TabOrder = 4
      object GroupBox1: TGroupBox
        Left = 3
        Top = 16
        Width = 572
        Height = 91
        Caption = 'Conta Banco'
        TabOrder = 0
        object Label4: TLabel
          Left = 8
          Top = 18
          Width = 38
          Height = 13
          Caption = 'Ag'#234'ncia'
        end
        object Label5: TLabel
          Left = 256
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
          Left = 256
          Top = 43
          Width = 80
          Height = 13
          Caption = 'C'#243'digo do Banco'
        end
        object Label8: TLabel
          Left = 8
          Top = 68
          Width = 127
          Height = 13
          Caption = 'Documento (CPF ou CNPJ)'
        end
        object Label15: TLabel
          Left = 286
          Top = 68
          Width = 27
          Height = 13
          Caption = 'Nome'
        end
        object txtAgencia: TEdit
          Left = 52
          Top = 15
          Width = 191
          Height = 21
          MaxLength = 4
          TabOrder = 0
        end
        object txtConta: TEdit
          Left = 291
          Top = 15
          Width = 278
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
          Left = 342
          Top = 40
          Width = 227
          Height = 21
          MaxLength = 4
          TabOrder = 3
        end
        object txtDocumento: TEdit
          Left = 141
          Top = 65
          Width = 136
          Height = 21
          MaxLength = 4
          TabOrder = 4
        end
        object txtNome: TEdit
          Left = 319
          Top = 65
          Width = 250
          Height = 21
          MaxLength = 4
          TabOrder = 5
        end
      end
      object GroupBox2: TGroupBox
        Left = 3
        Top = 108
        Width = 572
        Height = 43
        Caption = 'Chave Pix'
        TabOrder = 1
        object txtChave: TEdit
          Left = 3
          Top = 19
          Width = 566
          Height = 21
          MaxLength = 4
          TabOrder = 0
        end
      end
      object GroupBox4: TGroupBox
        Left = 3
        Top = 154
        Width = 572
        Height = 43
        Caption = 'QR Code'
        TabOrder = 2
        object txtQRCode: TEdit
          Left = 3
          Top = 18
          Width = 566
          Height = 21
          MaxLength = 4
          TabOrder = 0
        end
      end
    end
    object GroupBox6: TGroupBox
      Left = 3
      Top = 313
      Width = 578
      Height = 232
      Caption = 'Pagamento'
      TabOrder = 5
      object Label9: TLabel
        Left = 8
        Top = 41
        Width = 113
        Height = 13
        Caption = 'Informa'#231#227'o do Pagador'
      end
      object Label10: TLabel
        Left = 7
        Top = 17
        Width = 30
        Height = 13
        Caption = '*Valor'
      end
      object Label12: TLabel
        Left = 160
        Top = 17
        Width = 95
        Height = 13
        Caption = 'C'#243'digo Cidade IBGE'
      end
      object Label13: TLabel
        Left = 8
        Top = 65
        Width = 48
        Height = 13
        Caption = 'ID Pr'#243'prio'
      end
      object Label14: TLabel
        Left = 7
        Top = 89
        Width = 163
        Height = 13
        Caption = 'Identificador da Transa'#231#227'o (TXID)'
      end
      object txtValor: TEdit
        Left = 43
        Top = 14
        Width = 110
        Height = 21
        MaxLength = 8
        TabOrder = 0
      end
      object txtInfoPagador: TEdit
        Left = 127
        Top = 38
        Width = 447
        Height = 21
        MaxLength = 200
        TabOrder = 1
      end
      object txtIBGE: TEdit
        Left = 261
        Top = 14
        Width = 313
        Height = 21
        MaxLength = 8
        TabOrder = 2
      end
      object txtIDProprio: TEdit
        Left = 62
        Top = 62
        Width = 512
        Height = 21
        MaxLength = 200
        TabOrder = 3
      end
      object txtTXID: TEdit
        Left = 176
        Top = 86
        Width = 398
        Height = 21
        MaxLength = 200
        TabOrder = 4
      end
      object GroupBox8: TGroupBox
        Left = 3
        Top = 108
        Width = 572
        Height = 117
        Caption = 'Recorr'#234'ncia'
        TabOrder = 5
        object Label16: TLabel
          Left = 8
          Top = 19
          Width = 26
          Height = 13
          Caption = '*Tipo'
        end
        object Label17: TLabel
          Left = 174
          Top = 19
          Width = 173
          Height = 13
          Caption = 'Dia da Semana - Ex.: TERCA_FEIRA'
        end
        object Label18: TLabel
          Left = 476
          Top = 19
          Width = 52
          Height = 13
          Caption = 'Dia do M'#234's'
        end
        object Label19: TLabel
          Left = 8
          Top = 69
          Width = 140
          Height = 13
          Caption = 'Data In'#237'cio - Ex.: 2025-12-31'
        end
        object Label20: TLabel
          Left = 8
          Top = 44
          Width = 177
          Height = 13
          Caption = 'Datas - Ex.: 2025-12-06,2025-12-07'
        end
        object Label21: TLabel
          Left = 8
          Top = 94
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
        end
        object Label22: TLabel
          Left = 375
          Top = 69
          Width = 56
          Height = 13
          Caption = 'Quantidade'
        end
        object cmbTipo: TComboBox
          Left = 40
          Top = 16
          Width = 127
          Height = 21
          TabOrder = 0
        end
        object txtDiaSemana: TEdit
          Left = 350
          Top = 16
          Width = 119
          Height = 21
          MaxLength = 200
          TabOrder = 1
        end
        object txtDiaMes: TEdit
          Left = 532
          Top = 16
          Width = 37
          Height = 21
          MaxLength = 2
          TabOrder = 2
        end
        object txtDatas: TEdit
          Left = 191
          Top = 41
          Width = 378
          Height = 21
          MaxLength = 200
          TabOrder = 3
        end
        object txtDescricao: TEdit
          Left = 60
          Top = 91
          Width = 509
          Height = 21
          MaxLength = 200
          TabOrder = 4
        end
        object txtQuantidade: TEdit
          Left = 437
          Top = 66
          Width = 132
          Height = 21
          MaxLength = 200
          TabOrder = 5
        end
      end
      object txtDataInicio: TEdit
        Left = 157
        Top = 174
        Width = 215
        Height = 21
        MaxLength = 200
        TabOrder = 6
      end
    end
  end
end
