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
    Left = 286
    Top = 82
    Width = 156
    Height = 33
    Caption = 'Webhooks'
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
    Left = 286
    Top = 119
    Width = 156
    Height = 136
    BevelKind = bkFlat
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    Visible = False
    object pixConfigWebhook: TButton
      Left = 2
      Top = 1
      Width = 147
      Height = 33
      Caption = 'PUT /v2/webhook/:chave'
      TabOrder = 0
      OnClick = pixConfigWebhookClick
    end
    object pixListWebhook: TButton
      Left = 2
      Top = 33
      Width = 147
      Height = 33
      Caption = 'GET /v2/webhook/'
      TabOrder = 1
      OnClick = pixListWebhookClick
    end
    object pixGetWebhook: TButton
      Left = 2
      Top = 65
      Width = 147
      Height = 33
      Caption = 'GET /v2/webhook/:chave'
      TabOrder = 2
      OnClick = pixGetWebhookClick
    end
    object pixDeleteWebhook: TButton
      Left = 2
      Top = 97
      Width = 147
      Height = 33
      Caption = 'DELETE /v2/webhook/:chave'
      TabOrder = 3
      OnClick = pixDeleteWebhookClick
    end
  end
  object MCharges: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 82
    Width = 142
    Height = 33
    Margins.Top = 0
    Caption = 'Cobran'#231'as'
    Color = clWhite
    Constraints.MaxWidth = 175
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
    Left = 3
    Top = 119
    Width = 142
    Height = 199
    BevelKind = bkFlat
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
    Visible = False
    object pixListCharges: TButton
      Left = 5
      Top = 32
      Width = 127
      Height = 33
      Caption = 'GET /v2/cob'
      TabOrder = 0
      OnClick = pixListChargesClick
    end
    object pixCreateImmediateCharge: TButton
      Left = 5
      Top = 0
      Width = 127
      Height = 33
      Caption = 'POST /v2/cob'
      TabOrder = 1
      OnClick = pixCreateImmediateChargeClick
    end
    object pixUpdateCharge: TButton
      Left = 5
      Top = 64
      Width = 127
      Height = 33
      Caption = 'PATCH /v2/update/:txid'
      TabOrder = 2
      OnClick = pixUpdateChargeClick
    end
    object pixCreateCharge: TButton
      Left = 5
      Top = 96
      Width = 127
      Height = 33
      Caption = 'PUT /v2/cob/:txid'
      TabOrder = 3
      OnClick = pixCreateChargeClick
    end
    object pixDetailCharge: TButton
      Left = 5
      Top = 128
      Width = 127
      Height = 33
      Caption = 'GET /v2/cob/:txid'
      TabOrder = 4
      OnClick = pixDetailChargeClick
    end
    object menuCobv: TButton
      Left = 5
      Top = 159
      Width = 127
      Height = 33
      Caption = 'COBV ->'
      TabOrder = 5
      OnClick = menuCobvClick
      OnMouseMove = menuCobvMouseMove
    end
  end
  object MPix: TPanel
    Left = 446
    Top = 82
    Width = 183
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
    Left = 446
    Top = 119
    Width = 183
    Height = 196
    BevelKind = bkFlat
    Color = clWhite
    ParentBackground = False
    TabOrder = 5
    Visible = False
    object pixListReceived: TButton
      Left = 3
      Top = 0
      Width = 172
      Height = 33
      Caption = 'GET /v2/pix'
      TabOrder = 0
      OnClick = pixListReceivedClick
    end
    object pixSend: TButton
      Left = 3
      Top = 32
      Width = 172
      Height = 33
      Caption = 'PUT /v3/gn/pix/:idEnvio'
      TabOrder = 1
      OnClick = pixSendClick
    end
    object pixDetail: TButton
      Left = 3
      Top = 64
      Width = 172
      Height = 33
      Caption = 'GET /v2/pix/:e2eId'
      TabOrder = 2
      OnClick = pixDetailClick
    end
    object pixDevolutionGet: TButton
      Left = 3
      Top = 96
      Width = 172
      Height = 33
      Caption = 'GET /v2/pix/:e2eId/devolucao/:id'
      TabOrder = 3
      OnClick = pixDevolutionGetClick
    end
    object pixDevolution: TButton
      Left = 3
      Top = 128
      Width = 172
      Height = 33
      Caption = 'PUT /v2/pix/:e2eId/devolucao/:id'
      TabOrder = 4
      OnClick = pixDevolutionClick
    end
    object Button1: TButton
      Left = 3
      Top = 156
      Width = 172
      Height = 33
      Caption = '<- Extrato'
      TabOrder = 5
      OnMouseMove = menuExtratoMouseMove
    end
  end
  object MLoc: TPanel
    Left = 148
    Top = 82
    Width = 135
    Height = 33
    Caption = 'Payload Locations'
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
    Left = 148
    Top = 119
    Width = 135
    Height = 167
    BevelKind = bkFlat
    Color = clWhite
    ParentBackground = False
    TabOrder = 7
    Visible = False
    object SGetv2Loc_id_QrCode: TButton
      Left = 5
      Top = 0
      Width = 120
      Height = 33
      Caption = 'GET /v2/loc/:id/qrcode'
      TabOrder = 0
      OnClick = SGetv2Loc_id_QrCodeClick
    end
    object SGetv2Loc_id: TButton
      Left = 5
      Top = 32
      Width = 120
      Height = 33
      Caption = 'GET /v2/loc/:id/'
      TabOrder = 1
      OnClick = SGetv2Loc_idClick
    end
    object pixListLocation: TButton
      Left = 5
      Top = 64
      Width = 120
      Height = 33
      Caption = 'GET /v2/loc/'
      TabOrder = 2
      OnClick = pixListLocationClick
    end
    object pixCreateLocation: TButton
      Left = 5
      Top = 96
      Width = 120
      Height = 33
      Caption = 'POST /v2/loc/'
      TabOrder = 3
      OnClick = pixCreateLocationClick
    end
    object SDelv2Loc_id_txid: TButton
      Left = 5
      Top = 128
      Width = 120
      Height = 33
      Caption = 'DELETE /v2/loc/:id/txid'
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
    Left = 788
    Top = 82
    Width = 148
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
    Left = 939
    Top = 82
    Width = 133
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
    Left = 788
    Top = 119
    Width = 148
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
      Width = 136
      Height = 33
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Caption = 'POST /v2/gn/split/config'
      Constraints.MaxHeight = 33
      Constraints.MaxWidth = 151
      Constraints.MinHeight = 33
      TabOrder = 0
      OnClick = pixSplitConfigClick
    end
    object pixSplitConfigId: TButton
      AlignWithMargins = True
      Left = 4
      Top = 34
      Width = 136
      Height = 33
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Caption = 'PUT /v2/gn/split/config/:id'
      Constraints.MaxHeight = 33
      Constraints.MaxWidth = 151
      Constraints.MinHeight = 33
      TabOrder = 1
      OnClick = pixSplitConfigIdClick
    end
    object pixSplitDetailConfig: TButton
      AlignWithMargins = True
      Left = 4
      Top = 67
      Width = 136
      Height = 33
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Caption = 'GET /v2/gn/split/:id'
      Constraints.MaxHeight = 33
      Constraints.MaxWidth = 151
      Constraints.MinHeight = 33
      TabOrder = 2
      OnClick = pixSplitDetailConfigClick
    end
    object pixSplitDetailCharges: TButton
      AlignWithMargins = True
      Left = 4
      Top = 100
      Width = 136
      Height = 33
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Caption = 'GET /v2/gn/split/cob/:txid'
      Constraints.MaxHeight = 33
      Constraints.MaxWidth = 151
      Constraints.MinHeight = 33
      TabOrder = 3
      OnClick = pixSplitDetailChargesClick
    end
    object pixSplitLinkCharges: TButton
      AlignWithMargins = True
      Left = 4
      Top = 133
      Width = 136
      Height = 33
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Caption = 'PUT /v2/gn/split/cob/:txid'
      Constraints.MaxHeight = 33
      Constraints.MaxWidth = 151
      Constraints.MinHeight = 33
      TabOrder = 4
      OnClick = pixSplitLinkChargesClick
    end
    object pixSplitUnlinkCharges: TButton
      AlignWithMargins = True
      Left = 4
      Top = 166
      Width = 136
      Height = 33
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Caption = 'DEL /v2/gn/split/cob/:txid'
      Constraints.MaxHeight = 33
      Constraints.MaxWidth = 151
      Constraints.MinHeight = 33
      TabOrder = 5
      OnClick = pixSplitUnlinkChargesClick
    end
  end
  object SAccount: TPanel
    Left = 939
    Top = 119
    Width = 133
    Height = 206
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
      Width = 121
      Height = 33
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Caption = 'GET /v2/Gn/Config'
      Constraints.MaxWidth = 151
      TabOrder = 0
      OnClick = SGetV2GnConfigClick
    end
    object SGetV2GnSaldo: TButton
      AlignWithMargins = True
      Left = 4
      Top = 34
      Width = 121
      Height = 33
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Caption = 'GET /v2/Gn/Saldo'
      Constraints.MaxWidth = 156
      TabOrder = 1
      OnClick = SGetV2GnSaldoClick
    end
    object SPutV2GnConfig: TButton
      AlignWithMargins = True
      Left = 4
      Top = 67
      Width = 121
      Height = 33
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Caption = 'PUT /v2/Gn/Config'
      Constraints.MaxWidth = 156
      TabOrder = 2
      OnClick = SPutV2GnConfigClick
    end
    object gnListEvp: TButton
      AlignWithMargins = True
      Left = 4
      Top = 100
      Width = 121
      Height = 33
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Caption = 'GET /v2/Gn/Evp'
      Constraints.MaxWidth = 156
      TabOrder = 3
      OnClick = gnListEvpClick
    end
    object gnCreateEvp: TButton
      AlignWithMargins = True
      Left = 4
      Top = 133
      Width = 121
      Height = 33
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Caption = 'POST /v2/Gn/Evp'
      Constraints.MaxWidth = 156
      TabOrder = 4
      OnClick = gnCreateEvpClick
    end
    object gnDeleteEvp: TButton
      AlignWithMargins = True
      Left = 4
      Top = 166
      Width = 121
      Height = 33
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Caption = 'DEL /v2/Gn/Evp/:Chave'
      Constraints.MaxWidth = 156
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
    Width = 1069
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
    object Label1: TLabel
      Left = 13
      Top = 22
      Width = 43
      Height = 13
      Caption = 'Client_Id'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 240
      Top = 22
      Width = 64
      Height = 13
      Caption = 'Client_Secret'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 456
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
      Left = 11
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
      Left = 946
      Top = 39
      Width = 114
      Height = 26
      Caption = 'POST /oauth/token'
      TabOrder = 2
      OnClick = SPostOauthTokenClick
    end
    object MOAuth: TPanel
      Left = 946
      Top = 16
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
    Left = 872
    Top = 42
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
    Left = 138
    Top = 280
    Width = 126
    Height = 149
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
      Left = 4
      Top = 112
      Width = 118
      Height = 33
      Margins.Left = 10
      Margins.Right = 10
      Margins.Bottom = 0
      Caption = 'GET /v2/cobv/'
      TabOrder = 0
      OnClick = Button2Click
    end
    object pixDetailDueCharge: TButton
      AlignWithMargins = True
      Left = 4
      Top = 76
      Width = 118
      Height = 33
      Margins.Left = 10
      Margins.Right = 10
      Margins.Bottom = 0
      Caption = 'GET /v2/cobv/:txid'
      TabOrder = 1
      OnClick = pixDetailDueChargeClick
    end
    object pixUpdateDueCharge: TButton
      AlignWithMargins = True
      Left = 4
      Top = 40
      Width = 118
      Height = 33
      Margins.Left = 10
      Margins.Right = 10
      Margins.Bottom = 0
      Caption = 'PATCH /v2/cobv/:txid'
      TabOrder = 2
      OnClick = pixUpdateDueChargeClick
    end
    object pixCreateDueCharge: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 118
      Height = 33
      Margins.Left = 10
      Margins.Right = 10
      Margins.Bottom = 0
      Caption = 'PUT /v2/cobv/:txid'
      TabOrder = 3
      OnClick = pixCreateDueChargeClick
    end
  end
  object subMenuExtrato: TPanel
    Left = 224
    Top = 277
    Width = 229
    Height = 75
    Color = clWhite
    ParentBackground = False
    TabOrder = 17
    Visible = False
    OnMouseMove = menuExtratoMouseMove
    object createReport: TButton
      AlignWithMargins = True
      Left = 4
      Top = 2
      Width = 220
      Height = 33
      Margins.Left = 10
      Margins.Right = 10
      Caption = 'POST /v2/gn/relatorios/extrato-conciliacao'
      TabOrder = 0
      OnClick = createReportClick
    end
    object Button3: TButton
      AlignWithMargins = True
      Left = 4
      Top = 39
      Width = 220
      Height = 33
      Margins.Left = 10
      Margins.Right = 10
      Caption = 'GET /v2/gn/relatorios/:id'
      TabOrder = 1
      OnClick = Button3Click
    end
  end
  object MAutoPix: TPanel
    Left = 632
    Top = 82
    Width = 153
    Height = 33
    Caption = 'Pix Autom'#225'tico'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 18
    OnClick = MAutoPixClick
  end
  object SAutoPix: TPanel
    Left = 632
    Top = 119
    Width = 153
    Height = 170
    Color = clWhite
    ParentBackground = False
    TabOrder = 19
    Visible = False
    object menuRec: TButton
      Left = 3
      Top = 2
      Width = 146
      Height = 33
      Caption = 'Recorr'#234'ncias ->'
      TabOrder = 0
      OnMouseMove = menuRecMouseMove
    end
    object menuSoliRec: TButton
      Left = 3
      Top = 34
      Width = 146
      Height = 34
      Caption = '<- Solicita'#231#227'o Recorr'#234'ncia'
      TabOrder = 1
      OnMouseMove = menuSolicRecMouseMove
    end
    object menuCobr: TButton
      Left = 3
      Top = 67
      Width = 146
      Height = 33
      Caption = 'Cobran'#231'as Recorrentes ->'
      TabOrder = 2
      OnMouseMove = menuCobrMouseMove
    end
    object menuWebhooks: TButton
      Left = 3
      Top = 100
      Width = 146
      Height = 34
      Caption = '<- Webhooks'
      TabOrder = 3
      OnMouseMove = menuWebhookMouseMove
    end
    object menuLocations: TButton
      Left = 3
      Top = 134
      Width = 146
      Height = 33
      Caption = 'Payload Locations ->'
      TabOrder = 4
      OnMouseMove = menuLocMouseMove
    end
  end
  object subMenuRec: TPanel
    Left = 784
    Top = 119
    Width = 177
    Height = 144
    Color = clWhite
    ParentBackground = False
    TabOrder = 20
    Visible = False
    OnMouseMove = menuRecMouseMove
    object pixDetailRecurrenceAutomatic: TButton
      Left = 4
      Top = 2
      Width = 167
      Height = 33
      Caption = 'GET /v2/rec/:idRec'
      TabOrder = 0
      OnClick = pixDetailRecurrenceAutomaticClick
    end
    object pixUpdateRecurrenceAutomatic: TButton
      Left = 4
      Top = 37
      Width = 167
      Height = 33
      Caption = 'PATCH /v2/rec/:idRec'
      TabOrder = 1
      OnClick = pixUpdateRecurrenceAutomaticClick
    end
    object pixListRecurrenceAutomatic: TButton
      Left = 4
      Top = 72
      Width = 167
      Height = 33
      Caption = 'GET /v2/rec'
      TabOrder = 2
      OnClick = pixListRecurrenceAutomaticClick
    end
    object pixCreateRecurrenceAutomatic: TButton
      Left = 4
      Top = 107
      Width = 167
      Height = 33
      Caption = 'POST /v2/rec'
      TabOrder = 3
      OnClick = pixCreateRecurrenceAutomaticClick
    end
  end
  object subMenuSolicRec: TPanel
    Left = 448
    Top = 153
    Width = 185
    Height = 96
    Color = clWhite
    ParentBackground = False
    TabOrder = 21
    Visible = False
    OnMouseMove = menuSolicRecMouseMove
    object pixCreateRequestRecurrenceAutomatic: TButton
      Left = 3
      Top = 2
      Width = 176
      Height = 29
      Caption = 'POST /v2/solicrec'
      TabOrder = 0
      OnClick = pixCreateRequestRecurrenceAutomaticClick
    end
    object pixDetailRequestRecurrenceAutomatic: TButton
      Left = 3
      Top = 33
      Width = 176
      Height = 29
      Caption = 'GET /v2/solicrec/:idSolicRec'
      TabOrder = 1
      OnClick = pixDetailRequestRecurrenceAutomaticClick
    end
    object pixUpdateRequestRecurrenceAutomatic: TButton
      Left = 3
      Top = 64
      Width = 176
      Height = 29
      Caption = 'PATCH /v2/solicrec/:idSolicRec'
      TabOrder = 2
      OnClick = pixUpdateRequestRecurrenceAutomaticClick
    end
  end
  object subMenuCobr: TPanel
    Left = 784
    Top = 181
    Width = 205
    Height = 214
    Color = clWhite
    ParentBackground = False
    TabOrder = 22
    Visible = False
    OnMouseMove = menuCobrMouseMove
    object pixCreateAutomaticChargeTxid: TButton
      Left = 4
      Top = 2
      Width = 194
      Height = 33
      Caption = 'PUT /v2/cobr/:txid'
      TabOrder = 0
      OnClick = pixCreateAutomaticChargeTxidClick
    end
    object pixUpdateAutomaticCharge: TButton
      Left = 4
      Top = 37
      Width = 194
      Height = 33
      Caption = 'PATCH /v2/cobr/:txid'
      TabOrder = 1
      OnClick = pixUpdateAutomaticChargeClick
    end
    object pixDetailAutomaticCharge: TButton
      Left = 4
      Top = 72
      Width = 194
      Height = 33
      Caption = 'GET /v2/cobr/:txid'
      TabOrder = 2
      OnClick = pixDetailAutomaticChargeClick
    end
    object pixCreateAutomaticCharge: TButton
      Left = 4
      Top = 107
      Width = 194
      Height = 33
      Caption = 'POST /v2/cobr'
      TabOrder = 3
      OnClick = pixCreateAutomaticChargeClick
    end
    object pixListAutomaticCharge: TButton
      Left = 4
      Top = 142
      Width = 194
      Height = 33
      Caption = 'GET /v2/cobr'
      TabOrder = 4
      OnClick = pixListAutomaticChargeClick
    end
    object pixRetryRequestAutomatic: TButton
      Left = 4
      Top = 177
      Width = 194
      Height = 33
      Caption = 'POST /v2/cobr/:txid/retentativa/:data'
      TabOrder = 5
      OnClick = pixRetryRequestAutomaticClick
    end
  end
  object subMenuWebhook: TPanel
    Left = 448
    Top = 219
    Width = 185
    Height = 74
    Color = clWhite
    ParentBackground = False
    TabOrder = 23
    Visible = False
    OnMouseMove = menuWebhookMouseMove
    object menuWebRec: TButton
      Left = 4
      Top = 2
      Width = 176
      Height = 33
      Caption = '<- Recorr'#234'ncia'
      TabOrder = 0
      OnMouseMove = menuWebRecMouseMove
    end
    object menuWebCobr: TButton
      Left = 4
      Top = 37
      Width = 176
      Height = 33
      Caption = '<- Cobran'#231'a Recorrente'
      TabOrder = 1
      OnMouseMove = menuWebCobrMouseMove
    end
  end
  object subMenuWebRec: TPanel
    Left = 268
    Top = 143
    Width = 185
    Height = 110
    Color = clWhite
    ParentBackground = False
    TabOrder = 24
    Visible = False
    OnMouseMove = menuWebRecMouseMove
    object pixListWebhookRecurrenceAutomatic: TButton
      Left = 5
      Top = 38
      Width = 175
      Height = 33
      Caption = 'GET /v2/webhookrec'
      TabOrder = 0
      OnClick = pixListWebhookRecurrenceAutomaticClick
    end
    object pixDeleteWebhookRecurrenceAutomatic: TButton
      Left = 5
      Top = 74
      Width = 175
      Height = 33
      Caption = 'DELETE /v2/webhookrec'
      TabOrder = 1
      OnClick = pixDeleteWebhookRecurrenceAutomaticClick
    end
    object pixConfigWebhookRecurrenceAutomatic: TButton
      Left = 5
      Top = 2
      Width = 175
      Height = 33
      Caption = 'PUT /v2/webhookrec'
      TabOrder = 2
      OnClick = pixConfigWebhookRecurrenceAutomaticClick
    end
  end
  object subMenuWebCobr: TPanel
    Left = 268
    Top = 256
    Width = 185
    Height = 110
    Color = clWhite
    ParentBackground = False
    TabOrder = 25
    Visible = False
    OnMouseMove = menuWebCobrMouseMove
    object pixListWebhookAutomaticCharge: TButton
      Left = 5
      Top = 38
      Width = 175
      Height = 33
      Caption = 'GET /v2/webhookcobr'
      TabOrder = 0
      OnClick = pixListWebhookAutomaticChargeClick
    end
    object pixDeleteWebhookAutomaticCharge: TButton
      Left = 5
      Top = 74
      Width = 175
      Height = 33
      Caption = 'DELETE /v2/webhookcobr'
      TabOrder = 1
      OnClick = pixDeleteWebhookAutomaticChargeClick
    end
    object pixConfigWebhookAutomaticCharge: TButton
      Left = 5
      Top = 2
      Width = 175
      Height = 33
      Caption = 'PUT /v2/webhookcobr'
      TabOrder = 2
      OnClick = pixConfigWebhookAutomaticChargeClick
    end
  end
  object subMenuLoc: TPanel
    Left = 784
    Top = 249
    Width = 177
    Height = 144
    Color = clWhite
    ParentBackground = False
    TabOrder = 26
    Visible = False
    OnMouseMove = menuLocMouseMove
    object pixCreateLocationRecurrenceAutomatic: TButton
      Left = 4
      Top = 2
      Width = 167
      Height = 33
      Caption = 'POST /v2/locrec'
      TabOrder = 0
      OnClick = pixCreateLocationRecurrenceAutomaticClick
    end
    object pixListLocationRecurrenceAutomatic: TButton
      Left = 4
      Top = 37
      Width = 167
      Height = 33
      Caption = 'GET /v2/locrec'
      TabOrder = 1
      OnClick = pixListLocationRecurrenceAutomaticClick
    end
    object pixDetailLocationRecurrenceAutomatic: TButton
      Left = 4
      Top = 72
      Width = 167
      Height = 33
      Caption = 'GET /v2/locrec/:id'
      TabOrder = 2
      OnClick = pixDetailLocationRecurrenceAutomaticClick
    end
    object pixUnlinkLocationRecurrenceAutomatic: TButton
      Left = 4
      Top = 107
      Width = 167
      Height = 33
      Caption = 'DELETE /v2/locrec/:id/idRec'
      TabOrder = 3
      OnClick = pixUnlinkLocationRecurrenceAutomaticClick
    end
  end
  object selecionaOpenDialog: TOpenDialog
    Left = 48
    Top = 584
  end
end
