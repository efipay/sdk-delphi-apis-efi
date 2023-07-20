object frmAberturaDeContas: TfrmAberturaDeContas
  Left = 0
  Top = 0
  Caption = 'Ef'#237' Api de Abertura de Contas'
  ClientHeight = 641
  ClientWidth = 1107
  Color = 2191603
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
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
      Left = 16
      Top = 16
      Width = 37
      Height = 13
      Caption = 'ClientId'
    end
    object teste2: TLabel
      Left = 248
      Top = 16
      Width = 52
      Height = 13
      Caption = 'ClientScret'
    end
    object TLabel
      Left = 480
      Top = 16
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
      Top = 16
      Width = 114
      Height = 23
      Caption = 'Autentica'#231#227'o'
      Color = clWhite
      ParentBackground = False
      TabOrder = 4
    end
    object btnAuthentication: TButton
      Left = 965
      Top = 45
      Width = 114
      Height = 23
      Caption = 'Post /Oauth/Token'
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
  object dropDownConfiguracao: TPanel
    Left = 8
    Top = 83
    Width = 185
    Height = 33
    Caption = 'Cadastro'
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    OnClick = dropDownConfiguracaoClick
  end
  object optCadastro: TPanel
    Left = 8
    Top = 122
    Width = 185
    Height = 143
    Alignment = taRightJustify
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
    Visible = False
    object getAccountCredentials: TButton
      AlignWithMargins = True
      Left = 4
      Top = 34
      Width = 177
      Height = 33
      Hint = 'Consultar c'#243'digo de barras'
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Caption = 'GET /cadastro/credenciais'
      ImageAlignment = iaCenter
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = getAccountCredentialsClick
    end
    object createAccount: TButton
      AlignWithMargins = True
      Left = 4
      Top = 1
      Width = 177
      Height = 33
      Hint = 'Consultar  pagamento solicitado'
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Caption = 'POST /cadastro/conta-simplificada'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = createAccountClick
    end
    object getAccountCertificate: TButton
      AlignWithMargins = True
      Left = 4
      Top = 67
      Width = 177
      Height = 33
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Caption = 'GET /cadastro/certificado'
      TabOrder = 2
      OnClick = getAccountCertificateClick
    end
  end
  object dropDownWebhook: TPanel
    Left = 200
    Top = 83
    Width = 217
    Height = 33
    Caption = 'Webhook'
    Color = clWhite
    ParentBackground = False
    TabOrder = 4
    OnClick = dropDownWebhookClick
  end
  object optWebhook: TPanel
    Left = 200
    Top = 122
    Width = 217
    Height = 143
    Color = clWhite
    ParentBackground = False
    TabOrder = 5
    Visible = False
    object ofListParticipants: TButton
      AlignWithMargins = True
      Left = 4
      Top = 1
      Width = 209
      Height = 33
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Caption = 'POST /cadastro/webhook'
      TabOrder = 0
      OnClick = ofListParticipantsClick
    end
    object accountDetailWebhook: TButton
      AlignWithMargins = True
      Left = 4
      Top = 34
      Width = 209
      Height = 33
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Caption = 'GET /cadastro/webhook/:identificador'
      TabOrder = 1
      OnClick = accountDetailWebhookClick
    end
    object accountDeleteWebhook: TButton
      AlignWithMargins = True
      Left = 4
      Top = 67
      Width = 209
      Height = 33
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Caption = 'DELETE  /cadastro/webhook/:identificador'
      TabOrder = 2
      OnClick = accountDeleteWebhookClick
    end
    object accountListWebhook: TButton
      AlignWithMargins = True
      Left = 4
      Top = 100
      Width = 209
      Height = 33
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Caption = 'GET /cadastro/webhooks'
      TabOrder = 3
      OnClick = accountListWebhookClick
    end
  end
  object selecionaOpenDialog: TOpenDialog
    Left = 40
    Top = 584
  end
end
