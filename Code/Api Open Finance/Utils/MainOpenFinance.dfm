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
    Caption = 'Configura'#231#227'o'
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    OnClick = dropDownConfiguracaoClick
  end
  object dropDownParticipantes: TPanel
    Left = 200
    Top = 83
    Width = 209
    Height = 33
    Caption = 'Participantes'
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
    OnClick = dropDownParticipantesClick
  end
  object dropDownPagamentos: TPanel
    Left = 415
    Top = 83
    Width = 202
    Height = 33
    Caption = 'Pagamentos'
    Color = clWhite
    ParentBackground = False
    TabOrder = 4
    OnClick = dropDownPagamentosClick
  end
  object optConfiguracao: TPanel
    Left = 8
    Top = 122
    Width = 185
    Height = 111
    Alignment = taRightJustify
    Color = clWhite
    ParentBackground = False
    TabOrder = 5
    Visible = False
    object ofConfigDetail: TButton
      AlignWithMargins = True
      Left = 4
      Top = 43
      Width = 177
      Height = 33
      Hint = 'Consultar c'#243'digo de barras'
      Align = alTop
      Caption = 'GET /open-finance/config'
      ImageAlignment = iaCenter
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = ofConfigDetailClick
    end
    object ofConfigUpdate: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 177
      Height = 33
      Hint = 'Consultar  pagamento solicitado'
      Align = alTop
      Caption = 'PUT /open-finance/config'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ofConfigUpdateClick
    end
  end
  object optParticipantes: TPanel
    Left = 200
    Top = 122
    Width = 209
    Height = 111
    Color = clWhite
    ParentBackground = False
    TabOrder = 6
    Visible = False
    object ofListParticipants: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 201
      Height = 33
      Align = alTop
      Caption = 'GET /open-finance/participantes/:nome'
      TabOrder = 0
      OnClick = ofListParticipantsClick
    end
  end
  object optPagamentos: TPanel
    Left = 415
    Top = 122
    Width = 202
    Height = 111
    Color = clWhite
    ParentBackground = False
    TabOrder = 7
    Visible = False
    object ofStartPixPayment: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 194
      Height = 33
      Align = alTop
      Caption = 'POST  /open-finance/pagamentos/pix'
      TabOrder = 0
      OnClick = ofStartPixPaymentClick
    end
    object ofListPixPayment: TButton
      AlignWithMargins = True
      Left = 4
      Top = 43
      Width = 194
      Height = 33
      Align = alTop
      Caption = 'GET /open-finance/pagamentos/pix'
      TabOrder = 1
      OnClick = ofListPixPaymentClick
    end
  end
  object selecionaOpenDialog: TOpenDialog
    Left = 40
    Top = 584
  end
end
