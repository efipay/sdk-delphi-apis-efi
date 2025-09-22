object ViewPixCreateAutomaticChargeTxid: TViewPixCreateAutomaticChargeTxid
  Left = 0
  Top = 0
  Caption = 'Modal da Requisi'#231#227'o'
  ClientHeight = 402
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
    Height = 402
    Align = alClient
    Caption = '*Campos Obrigat'#243'rios'
    TabOrder = 0
    object Label2: TLabel
      Left = 3
      Top = 21
      Width = 100
      Height = 13
      Caption = '*Identificador :idRec'
    end
    object Label3: TLabel
      Left = 3
      Top = 47
      Width = 92
      Height = 13
      Caption = '*Identificador :txid'
    end
    object GroupBox1: TGroupBox
      Left = 3
      Top = 226
      Width = 578
      Height = 41
      Caption = '*Calend'#225'rio - "AAAA-MM-DD"'
      TabOrder = 0
      object Label4: TLabel
        Left = 5
        Top = 18
        Width = 81
        Height = 13
        Caption = 'Data Vencimento'
      end
      object txtDataVencimento: TEdit
        Left = 98
        Top = 15
        Width = 475
        Height = 21
        TabOrder = 0
      end
    end
    object gbValor: TGroupBox
      Left = 3
      Top = 270
      Width = 289
      Height = 43
      Caption = '*Valor - Ex. 5.00'
      TabOrder = 1
      object Label5: TLabel
        Left = 7
        Top = 18
        Width = 63
        Height = 13
        Caption = 'Valor Original'
      end
      object txtValor: TEdit
        Left = 76
        Top = 15
        Width = 210
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBox2: TGroupBox
      Left = 3
      Top = 316
      Width = 578
      Height = 43
      Caption = 'Informa'#231#245'es Adicionais'
      TabOrder = 2
      object txtInfoAdicional: TEdit
        Left = 5
        Top = 16
        Width = 568
        Height = 21
        MaxLength = 140
        TabOrder = 0
      end
    end
    object btnConfirmRequest: TButton
      Left = 289
      Top = 365
      Width = 291
      Height = 32
      Caption = 'Confirmar a Requisi'#231#227'o'
      TabOrder = 3
      OnClick = btnConfirmRequestClick
    end
    object btnCancelRequest: TButton
      Left = 3
      Top = 365
      Width = 280
      Height = 32
      Caption = 'Cancelar a Requisi'#231#227'o'
      TabOrder = 4
      OnClick = btnCancelRequestClick
    end
    object GroupBox5: TGroupBox
      Left = 3
      Top = 64
      Width = 577
      Height = 89
      Caption = 'Devedor'
      TabOrder = 5
      object Label1: TLabel
        Left = 7
        Top = 17
        Width = 19
        Height = 13
        Caption = 'CEP'
      end
      object Label6: TLabel
        Left = 264
        Top = 17
        Width = 33
        Height = 13
        Caption = 'Cidade'
      end
      object Label11: TLabel
        Left = 8
        Top = 41
        Width = 24
        Height = 13
        Caption = 'Email'
      end
      object Label12: TLabel
        Left = 7
        Top = 67
        Width = 55
        Height = 13
        Caption = 'Logradouro'
      end
      object Label13: TLabel
        Left = 469
        Top = 41
        Width = 13
        Height = 13
        Caption = 'UF'
      end
      object txtCEP: TEdit
        Left = 38
        Top = 14
        Width = 219
        Height = 21
        MaxLength = 8
        TabOrder = 0
      end
      object txtCidade: TEdit
        Left = 303
        Top = 14
        Width = 271
        Height = 21
        MaxLength = 200
        TabOrder = 1
      end
      object txtEmail: TEdit
        Left = 38
        Top = 39
        Width = 425
        Height = 21
        MaxLength = 200
        TabOrder = 2
      end
      object txtLogradouro: TEdit
        Left = 68
        Top = 64
        Width = 506
        Height = 21
        MaxLength = 200
        TabOrder = 3
      end
      object txtUF: TEdit
        Left = 488
        Top = 38
        Width = 86
        Height = 21
        MaxLength = 2
        TabOrder = 4
      end
    end
    object GroupBox6: TGroupBox
      Left = 299
      Top = 270
      Width = 282
      Height = 43
      Caption = '*Ajuste de Dia '#218'til'
      TabOrder = 6
      object cmbDiaUtil: TComboBox
        Left = 7
        Top = 15
        Width = 270
        Height = 21
        TabOrder = 0
      end
    end
    object txtIdRec: TEdit
      Left = 109
      Top = 18
      Width = 467
      Height = 21
      TabOrder = 7
    end
    object txtTXID: TEdit
      Left = 109
      Top = 44
      Width = 467
      Height = 21
      TabOrder = 8
    end
    object GroupBox7: TGroupBox
      Left = 3
      Top = 156
      Width = 578
      Height = 67
      Caption = '*Recebedor'
      TabOrder = 9
      object Label7: TLabel
        Left = 8
        Top = 18
        Width = 38
        Height = 13
        Caption = 'Ag'#234'ncia'
      end
      object Label8: TLabel
        Left = 256
        Top = 18
        Width = 29
        Height = 13
        Caption = 'Conta'
      end
      object Label9: TLabel
        Left = 8
        Top = 43
        Width = 67
        Height = 13
        Caption = 'Tipo da Conta'
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
        Width = 282
        Height = 21
        MaxLength = 4
        TabOrder = 1
      end
      object cmbTipoConta: TComboBox
        Left = 81
        Top = 42
        Width = 492
        Height = 21
        TabOrder = 2
      end
    end
  end
end
