object ViewPixCreateRecurrence: TViewPixCreateRecurrence
  Left = 0
  Top = 0
  Caption = 'Modal da Requisi'#231#227'o'
  ClientHeight = 412
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
    Height = 412
    Align = alClient
    Caption = '*Campos Obrigat'#243'rios'
    TabOrder = 0
    object gbDevedor: TGroupBox
      Left = 4
      Top = 17
      Width = 577
      Height = 64
      Caption = 'V'#237'nculo'
      TabOrder = 0
      object Label2: TLabel
        Left = 5
        Top = 17
        Width = 49
        Height = 13
        Caption = '*Contrato'
      end
      object Label3: TLabel
        Left = 9
        Top = 41
        Width = 33
        Height = 13
        Caption = 'Objeto'
      end
      object txtContrato: TEdit
        Left = 60
        Top = 14
        Width = 514
        Height = 21
        TabOrder = 0
      end
      object txtObjeto: TEdit
        Left = 60
        Top = 38
        Width = 514
        Height = 21
        MaxLength = 35
        TabOrder = 1
      end
    end
    object GroupBox1: TGroupBox
      Left = 3
      Top = 156
      Width = 578
      Height = 75
      Caption = 'Calend'#225'rio - "AAAA-MM-DD"'
      TabOrder = 1
      object Label4: TLabel
        Left = 5
        Top = 18
        Width = 59
        Height = 13
        Caption = '*Data Inicial'
      end
      object Label7: TLabel
        Left = 302
        Top = 18
        Width = 48
        Height = 13
        Caption = 'Data Final'
      end
      object Label8: TLabel
        Left = 6
        Top = 49
        Width = 69
        Height = 13
        Caption = '*Peridiocidade'
      end
      object txtDataInicial: TEdit
        Left = 70
        Top = 15
        Width = 220
        Height = 21
        TabOrder = 0
      end
      object txtDataFinal: TEdit
        Left = 355
        Top = 15
        Width = 220
        Height = 21
        TabOrder = 1
      end
      object cmbPeriodicidade: TComboBox
        Left = 81
        Top = 46
        Width = 492
        Height = 21
        TabOrder = 2
      end
    end
    object gbValor: TGroupBox
      Left = 4
      Top = 234
      Width = 577
      Height = 43
      Caption = 'Valor - Ex. 5.00 - Obs.: Preencha um ou o outro!'
      TabOrder = 2
      object Label5: TLabel
        Left = 9
        Top = 18
        Width = 84
        Height = 13
        Caption = 'Valor Recorr'#234'ncia'
      end
      object Label9: TLabel
        Left = 302
        Top = 18
        Width = 59
        Height = 13
        Caption = 'Valor M'#237'nimo'
      end
      object txtValorRec: TEdit
        Left = 103
        Top = 15
        Width = 187
        Height = 21
        TabOrder = 0
      end
      object txtValorMinimo: TEdit
        Left = 367
        Top = 15
        Width = 208
        Height = 21
        TabOrder = 1
      end
    end
    object GroupBox2: TGroupBox
      Left = 3
      Top = 280
      Width = 289
      Height = 43
      Caption = '*Pol'#237'tica de Retentativa'
      TabOrder = 3
      object cmbRetentativa: TComboBox
        Left = 6
        Top = 17
        Width = 280
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBox4: TGroupBox
      Left = 4
      Top = 326
      Width = 577
      Height = 43
      Caption = 'Dados da Jornada'
      TabOrder = 4
      object Label11: TLabel
        Left = 6
        Top = 20
        Width = 23
        Height = 13
        Caption = 'TXID'
      end
      object txtTXID: TEdit
        Left = 35
        Top = 17
        Width = 539
        Height = 21
        TabOrder = 0
      end
    end
    object btnConfirmRequest: TButton
      Left = 289
      Top = 375
      Width = 291
      Height = 32
      Caption = 'Confirmar a Requisi'#231#227'o'
      TabOrder = 5
      OnClick = btnConfirmRequestClick
    end
    object btnCancelRequest: TButton
      Left = 3
      Top = 375
      Width = 280
      Height = 32
      Caption = 'Cancelar a Requisi'#231#227'o'
      TabOrder = 6
      OnClick = btnCancelRequestClick
    end
    object GroupBox5: TGroupBox
      Left = 3
      Top = 84
      Width = 577
      Height = 69
      Caption = '*Devedor'
      TabOrder = 7
      object Label1: TLabel
        Left = 10
        Top = 17
        Width = 27
        Height = 13
        Caption = 'Nome'
      end
      object Label6: TLabel
        Left = 6
        Top = 41
        Width = 48
        Height = 13
        Caption = 'CPF/CNPJ'
      end
      object txtNome: TEdit
        Left = 67
        Top = 14
        Width = 506
        Height = 21
        TabOrder = 0
      end
      object txtDocumento: TEdit
        Left = 67
        Top = 38
        Width = 507
        Height = 21
        TabOrder = 1
      end
    end
    object GroupBox6: TGroupBox
      Left = 298
      Top = 280
      Width = 282
      Height = 43
      Caption = 'Location'
      TabOrder = 8
      object Label10: TLabel
        Left = 7
        Top = 20
        Width = 11
        Height = 13
        Caption = 'ID'
      end
      object txtLoc: TEdit
        Left = 24
        Top = 17
        Width = 255
        Height = 21
        TabOrder = 0
      end
    end
  end
end
