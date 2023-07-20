object MainPayment: TMainPayment
  Left = 0
  Top = 0
  Caption = 'Ef'#237' API Pagamentos'
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
    ExplicitWidth = 1095
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
    object Button1: TButton
      Left = 965
      Top = 45
      Width = 114
      Height = 23
      Caption = 'Post /Oauth/Token'
      TabOrder = 5
      OnClick = Button1Click
    end
  end
  object optGetCharges: TPanel
    Left = 8
    Top = 122
    Width = 185
    Height = 118
    Alignment = taRightJustify
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    Visible = False
    object payDetailBarCode: TButton
      AlignWithMargins = True
      Left = 4
      Top = 42
      Width = 177
      Height = 33
      Hint = 'Consultar c'#243'digo de barras'
      Align = alBottom
      Caption = 'GET /pagamento/codBarras'
      ImageAlignment = iaCenter
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = payDetailBarCodeClick
    end
    object payDetailIdPayment: TButton
      AlignWithMargins = True
      Left = 4
      Top = 3
      Width = 177
      Height = 33
      Hint = 'Consultar  pagamento solicitado'
      Align = alBottom
      Caption = 'GET /pagamento/idPagamento'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = payDetailIdPaymentClick
    end
    object payListPayments: TButton
      AlignWithMargins = True
      Left = 4
      Top = 81
      Width = 177
      Height = 33
      Align = alBottom
      Caption = 'GET /pagamento/resumo'
      TabOrder = 2
      OnClick = payListPaymentsClick
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
    TabOrder = 2
    ExplicitTop = 380
    ExplicitWidth = 1095
  end
  object dropDownChargesDetails: TPanel
    Left = 8
    Top = 83
    Width = 185
    Height = 33
    Caption = 'Consultar  Cobran'#231'as'
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
    OnClick = dropDownChargesDetailsClick
  end
  object dropDownChargePayment: TPanel
    Left = 200
    Top = 83
    Width = 185
    Height = 33
    Caption = 'Iniciar Pagamento '
    Color = clWhite
    ParentBackground = False
    TabOrder = 4
    OnClick = dropDownChargePaymentClick
  end
  object optInitCharges: TPanel
    Left = 199
    Top = 122
    Width = 185
    Height = 42
    Color = clWhite
    ParentBackground = False
    TabOrder = 5
    Visible = False
    object payBarcode: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 177
      Height = 33
      Align = alTop
      Caption = 'POST /pagamento/codBarras/'
      TabOrder = 0
      OnClick = payBarcodeClick
    end
  end
  object selecionaOpenDialog: TOpenDialog
    Left = 72
    Top = 584
  end
end
