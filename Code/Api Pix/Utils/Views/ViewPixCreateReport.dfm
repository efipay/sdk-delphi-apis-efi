object PixCreateReport: TPixCreateReport
  Left = 0
  Top = 0
  Caption = 'Modal da Requisi'#231#227'o'
  ClientHeight = 339
  ClientWidth = 635
  Color = 6001140
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 629
    Height = 328
    Align = alTop
    Caption = 'Body da Requisi'#231#227'o - *Campos Obrigat'#243'rios'
    TabOrder = 0
    object Label1: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 18
      Width = 619
      Height = 13
      Align = alTop
      Caption = 'Data do extrato desejado (AAAA-MM-DD)'
      ExplicitWidth = 201
    end
    object Label2: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 64
      Width = 619
      Height = 13
      Align = alTop
      Caption = 'Selecione os Filtros desejados:'
      ExplicitWidth = 147
    end
    object txtData: TEdit
      AlignWithMargins = True
      Left = 5
      Top = 37
      Width = 619
      Height = 21
      Align = alTop
      TabOrder = 0
    end
    object pixRecebidos: TCheckBox
      AlignWithMargins = True
      Left = 5
      Top = 83
      Width = 619
      Height = 17
      Align = alTop
      Caption = 'Pix Recebidos'
      Constraints.MaxWidth = 619
      TabOrder = 1
    end
    object pixEnviadoChave: TCheckBox
      Left = 151
      Top = 83
      Width = 133
      Height = 17
      Caption = 'Pix Enviado Via Chave'
      TabOrder = 2
    end
    object pixEnviadoDados: TCheckBox
      Left = 310
      Top = 83
      Width = 177
      Height = 17
      Caption = 'Pix Enviado Via Dados Banc'#225'rios'
      TabOrder = 3
    end
    object estornoPixEnviado: TCheckBox
      Left = 493
      Top = 83
      Width = 131
      Height = 17
      Caption = 'Estorno de Pix Enviado'
      TabOrder = 4
    end
    object pixDevolucaoEnviada: TCheckBox
      Left = 5
      Top = 120
      Width = 132
      Height = 17
      Caption = 'Pix Devolu'#231#227'o Enviada'
      TabOrder = 5
    end
    object pixDevolucaoRecebida: TCheckBox
      Left = 151
      Top = 120
      Width = 129
      Height = 17
      Caption = 'Pix Devolu'#231#227'o Recebida'
      TabOrder = 6
    end
    object tarifaPixEnviado: TCheckBox
      Left = 310
      Top = 120
      Width = 105
      Height = 17
      Caption = 'Tarifa Pix Enviado'
      TabOrder = 7
    end
    object tarifaPixRecebido: TCheckBox
      Left = 493
      Top = 120
      Width = 113
      Height = 17
      Caption = 'Tarifa Pix Recebido'
      TabOrder = 8
    end
    object estornoTarifaPixEnviado: TCheckBox
      Left = 3
      Top = 160
      Width = 145
      Height = 17
      Caption = 'Estorno Tarifa Pix Enviado'
      TabOrder = 9
    end
    object saldoDiaAnterior: TCheckBox
      Left = 151
      Top = 160
      Width = 122
      Height = 17
      Caption = 'Saldo do Dia Anterior'
      TabOrder = 10
    end
    object saldoDia: TCheckBox
      Left = 493
      Top = 160
      Width = 97
      Height = 17
      Caption = 'Saldo do Dia'
      TabOrder = 11
    end
    object transferenciaEnviada: TCheckBox
      Left = 493
      Top = 200
      Width = 123
      Height = 17
      Caption = 'Transfer'#234'ncia Enviada'
      TabOrder = 12
    end
    object transferenciaRecebida: TCheckBox
      Left = 3
      Top = 200
      Width = 134
      Height = 17
      Caption = 'Transfer'#234'ncia Recebida'
      TabOrder = 13
    end
    object estornoTransferenciaEnviada: TCheckBox
      Left = 310
      Top = 200
      Width = 162
      Height = 17
      Caption = 'Estorno Transfer'#234'ncia Enviada'
      TabOrder = 14
    end
    object tarifaTransferenciaEnviada: TCheckBox
      Left = 151
      Top = 200
      Width = 153
      Height = 17
      Caption = 'Tarifa Transfer'#234'ncia Enviada'
      TabOrder = 15
    end
    object estornoTarifaPixaRecebido: TCheckBox
      Left = 310
      Top = 160
      Width = 154
      Height = 17
      Caption = 'Estorno Tarifa Pix Recebido'
      TabOrder = 16
    end
    object estornoTarifaTransferenciaEnviada: TCheckBox
      Left = 3
      Top = 223
      Width = 222
      Height = 52
      Caption = 'Estorno da Tarifa de Transfer'#234'ncia Enviada'
      TabOrder = 17
      WordWrap = True
    end
    object btnCancelar: TButton
      Left = 3
      Top = 298
      Width = 265
      Height = 25
      Caption = 'Cancelar'
      Constraints.MaxWidth = 265
      TabOrder = 18
    end
    object btnRequest: TButton
      Left = 361
      Top = 298
      Width = 265
      Height = 25
      Caption = 'Requisitar'
      TabOrder = 19
      OnClick = btnRequestClick
    end
  end
end
