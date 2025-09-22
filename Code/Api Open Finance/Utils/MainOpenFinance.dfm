object frmOpenFinance: TfrmOpenFinance
  Left = 0
  Top = 0
  Caption = 'Ef'#237' API Open Fiinance'
  ClientHeight = 641
  ClientWidth = 1107
  Color = 2191603
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 13
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 1101
    Height = 74
    Align = alTop
    Caption = 'Credentials'
    TabOrder = 0
    object TLabel
      Left = 18
      Top = 20
      Width = 43
      Height = 13
      Caption = 'Client_Id'
    end
    object teste2: TLabel
      Left = 250
      Top = 20
      Width = 64
      Height = 13
      Caption = 'Client_Secret'
    end
    object TLabel
      Left = 482
      Top = 20
      Width = 85
      Height = 13
      Caption = 'Certificado (.P12)'
    end
    object txtClientId: TEdit
      Left = 16
      Top = 35
      Width = 206
      Height = 21
      TabOrder = 0
    end
    object txtClientSecret: TEdit
      Left = 248
      Top = 35
      Width = 206
      Height = 21
      TabOrder = 1
    end
    object txtCertFile: TEdit
      Left = 480
      Top = 35
      Width = 403
      Height = 21
      TabOrder = 2
      Text = 'Clique Aqui - Selecionar Certificado'
      OnClick = txtCertFileClick
    end
    object CheckBoxSandbox: TCheckBox
      Left = 889
      Top = 37
      Width = 70
      Height = 17
      Caption = 'Sandbox'
      TabOrder = 3
    end
    object Panel1: TPanel
      Left = 965
      Top = 18
      Width = 114
      Height = 23
      Caption = 'Autentica'#231#227'o'
      Color = clWhite
      ParentBackground = False
      TabOrder = 4
    end
    object btnAuthentication: TButton
      Left = 965
      Top = 41
      Width = 114
      Height = 23
      Caption = 'POST /oauth/token'
      TabOrder = 5
      OnClick = btnAuthenticationClick
    end
  end
  object memoResponse: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 389
    Width = 1101
    Height = 249
    Align = alBottom
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object MConfigParticipants: TPanel
    Left = 8
    Top = 83
    Width = 145
    Height = 33
    Caption = 'Configura'#231#227'o e Participantes'
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    OnClick = MConfigParticipantsClick
  end
  object MImmediate: TPanel
    Left = 157
    Top = 83
    Width = 309
    Height = 33
    Caption = 'Pagamentos Imediatos'
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
    OnClick = MImmediateClick
  end
  object MSchedule: TPanel
    Left = 470
    Top = 83
    Width = 370
    Height = 33
    Caption = 'Pagamentos Agendados'
    Color = clWhite
    ParentBackground = False
    TabOrder = 4
    OnClick = MScheduleClick
  end
  object SConfigParticipants: TPanel
    Left = 8
    Top = 122
    Width = 145
    Height = 104
    Alignment = taRightJustify
    Color = clWhite
    ParentBackground = False
    TabOrder = 5
    Visible = False
    object ofConfigDetail: TButton
      AlignWithMargins = True
      Left = 4
      Top = 35
      Width = 136
      Height = 33
      Hint = 'Consultar c'#243'digo de barras'
      Caption = 'GET /v1/config'
      ImageAlignment = iaCenter
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = ofConfigDetailClick
    end
    object ofConfigUpdate: TButton
      AlignWithMargins = True
      Left = 4
      Top = 2
      Width = 136
      Height = 33
      Hint = 'Consultar  pagamento solicitado'
      Caption = 'PUT /v1/config'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ofConfigUpdateClick
    end
    object ofListParticipants: TButton
      AlignWithMargins = True
      Left = 4
      Top = 68
      Width = 136
      Height = 33
      Caption = 'GET /v1/participantes'
      TabOrder = 2
      OnClick = ofListParticipantsClick
    end
  end
  object SSchedule: TPanel
    Left = 470
    Top = 122
    Width = 370
    Height = 137
    Color = clWhite
    ParentBackground = False
    TabOrder = 6
    Visible = False
    object ofCancelSchedulePix: TButton
      Left = 4
      Top = 68
      Width = 361
      Height = 33
      Caption = 
        'PATCH /v1/pagamentos-agendados/pix/:identificadorPagamento/cance' +
        'lar'
      TabOrder = 0
      OnClick = ofCancelSchedulePixClick
    end
    object ofListSchedulePixPayment: TButton
      Left = 4
      Top = 35
      Width = 361
      Height = 33
      Caption = 'GET /v1/pagamentos-agendados/pix'
      TabOrder = 1
      OnClick = ofListSchedulePixPaymentClick
    end
    object ofStartSchedulePixPayment: TButton
      Left = 4
      Top = 2
      Width = 361
      Height = 33
      Caption = 'POST /v1/pagamentos-agendados/pix'
      TabOrder = 2
      OnClick = ofStartSchedulePixPaymentClick
    end
    object ofDevolutionSchedulePix: TButton
      Left = 4
      Top = 101
      Width = 361
      Height = 33
      Caption = 
        'POST /v1/pagamentos-agendados/pix/:identificadorPagamento/devolv' +
        'er'
      TabOrder = 3
      OnClick = ofDevolutionSchedulePixClick
    end
  end
  object SImmediate: TPanel
    Left = 157
    Top = 122
    Width = 309
    Height = 104
    Color = clWhite
    ParentBackground = False
    TabOrder = 7
    Visible = False
    object ofStartPixPayment: TButton
      AlignWithMargins = True
      Left = 4
      Top = 2
      Width = 301
      Height = 33
      Caption = 'POST /v1/pagamentos/pix'
      TabOrder = 0
      OnClick = ofStartPixPaymentClick
    end
    object ofListPixPayment: TButton
      AlignWithMargins = True
      Left = 4
      Top = 35
      Width = 301
      Height = 33
      Caption = 'GET /v1/pagamentos/pix'
      TabOrder = 1
      OnClick = ofListPixPaymentClick
    end
    object ofDevolutionPix: TButton
      AlignWithMargins = True
      Left = 4
      Top = 68
      Width = 301
      Height = 33
      Caption = 'POST /v1/pagamentos/pix/:identificadorPagamento/devolver'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = ofDevolutionPixClick
    end
  end
  object MBiometric: TPanel
    Left = 843
    Top = 83
    Width = 256
    Height = 33
    Caption = 'Pagamentos por Biometria'
    Color = clWhite
    ParentBackground = False
    TabOrder = 8
    OnClick = MBiometricClick
  end
  object SBiometric: TPanel
    Left = 843
    Top = 122
    Width = 256
    Height = 170
    Color = clWhite
    ParentBackground = False
    TabOrder = 9
    Visible = False
    object ofCreateBiometricEnrollment: TButton
      Left = 3
      Top = 2
      Width = 249
      Height = 33
      Caption = 'POST /v1/pagamentos-biometria/vinculos'
      TabOrder = 0
      OnClick = ofCreateBiometricEnrollmentClick
    end
    object ofListBiometricEnrollment: TButton
      Left = 3
      Top = 35
      Width = 249
      Height = 33
      Caption = 'GET /v1/pagamentos-biometria/vinculos'
      TabOrder = 1
      OnClick = ofListBiometricEnrollmentClick
    end
    object ofRevokeBiometricEnrollment: TButton
      Left = 3
      Top = 68
      Width = 249
      Height = 33
      Caption = 'PATCH /v1/pagamentos-biometria/vinculos'
      TabOrder = 2
      OnClick = ofRevokeBiometricEnrollmentClick
    end
    object ofCreateBiometricPixPayment: TButton
      Left = 3
      Top = 101
      Width = 249
      Height = 33
      Caption = 'POST /v1/pagamentos-biometria/pix'
      TabOrder = 3
      OnClick = ofCreateBiometricPixPaymentClick
    end
    object ofListBiometricPixPayment: TButton
      Left = 3
      Top = 134
      Width = 249
      Height = 33
      Caption = 'GET /v1/pagamentos-biometria/pix'
      TabOrder = 4
      OnClick = ofListBiometricPixPaymentClick
    end
  end
  object MRecurrency: TPanel
    Left = 8
    Top = 264
    Width = 458
    Height = 33
    Caption = 'Pagamentos Recorrentes'
    Color = clWhite
    ParentBackground = False
    TabOrder = 10
    OnClick = MRecurrencyClick
  end
  object SRecurrency: TPanel
    Left = 8
    Top = 302
    Width = 458
    Height = 170
    Color = clWhite
    ParentBackground = False
    TabOrder = 11
    Visible = False
    object ofCancelRecurrencyPix: TButton
      Left = 4
      Top = 68
      Width = 450
      Height = 33
      Caption = 
        'PATCH /v1/pagamentos-recorrentes/pix/:identificadorPagamento/can' +
        'celar'
      TabOrder = 0
      OnClick = ofCancelRecurrencyPixClick
    end
    object ofListRecurrencyPixPayment: TButton
      Left = 4
      Top = 35
      Width = 450
      Height = 33
      Caption = 'GET /v1/pagamentos-recorrentes/pix'
      TabOrder = 1
      OnClick = ofListRecurrencyPixPaymentClick
    end
    object ofStartRecurrencyPixPayment: TButton
      Left = 4
      Top = 2
      Width = 450
      Height = 33
      Caption = 'POST /v1/pagamentos-recorrentes/pix'
      TabOrder = 2
      OnClick = ofStartRecurrencyPixPaymentClick
    end
    object ofDevolutionRecurrencyPix: TButton
      Left = 4
      Top = 101
      Width = 450
      Height = 33
      Caption = 
        'POST /v1/pagamentos-recorrentes/pix/:identificadorPagamento/devo' +
        'lver'
      TabOrder = 3
      OnClick = ofDevolutionRecurrencyPixClick
    end
    object ofReplaceRecurrencyPixParcel: TButton
      Left = 4
      Top = 134
      Width = 450
      Height = 33
      Caption = 
        'PATCH /v1/pagamentos-recorrentes/pix/:identificadorPagamento/sub' +
        'stituir/:endToEndId'
      TabOrder = 4
      OnClick = ofReplaceRecurrencyPixParcelClick
    end
  end
  object MAutomatic: TPanel
    Left = 470
    Top = 264
    Width = 370
    Height = 33
    Caption = 'Pagamentos Autom'#225'ticos'
    Color = clWhite
    ParentBackground = False
    TabOrder = 12
    OnClick = MAutomaticClick
  end
  object SAutomatic: TPanel
    Left = 470
    Top = 302
    Width = 370
    Height = 203
    Color = clWhite
    ParentBackground = False
    TabOrder = 13
    Visible = False
    object ofCreateAutomaticEnrollment: TButton
      Left = 4
      Top = 2
      Width = 361
      Height = 33
      Caption = 'POST /v1/pagamentos-automaticos/adesao'
      TabOrder = 0
      OnClick = ofCreateAutomaticEnrollmentClick
    end
    object ofListAutomaticEnrollment: TButton
      Left = 4
      Top = 35
      Width = 361
      Height = 33
      Caption = 'GET /v1/pagamentos-automaticos/adesao'
      TabOrder = 1
      OnClick = ofListAutomaticEnrollmentClick
    end
    object ofUpdateAutomaticEnrollment: TButton
      Left = 4
      Top = 68
      Width = 361
      Height = 33
      Caption = 'PATCH /v1/pagamentos-automaticos/adesao'
      TabOrder = 2
      OnClick = ofUpdateAutomaticEnrollmentClick
    end
    object ofCreateAutomaticPixPayment: TButton
      Left = 4
      Top = 101
      Width = 361
      Height = 33
      Caption = 'POST /v1/pagamentos-automaticos/pix'
      TabOrder = 3
      OnClick = ofCreateAutomaticPixPaymentClick
    end
    object ofListAutomaticPixPayment: TButton
      Left = 4
      Top = 134
      Width = 361
      Height = 33
      Caption = 'GET /v1/pagamentos-automaticos/pix'
      TabOrder = 4
      OnClick = ofListAutomaticPixPaymentClick
    end
    object ofCancelAutomaticPixPayment: TButton
      Left = 4
      Top = 167
      Width = 361
      Height = 33
      Caption = 'PATCH /v1/pagamentos-automaticos/pix'
      TabOrder = 5
      OnClick = ofCancelAutomaticPixPaymentClick
    end
  end
  object selecionaOpenDialog: TOpenDialog
    Left = 40
    Top = 584
  end
end
