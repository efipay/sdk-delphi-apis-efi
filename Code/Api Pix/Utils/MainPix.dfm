object MainPix: TMainPix
  Left = 0
  Top = 0
  Caption = 'Ef'#237' API Pix'
  ClientHeight = 638
  ClientWidth = 1075
  Color = 2191603
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Visible = True
  OnCreate = FormCreate
  OnMouseMove = FormMouseMove
  TextHeight = 13
  object MWebHook: TPanel
    Left = 359
    Top = 76
    Width = 175
    Height = 33
    Caption = 'WebHook'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    OnClick = MWebHookClick
  end
  object SWebHook: TPanel
    Left = 359
    Top = 115
    Width = 175
    Height = 207
    BevelKind = bkFlat
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    Visible = False
    object pixConfigWebhook: TButton
      Left = 8
      Top = 1
      Width = 155
      Height = 33
      Caption = 'Put /v2/webhook/:chave'
      TabOrder = 0
      OnClick = pixConfigWebhookClick
    end
    object pixListWebhook: TButton
      Left = 8
      Top = 33
      Width = 155
      Height = 33
      Caption = 'Get /v2/webhook/'
      TabOrder = 1
      OnClick = pixListWebhookClick
    end
    object pixGetWebhook: TButton
      Left = 8
      Top = 65
      Width = 155
      Height = 33
      Caption = 'Get /v2/webhook/:chave'
      TabOrder = 2
      OnClick = pixGetWebhookClick
    end
    object pixDeleteWebhook: TButton
      Left = 8
      Top = 97
      Width = 155
      Height = 33
      Caption = 'Del /v2/webhook/:chave'
      TabOrder = 3
      OnClick = pixDeleteWebhookClick
    end
  end
  object MCharges: TPanel
    AlignWithMargins = True
    Left = 1
    Top = 76
    Width = 175
    Height = 33
    Margins.Top = 0
    Caption = 'Cobran'#231'as'
    Color = clWhite
    Constraints.MaxWidth = 175
    Constraints.MinWidth = 175
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
    OnClick = MChargesClick
  end
  object SCharges: TPanel
    Left = 1
    Top = 113
    Width = 175
    Height = 209
    BevelKind = bkFlat
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
    Visible = False
    OnMouseLeave = SChargesMouseLeave
    object pixListCharges: TButton
      Left = 10
      Top = 32
      Width = 153
      Height = 33
      Caption = 'Get /v2/cob'
      TabOrder = 0
      OnClick = pixListChargesClick
    end
    object pixCreateImmediateCharge: TButton
      Left = 10
      Top = 0
      Width = 153
      Height = 33
      Caption = 'Post /v2/cob'
      TabOrder = 1
      OnClick = pixCreateImmediateChargeClick
    end
    object pixUpdateCharge: TButton
      Left = 10
      Top = 64
      Width = 153
      Height = 33
      Caption = 'Patch /v2/update/:txid'
      TabOrder = 2
      OnClick = pixUpdateChargeClick
    end
    object pixCreateCharge: TButton
      Left = 10
      Top = 96
      Width = 153
      Height = 33
      Caption = 'Put /v2/cob/:txid'
      TabOrder = 3
      OnClick = pixCreateChargeClick
    end
    object pixDetailCharge: TButton
      Left = 10
      Top = 128
      Width = 153
      Height = 33
      Caption = 'Get /v2/cob/:txid'
      TabOrder = 4
      OnClick = pixDetailChargeClick
    end
    object menuCobv: TButton
      Left = 10
      Top = 158
      Width = 153
      Height = 33
      Caption = 'COBV->'
      TabOrder = 5
      OnClick = menuCobvClick
      OnMouseMove = menuCobvMouseMove
    end
  end
  object MPix: TPanel
    Left = 540
    Top = 76
    Width = 209
    Height = 33
    Caption = 'Pix'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 4
    OnClick = MPixClick
  end
  object SPix: TPanel
    Left = 540
    Top = 115
    Width = 209
    Height = 207
    BevelKind = bkFlat
    Color = clWhite
    ParentBackground = False
    TabOrder = 5
    Visible = False
    OnMouseLeave = SPixMouseLeave
    object pixListReceived: TButton
      Left = 4
      Top = 0
      Width = 197
      Height = 33
      Caption = 'Get /v2/pix'
      TabOrder = 0
      OnClick = pixListReceivedClick
    end
    object pixSend: TButton
      Left = 4
      Top = 32
      Width = 197
      Height = 33
      Caption = 'Put /v2/pix'
      TabOrder = 1
      OnClick = pixSendClick
    end
    object pixDetail: TButton
      Left = 4
      Top = 64
      Width = 197
      Height = 33
      Caption = 'Get /v2/pix/:e2eId'
      TabOrder = 2
      OnClick = pixDetailClick
    end
    object pixDevolutionGet: TButton
      Left = 4
      Top = 96
      Width = 197
      Height = 33
      Caption = 'Get /v2/pix/:e2eId/devolucao/:id'
      TabOrder = 3
      OnClick = pixDevolutionGetClick
    end
    object pixDevolution: TButton
      Left = 4
      Top = 128
      Width = 197
      Height = 33
      Caption = 'Put /v2/pix/:e2eId/devolucao/:id'
      TabOrder = 4
      OnClick = pixDevolutionClick
    end
    object Button1: TButton
      Left = 4
      Top = 156
      Width = 197
      Height = 33
      Caption = 'Extrato->'
      TabOrder = 5
      OnMouseMove = menuExtratoMouseMove
    end
  end
  object MLoc: TPanel
    Left = 182
    Top = 76
    Width = 175
    Height = 33
    Caption = 'Loc'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 6
    OnClick = MLocClick
  end
  object SLoc: TPanel
    Left = 182
    Top = 115
    Width = 175
    Height = 207
    BevelKind = bkFlat
    Color = clWhite
    ParentBackground = False
    TabOrder = 7
    Visible = False
    OnMouseLeave = SLocMouseLeave
    object SGetv2Loc_id_QrCode: TButton
      Left = 8
      Top = 0
      Width = 155
      Height = 33
      Caption = 'Get /v2/loc/:id/qrcode'
      TabOrder = 0
      OnClick = SGetv2Loc_id_QrCodeClick
    end
    object SGetv2Loc_id: TButton
      Left = 8
      Top = 32
      Width = 155
      Height = 33
      Caption = 'Get /v2/loc/:id/'
      TabOrder = 1
      OnClick = SGetv2Loc_idClick
    end
    object pixListLocation: TButton
      Left = 8
      Top = 64
      Width = 155
      Height = 33
      Caption = 'Get /v2/loc/'
      TabOrder = 2
      OnClick = pixListLocationClick
    end
    object pixCreateLocation: TButton
      Left = 8
      Top = 96
      Width = 155
      Height = 33
      Caption = 'Post /v2/loc/'
      TabOrder = 3
      OnClick = pixCreateLocationClick
    end
    object SDelv2Loc_id_txid: TButton
      Left = 8
      Top = 128
      Width = 155
      Height = 33
      Caption = 'Del /v2/loc/:id/txid'
      TabOrder = 4
      OnClick = SDelv2Loc_id_txidClick
    end
  end
  object imgPanel: TPanel
    Left = 733
    Top = 328
    Width = 351
    Height = 308
    Color = clWhite
    ParentBackground = False
    TabOrder = 8
    object QrCodeImg: TImage
      Left = 5
      Top = 8
      Width = 338
      Height = 257
    end
    object btnCleanQRCode: TButton
      Left = 5
      Top = 271
      Width = 338
      Height = 33
      Caption = 'Limpar QrCode'
      TabOrder = 0
      OnClick = btnCleanQRCodeClick
    end
  end
  object MKeyPix: TPanel
    Left = 753
    Top = 76
    Width = 161
    Height = 33
    Caption = 'Split Pix'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 9
    OnClick = MKeyPixClick
  end
  object MAccount: TPanel
    Left = 916
    Top = 76
    Width = 168
    Height = 33
    Caption = 'Conta'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 10
    OnClick = MAccountClick
  end
  object SKeyPix: TPanel
    Left = 753
    Top = 113
    Width = 163
    Height = 209
    BevelKind = bkFlat
    Color = clWhite
    ParentBackground = False
    TabOrder = 11
    Visible = False
    object pixSplitConfig: TButton
      AlignWithMargins = True
      Left = 4
      Top = 1
      Width = 151
      Height = 33
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Caption = 'POST /v2/gn/split/config'
      Constraints.MaxHeight = 33
      Constraints.MaxWidth = 151
      Constraints.MinHeight = 33
      Constraints.MinWidth = 151
      TabOrder = 0
      OnClick = pixSplitConfigClick
    end
    object pixSplitConfigId: TButton
      AlignWithMargins = True
      Left = 4
      Top = 34
      Width = 151
      Height = 33
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Caption = 'PUT /v2/gn/split/config/:id'
      Constraints.MaxHeight = 33
      Constraints.MaxWidth = 151
      Constraints.MinHeight = 33
      Constraints.MinWidth = 151
      TabOrder = 1
      OnClick = pixSplitConfigIdClick
    end
    object pixSplitDetailConfig: TButton
      AlignWithMargins = True
      Left = 4
      Top = 67
      Width = 151
      Height = 33
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Caption = 'GET /v2/gn/split/:id'
      Constraints.MaxHeight = 33
      Constraints.MaxWidth = 151
      Constraints.MinHeight = 33
      Constraints.MinWidth = 151
      TabOrder = 2
      OnClick = pixSplitDetailConfigClick
    end
    object pixSplitDetailCharges: TButton
      AlignWithMargins = True
      Left = 4
      Top = 100
      Width = 151
      Height = 33
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Caption = 'GET /v2/gn/split/cob/:txid'
      Constraints.MaxHeight = 33
      Constraints.MaxWidth = 151
      Constraints.MinHeight = 33
      Constraints.MinWidth = 151
      TabOrder = 3
      OnClick = pixSplitDetailChargesClick
    end
    object pixSplitLinkCharges: TButton
      AlignWithMargins = True
      Left = 4
      Top = 133
      Width = 151
      Height = 33
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Caption = 'PUT /v2/gn/split/cob/:txid'
      Constraints.MaxHeight = 33
      Constraints.MaxWidth = 151
      Constraints.MinHeight = 33
      Constraints.MinWidth = 151
      TabOrder = 4
      OnClick = pixSplitLinkChargesClick
    end
    object pixSplitUnlinkCharges: TButton
      AlignWithMargins = True
      Left = 4
      Top = 166
      Width = 151
      Height = 33
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Caption = 'DEL /v2/gn/split/cob/:txid'
      Constraints.MaxHeight = 33
      Constraints.MaxWidth = 151
      Constraints.MinHeight = 33
      Constraints.MinWidth = 151
      TabOrder = 5
      OnClick = pixSplitUnlinkChargesClick
    end
  end
  object SAccount: TPanel
    Left = 916
    Top = 115
    Width = 168
    Height = 207
    BevelKind = bkFlat
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 16250871
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 12
    Visible = False
    object SGetV2GnConfig: TButton
      AlignWithMargins = True
      Left = 4
      Top = 1
      Width = 156
      Height = 33
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Caption = 'Get /v2/Gn/Config'
      Constraints.MaxWidth = 156
      Constraints.MinWidth = 151
      TabOrder = 0
      OnClick = SGetV2GnConfigClick
    end
    object SGetV2GnSaldo: TButton
      AlignWithMargins = True
      Left = 4
      Top = 34
      Width = 156
      Height = 33
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Caption = 'Get /v2/Gn/Saldo'
      Constraints.MaxWidth = 156
      Constraints.MinWidth = 151
      TabOrder = 1
      OnClick = SGetV2GnSaldoClick
    end
    object SPutV2GnConfig: TButton
      AlignWithMargins = True
      Left = 4
      Top = 67
      Width = 156
      Height = 33
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Caption = 'Put /v2/Gn/Config'
      Constraints.MaxWidth = 156
      Constraints.MinWidth = 151
      TabOrder = 2
      OnClick = SPutV2GnConfigClick
    end
    object gnListEvp: TButton
      AlignWithMargins = True
      Left = 4
      Top = 100
      Width = 156
      Height = 33
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Caption = 'Get /v2/Gn/Evp'
      Constraints.MaxWidth = 156
      Constraints.MinWidth = 151
      TabOrder = 3
      OnClick = gnListEvpClick
    end
    object gnCreateEvp: TButton
      AlignWithMargins = True
      Left = 4
      Top = 133
      Width = 156
      Height = 33
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Caption = 'Post /v2/Gn/Evp'
      Constraints.MaxWidth = 156
      Constraints.MinWidth = 151
      TabOrder = 4
      OnClick = gnCreateEvpClick
    end
    object gnDeleteEvp: TButton
      AlignWithMargins = True
      Left = 4
      Top = 166
      Width = 156
      Height = 33
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Caption = 'Del /v2/Gn/Evp/:Chave'
      Constraints.MaxWidth = 156
      Constraints.MinWidth = 151
      TabOrder = 5
      OnClick = gnDeleteEvpClick
    end
  end
  object MemoResponse: TMemo
    Left = 0
    Top = 328
    Width = 727
    Height = 306
    Lines.Strings = (
      'Memo1')
    TabOrder = 13
  end
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 1075
    Height = 74
    Align = alTop
    Caption = 'Credentials'
    Color = 2191603
    Constraints.MaxHeight = 74
    Constraints.MaxWidth = 1081
    Constraints.MinHeight = 74
    Constraints.MinWidth = 1069
    ParentBackground = False
    ParentColor = False
    TabOrder = 14
    ExplicitWidth = 1069
    object Label1: TLabel
      Left = 4
      Top = 22
      Width = 37
      Height = 13
      Caption = 'ClientId'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 238
      Top = 22
      Width = 58
      Height = 13
      Caption = 'ClientSecret'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 454
      Top = 22
      Width = 85
      Height = 13
      Caption = 'Certificado (.P12)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object txtClientId: TEdit
      Left = 4
      Top = 37
      Width = 206
      Height = 21
      TabOrder = 0
    end
    object txtClientSecret: TEdit
      Left = 238
      Top = 37
      Width = 185
      Height = 21
      TabOrder = 1
    end
    object SPostOauthToken: TButton
      Left = 964
      Top = 35
      Width = 114
      Height = 26
      Caption = 'Post /Oauth/Token'
      TabOrder = 2
      OnClick = SPostOauthTokenClick
    end
    object MOAuth: TPanel
      Left = 964
      Top = 12
      Width = 114
      Height = 23
      Caption = 'Autentica'#231#227'o'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 3
    end
    object txtCertFile: TEdit
      Left = 454
      Top = 37
      Width = 403
      Height = 21
      TabOrder = 4
      Text = 'Clique Aqui - Selecionar Certificado'
      OnClick = txtCertFileClick
      OnDblClick = txtCertFileDblClick
    end
  end
  object CheckBoxSandbox: TCheckBox
    Left = 875
    Top = 43
    Width = 70
    Height = 17
    Caption = 'Sandbox'
    Color = 2191603
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 15
  end
  object subMenuCobv: TPanel
    AlignWithMargins = True
    Left = 174
    Top = 273
    Width = 175
    Height = 160
    Margins.Left = 20
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Color = clWhite
    ParentBackground = False
    TabOrder = 16
    Visible = False
    OnMouseMove = subMenuCobvMouseMove
    object Button2: TButton
      AlignWithMargins = True
      Left = 11
      Top = 112
      Width = 153
      Height = 33
      Margins.Left = 10
      Margins.Right = 10
      Margins.Bottom = 0
      Align = alTop
      Caption = 'GET /v2/cobv/'
      Constraints.MaxHeight = 33
      Constraints.MaxWidth = 153
      TabOrder = 0
      OnClick = Button2Click
    end
    object pixDetailDueCharge: TButton
      AlignWithMargins = True
      Left = 11
      Top = 76
      Width = 153
      Height = 33
      Margins.Left = 10
      Margins.Right = 10
      Margins.Bottom = 0
      Align = alTop
      Caption = 'GET /v2/cobv/:txid'
      Constraints.MaxHeight = 33
      Constraints.MaxWidth = 153
      TabOrder = 1
      OnClick = pixDetailDueChargeClick
    end
    object pixUpdateDueCharge: TButton
      AlignWithMargins = True
      Left = 11
      Top = 40
      Width = 153
      Height = 33
      Margins.Left = 10
      Margins.Right = 10
      Margins.Bottom = 0
      Align = alTop
      Caption = 'PATCH /v2/cobv/:txid'
      Constraints.MaxHeight = 33
      Constraints.MaxWidth = 153
      TabOrder = 2
      OnClick = pixUpdateDueChargeClick
    end
    object pixCreateDueCharge: TButton
      AlignWithMargins = True
      Left = 11
      Top = 4
      Width = 153
      Height = 33
      Margins.Left = 10
      Margins.Right = 10
      Margins.Bottom = 0
      Align = alTop
      Caption = 'PUT /v2/cobv/:txid'
      Constraints.MaxHeight = 33
      Constraints.MaxWidth = 153
      TabOrder = 3
      OnClick = pixCreateDueChargeClick
    end
  end
  object subMenuExtrato: TPanel
    Left = 733
    Top = 273
    Width = 242
    Height = 160
    Color = clWhite
    ParentBackground = False
    TabOrder = 17
    Visible = False
    OnMouseMove = menuExtratoMouseMove
    object createReport: TButton
      AlignWithMargins = True
      Left = 11
      Top = 4
      Width = 220
      Height = 33
      Margins.Left = 10
      Margins.Right = 10
      Align = alTop
      Caption = 'POST /v2/gn/relatorios/extrato-conciliacao'
      Constraints.MaxHeight = 33
      Constraints.MaxWidth = 220
      Constraints.MinHeight = 33
      Constraints.MinWidth = 220
      TabOrder = 0
      OnClick = createReportClick
    end
    object Button3: TButton
      AlignWithMargins = True
      Left = 11
      Top = 43
      Width = 220
      Height = 33
      Margins.Left = 10
      Margins.Right = 10
      Align = alTop
      Caption = 'GET /v2/gn/relatorios/:id'
      Constraints.MaxHeight = 33
      Constraints.MaxWidth = 220
      Constraints.MinHeight = 33
      Constraints.MinWidth = 220
      TabOrder = 1
      OnClick = Button3Click
    end
  end
  object selecionaOpenDialog: TOpenDialog
    Left = 48
    Top = 584
  end
end
