object ViewPixCreateRecurringCharge: TViewPixCreateRecurringCharge
  Left = 0
  Top = 0
  Caption = 'Criar Cobran'#195#167'a Recorrente PIX'
  ClientHeight = 501
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 13
  object gbVinculo: TGroupBox
    Left = 8
    Top = 8
    Width = 584
    Height = 100
    Caption = 'V'#195#173'nculo'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 20
      Width = 43
      Height = 13
      Caption = 'Contrato'
    end
    object Label2: TLabel
      Left = 8
      Top = 50
      Width = 33
      Height = 13
      Caption = 'Objeto'
    end
    object txtContrato: TEdit
      Left = 80
      Top = 16
      Width = 480
      Height = 21
      TabOrder = 0
    end
    object txtObjeto: TEdit
      Left = 80
      Top = 46
      Width = 480
      Height = 21
      TabOrder = 1
    end
  end
  object gbDevedor: TGroupBox
    Left = 8
    Top = 116
    Width = 584
    Height = 100
    Caption = 'Devedor'
    TabOrder = 1
    object Label3: TLabel
      Left = 8
      Top = 20
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label4: TLabel
      Left = 8
      Top = 50
      Width = 19
      Height = 13
      Caption = 'CPF'
    end
    object Label5: TLabel
      Left = 310
      Top = 50
      Width = 25
      Height = 13
      Caption = 'CNPJ'
    end
    object txtNome: TEdit
      Left = 60
      Top = 16
      Width = 500
      Height = 21
      TabOrder = 0
    end
    object txtCpf: TEdit
      Left = 60
      Top = 46
      Width = 240
      Height = 21
      TabOrder = 1
    end
    object txtCnpj: TEdit
      Left = 350
      Top = 46
      Width = 210
      Height = 21
      TabOrder = 2
    end
  end
  object gbCalendario: TGroupBox
    Left = 8
    Top = 224
    Width = 584
    Height = 80
    Caption = 'Calend'#195#161'rio'
    TabOrder = 2
    object Label6: TLabel
      Left = 8
      Top = 20
      Width = 53
      Height = 13
      Caption = 'Data Inicial'
    end
    object Label7: TLabel
      Left = 250
      Top = 20
      Width = 48
      Height = 13
      Caption = 'Data Final'
    end
    object Label8: TLabel
      Left = 8
      Top = 50
      Width = 63
      Height = 13
      Caption = 'Periodicidade'
    end
    object txtDataInicial: TEdit
      Left = 80
      Top = 16
      Width = 150
      Height = 21
      TabOrder = 0
    end
    object txtDataFinal: TEdit
      Left = 320
      Top = 16
      Width = 150
      Height = 21
      TabOrder = 1
    end
    object cbPeriodicidade: TComboBox
      Left = 100
      Top = 46
      Width = 150
      Height = 21
      Style = csDropDownList
      TabOrder = 2
    end
  end
  object gbValor: TGroupBox
    Left = 8
    Top = 312
    Width = 200
    Height = 60
    Caption = 'Valor'
    TabOrder = 3
    object Label9: TLabel
      Left = 8
      Top = 20
      Width = 49
      Height = 13
      Caption = 'Valor Rec.'
    end
    object txtValor: TEdit
      Left = 60
      Top = 16
      Width = 120
      Height = 21
      TabOrder = 0
    end
  end
  object gbPolitica: TGroupBox
    Left = 220
    Top = 312
    Width = 180
    Height = 60
    Caption = 'Pol'#195#173'tica Retentativa'
    TabOrder = 4
    object Label10: TLabel
      Left = 8
      Top = 20
      Width = 42
      Height = 13
      Caption = 'Pol'#195#173'tica'
    end
    object cbPoliticaRetentativa: TComboBox
      Left = 70
      Top = 16
      Width = 100
      Height = 21
      Style = csDropDownList
      TabOrder = 0
    end
  end
  object gbLoc: TGroupBox
    Left = 408
    Top = 312
    Width = 184
    Height = 60
    Caption = 'Loc'
    TabOrder = 5
    object Label11: TLabel
      Left = 8
      Top = 20
      Width = 20
      Height = 13
      Caption = 'LOC'
    end
    object txtLoc: TEdit
      Left = 50
      Top = 16
      Width = 120
      Height = 21
      TabOrder = 0
    end
  end
  object gbAtivacao: TGroupBox
    Left = 8
    Top = 380
    Width = 584
    Height = 60
    Caption = 'Ativa'#195#167#195#163'o'
    TabOrder = 6
    object Label12: TLabel
      Left = 8
      Top = 20
      Width = 23
      Height = 13
      Caption = 'TxID'
    end
    object txtTxId: TEdit
      Left = 50
      Top = 16
      Width = 520
      Height = 21
      TabOrder = 0
    end
  end
  object btnConfirm: TButton
    Left = 292
    Top = 452
    Width = 300
    Height = 32
    Caption = 'Confirmar Cobran'#195#167'a Recorrente'
    TabOrder = 7
    OnClick = btnConfirmClick
  end
  object btnCancel: TButton
    Left = 8
    Top = 452
    Width = 280
    Height = 32
    Caption = 'Cancelar'
    TabOrder = 8
    OnClick = btnCancelClick
  end
end
